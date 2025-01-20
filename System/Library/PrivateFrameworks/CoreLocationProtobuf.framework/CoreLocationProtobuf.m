BOOL CLPAccessoryMetaReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(void *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        v19 = PBReaderReadString();
        v20 = 16;
        goto LABEL_24;
      }
      if (v18 == 1)
      {
        v19 = PBReaderReadString();
        v20 = 8;
LABEL_24:
        v21 = *(void **)(a1 + v20);
        *(void *)(a1 + v20) = v19;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    v19 = PBReaderReadString();
    v20 = 24;
    goto LABEL_24;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPAltimeterCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 56), v18);
        if PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2)) {
          goto LABEL_50;
        }
        goto LABEL_62;
      case 2u:
        *(unsigned char *)(a1 + 80) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v32 = 8;
        goto LABEL_59;
      case 3u:
        *(unsigned char *)(a1 + 80) |= 2u;
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v22 = 0;
        }
        uint64_t v32 = 16;
LABEL_59:
        *(void *)(a1 + v32) = v22;
        goto LABEL_60;
      case 4u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = 0;
        *(unsigned char *)(a1 + 80) |= 4u;
        while (2)
        {
          uint64_t v28 = *v3;
          uint64_t v29 = *(void *)(a2 + v28);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v30;
            v27 |= (unint64_t)(v31 & 0x7F) << v25;
            if (v31 < 0)
            {
              v25 += 7;
              BOOL v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v27) = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v27) = 0;
        }
LABEL_54:
        *(_DWORD *)(a1 + 24) = v27;
        goto LABEL_60;
      case 5u:
        v18 = objc_alloc_init(CLPContext);
        objc_storeStrong((id *)(a1 + 32), v18);
        if (!PBReaderPlaceMark() || (CLPContextReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_62;
        }
        goto LABEL_50;
      case 6u:
        v18 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 40), v18);
        goto LABEL_48;
      case 7u:
        v18 = objc_alloc_init(CLPIndoorPressure);
        [(id)a1 addPressure:v18];
        if (!PBReaderPlaceMark() || (CLPIndoorPressureReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_62;
        }
        goto LABEL_50;
      case 8u:
        v18 = objc_alloc_init(CLPIndoorWifiScan);
        [(id)a1 addWifiScan:v18];
        if (!PBReaderPlaceMark() || (CLPIndoorWifiScanReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_62;
        }
        goto LABEL_50;
      case 9u:
        v18 = objc_alloc_init(CLPLocation);
        [(id)a1 addLocations:v18];
LABEL_48:
        if PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v18, a2))
        {
LABEL_50:
          PBReaderRecallMark();

LABEL_60:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_62:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_60;
    }
  }
}

uint64_t CLPMetaReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
        goto LABEL_31;
      case 2u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 40;
        goto LABEL_31;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                uint64_t v23 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v23 = 0;
        }
LABEL_38:
        *(void *)(a1 + 8) = v23;
        goto LABEL_39;
      case 4u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
LABEL_31:
        uint64_t v28 = *(void **)(a1 + v19);
        *(void *)(a1 + v19) = v18;

        goto LABEL_39;
      case 5u:
        uint64_t v29 = objc_alloc_init(CLPRegulatoryDomainEstimate);
        [(id)a1 addRegulatoryDomainEstimates:v29];
        if PBReaderPlaceMark() && (CLPRegulatoryDomainEstimateReadFrom((uint64_t)v29, a2))
        {
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t CLPContextReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_44;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_46;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_46:
          uint64_t v41 = 16;
          goto LABEL_55;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 28) |= 4u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  uint64_t v28 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_50:
          *(unsigned char *)(a1 + 24) = v28 != 0;
          continue;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          break;
        case 4u:
          uint64_t v39 = PBReaderReadString();
          v40 = *(void **)(a1 + 8);
          *(void *)(a1 + 8) = v39;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v3;
        uint64_t v36 = *(void *)(a2 + v35);
        unint64_t v37 = v36 + 1;
        if (v36 == -1 || v37 > *(void *)(a2 + *v4)) {
          break;
        }
        char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
        *(void *)(a2 + v35) = v37;
        v20 |= (unint64_t)(v38 & 0x7F) << v33;
        if ((v38 & 0x80) == 0) {
          goto LABEL_52;
        }
        v33 += 7;
        BOOL v15 = v34++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_54;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_52:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v20) = 0;
      }
LABEL_54:
      uint64_t v41 = 20;
LABEL_55:
      *(_DWORD *)(a1 + v41) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    uint64_t v16 = *v5;
    int v17 = *(unsigned __int8 *)(a2 + v16);
    if (*(unsigned char *)(a2 + v16)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v17 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v118 = 8;
        goto LABEL_212;
      case 2u:
        uint64_t v22 = *v3;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v118 = 16;
        goto LABEL_212;
      case 3u:
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 84;
        goto LABEL_223;
      case 5u:
        *(_DWORD *)(a1 + 184) |= 1u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 32;
        goto LABEL_223;
      case 6u:
        *(_DWORD *)(a1 + 184) |= 0x4000u;
        uint64_t v30 = *v3;
        unint64_t v31 = *(void *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v31);
          *(void *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 176;
        goto LABEL_223;
      case 7u:
        *(_DWORD *)(a1 + 184) |= 0x1000u;
        uint64_t v32 = *v3;
        unint64_t v33 = *(void *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v33);
          *(void *)(a2 + v32) = v33 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 160;
        goto LABEL_223;
      case 8u:
        *(_DWORD *)(a1 + 184) |= 4u;
        uint64_t v34 = *v3;
        unint64_t v35 = *(void *)(a2 + v34);
        if (v35 <= 0xFFFFFFFFFFFFFFFBLL && v35 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v35);
          *(void *)(a2 + v34) = v35 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 60;
        goto LABEL_223;
      case 9u:
        uint64_t v36 = *v3;
        unint64_t v37 = *(void *)(a2 + v36);
        if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v37);
          *(void *)(a2 + v36) = v37 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v118 = 24;
LABEL_212:
        *(void *)(a1 + v118) = v21;
        goto LABEL_224;
      case 0xAu:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 184) |= 2u;
        while (2)
        {
          uint64_t v41 = *v3;
          uint64_t v42 = *(void *)(a2 + v41);
          unint64_t v43 = v42 + 1;
          if (v42 == -1 || v43 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v43;
            v40 |= (unint64_t)(v44 & 0x7F) << v38;
            if (v44 < 0)
            {
              v38 += 7;
              BOOL v15 = v39++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_157;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_157:
        uint64_t v115 = 56;
        goto LABEL_186;
      case 0xBu:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x400u;
        while (2)
        {
          uint64_t v47 = *v3;
          uint64_t v48 = *(void *)(a2 + v47);
          unint64_t v49 = v48 + 1;
          if (v48 == -1 || v49 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
            *(void *)(a2 + v47) = v49;
            v40 |= (unint64_t)(v50 & 0x7F) << v45;
            if (v50 < 0)
            {
              v45 += 7;
              BOOL v15 = v46++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_161;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_161:
        uint64_t v115 = 116;
        goto LABEL_186;
      case 0xCu:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x200u;
        while (2)
        {
          uint64_t v53 = *v3;
          uint64_t v54 = *(void *)(a2 + v53);
          unint64_t v55 = v54 + 1;
          if (v54 == -1 || v55 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)(a2 + *v7) + v54);
            *(void *)(a2 + v53) = v55;
            v40 |= (unint64_t)(v56 & 0x7F) << v51;
            if (v56 < 0)
            {
              v51 += 7;
              BOOL v15 = v52++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_165;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_165:
        uint64_t v115 = 112;
        goto LABEL_186;
      case 0xDu:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x800u;
        while (2)
        {
          uint64_t v59 = *v3;
          uint64_t v60 = *(void *)(a2 + v59);
          unint64_t v61 = v60 + 1;
          if (v60 == -1 || v61 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v62 = *(unsigned char *)(*(void *)(a2 + *v7) + v60);
            *(void *)(a2 + v59) = v61;
            v40 |= (unint64_t)(v62 & 0x7F) << v57;
            if (v62 < 0)
            {
              v57 += 7;
              BOOL v15 = v58++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_169;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_169:
        uint64_t v115 = 136;
        goto LABEL_186;
      case 0xEu:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10u;
        while (2)
        {
          uint64_t v65 = *v3;
          uint64_t v66 = *(void *)(a2 + v65);
          unint64_t v67 = v66 + 1;
          if (v66 == -1 || v67 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)(a2 + *v7) + v66);
            *(void *)(a2 + v65) = v67;
            v40 |= (unint64_t)(v68 & 0x7F) << v63;
            if (v68 < 0)
            {
              v63 += 7;
              BOOL v15 = v64++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_173:
        uint64_t v115 = 80;
        goto LABEL_186;
      case 0xFu:
        PBReaderReadString();
        v69 = (CLPMotionActivity *)objc_claimAutoreleasedReturnValue();
        if (v69) {
          [(id)a1 addAppBundleIdIndices:v69];
        }
        goto LABEL_153;
      case 0x10u:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v72 = 0;
        *(_DWORD *)(a1 + 184) |= 0x40000u;
        while (2)
        {
          uint64_t v73 = *v3;
          uint64_t v74 = *(void *)(a2 + v73);
          unint64_t v75 = v74 + 1;
          if (v74 == -1 || v75 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v76 = *(unsigned char *)(*(void *)(a2 + *v7) + v74);
            *(void *)(a2 + v73) = v75;
            v72 |= (unint64_t)(v76 & 0x7F) << v70;
            if (v76 < 0)
            {
              v70 += 7;
              BOOL v15 = v71++ >= 9;
              if (v15)
              {
                uint64_t v72 = 0;
                goto LABEL_177;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v72 = 0;
        }
LABEL_177:
        BOOL v116 = v72 != 0;
        uint64_t v117 = 183;
        goto LABEL_195;
      case 0x11u:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v79 = 0;
        *(_DWORD *)(a1 + 184) |= 0x20000u;
        while (2)
        {
          uint64_t v80 = *v3;
          uint64_t v81 = *(void *)(a2 + v80);
          unint64_t v82 = v81 + 1;
          if (v81 == -1 || v82 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
            *(void *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              BOOL v15 = v78++ >= 9;
              if (v15)
              {
                uint64_t v79 = 0;
                goto LABEL_181;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v79 = 0;
        }
LABEL_181:
        BOOL v116 = v79 != 0;
        uint64_t v117 = 182;
        goto LABEL_195;
      case 0x12u:
        v69 = objc_alloc_init(CLPMotionActivity);
        uint64_t v84 = 144;
        goto LABEL_99;
      case 0x13u:
        v69 = objc_alloc_init(CLPMotionActivity);
        uint64_t v84 = 104;
        goto LABEL_99;
      case 0x14u:
        v69 = objc_alloc_init(CLPMotionActivity);
        uint64_t v84 = 72;
LABEL_99:
        objc_storeStrong((id *)(a1 + v84), v69);
        if (!PBReaderPlaceMark() || !CLPMotionActivityReadFrom((uint64_t)v69, a2)) {
          goto LABEL_226;
        }
        goto LABEL_152;
      case 0x15u:
        *(_DWORD *)(a1 + 184) |= 8u;
        uint64_t v85 = *v3;
        unint64_t v86 = *(void *)(a2 + v85);
        if (v86 <= 0xFFFFFFFFFFFFFFFBLL && v86 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v86);
          *(void *)(a2 + v85) = v86 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 64;
        goto LABEL_223;
      case 0x16u:
        *(_DWORD *)(a1 + 184) |= 0x2000u;
        uint64_t v87 = *v3;
        unint64_t v88 = *(void *)(a2 + v87);
        if (v88 <= 0xFFFFFFFFFFFFFFFBLL && v88 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v88);
          *(void *)(a2 + v87) = v88 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 164;
        goto LABEL_223;
      case 0x17u:
        char v89 = 0;
        unsigned int v90 = 0;
        uint64_t v40 = 0;
        *(_DWORD *)(a1 + 184) |= 0x100u;
        while (2)
        {
          uint64_t v91 = *v3;
          uint64_t v92 = *(void *)(a2 + v91);
          unint64_t v93 = v92 + 1;
          if (v92 == -1 || v93 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v94 = *(unsigned char *)(*(void *)(a2 + *v7) + v92);
            *(void *)(a2 + v91) = v93;
            v40 |= (unint64_t)(v94 & 0x7F) << v89;
            if (v94 < 0)
            {
              v89 += 7;
              BOOL v15 = v90++ >= 9;
              if (v15)
              {
                LODWORD(v40) = 0;
                goto LABEL_185;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_185:
        uint64_t v115 = 100;
LABEL_186:
        *(_DWORD *)(a1 + v115) = v40;
        goto LABEL_224;
      case 0x18u:
        *(_DWORD *)(a1 + 184) |= 0x20u;
        uint64_t v95 = *v3;
        unint64_t v96 = *(void *)(a2 + v95);
        if (v96 <= 0xFFFFFFFFFFFFFFFBLL && v96 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v96);
          *(void *)(a2 + v95) = v96 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 88;
        goto LABEL_223;
      case 0x19u:
        *(_DWORD *)(a1 + 184) |= 0x80u;
        uint64_t v97 = *v3;
        unint64_t v98 = *(void *)(a2 + v97);
        if (v98 <= 0xFFFFFFFFFFFFFFFBLL && v98 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v98);
          *(void *)(a2 + v97) = v98 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 96;
        goto LABEL_223;
      case 0x1Au:
        *(_DWORD *)(a1 + 184) |= 0x40u;
        uint64_t v99 = *v3;
        unint64_t v100 = *(void *)(a2 + v99);
        if (v100 <= 0xFFFFFFFFFFFFFFFBLL && v100 + 4 <= *(void *)(a2 + *v4))
        {
          int v26 = *(_DWORD *)(*(void *)(a2 + *v7) + v100);
          *(void *)(a2 + v99) = v100 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v26 = 0;
        }
        uint64_t v119 = 92;
LABEL_223:
        *(_DWORD *)(a1 + v119) = v26;
        goto LABEL_224;
      case 0x1Bu:
        v69 = objc_alloc_init(CLPSatelliteReport);
        objc_storeStrong((id *)(a1 + 152), v69);
        if (!PBReaderPlaceMark() || !CLPSatelliteReportReadFrom((uint64_t)v69, a2)) {
          goto LABEL_226;
        }
        goto LABEL_152;
      case 0x1Cu:
        char v101 = 0;
        unsigned int v102 = 0;
        uint64_t v103 = 0;
        *(_DWORD *)(a1 + 184) |= 0x8000u;
        while (2)
        {
          uint64_t v104 = *v3;
          uint64_t v105 = *(void *)(a2 + v104);
          unint64_t v106 = v105 + 1;
          if (v105 == -1 || v106 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v107 = *(unsigned char *)(*(void *)(a2 + *v7) + v105);
            *(void *)(a2 + v104) = v106;
            v103 |= (unint64_t)(v107 & 0x7F) << v101;
            if (v107 < 0)
            {
              v101 += 7;
              BOOL v15 = v102++ >= 9;
              if (v15)
              {
                uint64_t v103 = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v103 = 0;
        }
LABEL_190:
        BOOL v116 = v103 != 0;
        uint64_t v117 = 180;
        goto LABEL_195;
      case 0x1Du:
        v69 = objc_alloc_init(CLPPipelineDiagnosticReport);
        objc_storeStrong((id *)(a1 + 120), v69);
        if (!PBReaderPlaceMark() || (CLPPipelineDiagnosticReportReadFrom((uint64_t)v69, a2) & 1) == 0) {
          goto LABEL_226;
        }
        goto LABEL_152;
      case 0x1Eu:
        v69 = objc_alloc_init(CLPBaroCalibrationIndication);
        objc_storeStrong((id *)(a1 + 48), v69);
        if (!PBReaderPlaceMark() || (CLPBaroCalibrationIndicationReadFrom((uint64_t)v69, a2) & 1) == 0) {
          goto LABEL_226;
        }
        goto LABEL_152;
      case 0x1Fu:
        v69 = objc_alloc_init(CLPLocationProcessingMetadata);
        objc_storeStrong((id *)(a1 + 128), v69);
        if (!PBReaderPlaceMark() || (CLPLocationProcessingMetadataReadFrom((uint64_t)v69, a2) & 1) == 0) {
          goto LABEL_226;
        }
        goto LABEL_152;
      case 0x20u:
        char v108 = 0;
        unsigned int v109 = 0;
        uint64_t v110 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10000u;
        while (2)
        {
          uint64_t v111 = *v3;
          uint64_t v112 = *(void *)(a2 + v111);
          unint64_t v113 = v112 + 1;
          if (v112 == -1 || v113 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v114 = *(unsigned char *)(*(void *)(a2 + *v7) + v112);
            *(void *)(a2 + v111) = v113;
            v110 |= (unint64_t)(v114 & 0x7F) << v108;
            if (v114 < 0)
            {
              v108 += 7;
              BOOL v15 = v109++ >= 9;
              if (v15)
              {
                uint64_t v110 = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v110 = 0;
        }
LABEL_194:
        BOOL v116 = v110 != 0;
        uint64_t v117 = 181;
LABEL_195:
        *(unsigned char *)(a1 + v117) = v116;
        goto LABEL_224;
      case 0x21u:
        v69 = objc_alloc_init(CLPVehicleType);
        objc_storeStrong((id *)(a1 + 168), v69);
        if PBReaderPlaceMark() && (CLPVehicleTypeReadFrom((uint64_t)v69, a2))
        {
LABEL_152:
          PBReaderRecallMark();
LABEL_153:

LABEL_224:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_226:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_224;
    }
  }
}

uint64_t CLPIndoorPressureReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 24) |= 4u;
        uint64_t v22 = *v3;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(void *)(a2 + *v4))
        {
          int v24 = *(_DWORD *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v24 = 0;
        }
        uint64_t v28 = 20;
      }
      else
      {
        if (v18 != 2)
        {
          if (v18 == 1)
          {
            *(unsigned char *)(a1 + 24) |= 1u;
            uint64_t v19 = *v3;
            unint64_t v20 = *(void *)(a2 + v19);
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
            {
              uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
              *(void *)(a2 + v19) = v20 + 8;
            }
            else
            {
              *(unsigned char *)(a2 + *v5) = 1;
              uint64_t v21 = 0;
            }
            *(void *)(a1 + 8) = v21;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        *(unsigned char *)(a1 + 24) |= 2u;
        uint64_t v25 = *v3;
        unint64_t v26 = *(void *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(void *)(a2 + *v4))
        {
          int v24 = *(_DWORD *)(*(void *)(a2 + *v7) + v26);
          *(void *)(a2 + v25) = v26 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v24 = 0;
        }
        uint64_t v28 = 16;
      }
      *(_DWORD *)(a1 + v28) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPIndoorWifiScanReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v17 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
            *(void *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            uint64_t v21 = 0;
          }
          uint64_t v48 = 16;
          goto LABEL_68;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 40;
          goto LABEL_50;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v28 = *v3;
            uint64_t v29 = *(void *)(a2 + v28);
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v27) = 0;
          }
LABEL_54:
          uint64_t v47 = 32;
          goto LABEL_63;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 52) |= 2u;
          while (2)
          {
            uint64_t v34 = *v3;
            uint64_t v35 = *(void *)(a2 + v34);
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v27) = 0;
          }
LABEL_58:
          uint64_t v47 = 36;
          goto LABEL_63;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v27 = 0;
          break;
        case 6u:
          *(unsigned char *)(a1 + 52) |= 1u;
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v21 = 0;
          }
          uint64_t v48 = 8;
LABEL_68:
          *(void *)(a1 + v48) = v21;
          continue;
        case 7u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 24;
LABEL_50:
          unsigned int v46 = *(void **)(a1 + v24);
          *(void *)(a1 + v24) = v23;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v3;
        uint64_t v41 = *(void *)(a2 + v40);
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v27 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_60;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_62;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_60:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v27) = 0;
      }
LABEL_62:
      uint64_t v47 = 48;
LABEL_63:
      *(_DWORD *)(a1 + v47) = v27;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPAppCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        uint64_t v19 = objc_alloc_init(CLPAppLocation);
        [(id)a1 addAppLocation:v19];
        if (!PBReaderPlaceMark() || (CLPAppLocationReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_33:

          return 0;
        }
LABEL_27:
        PBReaderRecallMark();
LABEL_28:

        goto LABEL_30;
      }
      if (v18 == 1)
      {
        uint64_t v19 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v20 = PBReaderReadData();
    uint64_t v19 = *(CLPAppLocation **)(a1 + 24);
    *(void *)(a1 + 24) = v20;
    goto LABEL_28;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPAppLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;

        goto LABEL_73;
      case 2u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (2)
        {
          uint64_t v24 = *v3;
          uint64_t v25 = *(void *)(a2 + v24);
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              BOOL v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_59;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_59:
        uint64_t v50 = 24;
        goto LABEL_72;
      case 3u:
        *(unsigned char *)(a1 + 52) |= 1u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        *(void *)(a1 + 8) = v30;
        goto LABEL_73;
      case 4u:
        char v31 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v31);
        if PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_73:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 52) |= 8u;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v23 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_63:
        uint64_t v50 = 48;
        goto LABEL_72;
      case 6u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 52) |= 4u;
        while (2)
        {
          uint64_t v40 = *v3;
          uint64_t v41 = *(void *)(a2 + v40);
          unint64_t v42 = v41 + 1;
          if (v41 == -1 || v42 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v42;
            v23 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v15 = v39++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_67:
        uint64_t v50 = 44;
        goto LABEL_72;
      case 7u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)(a1 + 52) |= 2u;
        while (2)
        {
          uint64_t v46 = *v3;
          uint64_t v47 = *(void *)(a2 + v46);
          unint64_t v48 = v47 + 1;
          if (v47 == -1 || v48 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v48;
            v23 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v15 = v45++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v23) = 0;
        }
LABEL_71:
        uint64_t v50 = 40;
LABEL_72:
        *(_DWORD *)(a1 + v50) = v23;
        goto LABEL_73;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_73;
    }
  }
}

uint64_t CLPAppCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        unint64_t v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPBaroCalibrationIndicationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 4u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_53;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_55:
          BOOL v50 = v20 != 0;
          uint64_t v51 = 20;
          goto LABEL_64;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 24) |= 8u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  uint64_t v28 = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_59:
          BOOL v50 = v28 != 0;
          uint64_t v51 = 21;
          goto LABEL_64;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          *(unsigned char *)(a1 + 24) |= 0x10u;
          while (2)
          {
            uint64_t v36 = *v3;
            uint64_t v37 = *(void *)(a2 + v36);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
              *(void *)(a2 + v36) = v38;
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                BOOL v15 = v34++ >= 9;
                if (v15)
                {
                  uint64_t v35 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v35 = 0;
          }
LABEL_63:
          BOOL v50 = v35 != 0;
          uint64_t v51 = 22;
LABEL_64:
          *(unsigned char *)(a1 + v51) = v50;
          continue;
        case 4u:
          *(unsigned char *)(a1 + 24) |= 1u;
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v42 = *(void *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v42 = 0;
          }
          *(void *)(a1 + 8) = v42;
          continue;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v46 = *v3;
        uint64_t v47 = *(void *)(a2 + v46);
        unint64_t v48 = v47 + 1;
        if (v47 == -1 || v48 > *(void *)(a2 + *v4)) {
          break;
        }
        char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
        *(void *)(a2 + v46) = v48;
        v45 |= (unint64_t)(v49 & 0x7F) << v43;
        if ((v49 & 0x80) == 0) {
          goto LABEL_66;
        }
        v43 += 7;
        BOOL v15 = v44++ >= 9;
        if (v15)
        {
          LODWORD(v45) = 0;
          goto LABEL_68;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_66:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v45) = 0;
      }
LABEL_68:
      *(_DWORD *)(a1 + 16) = v45;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPBundleIdReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 16;
      }
      else
      {
        if (v18 != 2)
        {
          if (v18 == 1)
          {
            *(unsigned char *)(a1 + 32) |= 1u;
            uint64_t v19 = *v3;
            unint64_t v20 = *(void *)(a2 + v19);
            if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
            {
              uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
              *(void *)(a2 + v19) = v20 + 8;
            }
            else
            {
              *(unsigned char *)(a2 + *v5) = 1;
              uint64_t v21 = 0;
            }
            *(void *)(a1 + 8) = v21;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 24;
      }
      char v24 = *(void **)(a1 + v23);
      *(void *)(a1 + v23) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPCalibratedPressureCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(_DWORD *)(a1 + 112) |= 0x100u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFFBLL && v19 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 72;
        goto LABEL_134;
      case 2u:
        *(_DWORD *)(a1 + 112) |= 0x200u;
        uint64_t v22 = *v3;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 76;
        goto LABEL_134;
      case 3u:
        *(_DWORD *)(a1 + 112) |= 0x40u;
        uint64_t v24 = *v3;
        unint64_t v25 = *(void *)(a2 + v24);
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v25);
          *(void *)(a2 + v24) = v25 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 56;
        goto LABEL_134;
      case 4u:
        *(_DWORD *)(a1 + 112) |= 0x80u;
        uint64_t v26 = *v3;
        unint64_t v27 = *(void *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v27);
          *(void *)(a2 + v26) = v27 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 60;
        goto LABEL_134;
      case 5u:
        *(_DWORD *)(a1 + 112) |= 8u;
        uint64_t v28 = *v3;
        unint64_t v29 = *(void *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v73 = 32;
        goto LABEL_137;
      case 6u:
        *(_DWORD *)(a1 + 112) |= 1u;
        uint64_t v31 = *v3;
        unint64_t v32 = *(void *)(a2 + v31);
        if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v32);
          *(void *)(a2 + v31) = v32 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v73 = 8;
        goto LABEL_137;
      case 7u:
        *(_DWORD *)(a1 + 112) |= 2u;
        uint64_t v33 = *v3;
        unint64_t v34 = *(void *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v34);
          *(void *)(a2 + v33) = v34 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v73 = 16;
        goto LABEL_137;
      case 8u:
        *(_DWORD *)(a1 + 112) |= 0x400u;
        uint64_t v35 = *v3;
        unint64_t v36 = *(void *)(a2 + v35);
        if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v36);
          *(void *)(a2 + v35) = v36 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 80;
        goto LABEL_134;
      case 9u:
        *(_DWORD *)(a1 + 112) |= 0x10u;
        uint64_t v37 = *v3;
        unint64_t v38 = *(void *)(a2 + v37);
        if (v38 <= 0xFFFFFFFFFFFFFFFBLL && v38 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v38);
          *(void *)(a2 + v37) = v38 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 48;
        goto LABEL_134;
      case 0xAu:
        *(_DWORD *)(a1 + 112) |= 0x20u;
        uint64_t v39 = *v3;
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v40);
          *(void *)(a2 + v39) = v40 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 52;
        goto LABEL_134;
      case 0xBu:
        *(_DWORD *)(a1 + 112) |= 0x10000u;
        uint64_t v41 = *v3;
        unint64_t v42 = *(void *)(a2 + v41);
        if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v42);
          *(void *)(a2 + v41) = v42 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 104;
        goto LABEL_134;
      case 0xCu:
        *(_DWORD *)(a1 + 112) |= 0x20000u;
        uint64_t v43 = *v3;
        unint64_t v44 = *(void *)(a2 + v43);
        if (v44 <= 0xFFFFFFFFFFFFFFFBLL && v44 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v44);
          *(void *)(a2 + v43) = v44 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 108;
        goto LABEL_134;
      case 0xDu:
        *(_DWORD *)(a1 + 112) |= 0x2000u;
        uint64_t v45 = *v3;
        unint64_t v46 = *(void *)(a2 + v45);
        if (v46 <= 0xFFFFFFFFFFFFFFFBLL && v46 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v46);
          *(void *)(a2 + v45) = v46 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 92;
        goto LABEL_134;
      case 0xEu:
        *(_DWORD *)(a1 + 112) |= 0x4000u;
        uint64_t v47 = *v3;
        unint64_t v48 = *(void *)(a2 + v47);
        if (v48 <= 0xFFFFFFFFFFFFFFFBLL && v48 + 4 <= *(void *)(a2 + *v4))
        {
          int v20 = *(_DWORD *)(*(void *)(a2 + *v7) + v48);
          *(void *)(a2 + v47) = v48 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v20 = 0;
        }
        uint64_t v72 = 96;
LABEL_134:
        *(_DWORD *)(a1 + v72) = v20;
        goto LABEL_138;
      case 0xFu:
        *(_DWORD *)(a1 + 112) |= 4u;
        uint64_t v49 = *v3;
        unint64_t v50 = *(void *)(a2 + v49);
        if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v30 = *(void *)(*(void *)(a2 + *v7) + v50);
          *(void *)(a2 + v49) = v50 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v30 = 0;
        }
        uint64_t v73 = 24;
LABEL_137:
        *(void *)(a1 + v73) = v30;
        goto LABEL_138;
      case 0x10u:
        uint64_t v51 = objc_alloc_init(CLPMotionActivity);
        objc_storeStrong((id *)(a1 + 40), v51);
        if (!PBReaderPlaceMark() || !CLPMotionActivityReadFrom((uint64_t)v51, a2)) {
          goto LABEL_140;
        }
        goto LABEL_78;
      case 0x11u:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v54 = 0;
        *(_DWORD *)(a1 + 112) |= 0x8000u;
        while (2)
        {
          uint64_t v55 = *v3;
          uint64_t v56 = *(void *)(a2 + v55);
          unint64_t v57 = v56 + 1;
          if (v56 == -1 || v57 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v56);
            *(void *)(a2 + v55) = v57;
            v54 |= (unint64_t)(v58 & 0x7F) << v52;
            if (v58 < 0)
            {
              v52 += 7;
              BOOL v15 = v53++ >= 9;
              if (v15)
              {
                LODWORD(v54) = 0;
                goto LABEL_96;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v54) = 0;
        }
LABEL_96:
        uint64_t v71 = 100;
        goto LABEL_105;
      case 0x12u:
        uint64_t v51 = objc_alloc_init(CLPBaroCalibrationIndication);
        objc_storeStrong((id *)(a1 + 64), v51);
        if PBReaderPlaceMark() && (CLPBaroCalibrationIndicationReadFrom((uint64_t)v51, a2))
        {
LABEL_78:
          PBReaderRecallMark();

LABEL_138:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_140:

        return 0;
      case 0x13u:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v54 = 0;
        *(_DWORD *)(a1 + 112) |= 0x800u;
        while (2)
        {
          uint64_t v61 = *v3;
          uint64_t v62 = *(void *)(a2 + v61);
          unint64_t v63 = v62 + 1;
          if (v62 == -1 || v63 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
            *(void *)(a2 + v61) = v63;
            v54 |= (unint64_t)(v64 & 0x7F) << v59;
            if (v64 < 0)
            {
              v59 += 7;
              BOOL v15 = v60++ >= 9;
              if (v15)
              {
                LODWORD(v54) = 0;
                goto LABEL_100;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v54) = 0;
        }
LABEL_100:
        uint64_t v71 = 84;
        goto LABEL_105;
      case 0x14u:
        char v65 = 0;
        unsigned int v66 = 0;
        uint64_t v54 = 0;
        *(_DWORD *)(a1 + 112) |= 0x1000u;
        while (2)
        {
          uint64_t v67 = *v3;
          uint64_t v68 = *(void *)(a2 + v67);
          unint64_t v69 = v68 + 1;
          if (v68 == -1 || v69 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v70 = *(unsigned char *)(*(void *)(a2 + *v7) + v68);
            *(void *)(a2 + v67) = v69;
            v54 |= (unint64_t)(v70 & 0x7F) << v65;
            if (v70 < 0)
            {
              v65 += 7;
              BOOL v15 = v66++ >= 9;
              if (v15)
              {
                LODWORD(v54) = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v54) = 0;
        }
LABEL_104:
        uint64_t v71 = 88;
LABEL_105:
        *(_DWORD *)(a1 + v71) = v54;
        goto LABEL_138;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_138;
    }
  }
}

BOOL CLPMotionActivityReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 16) |= 2u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4))
          {
            uint64_t v26 = &OBJC_IVAR___CLPMotionActivity__type;
            goto LABEL_38;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            break;
          }
          v18 += 7;
          BOOL v25 = v19++ > 8;
          if (v25)
          {
            LODWORD(v20) = 0;
            uint64_t v26 = &OBJC_IVAR___CLPMotionActivity__type;
            goto LABEL_41;
          }
        }
        uint64_t v26 = &OBJC_IVAR___CLPMotionActivity__type;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + *v26) = v20;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_42:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v27 = 0;
    unsigned int v28 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 16) |= 1u;
    while (1)
    {
      uint64_t v29 = *v3;
      uint64_t v30 = *(void *)(a2 + v29);
      unint64_t v31 = v30 + 1;
      if (v30 == -1 || v31 > *(void *)(a2 + *v4)) {
        break;
      }
      char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
      *(void *)(a2 + v29) = v31;
      v20 |= (unint64_t)(v32 & 0x7F) << v27;
      if ((v32 & 0x80) == 0)
      {
        uint64_t v26 = &OBJC_IVAR___CLPMotionActivity__confidence;
        goto LABEL_39;
      }
      v27 += 7;
      BOOL v25 = v28++ > 8;
      if (v25)
      {
        LODWORD(v20) = 0;
        uint64_t v26 = &OBJC_IVAR___CLPMotionActivity__confidence;
        goto LABEL_41;
      }
    }
    uint64_t v26 = &OBJC_IVAR___CLPMotionActivity__confidence;
LABEL_38:
    *(unsigned char *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPCdmaCellNeighborReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 8u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4))
            {
              uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pnoffset;
              goto LABEL_61;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v18 += 7;
            BOOL v25 = v19++ > 8;
            if (v25)
            {
              LODWORD(v20) = 0;
              uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pnoffset;
              goto LABEL_64;
            }
          }
          uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pnoffset;
          goto LABEL_62;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 4u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pilotPhase;
              goto LABEL_61;
            }
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v25 = v28++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pilotPhase;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__pilotPhase;
          goto LABEL_62;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          while (2)
          {
            uint64_t v35 = *v3;
            uint64_t v36 = *(void *)(a2 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)(a2 + *v4))
            {
              uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__ecn0;
              goto LABEL_61;
            }
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v37;
            v20 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v25 = v34++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__ecn0;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__ecn0;
          goto LABEL_62;
        case 4u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 0x10u;
          while (2)
          {
            uint64_t v41 = *v3;
            uint64_t v42 = *(void *)(a2 + v41);
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)(a2 + *v4))
            {
              uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__rscp;
              goto LABEL_61;
            }
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v43;
            v20 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v25 = v40++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__rscp;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__rscp;
          goto LABEL_62;
        case 5u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
          return 0;
      }
      while (1)
      {
        uint64_t v47 = *v3;
        uint64_t v48 = *(void *)(a2 + v47);
        unint64_t v49 = v48 + 1;
        if (v48 == -1 || v49 > *(void *)(a2 + *v4)) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
        *(void *)(a2 + v47) = v49;
        v20 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
        {
          uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__channel;
          goto LABEL_62;
        }
        v45 += 7;
        BOOL v25 = v46++ > 8;
        if (v25)
        {
          LODWORD(v20) = 0;
          uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__channel;
          goto LABEL_64;
        }
      }
      uint64_t v26 = &OBJC_IVAR___CLPCdmaCellNeighbor__channel;
LABEL_61:
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_62:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v20) = 0;
      }
LABEL_64:
      *(_DWORD *)(a1 + *v26) = -(v20 & 1) ^ ((int)v20 >> 1);
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPCdmaCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    int v17 = v10 & 7;
    if (v16 || v17 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v22 = *v3;
          uint64_t v23 = *(void *)(a2 + v22);
          unint64_t v24 = v23 + 1;
          if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0) {
            goto LABEL_180;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_182;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_180:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_182:
        uint64_t v146 = 108;
        goto LABEL_235;
      case 2u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v21 = 0;
        while (2)
        {
          uint64_t v28 = *v3;
          uint64_t v29 = *(void *)(a2 + v28);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
            *(void *)(a2 + v28) = v30;
            v21 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              BOOL v15 = v27++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_186;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_186:
        uint64_t v146 = 112;
        goto LABEL_235;
      case 3u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v21 = 0;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v21 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_190:
        uint64_t v146 = 192;
        goto LABEL_235;
      case 4u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v21 = 0;
        while (2)
        {
          uint64_t v40 = *v3;
          uint64_t v41 = *(void *)(a2 + v40);
          unint64_t v42 = v41 + 1;
          if (v41 == -1 || v42 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v42;
            v21 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v15 = v39++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_194:
        uint64_t v146 = 136;
        goto LABEL_235;
      case 5u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v21 = 0;
        while (2)
        {
          uint64_t v46 = *v3;
          uint64_t v47 = *(void *)(a2 + v46);
          unint64_t v48 = v47 + 1;
          if (v47 == -1 || v48 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v48;
            v21 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v15 = v45++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_198;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_198:
        uint64_t v146 = 76;
        goto LABEL_235;
      case 6u:
        *(_WORD *)(a1 + 204) |= 1u;
        uint64_t v50 = *v3;
        unint64_t v51 = *(void *)(a2 + v50);
        if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v52 = *(void *)(*(void *)(a2 + *v7) + v51);
          *(void *)(a2 + v50) = v51 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v52 = 0;
        }
        uint64_t v156 = 32;
        goto LABEL_267;
      case 7u:
        *(_WORD *)(a1 + 204) |= 2u;
        uint64_t v53 = *v3;
        unint64_t v54 = *(void *)(a2 + v53);
        if (v54 <= 0xFFFFFFFFFFFFFFF7 && v54 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v52 = *(void *)(*(void *)(a2 + *v7) + v54);
          *(void *)(a2 + v53) = v54 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v52 = 0;
        }
        uint64_t v156 = 40;
        goto LABEL_267;
      case 8u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x4000u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
            *(void *)(a2 + v57) = v59;
            v21 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_202;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_202:
        uint64_t v146 = 196;
        goto LABEL_235;
      case 9u:
        uint64_t v61 = PBReaderReadString();
        uint64_t v62 = 168;
        goto LABEL_178;
      case 0xAu:
        *(_WORD *)(a1 + 204) |= 4u;
        uint64_t v63 = *v3;
        unint64_t v64 = *(void *)(a2 + v63);
        if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v52 = *(void *)(*(void *)(a2 + *v7) + v64);
          *(void *)(a2 + v63) = v64 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v52 = 0;
        }
        uint64_t v156 = 48;
        goto LABEL_267;
      case 0xBu:
        *(_WORD *)(a1 + 204) |= 8u;
        uint64_t v65 = *v3;
        unint64_t v66 = *(void *)(a2 + v65);
        if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v52 = *(void *)(*(void *)(a2 + *v7) + v66);
          *(void *)(a2 + v65) = v66 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v52 = 0;
        }
        uint64_t v156 = 56;
LABEL_267:
        *(void *)(a1 + v156) = v52;
        goto LABEL_268;
      case 0xCu:
        char v67 = 0;
        unsigned int v68 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x10u;
        while (2)
        {
          uint64_t v69 = *v3;
          uint64_t v70 = *(void *)(a2 + v69);
          unint64_t v71 = v70 + 1;
          if (v70 == -1 || v71 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v72 = *(unsigned char *)(*(void *)(a2 + *v7) + v70);
            *(void *)(a2 + v69) = v71;
            v21 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              v67 += 7;
              BOOL v15 = v68++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_206;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_206:
        uint64_t v146 = 72;
        goto LABEL_235;
      case 0xDu:
        char v73 = 0;
        unsigned int v74 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x800u;
        while (2)
        {
          uint64_t v75 = *v3;
          uint64_t v76 = *(void *)(a2 + v75);
          unint64_t v77 = v76 + 1;
          if (v76 == -1 || v77 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v78 = *(unsigned char *)(*(void *)(a2 + *v7) + v76);
            *(void *)(a2 + v75) = v77;
            v21 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              v73 += 7;
              BOOL v15 = v74++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_210;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_210:
        uint64_t v146 = 156;
        goto LABEL_235;
      case 0xEu:
        char v79 = 0;
        unsigned int v80 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x20u;
        while (2)
        {
          uint64_t v81 = *v3;
          uint64_t v82 = *(void *)(a2 + v81);
          unint64_t v83 = v82 + 1;
          if (v82 == -1 || v83 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v84 = *(unsigned char *)(*(void *)(a2 + *v7) + v82);
            *(void *)(a2 + v81) = v83;
            v21 |= (unint64_t)(v84 & 0x7F) << v79;
            if (v84 < 0)
            {
              v79 += 7;
              BOOL v15 = v80++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_214;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_214:
        uint64_t v146 = 80;
        goto LABEL_235;
      case 0xFu:
        char v85 = 0;
        unsigned int v86 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x400u;
        while (2)
        {
          uint64_t v87 = *v3;
          uint64_t v88 = *(void *)(a2 + v87);
          unint64_t v89 = v88 + 1;
          if (v88 == -1 || v89 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v88);
            *(void *)(a2 + v87) = v89;
            v21 |= (unint64_t)(v90 & 0x7F) << v85;
            if (v90 < 0)
            {
              v85 += 7;
              BOOL v15 = v86++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_218;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_218:
        uint64_t v146 = 152;
        goto LABEL_235;
      case 0x10u:
        char v91 = 0;
        unsigned int v92 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x40u;
        while (2)
        {
          uint64_t v93 = *v3;
          uint64_t v94 = *(void *)(a2 + v93);
          unint64_t v95 = v94 + 1;
          if (v94 == -1 || v95 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
            *(void *)(a2 + v93) = v95;
            v21 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              v91 += 7;
              BOOL v15 = v92++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_222;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_222:
        uint64_t v146 = 84;
        goto LABEL_235;
      case 0x11u:
        uint64_t v97 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 96), v97);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v97, a2) & 1) == 0) {
          goto LABEL_271;
        }
        goto LABEL_169;
      case 0x12u:
        uint64_t v61 = PBReaderReadString();
        uint64_t v62 = 64;
        goto LABEL_178;
      case 0x13u:
        char v98 = 0;
        unsigned int v99 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x2000u;
        while (2)
        {
          uint64_t v100 = *v3;
          uint64_t v101 = *(void *)(a2 + v100);
          unint64_t v102 = v101 + 1;
          if (v101 == -1 || v102 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v101);
            *(void *)(a2 + v100) = v102;
            v21 |= (unint64_t)(v103 & 0x7F) << v98;
            if (v103 < 0)
            {
              v98 += 7;
              BOOL v15 = v99++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_226;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_226:
        uint64_t v146 = 176;
        goto LABEL_235;
      case 0x14u:
        uint64_t v61 = PBReaderReadString();
        uint64_t v62 = 144;
        goto LABEL_178;
      case 0x15u:
        char v104 = 0;
        unsigned int v105 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x200u;
        while (2)
        {
          uint64_t v106 = *v3;
          uint64_t v107 = *(void *)(a2 + v106);
          unint64_t v108 = v107 + 1;
          if (v107 == -1 || v108 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v109 = *(unsigned char *)(*(void *)(a2 + *v7) + v107);
            *(void *)(a2 + v106) = v108;
            v21 |= (unint64_t)(v109 & 0x7F) << v104;
            if (v109 < 0)
            {
              v104 += 7;
              BOOL v15 = v105++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_230;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_230:
        uint64_t v146 = 104;
        goto LABEL_235;
      case 0x16u:
        char v110 = 0;
        unsigned int v111 = 0;
        uint64_t v21 = 0;
        *(_WORD *)(a1 + 204) |= 0x80u;
        while (2)
        {
          uint64_t v112 = *v3;
          uint64_t v113 = *(void *)(a2 + v112);
          unint64_t v114 = v113 + 1;
          if (v113 == -1 || v114 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v115 = *(unsigned char *)(*(void *)(a2 + *v7) + v113);
            *(void *)(a2 + v112) = v114;
            v21 |= (unint64_t)(v115 & 0x7F) << v110;
            if (v115 < 0)
            {
              v110 += 7;
              BOOL v15 = v111++ >= 9;
              if (v15)
              {
                LODWORD(v21) = 0;
                goto LABEL_234;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_234:
        uint64_t v146 = 88;
LABEL_235:
        *(_DWORD *)(a1 + v146) = v21;
        goto LABEL_268;
      case 0x17u:
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
          {
            char v117 = 0;
            unsigned int v118 = 0;
            uint64_t v119 = 0;
            while (1)
            {
              uint64_t v120 = *v3;
              uint64_t v121 = *(void *)(a2 + v120);
              unint64_t v122 = v121 + 1;
              if (v121 == -1 || v122 > *(void *)(a2 + *v4)) {
                break;
              }
              char v123 = *(unsigned char *)(*(void *)(a2 + *v7) + v121);
              *(void *)(a2 + v120) = v122;
              v119 |= (unint64_t)(v123 & 0x7F) << v117;
              if (v123 < 0)
              {
                v117 += 7;
                BOOL v15 = v118++ >= 9;
                if (!v15) {
                  continue;
                }
              }
              goto LABEL_147;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_147:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          char v149 = 0;
          unsigned int v150 = 0;
          uint64_t v151 = 0;
          while (1)
          {
            uint64_t v152 = *v3;
            uint64_t v153 = *(void *)(a2 + v152);
            unint64_t v154 = v153 + 1;
            if (v153 == -1 || v154 > *(void *)(a2 + *v4)) {
              break;
            }
            char v155 = *(unsigned char *)(*(void *)(a2 + *v7) + v153);
            *(void *)(a2 + v152) = v154;
            v151 |= (unint64_t)(v155 & 0x7F) << v149;
            if (v155 < 0)
            {
              v149 += 7;
              BOOL v15 = v150++ >= 9;
              if (!v15) {
                continue;
              }
            }
            goto LABEL_258;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_258:
          PBRepeatedInt32Add();
        }
        goto LABEL_268;
      case 0x19u:
        char v124 = 0;
        unsigned int v125 = 0;
        uint64_t v126 = 0;
        *(_WORD *)(a1 + 204) |= 0x100u;
        while (2)
        {
          uint64_t v127 = *v3;
          uint64_t v128 = *(void *)(a2 + v127);
          unint64_t v129 = v128 + 1;
          if (v128 == -1 || v129 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v130 = *(unsigned char *)(*(void *)(a2 + *v7) + v128);
            *(void *)(a2 + v127) = v129;
            v126 |= (unint64_t)(v130 & 0x7F) << v124;
            if (v130 < 0)
            {
              v124 += 7;
              BOOL v15 = v125++ >= 9;
              if (v15)
              {
                LODWORD(v126) = 0;
                goto LABEL_239;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v126) = 0;
        }
LABEL_239:
        int v147 = -(v126 & 1) ^ ((int)v126 >> 1);
        uint64_t v148 = 92;
        goto LABEL_244;
      case 0x1Au:
        char v131 = 0;
        unsigned int v132 = 0;
        uint64_t v133 = 0;
        *(_WORD *)(a1 + 204) |= 0x1000u;
        while (2)
        {
          uint64_t v134 = *v3;
          uint64_t v135 = *(void *)(a2 + v134);
          unint64_t v136 = v135 + 1;
          if (v135 == -1 || v136 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v137 = *(unsigned char *)(*(void *)(a2 + *v7) + v135);
            *(void *)(a2 + v134) = v136;
            v133 |= (unint64_t)(v137 & 0x7F) << v131;
            if (v137 < 0)
            {
              v131 += 7;
              BOOL v15 = v132++ >= 9;
              if (v15)
              {
                LODWORD(v133) = 0;
                goto LABEL_243;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v133) = 0;
        }
LABEL_243:
        int v147 = -(v133 & 1) ^ ((int)v133 >> 1);
        uint64_t v148 = 160;
LABEL_244:
        *(_DWORD *)(a1 + v148) = v147;
        goto LABEL_268;
      case 0x1Eu:
        uint64_t v97 = objc_alloc_init(CLPCdmaCellNeighbor);
        [(id)a1 addNeighbor:v97];
        if (!PBReaderPlaceMark() || !CLPCdmaCellNeighborReadFrom((uint64_t)v97, a2)) {
          goto LABEL_271;
        }
        goto LABEL_169;
      case 0x1Fu:
        uint64_t v97 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 120), v97);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v97, a2))
        {
LABEL_169:
          PBReaderRecallMark();

LABEL_268:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_271:

        return 0;
      case 0x20u:
        char v138 = 0;
        unsigned int v139 = 0;
        uint64_t v140 = 0;
        *(_WORD *)(a1 + 204) |= 0x8000u;
        while (2)
        {
          uint64_t v141 = *v3;
          uint64_t v142 = *(void *)(a2 + v141);
          unint64_t v143 = v142 + 1;
          if (v142 == -1 || v143 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v144 = *(unsigned char *)(*(void *)(a2 + *v7) + v142);
            *(void *)(a2 + v141) = v143;
            v140 |= (unint64_t)(v144 & 0x7F) << v138;
            if (v144 < 0)
            {
              v138 += 7;
              BOOL v15 = v139++ >= 9;
              if (v15)
              {
                uint64_t v140 = 0;
                goto LABEL_248;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v140 = 0;
        }
LABEL_248:
        *(unsigned char *)(a1 + 200) = v140 != 0;
        goto LABEL_268;
      case 0x21u:
        uint64_t v61 = PBReaderReadString();
        uint64_t v62 = 184;
LABEL_178:
        v145 = *(void **)(a1 + v62);
        *(void *)(a1 + v62) = v61;

        goto LABEL_268;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_268;
    }
  }
}

BOOL CLPCellNeighborsGroupReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = objc_alloc_init(CLPCellNeighbor);
        [a1 addGsmNeighbors:v18];
        goto LABEL_23;
      case 2u:
        char v18 = objc_alloc_init(CLPCellNeighbor);
        [a1 addScdmaNeighbors:v18];
LABEL_23:
        if (!PBReaderPlaceMark() || !CLPCellNeighborReadFrom((uint64_t)v18, a2)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      case 3u:
        char v18 = objc_alloc_init(CLPCdmaCellNeighbor);
        [a1 addCdmaNeighbors:v18];
        if (!PBReaderPlaceMark() || !CLPCdmaCellNeighborReadFrom((uint64_t)v18, a2)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      case 4u:
        char v18 = objc_alloc_init(CLPLteCellNeighbor);
        [a1 addLteNeighbors:v18];
        if (!PBReaderPlaceMark() || !CLPLteCellNeighborReadFrom((uint64_t)v18, a2)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      case 5u:
        char v18 = objc_alloc_init(CLPNRCellNeighbor);
        [a1 addNrNeighbors:v18];
        if (PBReaderPlaceMark() && CLPNRCellNeighborReadFrom((uint64_t)v18, a2))
        {
LABEL_34:
          PBReaderRecallMark();

LABEL_35:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_38:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_35;
    }
  }
}

BOOL CLPCellNeighborReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 0x10u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4))
            {
              char v26 = &OBJC_IVAR___CLPCellNeighbor__uarfcn;
              goto LABEL_61;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v18 += 7;
            BOOL v25 = v19++ > 8;
            if (v25)
            {
              LODWORD(v20) = 0;
              char v26 = &OBJC_IVAR___CLPCellNeighbor__uarfcn;
              goto LABEL_64;
            }
          }
          char v26 = &OBJC_IVAR___CLPCellNeighbor__uarfcn;
          goto LABEL_62;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              char v26 = &OBJC_IVAR___CLPCellNeighbor__psc;
              goto LABEL_61;
            }
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              BOOL v25 = v28++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                char v26 = &OBJC_IVAR___CLPCellNeighbor__psc;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          char v26 = &OBJC_IVAR___CLPCellNeighbor__psc;
          goto LABEL_62;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 8u;
          while (2)
          {
            uint64_t v35 = *v3;
            uint64_t v36 = *(void *)(a2 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)(a2 + *v4))
            {
              char v26 = &OBJC_IVAR___CLPCellNeighbor__rssi;
              goto LABEL_61;
            }
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
            *(void *)(a2 + v35) = v37;
            v20 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              BOOL v25 = v34++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                char v26 = &OBJC_IVAR___CLPCellNeighbor__rssi;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          char v26 = &OBJC_IVAR___CLPCellNeighbor__rssi;
          goto LABEL_62;
        case 4u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          while (2)
          {
            uint64_t v41 = *v3;
            uint64_t v42 = *(void *)(a2 + v41);
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)(a2 + *v4))
            {
              char v26 = &OBJC_IVAR___CLPCellNeighbor__ecn0;
              goto LABEL_61;
            }
            char v44 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v43;
            v20 |= (unint64_t)(v44 & 0x7F) << v39;
            if (v44 < 0)
            {
              v39 += 7;
              BOOL v25 = v40++ > 8;
              if (v25)
              {
                LODWORD(v20) = 0;
                char v26 = &OBJC_IVAR___CLPCellNeighbor__ecn0;
                goto LABEL_64;
              }
              continue;
            }
            break;
          }
          char v26 = &OBJC_IVAR___CLPCellNeighbor__ecn0;
          goto LABEL_62;
        case 5u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 28) |= 4u;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
          return 0;
      }
      while (1)
      {
        uint64_t v47 = *v3;
        uint64_t v48 = *(void *)(a2 + v47);
        unint64_t v49 = v48 + 1;
        if (v48 == -1 || v49 > *(void *)(a2 + *v4)) {
          break;
        }
        char v50 = *(unsigned char *)(*(void *)(a2 + *v7) + v48);
        *(void *)(a2 + v47) = v49;
        v20 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
        {
          char v26 = &OBJC_IVAR___CLPCellNeighbor__rscp;
          goto LABEL_62;
        }
        v45 += 7;
        BOOL v25 = v46++ > 8;
        if (v25)
        {
          LODWORD(v20) = 0;
          char v26 = &OBJC_IVAR___CLPCellNeighbor__rscp;
          goto LABEL_64;
        }
      }
      char v26 = &OBJC_IVAR___CLPCellNeighbor__rscp;
LABEL_61:
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_62:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v20) = 0;
      }
LABEL_64:
      *(_DWORD *)(a1 + *v26) = -(v20 & 1) ^ ((int)v20 >> 1);
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPLteCellNeighborReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 0x80u;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_78;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_80;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_78:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_80:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          char v67 = &OBJC_IVAR___CLPLteCellNeighbor__uarfcn;
          goto LABEL_109;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 0x10u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v20 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_84:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          char v67 = &OBJC_IVAR___CLPLteCellNeighbor__pid;
          goto LABEL_109;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 0x40u;
          while (2)
          {
            uint64_t v33 = *v3;
            uint64_t v34 = *(void *)(a2 + v33);
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v35;
              v20 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v15 = v32++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_88:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          char v67 = &OBJC_IVAR___CLPLteCellNeighbor__rssi;
          goto LABEL_109;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 2u;
          while (2)
          {
            uint64_t v39 = *v3;
            uint64_t v40 = *(void *)(a2 + v39);
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
              *(void *)(a2 + v39) = v41;
              v20 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                BOOL v15 = v38++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_92:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          char v67 = &OBJC_IVAR___CLPLteCellNeighbor__ecn0;
          goto LABEL_109;
        case 5u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 0x20u;
          while (2)
          {
            uint64_t v45 = *v3;
            uint64_t v46 = *(void *)(a2 + v45);
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
              *(void *)(a2 + v45) = v47;
              v20 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v15 = v44++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_96:
          LODWORD(v20) = -(v20 & 1) ^ ((int)v20 >> 1);
          char v67 = &OBJC_IVAR___CLPLteCellNeighbor__rscp;
          goto LABEL_109;
        case 6u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 1u;
          while (2)
          {
            uint64_t v51 = *v3;
            uint64_t v52 = *(void *)(a2 + v51);
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
              *(void *)(a2 + v51) = v53;
              v20 |= (unint64_t)(v54 & 0x7F) << v49;
              if (v54 < 0)
              {
                v49 += 7;
                BOOL v15 = v50++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_100:
          char v67 = &OBJC_IVAR___CLPLteCellNeighbor__bandwidth;
          goto LABEL_109;
        case 7u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
          while (2)
          {
            uint64_t v57 = *v3;
            uint64_t v58 = *(void *)(a2 + v57);
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
              *(void *)(a2 + v57) = v59;
              v20 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                BOOL v15 = v56++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_104;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_104:
          char v67 = &OBJC_IVAR___CLPLteCellNeighbor__neighborType;
          goto LABEL_109;
        case 8u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 40) |= 4u;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
          return 0;
      }
      while (1)
      {
        uint64_t v63 = *v3;
        uint64_t v64 = *(void *)(a2 + v63);
        unint64_t v65 = v64 + 1;
        if (v64 == -1 || v65 > *(void *)(a2 + *v4)) {
          break;
        }
        char v66 = *(unsigned char *)(*(void *)(a2 + *v7) + v64);
        *(void *)(a2 + v63) = v65;
        v20 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0) {
          goto LABEL_106;
        }
        v61 += 7;
        BOOL v15 = v62++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_108;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_106:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v20) = 0;
      }
LABEL_108:
      char v67 = &OBJC_IVAR___CLPLteCellNeighbor__maxThroughput;
LABEL_109:
      *(_DWORD *)(a1 + *v67) = v20;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPNRCellNeighborReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    char v8 = &OBJC_IVAR___CLPNRCellNeighbor__nrarfcn;
    unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
    unint64_t v10 = &OBJC_IVAR___CLPNRCellNeighbor__pid;
    uint64_t v11 = &OBJC_IVAR___CLPNRCellNeighbor__rssi;
    uint64_t v12 = &OBJC_IVAR___CLPNRCellNeighbor__ecn0;
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v3;
        uint64_t v17 = *(void *)(a2 + v16);
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)(a2 + *v4)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)(a2 + *v9) + v17);
        *(void *)(a2 + v16) = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_12;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v21 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v15 = 0;
      }
LABEL_14:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 0x20u;
          while (1)
          {
            uint64_t v26 = *v3;
            uint64_t v27 = *(void *)(a2 + v26);
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)(a2 + *v4)) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)(a2 + *v9) + v27);
            *(void *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0) {
              goto LABEL_99;
            }
            v23 += 7;
            BOOL v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_101;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_99:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_101:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          char v96 = v8;
          goto LABEL_142;
        case 2u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 0x40u;
          while (2)
          {
            uint64_t v38 = *v3;
            uint64_t v39 = *(void *)(a2 + v38);
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v9) + v39);
              *(void *)(a2 + v38) = v40;
              v25 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                BOOL v20 = v37++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_105:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          char v96 = v10;
          goto LABEL_142;
        case 3u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 0x100u;
          while (2)
          {
            uint64_t v44 = *v3;
            uint64_t v45 = *(void *)(a2 + v44);
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)(a2 + *v9) + v45);
              *(void *)(a2 + v44) = v46;
              v25 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v20 = v43++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_109:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          char v96 = v11;
          goto LABEL_142;
        case 4u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 4u;
          while (2)
          {
            uint64_t v50 = *v3;
            uint64_t v51 = *(void *)(a2 + v50);
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)(a2 + *v9) + v51);
              *(void *)(a2 + v50) = v52;
              v25 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                BOOL v20 = v49++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_113:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          char v96 = v12;
          goto LABEL_142;
        case 5u:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 0x80u;
          while (2)
          {
            uint64_t v56 = *v3;
            uint64_t v57 = *(void *)(a2 + v56);
            unint64_t v58 = v57 + 1;
            if (v57 == -1 || v58 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v59 = *(unsigned char *)(*(void *)(a2 + *v9) + v57);
              *(void *)(a2 + v56) = v58;
              v25 |= (unint64_t)(v59 & 0x7F) << v54;
              if (v59 < 0)
              {
                v54 += 7;
                BOOL v20 = v55++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_117:
          LODWORD(v25) = -(v25 & 1) ^ ((int)v25 >> 1);
          char v96 = &OBJC_IVAR___CLPNRCellNeighbor__rscp;
          goto LABEL_142;
        case 6u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 0x400u;
          while (2)
          {
            uint64_t v62 = *v3;
            uint64_t v63 = *(void *)(a2 + v62);
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)(a2 + *v9) + v63);
              *(void *)(a2 + v62) = v64;
              v25 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v20 = v61++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_121:
          char v96 = &OBJC_IVAR___CLPNRCellNeighbor__scs;
          goto LABEL_142;
        case 7u:
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 0x200u;
          while (2)
          {
            uint64_t v68 = *v3;
            uint64_t v69 = *(void *)(a2 + v68);
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)(a2 + *v9) + v69);
              *(void *)(a2 + v68) = v70;
              v25 |= (unint64_t)(v71 & 0x7F) << v66;
              if (v71 < 0)
              {
                v66 += 7;
                BOOL v20 = v67++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_125:
          char v96 = &OBJC_IVAR___CLPNRCellNeighbor__saOrNsaNeighbor;
          goto LABEL_142;
        case 8u:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 1u;
          while (2)
          {
            uint64_t v74 = *v3;
            uint64_t v75 = *(void *)(a2 + v74);
            unint64_t v76 = v75 + 1;
            if (v75 == -1 || v76 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)(a2 + *v9) + v75);
              *(void *)(a2 + v74) = v76;
              v25 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                BOOL v20 = v73++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_129:
          char v96 = &OBJC_IVAR___CLPNRCellNeighbor__bandwidth;
          goto LABEL_142;
        case 9u:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 0x10u;
          while (2)
          {
            uint64_t v80 = *v3;
            uint64_t v81 = *(void *)(a2 + v80);
            unint64_t v82 = v81 + 1;
            if (v81 == -1 || v82 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v83 = *(unsigned char *)(*(void *)(a2 + *v9) + v81);
              *(void *)(a2 + v80) = v82;
              v25 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                BOOL v20 = v79++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_133:
          char v96 = &OBJC_IVAR___CLPNRCellNeighbor__neighborType;
          goto LABEL_142;
        case 0xAu:
          char v84 = 0;
          unsigned int v85 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 8u;
          while (2)
          {
            uint64_t v86 = *v3;
            uint64_t v87 = *(void *)(a2 + v86);
            unint64_t v88 = v87 + 1;
            if (v87 == -1 || v88 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)(a2 + *v9) + v87);
              *(void *)(a2 + v86) = v88;
              v25 |= (unint64_t)(v89 & 0x7F) << v84;
              if (v89 < 0)
              {
                v84 += 7;
                BOOL v20 = v85++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v25) = 0;
          }
LABEL_137:
          char v96 = &OBJC_IVAR___CLPNRCellNeighbor__maxThroughput;
          goto LABEL_142;
        case 0xBu:
          char v90 = 0;
          unsigned int v91 = 0;
          uint64_t v25 = 0;
          *(_WORD *)(a1 + v7[244]) |= 2u;
          break;
        default:
          char v30 = v8;
          char v31 = v10;
          unsigned int v32 = v11;
          uint64_t v33 = v7;
          uint64_t v34 = v12;
          char v35 = PBReaderSkipValueWithTag();
          uint64_t v12 = v34;
          v5 = (int *)MEMORY[0x1E4F940C8];
          v7 = v33;
          uint64_t v11 = v32;
          unint64_t v10 = v31;
          char v8 = v30;
          if (v35) {
            continue;
          }
          return 0;
      }
      while (1)
      {
        uint64_t v92 = *v3;
        uint64_t v93 = *(void *)(a2 + v92);
        unint64_t v94 = v93 + 1;
        if (v93 == -1 || v94 > *(void *)(a2 + *v4)) {
          break;
        }
        char v95 = *(unsigned char *)(*(void *)(a2 + *v9) + v93);
        *(void *)(a2 + v92) = v94;
        v25 |= (unint64_t)(v95 & 0x7F) << v90;
        if ((v95 & 0x80) == 0) {
          goto LABEL_139;
        }
        v90 += 7;
        BOOL v20 = v91++ >= 9;
        if (v20)
        {
          LODWORD(v25) = 0;
          goto LABEL_141;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_139:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v25) = 0;
      }
LABEL_141:
      char v96 = &OBJC_IVAR___CLPNRCellNeighbor__bwpSupport;
LABEL_142:
      *(_DWORD *)(a1 + *v96) = v25;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPCellOutOfServiceInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          unint64_t v18 = objc_alloc_init(CLPLocation);
          objc_storeStrong((id *)(a1 + 8), v18);
          if PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v18, a2))
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          int v21 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v20;

          continue;
        case 3u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          *(unsigned char *)(a1 + 28) |= 2u;
          while (2)
          {
            uint64_t v25 = *v3;
            uint64_t v26 = *(void *)(a2 + v25);
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
              *(void *)(a2 + v25) = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v15 = v23++ >= 9;
                if (v15)
                {
                  uint64_t v24 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v24 = 0;
          }
LABEL_42:
          BOOL v36 = v24 != 0;
          uint64_t v37 = 25;
          goto LABEL_47;
        case 4u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          *(unsigned char *)(a1 + 28) |= 1u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v3;
        uint64_t v33 = *(void *)(a2 + v32);
        unint64_t v34 = v33 + 1;
        if (v33 == -1 || v34 > *(void *)(a2 + *v4)) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
        *(void *)(a2 + v32) = v34;
        v31 |= (unint64_t)(v35 & 0x7F) << v29;
        if ((v35 & 0x80) == 0) {
          goto LABEL_44;
        }
        v29 += 7;
        BOOL v15 = v30++ >= 9;
        if (v15)
        {
          uint64_t v31 = 0;
          goto LABEL_46;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v31 = 0;
      }
LABEL_46:
      BOOL v36 = v31 != 0;
      uint64_t v37 = 24;
LABEL_47:
      *(unsigned char *)(a1 + v37) = v36;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_140;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_142;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_140:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_142:
        uint64_t v119 = 40;
        goto LABEL_188;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_146:
        uint64_t v119 = 44;
        goto LABEL_188;
      case 3u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v33 = *v3;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_150:
        uint64_t v119 = 28;
        goto LABEL_188;
      case 4u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v39 = *v3;
          uint64_t v40 = *(void *)(a2 + v39);
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v41;
            v20 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_154;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_154:
        uint64_t v119 = 20;
        goto LABEL_188;
      case 5u:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v45 = *v3;
          uint64_t v46 = *(void *)(a2 + v45);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v20 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              BOOL v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_158;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_158:
        uint64_t v119 = 84;
        goto LABEL_188;
      case 6u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 112) |= 1u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v20 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_162;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_162:
        uint64_t v119 = 16;
        goto LABEL_188;
      case 7u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 112) |= 4u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
            *(void *)(a2 + v57) = v59;
            v20 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_166;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_166:
        uint64_t v119 = 72;
        goto LABEL_188;
      case 8u:
        unsigned int v61 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v61);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v61, a2) & 1) == 0) {
          goto LABEL_204;
        }
        goto LABEL_115;
      case 9u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 8;
        goto LABEL_124;
      case 0xAu:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 112) |= 0x20u;
        while (2)
        {
          uint64_t v66 = *v3;
          uint64_t v67 = *(void *)(a2 + v66);
          unint64_t v68 = v67 + 1;
          if (v67 == -1 || v68 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v68;
            v20 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v64 += 7;
              BOOL v15 = v65++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_170;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_170:
        uint64_t v119 = 88;
        goto LABEL_188;
      case 0xBu:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 112) |= 0x40u;
        while (2)
        {
          uint64_t v72 = *v3;
          uint64_t v73 = *(void *)(a2 + v72);
          unint64_t v74 = v73 + 1;
          if (v73 == -1 || v74 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v74;
            v20 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v70 += 7;
              BOOL v15 = v71++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_174;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_174:
        uint64_t v119 = 104;
        goto LABEL_188;
      case 0xCu:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 64;
        goto LABEL_124;
      case 0xFu:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v79 = 0;
        *(_WORD *)(a1 + 112) |= 2u;
        while (2)
        {
          uint64_t v80 = *v3;
          uint64_t v81 = *(void *)(a2 + v80);
          unint64_t v82 = v81 + 1;
          if (v81 == -1 || v82 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
            *(void *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              BOOL v15 = v78++ >= 9;
              if (v15)
              {
                LODWORD(v79) = 0;
                goto LABEL_178;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v79) = 0;
        }
LABEL_178:
        int v120 = -(v79 & 1) ^ ((int)v79 >> 1);
        uint64_t v121 = 24;
        goto LABEL_183;
      case 0x10u:
        char v84 = 0;
        unsigned int v85 = 0;
        uint64_t v86 = 0;
        *(_WORD *)(a1 + 112) |= 0x10u;
        while (2)
        {
          uint64_t v87 = *v3;
          uint64_t v88 = *(void *)(a2 + v87);
          unint64_t v89 = v88 + 1;
          if (v88 == -1 || v89 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v88);
            *(void *)(a2 + v87) = v89;
            v86 |= (unint64_t)(v90 & 0x7F) << v84;
            if (v90 < 0)
            {
              v84 += 7;
              BOOL v15 = v85++ >= 9;
              if (v15)
              {
                LODWORD(v86) = 0;
                goto LABEL_182;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v86) = 0;
        }
LABEL_182:
        int v120 = -(v86 & 1) ^ ((int)v86 >> 1);
        uint64_t v121 = 80;
LABEL_183:
        *(_DWORD *)(a1 + v121) = v120;
        goto LABEL_202;
      case 0x11u:
        char v91 = 0;
        unsigned int v92 = 0;
        uint64_t v20 = 0;
        *(_WORD *)(a1 + 112) |= 8u;
        while (2)
        {
          uint64_t v93 = *v3;
          uint64_t v94 = *(void *)(a2 + v93);
          unint64_t v95 = v94 + 1;
          if (v94 == -1 || v95 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
            *(void *)(a2 + v93) = v95;
            v20 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              v91 += 7;
              BOOL v15 = v92++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_187;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_187:
        uint64_t v119 = 76;
LABEL_188:
        *(_DWORD *)(a1 + v119) = v20;
        goto LABEL_202;
      case 0x14u:
        unsigned int v61 = objc_alloc_init(CLPCellNeighbor);
        [(id)a1 addNeighbor:v61];
        if (!PBReaderPlaceMark() || !CLPCellNeighborReadFrom((uint64_t)v61, a2)) {
          goto LABEL_204;
        }
        goto LABEL_115;
      case 0x15u:
        unsigned int v61 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 48), v61);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v61, a2))
        {
LABEL_115:
          PBReaderRecallMark();

LABEL_202:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_204:

        return 0;
      case 0x16u:
        char v97 = 0;
        unsigned int v98 = 0;
        uint64_t v99 = 0;
        *(_WORD *)(a1 + 112) |= 0x100u;
        while (2)
        {
          uint64_t v100 = *v3;
          uint64_t v101 = *(void *)(a2 + v100);
          unint64_t v102 = v101 + 1;
          if (v101 == -1 || v102 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v101);
            *(void *)(a2 + v100) = v102;
            v99 |= (unint64_t)(v103 & 0x7F) << v97;
            if (v103 < 0)
            {
              v97 += 7;
              BOOL v15 = v98++ >= 9;
              if (v15)
              {
                uint64_t v99 = 0;
                goto LABEL_192;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v99 = 0;
        }
LABEL_192:
        BOOL v122 = v99 != 0;
        uint64_t v123 = 109;
        goto LABEL_201;
      case 0x17u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 96;
LABEL_124:
        char v104 = *(void **)(a1 + v63);
        *(void *)(a1 + v63) = v62;

        goto LABEL_202;
      case 0x18u:
        char v105 = 0;
        unsigned int v106 = 0;
        uint64_t v107 = 0;
        *(_WORD *)(a1 + 112) |= 0x200u;
        while (2)
        {
          uint64_t v108 = *v3;
          uint64_t v109 = *(void *)(a2 + v108);
          unint64_t v110 = v109 + 1;
          if (v109 == -1 || v110 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v111 = *(unsigned char *)(*(void *)(a2 + *v7) + v109);
            *(void *)(a2 + v108) = v110;
            v107 |= (unint64_t)(v111 & 0x7F) << v105;
            if (v111 < 0)
            {
              v105 += 7;
              BOOL v15 = v106++ >= 9;
              if (v15)
              {
                uint64_t v107 = 0;
                goto LABEL_196;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v107 = 0;
        }
LABEL_196:
        BOOL v122 = v107 != 0;
        uint64_t v123 = 110;
        goto LABEL_201;
      case 0x19u:
        char v112 = 0;
        unsigned int v113 = 0;
        uint64_t v114 = 0;
        *(_WORD *)(a1 + 112) |= 0x80u;
        while (2)
        {
          uint64_t v115 = *v3;
          uint64_t v116 = *(void *)(a2 + v115);
          unint64_t v117 = v116 + 1;
          if (v116 == -1 || v117 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v118 = *(unsigned char *)(*(void *)(a2 + *v7) + v116);
            *(void *)(a2 + v115) = v117;
            v114 |= (unint64_t)(v118 & 0x7F) << v112;
            if (v118 < 0)
            {
              v112 += 7;
              BOOL v15 = v113++ >= 9;
              if (v15)
              {
                uint64_t v114 = 0;
                goto LABEL_200;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v114 = 0;
        }
LABEL_200:
        BOOL v122 = v114 != 0;
        uint64_t v123 = 108;
LABEL_201:
        *(unsigned char *)(a1 + v123) = v122;
        goto LABEL_202;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_202;
    }
  }
}

BOOL CLPCellWifiCollectionRequestReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 5, v18);
        if PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2)) {
          goto LABEL_44;
        }
        goto LABEL_48;
      case 2u:
        char v18 = objc_alloc_init(CLPCellTowerLocation);
        [a1 addCellTowerLocation:v18];
        if (!PBReaderPlaceMark() || (CLPCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 3u:
        char v18 = objc_alloc_init(CLPWifiAPLocation);
        [a1 addWifiAPLocation:v18];
        if (!PBReaderPlaceMark() || (CLPWifiAPLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 4u:
        char v18 = objc_alloc_init(CLPCdmaCellTowerLocation);
        [a1 addCdmaCellTowerLocation:v18];
        if (!PBReaderPlaceMark() || (CLPCdmaCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 5u:
        char v18 = objc_alloc_init(CLPLteCellTowerLocation);
        [a1 addLteCellTowerLocation:v18];
        if (!PBReaderPlaceMark() || (CLPLteCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 6u:
        char v18 = objc_alloc_init(CLPSCdmaCellTowerLocation);
        [a1 addScdmaCellTowerLocation:v18];
        if (!PBReaderPlaceMark() || (CLPSCdmaCellTowerLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 7u:
        char v18 = objc_alloc_init(CLPCellOutOfServiceInfo);
        [a1 addCellOutOfServiceInfo:v18];
        if (!PBReaderPlaceMark() || (CLPCellOutOfServiceInfoReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 8u:
        char v18 = objc_alloc_init(CLPNRCellTowerLocation);
        [a1 addNrCellTowerLocation:v18];
        if PBReaderPlaceMark() && (CLPNRCellTowerLocationReadFrom((uint64_t)v18, a2))
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_45:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_48:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_45;
    }
  }
}

uint64_t CLPWifiAPLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
  char v8 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
  unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
  unint64_t v10 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      uint64_t v15 = *(void *)(a2 + v14);
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        int v19 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v19 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v19 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = v7[408];
        goto LABEL_40;
      case 2u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v9) + v28);
            *(void *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              BOOL v18 = v25++ >= 9;
              if (v18)
              {
                LODWORD(v26) = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_68:
        uint64_t v63 = v8[409];
        goto LABEL_85;
      case 3u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v26 = 0;
        while (2)
        {
          uint64_t v33 = *v3;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v9) + v34);
            *(void *)(a2 + v33) = v35;
            v26 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v18 = v32++ >= 9;
              if (v18)
              {
                LODWORD(v26) = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_72:
        uint64_t v63 = v10[410];
        goto LABEL_85;
      case 4u:
        char v37 = v10;
        unsigned int v38 = v8;
        uint64_t v39 = v7;
        uint64_t v40 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v40);
        if PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v40, a2))
        {
          PBReaderRecallMark();

          v7 = v39;
          char v8 = v38;
          unint64_t v10 = v37;
LABEL_86:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 16;
LABEL_40:
        unint64_t v41 = *(void **)(a1 + v22);
        *(void *)(a1 + v22) = v21;

        goto LABEL_86;
      case 6u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 60) |= 8u;
        while (2)
        {
          uint64_t v44 = *v3;
          uint64_t v45 = *(void *)(a2 + v44);
          unint64_t v46 = v45 + 1;
          if (v45 == -1 || v46 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)(a2 + *v9) + v45);
            *(void *)(a2 + v44) = v46;
            v26 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              BOOL v18 = v43++ >= 9;
              if (v18)
              {
                LODWORD(v26) = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_76:
        uint64_t v63 = 56;
        goto LABEL_85;
      case 7u:
        char v48 = 0;
        unsigned int v49 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 60) |= 2u;
        while (2)
        {
          uint64_t v50 = *v3;
          uint64_t v51 = *(void *)(a2 + v50);
          unint64_t v52 = v51 + 1;
          if (v51 == -1 || v52 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + *v9) + v51);
            *(void *)(a2 + v50) = v52;
            v26 |= (unint64_t)(v53 & 0x7F) << v48;
            if (v53 < 0)
            {
              v48 += 7;
              BOOL v18 = v49++ >= 9;
              if (v18)
              {
                LODWORD(v26) = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_80:
        uint64_t v63 = 28;
        goto LABEL_85;
      case 8u:
        *(unsigned char *)(a1 + 60) |= 1u;
        uint64_t v54 = *v3;
        unint64_t v55 = *(void *)(a2 + v54);
        if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v56 = *(void *)(*(void *)(a2 + *v9) + v55);
          *(void *)(a2 + v54) = v55 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v56 = 0;
        }
        *(void *)(a1 + 8) = v56;
        goto LABEL_86;
      case 9u:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 60) |= 4u;
        while (2)
        {
          uint64_t v59 = *v3;
          uint64_t v60 = *(void *)(a2 + v59);
          unint64_t v61 = v60 + 1;
          if (v60 == -1 || v61 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v62 = *(unsigned char *)(*(void *)(a2 + *v9) + v60);
            *(void *)(a2 + v59) = v61;
            v26 |= (unint64_t)(v62 & 0x7F) << v57;
            if (v62 < 0)
            {
              v57 += 7;
              BOOL v18 = v58++ >= 9;
              if (v18)
              {
                LODWORD(v26) = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_84:
        uint64_t v63 = 52;
LABEL_85:
        *(_DWORD *)(a1 + v63) = v26;
        goto LABEL_86;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_86;
    }
  }
}

uint64_t CLPLteCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_211;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_213;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_211:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_213:
        uint64_t v180 = 84;
        goto LABEL_299;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_217:
        uint64_t v180 = 88;
        goto LABEL_299;
      case 3u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v33 = *v3;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_221:
        uint64_t v180 = 168;
        goto LABEL_299;
      case 4u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v39 = *v3;
          uint64_t v40 = *(void *)(a2 + v39);
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v41;
            v20 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_225:
        uint64_t v180 = 40;
        goto LABEL_299;
      case 5u:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x20000u;
        while (2)
        {
          uint64_t v45 = *v3;
          uint64_t v46 = *(void *)(a2 + v45);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v20 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              BOOL v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_229:
        uint64_t v180 = 176;
        goto LABEL_299;
      case 6u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x800u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v20 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_233:
        uint64_t v180 = 136;
        goto LABEL_299;
      case 7u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 4u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
            *(void *)(a2 + v57) = v59;
            v20 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_237:
        uint64_t v180 = 32;
        goto LABEL_299;
      case 8u:
        unint64_t v61 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 72), v61);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v61, a2) & 1) == 0) {
          goto LABEL_317;
        }
        goto LABEL_114;
      case 9u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 24;
        goto LABEL_209;
      case 0xAu:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 128;
        goto LABEL_209;
      case 0xBu:
        *(_DWORD *)(a1 + 184) |= 1u;
        uint64_t v64 = *v3;
        unint64_t v65 = *(void *)(a2 + v64);
        if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v66 = *(void *)(*(void *)(a2 + *v7) + v65);
          *(void *)(a2 + v64) = v65 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v66 = 0;
        }
        uint64_t v185 = 8;
        goto LABEL_315;
      case 0xCu:
        *(_DWORD *)(a1 + 184) |= 2u;
        uint64_t v67 = *v3;
        unint64_t v68 = *(void *)(a2 + v67);
        if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v66 = *(void *)(*(void *)(a2 + *v7) + v68);
          *(void *)(a2 + v67) = v68 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v66 = 0;
        }
        uint64_t v185 = 16;
LABEL_315:
        *(void *)(a1 + v185) = v66;
        goto LABEL_300;
      case 0xDu:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x8000u;
        while (2)
        {
          uint64_t v71 = *v3;
          uint64_t v72 = *(void *)(a2 + v71);
          unint64_t v73 = v72 + 1;
          if (v72 == -1 || v73 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v74 = *(unsigned char *)(*(void *)(a2 + *v7) + v72);
            *(void *)(a2 + v71) = v73;
            v20 |= (unint64_t)(v74 & 0x7F) << v69;
            if (v74 < 0)
            {
              v69 += 7;
              BOOL v15 = v70++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_241:
        uint64_t v180 = 152;
        goto LABEL_299;
      case 0xEu:
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v77 = 0;
        *(_DWORD *)(a1 + 184) |= 0x100u;
        while (2)
        {
          uint64_t v78 = *v3;
          uint64_t v79 = *(void *)(a2 + v78);
          unint64_t v80 = v79 + 1;
          if (v79 == -1 || v80 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v81 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
            *(void *)(a2 + v78) = v80;
            v77 |= (unint64_t)(v81 & 0x7F) << v75;
            if (v81 < 0)
            {
              v75 += 7;
              BOOL v15 = v76++ >= 9;
              if (v15)
              {
                LODWORD(v77) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v77) = 0;
        }
LABEL_245:
        int v181 = -(v77 & 1) ^ ((int)v77 >> 1);
        uint64_t v182 = 60;
        goto LABEL_254;
      case 0xFu:
        char v82 = 0;
        unsigned int v83 = 0;
        uint64_t v84 = 0;
        *(_DWORD *)(a1 + 184) |= 0x2000u;
        while (2)
        {
          uint64_t v85 = *v3;
          uint64_t v86 = *(void *)(a2 + v85);
          unint64_t v87 = v86 + 1;
          if (v86 == -1 || v87 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v88 = *(unsigned char *)(*(void *)(a2 + *v7) + v86);
            *(void *)(a2 + v85) = v87;
            v84 |= (unint64_t)(v88 & 0x7F) << v82;
            if (v88 < 0)
            {
              v82 += 7;
              BOOL v15 = v83++ >= 9;
              if (v15)
              {
                LODWORD(v84) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v84) = 0;
        }
LABEL_249:
        int v181 = -(v84 & 1) ^ ((int)v84 >> 1);
        uint64_t v182 = 144;
        goto LABEL_254;
      case 0x10u:
        char v89 = 0;
        unsigned int v90 = 0;
        uint64_t v91 = 0;
        *(_DWORD *)(a1 + 184) |= 0x4000u;
        while (2)
        {
          uint64_t v92 = *v3;
          uint64_t v93 = *(void *)(a2 + v92);
          unint64_t v94 = v93 + 1;
          if (v93 == -1 || v94 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v95 = *(unsigned char *)(*(void *)(a2 + *v7) + v93);
            *(void *)(a2 + v92) = v94;
            v91 |= (unint64_t)(v95 & 0x7F) << v89;
            if (v95 < 0)
            {
              v89 += 7;
              BOOL v15 = v90++ >= 9;
              if (v15)
              {
                LODWORD(v91) = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v91) = 0;
        }
LABEL_253:
        int v181 = -(v91 & 1) ^ ((int)v91 >> 1);
        uint64_t v182 = 148;
LABEL_254:
        *(_DWORD *)(a1 + v182) = v181;
        goto LABEL_300;
      case 0x14u:
        unint64_t v61 = objc_alloc_init(CLPLteCellNeighbor);
        [(id)a1 addNeighbor:v61];
        if (!PBReaderPlaceMark() || !CLPLteCellNeighborReadFrom((uint64_t)v61, a2)) {
          goto LABEL_317;
        }
        goto LABEL_114;
      case 0x15u:
        unint64_t v61 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 96), v61);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v61, a2))
        {
LABEL_114:
          PBReaderRecallMark();

LABEL_300:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_317:

        return 0;
      case 0x16u:
        char v97 = 0;
        unsigned int v98 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 8u;
        while (2)
        {
          uint64_t v99 = *v3;
          uint64_t v100 = *(void *)(a2 + v99);
          unint64_t v101 = v100 + 1;
          if (v100 == -1 || v101 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v102 = *(unsigned char *)(*(void *)(a2 + *v7) + v100);
            *(void *)(a2 + v99) = v101;
            v20 |= (unint64_t)(v102 & 0x7F) << v97;
            if (v102 < 0)
            {
              v97 += 7;
              BOOL v15 = v98++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_258;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_258:
        uint64_t v180 = 36;
        goto LABEL_299;
      case 0x17u:
        char v103 = 0;
        unsigned int v104 = 0;
        uint64_t v105 = 0;
        *(_DWORD *)(a1 + 184) |= 0x80000u;
        while (2)
        {
          uint64_t v106 = *v3;
          uint64_t v107 = *(void *)(a2 + v106);
          unint64_t v108 = v107 + 1;
          if (v107 == -1 || v108 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v109 = *(unsigned char *)(*(void *)(a2 + *v7) + v107);
            *(void *)(a2 + v106) = v108;
            v105 |= (unint64_t)(v109 & 0x7F) << v103;
            if (v109 < 0)
            {
              v103 += 7;
              BOOL v15 = v104++ >= 9;
              if (v15)
              {
                uint64_t v105 = 0;
                goto LABEL_262;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v105 = 0;
        }
LABEL_262:
        BOOL v183 = v105 != 0;
        uint64_t v184 = 181;
        goto LABEL_310;
      case 0x18u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 160;
        goto LABEL_209;
      case 0x19u:
        char v110 = 0;
        unsigned int v111 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x40u;
        while (2)
        {
          uint64_t v112 = *v3;
          uint64_t v113 = *(void *)(a2 + v112);
          unint64_t v114 = v113 + 1;
          if (v113 == -1 || v114 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v115 = *(unsigned char *)(*(void *)(a2 + *v7) + v113);
            *(void *)(a2 + v112) = v114;
            v20 |= (unint64_t)(v115 & 0x7F) << v110;
            if (v115 < 0)
            {
              v110 += 7;
              BOOL v15 = v111++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_266;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_266:
        uint64_t v180 = 52;
        goto LABEL_299;
      case 0x1Au:
        char v116 = 0;
        unsigned int v117 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x80u;
        while (2)
        {
          uint64_t v118 = *v3;
          uint64_t v119 = *(void *)(a2 + v118);
          unint64_t v120 = v119 + 1;
          if (v119 == -1 || v120 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v121 = *(unsigned char *)(*(void *)(a2 + *v7) + v119);
            *(void *)(a2 + v118) = v120;
            v20 |= (unint64_t)(v121 & 0x7F) << v116;
            if (v121 < 0)
            {
              v116 += 7;
              BOOL v15 = v117++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_270;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_270:
        uint64_t v180 = 56;
        goto LABEL_299;
      case 0x1Bu:
        char v122 = 0;
        unsigned int v123 = 0;
        uint64_t v124 = 0;
        *(_DWORD *)(a1 + 184) |= 0x100000u;
        while (2)
        {
          uint64_t v125 = *v3;
          uint64_t v126 = *(void *)(a2 + v125);
          unint64_t v127 = v126 + 1;
          if (v126 == -1 || v127 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v128 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
            *(void *)(a2 + v125) = v127;
            v124 |= (unint64_t)(v128 & 0x7F) << v122;
            if (v128 < 0)
            {
              v122 += 7;
              BOOL v15 = v123++ >= 9;
              if (v15)
              {
                uint64_t v124 = 0;
                goto LABEL_274;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v124 = 0;
        }
LABEL_274:
        BOOL v183 = v124 != 0;
        uint64_t v184 = 182;
        goto LABEL_310;
      case 0x1Cu:
        char v129 = 0;
        unsigned int v130 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x200u;
        while (2)
        {
          uint64_t v131 = *v3;
          uint64_t v132 = *(void *)(a2 + v131);
          unint64_t v133 = v132 + 1;
          if (v132 == -1 || v133 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v134 = *(unsigned char *)(*(void *)(a2 + *v7) + v132);
            *(void *)(a2 + v131) = v133;
            v20 |= (unint64_t)(v134 & 0x7F) << v129;
            if (v134 < 0)
            {
              v129 += 7;
              BOOL v15 = v130++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_278;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_278:
        uint64_t v180 = 64;
        goto LABEL_299;
      case 0x1Du:
        char v135 = 0;
        unsigned int v136 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x1000u;
        while (2)
        {
          uint64_t v137 = *v3;
          uint64_t v138 = *(void *)(a2 + v137);
          unint64_t v139 = v138 + 1;
          if (v138 == -1 || v139 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v140 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
            *(void *)(a2 + v137) = v139;
            v20 |= (unint64_t)(v140 & 0x7F) << v135;
            if (v140 < 0)
            {
              v135 += 7;
              BOOL v15 = v136++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_282;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_282:
        uint64_t v180 = 140;
        goto LABEL_299;
      case 0x1Eu:
        char v141 = 0;
        unsigned int v142 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x400u;
        while (2)
        {
          uint64_t v143 = *v3;
          uint64_t v144 = *(void *)(a2 + v143);
          unint64_t v145 = v144 + 1;
          if (v144 == -1 || v145 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v146 = *(unsigned char *)(*(void *)(a2 + *v7) + v144);
            *(void *)(a2 + v143) = v145;
            v20 |= (unint64_t)(v146 & 0x7F) << v141;
            if (v146 < 0)
            {
              v141 += 7;
              BOOL v15 = v142++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_286;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_286:
        uint64_t v180 = 80;
        goto LABEL_299;
      case 0x1Fu:
        char v147 = 0;
        unsigned int v148 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x20u;
        while (2)
        {
          uint64_t v149 = *v3;
          uint64_t v150 = *(void *)(a2 + v149);
          unint64_t v151 = v150 + 1;
          if (v150 == -1 || v151 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v152 = *(unsigned char *)(*(void *)(a2 + *v7) + v150);
            *(void *)(a2 + v149) = v151;
            v20 |= (unint64_t)(v152 & 0x7F) << v147;
            if (v152 < 0)
            {
              v147 += 7;
              BOOL v15 = v148++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_290;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_290:
        uint64_t v180 = 48;
        goto LABEL_299;
      case 0x20u:
        char v153 = 0;
        unsigned int v154 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10u;
        while (2)
        {
          uint64_t v155 = *v3;
          uint64_t v156 = *(void *)(a2 + v155);
          unint64_t v157 = v156 + 1;
          if (v156 == -1 || v157 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v158 = *(unsigned char *)(*(void *)(a2 + *v7) + v156);
            *(void *)(a2 + v155) = v157;
            v20 |= (unint64_t)(v158 & 0x7F) << v153;
            if (v158 < 0)
            {
              v153 += 7;
              BOOL v15 = v154++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_294;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_294:
        uint64_t v180 = 44;
        goto LABEL_299;
      case 0x21u:
        char v159 = 0;
        unsigned int v160 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 184) |= 0x10000u;
        while (2)
        {
          uint64_t v161 = *v3;
          uint64_t v162 = *(void *)(a2 + v161);
          unint64_t v163 = v162 + 1;
          if (v162 == -1 || v163 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v164 = *(unsigned char *)(*(void *)(a2 + *v7) + v162);
            *(void *)(a2 + v161) = v163;
            v20 |= (unint64_t)(v164 & 0x7F) << v159;
            if (v164 < 0)
            {
              v159 += 7;
              BOOL v15 = v160++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_298;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_298:
        uint64_t v180 = 172;
LABEL_299:
        *(_DWORD *)(a1 + v180) = v20;
        goto LABEL_300;
      case 0x22u:
        char v165 = 0;
        unsigned int v166 = 0;
        uint64_t v167 = 0;
        *(_DWORD *)(a1 + 184) |= 0x200000u;
        while (2)
        {
          uint64_t v168 = *v3;
          uint64_t v169 = *(void *)(a2 + v168);
          unint64_t v170 = v169 + 1;
          if (v169 == -1 || v170 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v171 = *(unsigned char *)(*(void *)(a2 + *v7) + v169);
            *(void *)(a2 + v168) = v170;
            v167 |= (unint64_t)(v171 & 0x7F) << v165;
            if (v171 < 0)
            {
              v165 += 7;
              BOOL v15 = v166++ >= 9;
              if (v15)
              {
                uint64_t v167 = 0;
                goto LABEL_305;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v167 = 0;
        }
LABEL_305:
        BOOL v183 = v167 != 0;
        uint64_t v184 = 183;
        goto LABEL_310;
      case 0x23u:
        char v172 = 0;
        unsigned int v173 = 0;
        uint64_t v174 = 0;
        *(_DWORD *)(a1 + 184) |= 0x40000u;
        while (2)
        {
          uint64_t v175 = *v3;
          uint64_t v176 = *(void *)(a2 + v175);
          unint64_t v177 = v176 + 1;
          if (v176 == -1 || v177 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v178 = *(unsigned char *)(*(void *)(a2 + *v7) + v176);
            *(void *)(a2 + v175) = v177;
            v174 |= (unint64_t)(v178 & 0x7F) << v172;
            if (v178 < 0)
            {
              v172 += 7;
              BOOL v15 = v173++ >= 9;
              if (v15)
              {
                uint64_t v174 = 0;
                goto LABEL_309;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v174 = 0;
        }
LABEL_309:
        BOOL v183 = v174 != 0;
        uint64_t v184 = 180;
LABEL_310:
        *(unsigned char *)(a1 + v184) = v183;
        goto LABEL_300;
      case 0x24u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 120;
        goto LABEL_209;
      case 0x25u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 112;
LABEL_209:
        v179 = *(void **)(a1 + v63);
        *(void *)(a1 + v63) = v62;

        goto LABEL_300;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_300;
    }
  }
}

uint64_t CLPSCdmaCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_126;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_128;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_126:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_128:
        uint64_t v105 = 40;
        goto LABEL_174;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_132;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_132:
        uint64_t v105 = 44;
        goto LABEL_174;
      case 3u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v33 = *v3;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_136;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_136:
        uint64_t v105 = 28;
        goto LABEL_174;
      case 4u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v39 = *v3;
          uint64_t v40 = *(void *)(a2 + v39);
          unint64_t v41 = v40 + 1;
          if (v40 == -1 || v41 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v41;
            v20 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v15 = v38++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_140;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_140:
        uint64_t v105 = 20;
        goto LABEL_174;
      case 5u:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v20 = 0;
        while (2)
        {
          uint64_t v45 = *v3;
          uint64_t v46 = *(void *)(a2 + v45);
          unint64_t v47 = v46 + 1;
          if (v46 == -1 || v47 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
            *(void *)(a2 + v45) = v47;
            v20 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              BOOL v15 = v44++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_144;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_144:
        uint64_t v105 = 84;
        goto LABEL_174;
      case 6u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 112) |= 1u;
        while (2)
        {
          uint64_t v51 = *v3;
          uint64_t v52 = *(void *)(a2 + v51);
          unint64_t v53 = v52 + 1;
          if (v52 == -1 || v53 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v53;
            v20 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              v49 += 7;
              BOOL v15 = v50++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_148;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_148:
        uint64_t v105 = 16;
        goto LABEL_174;
      case 7u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 112) |= 4u;
        while (2)
        {
          uint64_t v57 = *v3;
          uint64_t v58 = *(void *)(a2 + v57);
          unint64_t v59 = v58 + 1;
          if (v58 == -1 || v59 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)(a2 + *v7) + v58);
            *(void *)(a2 + v57) = v59;
            v20 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              v55 += 7;
              BOOL v15 = v56++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_152;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_152:
        uint64_t v105 = 72;
        goto LABEL_174;
      case 8u:
        unint64_t v61 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 32), v61);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v61, a2) & 1) == 0) {
          goto LABEL_182;
        }
        goto LABEL_115;
      case 9u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 8;
        goto LABEL_124;
      case 0xAu:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 112) |= 0x20u;
        while (2)
        {
          uint64_t v66 = *v3;
          uint64_t v67 = *(void *)(a2 + v66);
          unint64_t v68 = v67 + 1;
          if (v67 == -1 || v68 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v67);
            *(void *)(a2 + v66) = v68;
            v20 |= (unint64_t)(v69 & 0x7F) << v64;
            if (v69 < 0)
            {
              v64 += 7;
              BOOL v15 = v65++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_156;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_156:
        uint64_t v105 = 88;
        goto LABEL_174;
      case 0xBu:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 112) |= 0x40u;
        while (2)
        {
          uint64_t v72 = *v3;
          uint64_t v73 = *(void *)(a2 + v72);
          unint64_t v74 = v73 + 1;
          if (v73 == -1 || v74 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v74;
            v20 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v70 += 7;
              BOOL v15 = v71++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_160;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_160:
        uint64_t v105 = 104;
        goto LABEL_174;
      case 0xCu:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 64;
        goto LABEL_124;
      case 0xFu:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v79 = 0;
        *(unsigned char *)(a1 + 112) |= 2u;
        while (2)
        {
          uint64_t v80 = *v3;
          uint64_t v81 = *(void *)(a2 + v80);
          unint64_t v82 = v81 + 1;
          if (v81 == -1 || v82 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v83 = *(unsigned char *)(*(void *)(a2 + *v7) + v81);
            *(void *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              BOOL v15 = v78++ >= 9;
              if (v15)
              {
                LODWORD(v79) = 0;
                goto LABEL_164;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v79) = 0;
        }
LABEL_164:
        int v106 = -(v79 & 1) ^ ((int)v79 >> 1);
        uint64_t v107 = 24;
        goto LABEL_169;
      case 0x10u:
        char v84 = 0;
        unsigned int v85 = 0;
        uint64_t v86 = 0;
        *(unsigned char *)(a1 + 112) |= 0x10u;
        while (2)
        {
          uint64_t v87 = *v3;
          uint64_t v88 = *(void *)(a2 + v87);
          unint64_t v89 = v88 + 1;
          if (v88 == -1 || v89 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v90 = *(unsigned char *)(*(void *)(a2 + *v7) + v88);
            *(void *)(a2 + v87) = v89;
            v86 |= (unint64_t)(v90 & 0x7F) << v84;
            if (v90 < 0)
            {
              v84 += 7;
              BOOL v15 = v85++ >= 9;
              if (v15)
              {
                LODWORD(v86) = 0;
                goto LABEL_168;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v86) = 0;
        }
LABEL_168:
        int v106 = -(v86 & 1) ^ ((int)v86 >> 1);
        uint64_t v107 = 80;
LABEL_169:
        *(_DWORD *)(a1 + v107) = v106;
        goto LABEL_175;
      case 0x11u:
        char v91 = 0;
        unsigned int v92 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 112) |= 8u;
        while (2)
        {
          uint64_t v93 = *v3;
          uint64_t v94 = *(void *)(a2 + v93);
          unint64_t v95 = v94 + 1;
          if (v94 == -1 || v95 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
            *(void *)(a2 + v93) = v95;
            v20 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              v91 += 7;
              BOOL v15 = v92++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_173;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_173:
        uint64_t v105 = 76;
LABEL_174:
        *(_DWORD *)(a1 + v105) = v20;
        goto LABEL_175;
      case 0x14u:
        unint64_t v61 = objc_alloc_init(CLPCellNeighbor);
        [(id)a1 addNeighbor:v61];
        if (!PBReaderPlaceMark() || !CLPCellNeighborReadFrom((uint64_t)v61, a2)) {
          goto LABEL_182;
        }
        goto LABEL_115;
      case 0x15u:
        unint64_t v61 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 48), v61);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v61, a2))
        {
LABEL_115:
          PBReaderRecallMark();

LABEL_175:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_182:

        return 0;
      case 0x16u:
        char v97 = 0;
        unsigned int v98 = 0;
        uint64_t v99 = 0;
        *(unsigned char *)(a1 + 112) |= 0x80u;
        while (2)
        {
          uint64_t v100 = *v3;
          uint64_t v101 = *(void *)(a2 + v100);
          unint64_t v102 = v101 + 1;
          if (v101 == -1 || v102 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v101);
            *(void *)(a2 + v100) = v102;
            v99 |= (unint64_t)(v103 & 0x7F) << v97;
            if (v103 < 0)
            {
              v97 += 7;
              BOOL v15 = v98++ >= 9;
              if (v15)
              {
                uint64_t v99 = 0;
                goto LABEL_180;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v99 = 0;
        }
LABEL_180:
        *(unsigned char *)(a1 + 108) = v99 != 0;
        goto LABEL_175;
      case 0x17u:
        uint64_t v62 = PBReaderReadString();
        uint64_t v63 = 96;
LABEL_124:
        unsigned int v104 = *(void **)(a1 + v63);
        *(void *)(a1 + v63) = v62;

        goto LABEL_175;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_175;
    }
  }
}

uint64_t CLPNRCellTowerLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x800u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_211;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_213;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_211:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_213:
        uint64_t v181 = 84;
        goto LABEL_299;
      case 2u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x1000u;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v20 |= (unint64_t)(v30 & 0x7F) << v25;
            if (v30 < 0)
            {
              v25 += 7;
              BOOL v15 = v26++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_217:
        uint64_t v181 = 88;
        goto LABEL_299;
      case 3u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x100000u;
        while (2)
        {
          uint64_t v33 = *v3;
          uint64_t v34 = *(void *)(a2 + v33);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v35;
            v20 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              BOOL v15 = v32++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_221:
        uint64_t v181 = 176;
        goto LABEL_299;
      case 4u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v39 = 0;
        *(_DWORD *)(a1 + 188) |= 4u;
        while (2)
        {
          uint64_t v40 = *v3;
          uint64_t v41 = *(void *)(a2 + v40);
          unint64_t v42 = v41 + 1;
          if (v41 == -1 || v42 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
            *(void *)(a2 + v40) = v42;
            v39 |= (unint64_t)(v43 & 0x7F) << v37;
            if (v43 < 0)
            {
              v37 += 7;
              BOOL v15 = v38++ >= 9;
              if (v15)
              {
                uint64_t v39 = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v39 = 0;
        }
LABEL_225:
        *(void *)(a1 + 24) = v39;
        goto LABEL_314;
      case 5u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x2000u;
        while (2)
        {
          uint64_t v46 = *v3;
          uint64_t v47 = *(void *)(a2 + v46);
          unint64_t v48 = v47 + 1;
          if (v47 == -1 || v48 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v48;
            v20 |= (unint64_t)(v49 & 0x7F) << v44;
            if (v49 < 0)
            {
              v44 += 7;
              BOOL v15 = v45++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_229:
        uint64_t v181 = 128;
        goto LABEL_299;
      case 6u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x4000u;
        while (2)
        {
          uint64_t v52 = *v3;
          uint64_t v53 = *(void *)(a2 + v52);
          unint64_t v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)(a2 + *v7) + v53);
            *(void *)(a2 + v52) = v54;
            v20 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              BOOL v15 = v51++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_233:
        uint64_t v181 = 144;
        goto LABEL_299;
      case 7u:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 8u;
        while (2)
        {
          uint64_t v58 = *v3;
          uint64_t v59 = *(void *)(a2 + v58);
          unint64_t v60 = v59 + 1;
          if (v59 == -1 || v60 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
            *(void *)(a2 + v58) = v60;
            v20 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              BOOL v15 = v57++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_237:
        uint64_t v181 = 40;
        goto LABEL_299;
      case 8u:
        uint64_t v62 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 72), v62);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v62, a2) & 1) == 0) {
          goto LABEL_316;
        }
        goto LABEL_114;
      case 9u:
        uint64_t v63 = PBReaderReadString();
        uint64_t v64 = 32;
        goto LABEL_209;
      case 0xAu:
        uint64_t v63 = PBReaderReadString();
        uint64_t v64 = 136;
        goto LABEL_209;
      case 0xBu:
        *(_DWORD *)(a1 + 188) |= 1u;
        uint64_t v65 = *v3;
        unint64_t v66 = *(void *)(a2 + v65);
        if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v67 = *(void *)(*(void *)(a2 + *v7) + v66);
          *(void *)(a2 + v65) = v66 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v67 = 0;
        }
        uint64_t v186 = 8;
        goto LABEL_313;
      case 0xCu:
        *(_DWORD *)(a1 + 188) |= 2u;
        uint64_t v68 = *v3;
        unint64_t v69 = *(void *)(a2 + v68);
        if (v69 <= 0xFFFFFFFFFFFFFFF7 && v69 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v67 = *(void *)(*(void *)(a2 + *v7) + v69);
          *(void *)(a2 + v68) = v69 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v67 = 0;
        }
        uint64_t v186 = 16;
LABEL_313:
        *(void *)(a1 + v186) = v67;
        goto LABEL_314;
      case 0xDu:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x80000u;
        while (2)
        {
          uint64_t v72 = *v3;
          uint64_t v73 = *(void *)(a2 + v72);
          unint64_t v74 = v73 + 1;
          if (v73 == -1 || v74 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v74;
            v20 |= (unint64_t)(v75 & 0x7F) << v70;
            if (v75 < 0)
            {
              v70 += 7;
              BOOL v15 = v71++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_241:
        uint64_t v181 = 164;
        goto LABEL_299;
      case 0xEu:
        char v76 = 0;
        unsigned int v77 = 0;
        uint64_t v78 = 0;
        *(_DWORD *)(a1 + 188) |= 0x80u;
        while (2)
        {
          uint64_t v79 = *v3;
          uint64_t v80 = *(void *)(a2 + v79);
          unint64_t v81 = v80 + 1;
          if (v80 == -1 || v81 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v82 = *(unsigned char *)(*(void *)(a2 + *v7) + v80);
            *(void *)(a2 + v79) = v81;
            v78 |= (unint64_t)(v82 & 0x7F) << v76;
            if (v82 < 0)
            {
              v76 += 7;
              BOOL v15 = v77++ >= 9;
              if (v15)
              {
                LODWORD(v78) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v78) = 0;
        }
LABEL_245:
        int v182 = -(v78 & 1) ^ ((int)v78 >> 1);
        uint64_t v183 = 56;
        goto LABEL_254;
      case 0xFu:
        char v83 = 0;
        unsigned int v84 = 0;
        uint64_t v85 = 0;
        *(_DWORD *)(a1 + 188) |= 0x10000u;
        while (2)
        {
          uint64_t v86 = *v3;
          uint64_t v87 = *(void *)(a2 + v86);
          unint64_t v88 = v87 + 1;
          if (v87 == -1 || v88 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v89 = *(unsigned char *)(*(void *)(a2 + *v7) + v87);
            *(void *)(a2 + v86) = v88;
            v85 |= (unint64_t)(v89 & 0x7F) << v83;
            if (v89 < 0)
            {
              v83 += 7;
              BOOL v15 = v84++ >= 9;
              if (v15)
              {
                LODWORD(v85) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v85) = 0;
        }
LABEL_249:
        int v182 = -(v85 & 1) ^ ((int)v85 >> 1);
        uint64_t v183 = 152;
        goto LABEL_254;
      case 0x10u:
        char v90 = 0;
        unsigned int v91 = 0;
        uint64_t v92 = 0;
        *(_DWORD *)(a1 + 188) |= 0x20000u;
        while (2)
        {
          uint64_t v93 = *v3;
          uint64_t v94 = *(void *)(a2 + v93);
          unint64_t v95 = v94 + 1;
          if (v94 == -1 || v95 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)(a2 + *v7) + v94);
            *(void *)(a2 + v93) = v95;
            v92 |= (unint64_t)(v96 & 0x7F) << v90;
            if (v96 < 0)
            {
              v90 += 7;
              BOOL v15 = v91++ >= 9;
              if (v15)
              {
                LODWORD(v92) = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v92) = 0;
        }
LABEL_253:
        int v182 = -(v92 & 1) ^ ((int)v92 >> 1);
        uint64_t v183 = 156;
LABEL_254:
        *(_DWORD *)(a1 + v183) = v182;
        goto LABEL_314;
      case 0x14u:
        uint64_t v62 = objc_alloc_init(CLPNRCellNeighbor);
        [(id)a1 addNeighbor:v62];
        if (!PBReaderPlaceMark() || !CLPNRCellNeighborReadFrom((uint64_t)v62, a2)) {
          goto LABEL_316;
        }
        goto LABEL_114;
      case 0x15u:
        uint64_t v62 = objc_alloc_init(CLPCellNeighborsGroup);
        objc_storeStrong((id *)(a1 + 96), v62);
        if (PBReaderPlaceMark() && CLPCellNeighborsGroupReadFrom(v62, a2))
        {
LABEL_114:
          PBReaderRecallMark();

LABEL_314:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_316:

        return 0;
      case 0x16u:
        char v98 = 0;
        unsigned int v99 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x10u;
        while (2)
        {
          uint64_t v100 = *v3;
          uint64_t v101 = *(void *)(a2 + v100);
          unint64_t v102 = v101 + 1;
          if (v101 == -1 || v102 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v103 = *(unsigned char *)(*(void *)(a2 + *v7) + v101);
            *(void *)(a2 + v100) = v102;
            v20 |= (unint64_t)(v103 & 0x7F) << v98;
            if (v103 < 0)
            {
              v98 += 7;
              BOOL v15 = v99++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_258;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_258:
        uint64_t v181 = 44;
        goto LABEL_299;
      case 0x17u:
        char v104 = 0;
        unsigned int v105 = 0;
        uint64_t v106 = 0;
        *(_DWORD *)(a1 + 188) |= 0x800000u;
        while (2)
        {
          uint64_t v107 = *v3;
          uint64_t v108 = *(void *)(a2 + v107);
          unint64_t v109 = v108 + 1;
          if (v108 == -1 || v109 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v110 = *(unsigned char *)(*(void *)(a2 + *v7) + v108);
            *(void *)(a2 + v107) = v109;
            v106 |= (unint64_t)(v110 & 0x7F) << v104;
            if (v110 < 0)
            {
              v104 += 7;
              BOOL v15 = v105++ >= 9;
              if (v15)
              {
                uint64_t v106 = 0;
                goto LABEL_262;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v106 = 0;
        }
LABEL_262:
        BOOL v184 = v106 != 0;
        uint64_t v185 = 185;
        goto LABEL_308;
      case 0x18u:
        uint64_t v63 = PBReaderReadString();
        uint64_t v64 = 168;
        goto LABEL_209;
      case 0x19u:
        char v111 = 0;
        unsigned int v112 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x40000u;
        while (2)
        {
          uint64_t v113 = *v3;
          uint64_t v114 = *(void *)(a2 + v113);
          unint64_t v115 = v114 + 1;
          if (v114 == -1 || v115 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v116 = *(unsigned char *)(*(void *)(a2 + *v7) + v114);
            *(void *)(a2 + v113) = v115;
            v20 |= (unint64_t)(v116 & 0x7F) << v111;
            if (v116 < 0)
            {
              v111 += 7;
              BOOL v15 = v112++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_266;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_266:
        uint64_t v181 = 160;
        goto LABEL_299;
      case 0x1Au:
        char v117 = 0;
        unsigned int v118 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x100u;
        while (2)
        {
          uint64_t v119 = *v3;
          uint64_t v120 = *(void *)(a2 + v119);
          unint64_t v121 = v120 + 1;
          if (v120 == -1 || v121 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v122 = *(unsigned char *)(*(void *)(a2 + *v7) + v120);
            *(void *)(a2 + v119) = v121;
            v20 |= (unint64_t)(v122 & 0x7F) << v117;
            if (v122 < 0)
            {
              v117 += 7;
              BOOL v15 = v118++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_270;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_270:
        uint64_t v181 = 60;
        goto LABEL_299;
      case 0x1Bu:
        char v123 = 0;
        unsigned int v124 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x40u;
        while (2)
        {
          uint64_t v125 = *v3;
          uint64_t v126 = *(void *)(a2 + v125);
          unint64_t v127 = v126 + 1;
          if (v126 == -1 || v127 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v128 = *(unsigned char *)(*(void *)(a2 + *v7) + v126);
            *(void *)(a2 + v125) = v127;
            v20 |= (unint64_t)(v128 & 0x7F) << v123;
            if (v128 < 0)
            {
              v123 += 7;
              BOOL v15 = v124++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_274;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_274:
        uint64_t v181 = 52;
        goto LABEL_299;
      case 0x1Cu:
        char v129 = 0;
        unsigned int v130 = 0;
        uint64_t v131 = 0;
        *(_DWORD *)(a1 + 188) |= 0x1000000u;
        while (2)
        {
          uint64_t v132 = *v3;
          uint64_t v133 = *(void *)(a2 + v132);
          unint64_t v134 = v133 + 1;
          if (v133 == -1 || v134 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v135 = *(unsigned char *)(*(void *)(a2 + *v7) + v133);
            *(void *)(a2 + v132) = v134;
            v131 |= (unint64_t)(v135 & 0x7F) << v129;
            if (v135 < 0)
            {
              v129 += 7;
              BOOL v15 = v130++ >= 9;
              if (v15)
              {
                uint64_t v131 = 0;
                goto LABEL_278;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v131 = 0;
        }
LABEL_278:
        BOOL v184 = v131 != 0;
        uint64_t v185 = 186;
        goto LABEL_308;
      case 0x1Du:
        char v136 = 0;
        unsigned int v137 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x200u;
        while (2)
        {
          uint64_t v138 = *v3;
          uint64_t v139 = *(void *)(a2 + v138);
          unint64_t v140 = v139 + 1;
          if (v139 == -1 || v140 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v141 = *(unsigned char *)(*(void *)(a2 + *v7) + v139);
            *(void *)(a2 + v138) = v140;
            v20 |= (unint64_t)(v141 & 0x7F) << v136;
            if (v141 < 0)
            {
              v136 += 7;
              BOOL v15 = v137++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_282;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_282:
        uint64_t v181 = 64;
        goto LABEL_299;
      case 0x1Eu:
        char v142 = 0;
        unsigned int v143 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x8000u;
        while (2)
        {
          uint64_t v144 = *v3;
          uint64_t v145 = *(void *)(a2 + v144);
          unint64_t v146 = v145 + 1;
          if (v145 == -1 || v146 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v147 = *(unsigned char *)(*(void *)(a2 + *v7) + v145);
            *(void *)(a2 + v144) = v146;
            v20 |= (unint64_t)(v147 & 0x7F) << v142;
            if (v147 < 0)
            {
              v142 += 7;
              BOOL v15 = v143++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_286;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_286:
        uint64_t v181 = 148;
        goto LABEL_299;
      case 0x1Fu:
        char v148 = 0;
        unsigned int v149 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x400u;
        while (2)
        {
          uint64_t v150 = *v3;
          uint64_t v151 = *(void *)(a2 + v150);
          unint64_t v152 = v151 + 1;
          if (v151 == -1 || v152 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v153 = *(unsigned char *)(*(void *)(a2 + *v7) + v151);
            *(void *)(a2 + v150) = v152;
            v20 |= (unint64_t)(v153 & 0x7F) << v148;
            if (v153 < 0)
            {
              v148 += 7;
              BOOL v15 = v149++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_290;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_290:
        uint64_t v181 = 80;
        goto LABEL_299;
      case 0x20u:
        char v154 = 0;
        unsigned int v155 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x20u;
        while (2)
        {
          uint64_t v156 = *v3;
          uint64_t v157 = *(void *)(a2 + v156);
          unint64_t v158 = v157 + 1;
          if (v157 == -1 || v158 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v159 = *(unsigned char *)(*(void *)(a2 + *v7) + v157);
            *(void *)(a2 + v156) = v158;
            v20 |= (unint64_t)(v159 & 0x7F) << v154;
            if (v159 < 0)
            {
              v154 += 7;
              BOOL v15 = v155++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_294;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_294:
        uint64_t v181 = 48;
        goto LABEL_299;
      case 0x21u:
        char v160 = 0;
        unsigned int v161 = 0;
        uint64_t v20 = 0;
        *(_DWORD *)(a1 + 188) |= 0x200000u;
        while (2)
        {
          uint64_t v162 = *v3;
          uint64_t v163 = *(void *)(a2 + v162);
          unint64_t v164 = v163 + 1;
          if (v163 == -1 || v164 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v165 = *(unsigned char *)(*(void *)(a2 + *v7) + v163);
            *(void *)(a2 + v162) = v164;
            v20 |= (unint64_t)(v165 & 0x7F) << v160;
            if (v165 < 0)
            {
              v160 += 7;
              BOOL v15 = v161++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_298;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_298:
        uint64_t v181 = 180;
LABEL_299:
        *(_DWORD *)(a1 + v181) = v20;
        goto LABEL_314;
      case 0x22u:
        char v166 = 0;
        unsigned int v167 = 0;
        uint64_t v168 = 0;
        *(_DWORD *)(a1 + 188) |= 0x2000000u;
        while (2)
        {
          uint64_t v169 = *v3;
          uint64_t v170 = *(void *)(a2 + v169);
          unint64_t v171 = v170 + 1;
          if (v170 == -1 || v171 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v172 = *(unsigned char *)(*(void *)(a2 + *v7) + v170);
            *(void *)(a2 + v169) = v171;
            v168 |= (unint64_t)(v172 & 0x7F) << v166;
            if (v172 < 0)
            {
              v166 += 7;
              BOOL v15 = v167++ >= 9;
              if (v15)
              {
                uint64_t v168 = 0;
                goto LABEL_303;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v168 = 0;
        }
LABEL_303:
        BOOL v184 = v168 != 0;
        uint64_t v185 = 187;
        goto LABEL_308;
      case 0x23u:
        char v173 = 0;
        unsigned int v174 = 0;
        uint64_t v175 = 0;
        *(_DWORD *)(a1 + 188) |= 0x400000u;
        while (2)
        {
          uint64_t v176 = *v3;
          uint64_t v177 = *(void *)(a2 + v176);
          unint64_t v178 = v177 + 1;
          if (v177 == -1 || v178 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v179 = *(unsigned char *)(*(void *)(a2 + *v7) + v177);
            *(void *)(a2 + v176) = v178;
            v175 |= (unint64_t)(v179 & 0x7F) << v173;
            if (v179 < 0)
            {
              v173 += 7;
              BOOL v15 = v174++ >= 9;
              if (v15)
              {
                uint64_t v175 = 0;
                goto LABEL_307;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v175 = 0;
        }
LABEL_307:
        BOOL v184 = v175 != 0;
        uint64_t v185 = 184;
LABEL_308:
        *(unsigned char *)(a1 + v185) = v184;
        goto LABEL_314;
      case 0x24u:
        uint64_t v63 = PBReaderReadString();
        uint64_t v64 = 120;
        goto LABEL_209;
      case 0x25u:
        uint64_t v63 = PBReaderReadString();
        uint64_t v64 = 112;
LABEL_209:
        uint64_t v180 = *(void **)(a1 + v64);
        *(void *)(a1 + v64) = v63;

        goto LABEL_314;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_314;
    }
  }
}

uint64_t CLPCellWifiCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        unsigned int v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPConsolidationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        unsigned int v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPIndoorCMAttitudeReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
        goto LABEL_45;
      case 2u:
        uint64_t v22 = objc_alloc_init(CLPQuaternion);
        objc_storeStrong((id *)(a1 + 24), v22);
        if (PBReaderPlaceMark() && CLPQuaternionReadFrom((uint64_t)v22, a2))
        {
          PBReaderRecallMark();

LABEL_45:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        *(unsigned char *)(a1 + 32) |= 2u;
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
        {
          int v25 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v25 = 0;
        }
        *(_DWORD *)(a1 + 16) = v25;
        goto LABEL_45;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
        while (2)
        {
          uint64_t v29 = *v3;
          uint64_t v30 = *(void *)(a2 + v29);
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              BOOL v15 = v27++ >= 9;
              if (v15)
              {
                LODWORD(v28) = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v28) = 0;
        }
LABEL_40:
        *(_DWORD *)(a1 + 20) = v28;
        goto LABEL_45;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_45;
    }
  }
}

BOOL CLPQuaternionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v17 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 24) |= 1u;
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFFBLL && v20 + 4 <= *(void *)(a2 + *v4))
          {
            int v21 = *(_DWORD *)(*(void *)(a2 + *v7) + v20);
            *(void *)(a2 + v19) = v20 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v21 = 0;
          }
          uint64_t v28 = &OBJC_IVAR___CLPQuaternion__w;
          goto LABEL_41;
        case 2u:
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(void *)(a2 + *v4))
          {
            int v21 = *(_DWORD *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            int v21 = 0;
          }
          uint64_t v28 = &OBJC_IVAR___CLPQuaternion__x;
          goto LABEL_41;
        case 3u:
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + *v4))
          {
            int v21 = *(_DWORD *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            int v21 = 0;
          }
          uint64_t v28 = &OBJC_IVAR___CLPQuaternion__y;
          goto LABEL_41;
        case 4u:
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(a2 + v26);
          if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(void *)(a2 + *v4))
          {
            int v21 = *(_DWORD *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v27 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + v16) = 1;
            int v21 = 0;
          }
          uint64_t v28 = &OBJC_IVAR___CLPQuaternion__z;
LABEL_41:
          *(_DWORD *)(a1 + *v28) = v21;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPIndoorCMPedometerReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 44) |= 2u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v49 = 16;
          goto LABEL_73;
        case 2u:
          *(unsigned char *)(a1 + 44) |= 8u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(void *)(a2 + *v4))
          {
            int v24 = *(_DWORD *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v24 = 0;
          }
          uint64_t v50 = 28;
          goto LABEL_76;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 44) |= 0x40u;
          while (2)
          {
            uint64_t v28 = *v3;
            uint64_t v29 = *(void *)(a2 + v28);
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
              *(void *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v27) = 0;
          }
LABEL_57:
          uint64_t v48 = 40;
          goto LABEL_66;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 44) |= 0x10u;
          while (2)
          {
            uint64_t v34 = *v3;
            uint64_t v35 = *(void *)(a2 + v34);
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v15 = v33++ >= 9;
                if (v15)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v27) = 0;
          }
LABEL_61:
          uint64_t v48 = 32;
          goto LABEL_66;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v27 = 0;
          *(unsigned char *)(a1 + 44) |= 0x20u;
          break;
        case 6u:
          *(unsigned char *)(a1 + 44) |= 1u;
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v45);
            *(void *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v49 = 8;
LABEL_73:
          *(void *)(a1 + v49) = v20;
          continue;
        case 7u:
          *(unsigned char *)(a1 + 44) |= 4u;
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFFBLL && v47 + 4 <= *(void *)(a2 + *v4))
          {
            int v24 = *(_DWORD *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v47 + 4;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            int v24 = 0;
          }
          uint64_t v50 = 24;
LABEL_76:
          *(_DWORD *)(a1 + v50) = v24;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v3;
        uint64_t v41 = *(void *)(a2 + v40);
        unint64_t v42 = v41 + 1;
        if (v41 == -1 || v42 > *(void *)(a2 + *v4)) {
          break;
        }
        char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
        *(void *)(a2 + v40) = v42;
        v27 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0) {
          goto LABEL_63;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_65;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_63:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v27) = 0;
      }
LABEL_65:
      uint64_t v48 = 36;
LABEL_66:
      *(_DWORD *)(a1 + v48) = v27;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPIndoorCollectionRequestReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 8, v18);
        if PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2)) {
          goto LABEL_44;
        }
        goto LABEL_48;
      case 2u:
        uint64_t v18 = objc_alloc_init(CLPIndoorWifiScan);
        [a1 addIndoorWifis:v18];
        if (!PBReaderPlaceMark() || (CLPIndoorWifiScanReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 3u:
        uint64_t v18 = objc_alloc_init(CLPLocation);
        [a1 addIndoorLocations:v18];
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 4u:
        uint64_t v18 = objc_alloc_init(CLPIndoorCMAttitude);
        [a1 addIndoorCMAttitude:v18];
        if (!PBReaderPlaceMark() || (CLPIndoorCMAttitudeReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 5u:
        uint64_t v18 = objc_alloc_init(CLPIndoorCMPedometer);
        [a1 addIndoorCMPedometer:v18];
        if (!PBReaderPlaceMark() || (CLPIndoorCMPedometerReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 6u:
        uint64_t v18 = objc_alloc_init(CLPIndoorMotionActivity);
        [a1 addIndoorMotionActivity:v18];
        if (!PBReaderPlaceMark() || (CLPIndoorMotionActivityReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 7u:
        uint64_t v18 = objc_alloc_init(CLPIndoorPressure);
        [a1 addIndoorPressure:v18];
        if (!PBReaderPlaceMark() || (CLPIndoorPressureReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_48;
        }
        goto LABEL_44;
      case 8u:
        uint64_t v18 = objc_alloc_init(CLPBundleId);
        [a1 addBundleId:v18];
        if PBReaderPlaceMark() && (CLPBundleIdReadFrom((uint64_t)v18, a2))
        {
LABEL_44:
          PBReaderRecallMark();

LABEL_45:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_48:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_45;
    }
  }
}

uint64_t CLPIndoorMotionActivityReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        int v21 = objc_alloc_init(CLPMotionActivity);
        objc_storeStrong((id *)(a1 + 16), v21);
        if (!PBReaderPlaceMark() || !CLPMotionActivityReadFrom((uint64_t)v21, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        *(void *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPIndoorCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        unsigned int v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPIndoorEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 112) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_67;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_69;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_67:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_69:
        *(_DWORD *)(a1 + 72) = v20;
        goto LABEL_64;
      case 2u:
        unsigned int v26 = objc_alloc_init(CLPIndoorCMAttitude);
        objc_storeStrong((id *)(a1 + 16), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorCMAttitudeReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 3u:
        unsigned int v26 = objc_alloc_init(CLPIndoorCMPedometer);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorCMPedometerReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 4u:
        unsigned int v26 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 5u:
        unsigned int v26 = objc_alloc_init(CLPIndoorMotionActivity);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorMotionActivityReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 6u:
        unsigned int v26 = objc_alloc_init(CLPIndoorPressure);
        objc_storeStrong((id *)(a1 + 64), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorPressureReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 7u:
        unsigned int v26 = objc_alloc_init(CLPIndoorWifiScan);
        objc_storeStrong((id *)(a1 + 96), v26);
        if (!PBReaderPlaceMark() || (CLPIndoorWifiScanReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 8u:
        unsigned int v26 = objc_alloc_init(CLPBundleId);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (!PBReaderPlaceMark() || (CLPBundleIdReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 9u:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONVIOEstimation);
        objc_storeStrong((id *)(a1 + 80), v26);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVIOEstimationReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 0xAu:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONVLLocalizationResult);
        objc_storeStrong((id *)(a1 + 88), v26);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVLLocalizationResultReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 0xBu:
        unsigned int v26 = objc_alloc_init(CLPWorkoutUpdateMotionActivity);
        objc_storeStrong((id *)(a1 + 104), v26);
        if (!PBReaderPlaceMark() || (CLPWorkoutUpdateMotionActivityReadFrom((uint64_t)v26, a2) & 1) == 0) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 0xCu:
        unsigned int v26 = objc_alloc_init(CLPInertialOdometry);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (!PBReaderPlaceMark() || !CLPInertialOdometryReadFrom((uint64_t)v26, a2)) {
          goto LABEL_71;
        }
        goto LABEL_63;
      case 0xDu:
        unsigned int v26 = objc_alloc_init(CLPOutdoorUpdate);
        objc_storeStrong((id *)(a1 + 56), v26);
        if PBReaderPlaceMark() && (CLPOutdoorUpdateReadFrom((uint64_t)v26, a2))
        {
LABEL_63:
          PBReaderRecallMark();

LABEL_64:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_71:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_64;
    }
  }
}

uint64_t CLPLOGENTRYVISIONVIOEstimationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 84) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_53;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_55;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_55:
        *(_DWORD *)(a1 + 80) = v20;
        goto LABEL_50;
      case 2u:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        uint64_t v27 = 64;
        goto LABEL_30;
      case 3u:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        uint64_t v27 = 72;
LABEL_30:
        objc_storeStrong((id *)(a1 + v27), v26);
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v26, a2)) {
          goto LABEL_57;
        }
        goto LABEL_49;
      case 4u:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONVIOInertialStateInfo);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVIOInertialStateInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_49;
      case 5u:
        uint64_t v28 = PBReaderReadData();
        uint64_t v29 = 48;
        goto LABEL_41;
      case 6u:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONVIOInertialCovarianceInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVIOInertialCovarianceInfoReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_49;
      case 7u:
        uint64_t v28 = PBReaderReadData();
        uint64_t v29 = 32;
LABEL_41:
        unint64_t v30 = *(void **)(a1 + v29);
        *(void *)(a1 + v29) = v28;

        goto LABEL_50;
      case 8u:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONSimdFloatMxN);
        uint64_t v31 = 24;
        goto LABEL_44;
      case 9u:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONSimdFloatMxN);
        uint64_t v31 = 16;
LABEL_44:
        objc_storeStrong((id *)(a1 + v31), v26);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdFloatMxNReadFrom(v26, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_49;
      case 0xAu:
        unsigned int v26 = objc_alloc_init(CLPLOGENTRYVISIONCGSize);
        objc_storeStrong((id *)(a1 + 8), v26);
        if (PBReaderPlaceMark() && CLPLOGENTRYVISIONCGSizeReadFrom((uint64_t)v26, a2))
        {
LABEL_49:
          PBReaderRecallMark();

LABEL_50:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_57:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_50;
    }
  }
}

uint64_t CLPLOGENTRYVISIONVLLocalizationResultReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        objc_storeStrong((id *)(a1 + 40), v18);
        if (PBReaderPlaceMark() && CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v18, a2)) {
          goto LABEL_38;
        }
        goto LABEL_44;
      case 2u:
        char v18 = objc_alloc_init(CLPLOGENTRYVISIONVLLocation);
        objc_storeStrong((id *)(a1 + 32), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVLLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_38;
      case 3u:
        char v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleMxN);
        objc_storeStrong((id *)(a1 + 48), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMxNReadFrom(v18, a2) & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_38;
      case 4u:
        char v18 = objc_alloc_init(CLPLOGENTRYVISIONVLMatrixfMxN);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVLMatrixfMxNReadFrom(v18, a2) & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_38;
      case 5u:
        *(unsigned char *)(a1 + 56) |= 1u;
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)(a2 + *v4))
        {
          int v22 = *(_DWORD *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 4;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          int v22 = 0;
        }
        *(_DWORD *)(a1 + 8) = v22;
        goto LABEL_39;
      case 6u:
        char v18 = objc_alloc_init(CLPLOGENTRYVISIONVLLocalizationDebugInfo);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (PBReaderPlaceMark()
          && (CLPLOGENTRYVISIONVLLocalizationDebugInfoReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_38:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_44:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_39;
    }
  }
}

uint64_t CLPWorkoutUpdateMotionActivityReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 28) |= 4u;
        while (1)
        {
          uint64_t v25 = *v3;
          uint64_t v26 = *(void *)(a2 + v25);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + *v4)) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
          *(void *)(a2 + v25) = v27;
          v24 |= (unint64_t)(v28 & 0x7F) << v22;
          if ((v28 & 0x80) == 0) {
            goto LABEL_37;
          }
          v22 += 7;
          BOOL v15 = v23++ >= 9;
          if (v15)
          {
            LODWORD(v24) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 24) = v24;
      }
      else
      {
        if (v18 == 2)
        {
          *(unsigned char *)(a1 + 28) |= 1u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v21 = 0;
          }
          uint64_t v32 = 8;
        }
        else
        {
          if (v18 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          *(unsigned char *)(a1 + 28) |= 2u;
          uint64_t v19 = *v3;
          unint64_t v20 = *(void *)(a2 + v19);
          if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
            *(void *)(a2 + v19) = v20 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v21 = 0;
          }
          uint64_t v32 = 16;
        }
        *(void *)(a1 + v32) = v21;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPInertialOdometryReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 64) |= 0x40u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unsigned int v33 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          goto LABEL_56;
        case 2u:
          *(unsigned char *)(a1 + 64) |= 1u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unsigned int v33 = &OBJC_IVAR___CLPInertialOdometry__deltaPositionX;
          goto LABEL_56;
        case 3u:
          *(unsigned char *)(a1 + 64) |= 2u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v24);
            *(void *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unsigned int v33 = &OBJC_IVAR___CLPInertialOdometry__deltaPositionY;
          goto LABEL_56;
        case 4u:
          *(unsigned char *)(a1 + 64) |= 4u;
          uint64_t v25 = *v3;
          unint64_t v26 = *(void *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unsigned int v33 = &OBJC_IVAR___CLPInertialOdometry__deltaPositionZ;
          goto LABEL_56;
        case 5u:
          *(unsigned char *)(a1 + 64) |= 8u;
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v28 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unsigned int v33 = &OBJC_IVAR___CLPInertialOdometry__deltaVelocityX;
          goto LABEL_56;
        case 6u:
          *(unsigned char *)(a1 + 64) |= 0x10u;
          uint64_t v29 = *v3;
          unint64_t v30 = *(void *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v30);
            *(void *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unsigned int v33 = &OBJC_IVAR___CLPInertialOdometry__deltaVelocityY;
          goto LABEL_56;
        case 7u:
          *(unsigned char *)(a1 + 64) |= 0x20u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          unsigned int v33 = &OBJC_IVAR___CLPInertialOdometry__deltaVelocityZ;
LABEL_56:
          *(void *)(a1 + *v33) = v20;
          goto LABEL_57;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_57:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPOutdoorUpdateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 40) |= 4u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v40 = 24;
          goto LABEL_59;
        case 2u:
          *(unsigned char *)(a1 + 40) |= 2u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v40 = 16;
          goto LABEL_59;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 40) |= 0x10u;
          while (2)
          {
            uint64_t v27 = *v3;
            uint64_t v28 = *(void *)(a2 + v27);
            unint64_t v29 = v28 + 1;
            if (v28 == -1 || v29 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                BOOL v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_47:
          uint64_t v39 = 36;
          goto LABEL_52;
        case 4u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 40) |= 8u;
          break;
        case 5u:
          *(unsigned char *)(a1 + 40) |= 1u;
          uint64_t v37 = *v3;
          unint64_t v38 = *(void *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v40 = 8;
LABEL_59:
          *(void *)(a1 + v40) = v20;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v3;
        uint64_t v34 = *(void *)(a2 + v33);
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)(a2 + *v4)) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
        *(void *)(a2 + v33) = v35;
        v26 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0) {
          goto LABEL_49;
        }
        v31 += 7;
        BOOL v15 = v32++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_51;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_51:
      uint64_t v39 = 32;
LABEL_52:
      *(_DWORD *)(a1 + v39) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPIonosphereCollectionRequestReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 2, v18);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(CLPIonosphereData);
    [a1 addIonoData:v18];
    if (!PBReaderPlaceMark() || !CLPIonosphereDataReadFrom((uint64_t)v18, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPIonosphereDataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    char v8 = &OBJC_IVAR___CLPIonosphereData__latitudeDeg;
    unsigned int v9 = (int *)MEMORY[0x1E4F940B8];
    unint64_t v10 = &OBJC_IVAR___CLPIonosphereData__longitudeDeg;
    uint64_t v11 = &OBJC_IVAR___CLPIonosphereData__geodeticAltitudeM;
    uint64_t v12 = &OBJC_IVAR___CLPIonosphereData__applicableTimeSec;
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v3;
        uint64_t v17 = *(void *)(a2 + v16);
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)(a2 + *v4)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)(a2 + *v9) + v17);
        *(void *)(a2 + v16) = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_12;
        }
        v13 += 7;
        if (v14++ >= 9)
        {
          unint64_t v15 = 0;
          int v21 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v21 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v15 = 0;
      }
LABEL_14:
      if (v21 || (v15 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v15 >> 3))
      {
        case 1u:
          *(_DWORD *)(a1 + v7[9]) |= 0x200u;
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v24);
            *(void *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = v8;
          goto LABEL_116;
        case 2u:
          *(_DWORD *)(a1 + v7[9]) |= 0x400u;
          uint64_t v32 = *v3;
          unint64_t v33 = *(void *)(a2 + v32);
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v33);
            *(void *)(a2 + v32) = v33 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = v10;
          goto LABEL_116;
        case 3u:
          *(_DWORD *)(a1 + v7[9]) |= 0x80u;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v35);
            *(void *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = v11;
          goto LABEL_116;
        case 4u:
          *(_DWORD *)(a1 + v7[9]) |= 1u;
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v37);
            *(void *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = v12;
          goto LABEL_116;
        case 5u:
          *(_DWORD *)(a1 + v7[9]) |= 0x100u;
          uint64_t v38 = *v3;
          unint64_t v39 = *(void *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v39);
            *(void *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__hmaxKm;
          goto LABEL_116;
        case 6u:
          *(_DWORD *)(a1 + v7[9]) |= 0x40000u;
          uint64_t v40 = *v3;
          unint64_t v41 = *(void *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v41);
            *(void *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__vtec0;
          goto LABEL_116;
        case 7u:
          *(_DWORD *)(a1 + v7[9]) |= 0x20u;
          uint64_t v42 = *v3;
          unint64_t v43 = *(void *)(a2 + v42);
          if (v43 <= 0xFFFFFFFFFFFFFFF7 && v43 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v43);
            *(void *)(a2 + v42) = v43 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__dvtecDtheta;
          goto LABEL_116;
        case 8u:
          *(_DWORD *)(a1 + v7[9]) |= 0x10u;
          uint64_t v44 = *v3;
          unint64_t v45 = *(void *)(a2 + v44);
          if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v45);
            *(void *)(a2 + v44) = v45 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__dvtecDphi;
          goto LABEL_116;
        case 9u:
          *(_DWORD *)(a1 + v7[9]) |= 4u;
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v47);
            *(void *)(a2 + v46) = v47 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__d2vtecDtheta2;
          goto LABEL_116;
        case 0xAu:
          *(_DWORD *)(a1 + v7[9]) |= 8u;
          uint64_t v48 = *v3;
          unint64_t v49 = *(void *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v49);
            *(void *)(a2 + v48) = v49 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__d2vtecDthetaphi;
          goto LABEL_116;
        case 0xBu:
          *(_DWORD *)(a1 + v7[9]) |= 2u;
          uint64_t v50 = *v3;
          unint64_t v51 = *(void *)(a2 + v50);
          if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v51);
            *(void *)(a2 + v50) = v51 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__d2vtecDphi2;
          goto LABEL_116;
        case 0xCu:
          *(_DWORD *)(a1 + v7[9]) |= 0x40u;
          uint64_t v52 = *v3;
          unint64_t v53 = *(void *)(a2 + v52);
          if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v53);
            *(void *)(a2 + v52) = v53 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__estimatorAgeSec;
          goto LABEL_116;
        case 0xDu:
          *(_DWORD *)(a1 + v7[9]) |= 0x10000u;
          uint64_t v54 = *v3;
          unint64_t v55 = *(void *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v55);
            *(void *)(a2 + v54) = v55 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__phmaxHmaxKm2;
          goto LABEL_116;
        case 0xEu:
          *(_DWORD *)(a1 + v7[9]) |= 0x20000u;
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v57);
            *(void *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__pvtec0Vtec0;
          goto LABEL_116;
        case 0xFu:
          *(_DWORD *)(a1 + v7[9]) |= 0x8000u;
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFF7 && v59 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v59);
            *(void *)(a2 + v58) = v59 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__pdvtecDthetaDvtecDtheta;
          goto LABEL_116;
        case 0x10u:
          *(_DWORD *)(a1 + v7[9]) |= 0x4000u;
          uint64_t v60 = *v3;
          unint64_t v61 = *(void *)(a2 + v60);
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v61);
            *(void *)(a2 + v60) = v61 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__pdvtecDphiDvtecDphi;
          goto LABEL_116;
        case 0x11u:
          *(_DWORD *)(a1 + v7[9]) |= 0x1000u;
          uint64_t v62 = *v3;
          unint64_t v63 = *(void *)(a2 + v62);
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v63);
            *(void *)(a2 + v62) = v63 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__pd2vtecDtheta2D2vtecDtheta2;
          goto LABEL_116;
        case 0x12u:
          *(_DWORD *)(a1 + v7[9]) |= 0x2000u;
          uint64_t v64 = *v3;
          unint64_t v65 = *(void *)(a2 + v64);
          if (v65 <= 0xFFFFFFFFFFFFFFF7 && v65 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v65);
            *(void *)(a2 + v64) = v65 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__pd2vtecDthetadphiD2vtecDthetadphi;
          goto LABEL_116;
        case 0x13u:
          *(_DWORD *)(a1 + v7[9]) |= 0x800u;
          uint64_t v66 = *v3;
          unint64_t v67 = *(void *)(a2 + v66);
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v25 = *(void *)(*(void *)(a2 + *v9) + v67);
            *(void *)(a2 + v66) = v67 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v25 = 0;
          }
          uint64_t v68 = &OBJC_IVAR___CLPIonosphereData__pd2vtecDphi2D2vtecDphi2;
LABEL_116:
          *(void *)(a1 + *v68) = v25;
          goto LABEL_117;
        default:
          uint64_t v26 = v8;
          uint64_t v27 = v10;
          uint64_t v28 = v11;
          unint64_t v29 = v7;
          char v30 = v12;
          char v31 = PBReaderSkipValueWithTag();
          uint64_t v12 = v30;
          v5 = (int *)MEMORY[0x1E4F940C8];
          v7 = v29;
          uint64_t v11 = v28;
          unint64_t v10 = v27;
          char v8 = v26;
          if ((v31 & 1) == 0) {
            return 0;
          }
LABEL_117:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPLOGENTRYVISIONCGSizeReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 2u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        uint64_t v23 = &OBJC_IVAR___CLPLOGENTRYVISIONCGSize__width;
LABEL_32:
        *(void *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_33:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 24) |= 1u;
    uint64_t v21 = *v3;
    unint64_t v22 = *(void *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
      *(void *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v20 = 0;
    }
    uint64_t v23 = &OBJC_IVAR___CLPLOGENTRYVISIONCGSize__height;
    goto LABEL_32;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLHeadingReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        objc_storeStrong((id *)(a1 + 64), v18);
        if (PBReaderPlaceMark() && CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v18, a2)) {
          goto LABEL_47;
        }
        goto LABEL_57;
      case 2u:
        uint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleMxN);
        uint64_t v20 = 40;
        goto LABEL_26;
      case 3u:
        uint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleMxN);
        uint64_t v20 = 32;
LABEL_26:
        objc_storeStrong((id *)(a1 + v20), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMxNReadFrom(v18, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_47;
      case 4u:
        uint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleM);
        objc_storeStrong((id *)(a1 + 48), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_47;
      case 5u:
        *(unsigned char *)(a1 + 72) |= 1u;
        uint64_t v21 = *v3;
        unint64_t v22 = *(void *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v23 = 0;
        }
        *(void *)(a1 + 8) = v23;
        goto LABEL_48;
      case 6u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 72) |= 2u;
        while (2)
        {
          uint64_t v27 = *v3;
          uint64_t v28 = *(void *)(a2 + v27);
          unint64_t v29 = v28 + 1;
          if (v28 == -1 || v29 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
            *(void *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              BOOL v15 = v25++ >= 9;
              if (v15)
              {
                LODWORD(v26) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_53:
        *(_DWORD *)(a1 + 16) = v26;
        goto LABEL_48;
      case 7u:
        uint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONLSLLocation);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONLSLLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_57;
        }
        goto LABEL_47;
      case 8u:
        uint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONLSLHeadingSupplInfo);
        objc_storeStrong((id *)(a1 + 56), v18);
        if (PBReaderPlaceMark()
          && (CLPLOGENTRYVISIONLSLHeadingSupplInfoReadFrom((uint64_t)v18, a2) & 1) != 0)
        {
LABEL_47:
          PBReaderRecallMark();

LABEL_48:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_57:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_48;
    }
  }
}

BOOL CLPLOGENTRYVISIONTimeStampReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(unsigned char *)(a1 + 32) |= 4u;
        uint64_t v22 = *v3;
        unint64_t v23 = *(void *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v26 = &OBJC_IVAR___CLPLOGENTRYVISIONTimeStamp__machContinuousTimeS;
        goto LABEL_38;
      }
      if (v18 == 2) {
        break;
      }
      if (v18 == 1)
      {
        *(unsigned char *)(a1 + 32) |= 1u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        uint64_t v26 = &OBJC_IVAR___CLPLOGENTRYVISIONTimeStamp__cfAbsoluteTimeS;
LABEL_38:
        *(void *)(a1 + *v26) = v21;
        goto LABEL_39;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_39:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 32) |= 2u;
    uint64_t v24 = *v3;
    unint64_t v25 = *(void *)(a2 + v24);
    if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v25);
      *(void *)(a2 + v24) = v25 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v21 = 0;
    }
    uint64_t v26 = &OBJC_IVAR___CLPLOGENTRYVISIONTimeStamp__machAbsoluteTimeS;
    goto LABEL_38;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONSimdDoubleMxNReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleM);
        [a1 addColumns:v18];
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONSimdDoubleMReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v6 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        uint64_t v11 = *(void *)(a2 + v10);
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        if (v8++ >= 9)
        {
          unint64_t v9 = 0;
          uint64_t v15 = *v5;
          int v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v15 = *v5;
      int v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(unsigned char *)(a2 + v15)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v17 = v9 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            unint64_t v20 = (unint64_t *)(a2 + *v3);
            unint64_t v21 = *v20;
            unint64_t v22 = *(void *)(a2 + *v4);
            if (*v20 >= v22) {
              break;
            }
            uint64_t v23 = *v5;
            if (*(unsigned char *)(a2 + v23)) {
              break;
            }
            if (v21 > 0xFFFFFFFFFFFFFFF7 || v21 + 8 > v22) {
              *(unsigned char *)(a2 + v23) = 1;
            }
            else {
              *unint64_t v20 = v21 + 8;
            }
            PBRepeatedDoubleAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v24) = v25 + 8;
          }
          else {
            *(unsigned char *)(a2 + v15) = 1;
          }
          PBRepeatedDoubleAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v19 = objc_alloc_init(CLPLOGENTRYVISIONTimeStamp);
        objc_storeStrong((id *)(a1 + 24), v19);
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONTimeStampReadFrom((uint64_t)v19, a2))
        {
LABEL_36:

          return 0;
        }
      }
      else
      {
        if (v18 == 2)
        {
          *(unsigned char *)(a1 + 32) |= 1u;
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v22 = 0;
          }
          *(void *)(a1 + 8) = v22;
          continue;
        }
        if (v18 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        uint64_t v19 = objc_alloc_init(CLPLOGENTRYVISIONLSLLocationCoordinate);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONLSLLocationCoordinateReadFrom((uint64_t)v19, a2)) {
          goto LABEL_36;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLHeadingSupplInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONLSLMapRoadSegment);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONLSLMapRoadSegmentReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLHeadingEstimationReadFrom(unsigned char *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v18 != 2)
      {
        if (v18 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_49;
        }
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        a1[24] |= 2u;
        while (1)
        {
          uint64_t v22 = *v3;
          uint64_t v23 = *(void *)(a2 + v22);
          unint64_t v24 = v23 + 1;
          if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0) {
            goto LABEL_41;
          }
          v19 += 7;
          BOOL v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_43;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_43:
        uint64_t v34 = 20;
        goto LABEL_48;
      }
      uint64_t v32 = objc_alloc_init(CLPLOGENTRYVISIONLSLHeading);
      [a1 addHeadings:v32];
      if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONLSLHeadingReadFrom((uint64_t)v32, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

LABEL_49:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v26 = 0;
    unsigned int v27 = 0;
    uint64_t v21 = 0;
    a1[24] |= 1u;
    while (1)
    {
      uint64_t v28 = *v3;
      uint64_t v29 = *(void *)(a2 + v28);
      unint64_t v30 = v29 + 1;
      if (v29 == -1 || v30 > *(void *)(a2 + *v4)) {
        break;
      }
      char v31 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
      *(void *)(a2 + v28) = v30;
      v21 |= (unint64_t)(v31 & 0x7F) << v26;
      if ((v31 & 0x80) == 0) {
        goto LABEL_45;
      }
      v26 += 7;
      BOOL v15 = v27++ >= 9;
      if (v15)
      {
        LODWORD(v21) = 0;
        goto LABEL_47;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
    if (*(unsigned char *)(a2 + *v5)) {
      LODWORD(v21) = 0;
    }
LABEL_47:
    uint64_t v34 = 16;
LABEL_48:
    *(_DWORD *)&a1[v34] = v21;
    goto LABEL_49;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONLSLMapRoadSegmentReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v25 = objc_alloc_init(CLPLOGENTRYVISIONLSLLocationCoordinate);
        [(id)a1 addPolylines:v25];
        if (!PBReaderPlaceMark() || !CLPLOGENTRYVISIONLSLLocationCoordinateReadFrom((uint64_t)v25, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_35:
        *(void *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPLOGENTRYVISIONLSLLocationCoordinateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        unint64_t v23 = &OBJC_IVAR___CLPLOGENTRYVISIONLSLLocationCoordinate__latitude;
LABEL_32:
        *(void *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_33:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 24) |= 2u;
    uint64_t v21 = *v3;
    unint64_t v22 = *(void *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
      *(void *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v20 = 0;
    }
    unint64_t v23 = &OBJC_IVAR___CLPLOGENTRYVISIONLSLLocationCoordinate__longitude;
    goto LABEL_32;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONSimdFloatMReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v6 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        uint64_t v11 = *(void *)(a2 + v10);
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        if (v8++ >= 9)
        {
          unint64_t v9 = 0;
          uint64_t v15 = *v5;
          int v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v15 = *v5;
      int v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(unsigned char *)(a2 + v15)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v17 = v9 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            uint64_t v20 = (unint64_t *)(a2 + *v3);
            unint64_t v21 = *v20;
            unint64_t v22 = *(void *)(a2 + *v4);
            if (*v20 >= v22) {
              break;
            }
            uint64_t v23 = *v5;
            if (*(unsigned char *)(a2 + v23)) {
              break;
            }
            if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22) {
              *(unsigned char *)(a2 + v23) = 1;
            }
            else {
              *uint64_t v20 = v21 + 4;
            }
            PBRepeatedFloatAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v24) = v25 + 4;
          }
          else {
            *(unsigned char *)(a2 + v15) = 1;
          }
          PBRepeatedFloatAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONSimdFloatMxNReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdFloatM);
        [a1 addColumns:v18];
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdFloatMReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVIOInertialStateInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    char v8 = (int *)MEMORY[0x1E4F940B8];
    unsigned int v9 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    unint64_t v10 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    uint64_t v11 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    uint64_t v12 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    unint64_t v13 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    char v14 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    uint64_t v15 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    int v16 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v19 = 0;
      while (1)
      {
        uint64_t v20 = *v3;
        uint64_t v21 = *(void *)(a2 + v20);
        unint64_t v22 = v21 + 1;
        if (v21 == -1 || v22 > *(void *)(a2 + *v4)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)(a2 + *v8) + v21);
        *(void *)(a2 + v20) = v22;
        v19 |= (unint64_t)(v23 & 0x7F) << v17;
        if ((v23 & 0x80) == 0) {
          goto LABEL_12;
        }
        v17 += 7;
        BOOL v24 = v18++ >= 9;
        if (v24)
        {
          unint64_t v19 = 0;
          int v25 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v25 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v19 = 0;
      }
LABEL_14:
      if (v25 || (v19 & 7) == 4) {
        break;
      }
      switch((v19 >> 3))
      {
        case 1u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(_WORD *)(a1 + v7[88]) |= 1u;
          while (1)
          {
            uint64_t v30 = *v3;
            uint64_t v31 = *(void *)(a2 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)(a2 + *v8) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_106;
            }
            v27 += 7;
            BOOL v24 = v28++ >= 9;
            if (v24)
            {
              uint64_t v29 = 0;
              goto LABEL_108;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_106:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_108:
          *(void *)(a1 + v9[89]) = v29;
          continue;
        case 2u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x200u;
          while (2)
          {
            uint64_t v43 = *v3;
            uint64_t v44 = *(void *)(a2 + v43);
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)(a2 + *v8) + v44);
              *(void *)(a2 + v43) = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v24 = v41++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_112:
          uint64_t v107 = v10[90];
          goto LABEL_153;
        case 3u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x40u;
          while (2)
          {
            uint64_t v49 = *v3;
            uint64_t v50 = *(void *)(a2 + v49);
            unint64_t v51 = v50 + 1;
            if (v50 == -1 || v51 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)(a2 + *v8) + v50);
              *(void *)(a2 + v49) = v51;
              v42 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                BOOL v24 = v48++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_116:
          uint64_t v107 = v11[91];
          goto LABEL_153;
        case 4u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x20u;
          while (2)
          {
            uint64_t v55 = *v3;
            uint64_t v56 = *(void *)(a2 + v55);
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)(a2 + *v8) + v56);
              *(void *)(a2 + v55) = v57;
              v42 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                BOOL v24 = v54++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_120:
          uint64_t v107 = v12[92];
          goto LABEL_153;
        case 5u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x10u;
          while (2)
          {
            uint64_t v61 = *v3;
            uint64_t v62 = *(void *)(a2 + v61);
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)(a2 + *v8) + v62);
              *(void *)(a2 + v61) = v63;
              v42 |= (unint64_t)(v64 & 0x7F) << v59;
              if (v64 < 0)
              {
                v59 += 7;
                BOOL v24 = v60++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_124:
          uint64_t v107 = v13[93];
          goto LABEL_153;
        case 6u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 8u;
          while (2)
          {
            uint64_t v67 = *v3;
            uint64_t v68 = *(void *)(a2 + v67);
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)(a2 + *v8) + v68);
              *(void *)(a2 + v67) = v69;
              v42 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                BOOL v24 = v66++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_128:
          uint64_t v107 = v14[94];
          goto LABEL_153;
        case 7u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x800u;
          while (2)
          {
            uint64_t v73 = *v3;
            uint64_t v74 = *(void *)(a2 + v73);
            unint64_t v75 = v74 + 1;
            if (v74 == -1 || v75 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v76 = *(unsigned char *)(*(void *)(a2 + *v8) + v74);
              *(void *)(a2 + v73) = v75;
              v42 |= (unint64_t)(v76 & 0x7F) << v71;
              if (v76 < 0)
              {
                v71 += 7;
                BOOL v24 = v72++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_132:
          uint64_t v107 = v15[95];
          goto LABEL_153;
        case 8u:
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x400u;
          while (2)
          {
            uint64_t v79 = *v3;
            uint64_t v80 = *(void *)(a2 + v79);
            unint64_t v81 = v80 + 1;
            if (v80 == -1 || v81 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)(a2 + *v8) + v80);
              *(void *)(a2 + v79) = v81;
              v42 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                BOOL v24 = v78++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_136:
          uint64_t v107 = v16[96];
          goto LABEL_153;
        case 9u:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 4u;
          while (2)
          {
            uint64_t v85 = *v3;
            uint64_t v86 = *(void *)(a2 + v85);
            unint64_t v87 = v86 + 1;
            if (v86 == -1 || v87 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v88 = *(unsigned char *)(*(void *)(a2 + *v8) + v86);
              *(void *)(a2 + v85) = v87;
              v42 |= (unint64_t)(v88 & 0x7F) << v83;
              if (v88 < 0)
              {
                v83 += 7;
                BOOL v24 = v84++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_140:
          uint64_t v107 = 20;
          goto LABEL_153;
        case 0xAu:
          char v89 = 0;
          unsigned int v90 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 2u;
          while (2)
          {
            uint64_t v91 = *v3;
            uint64_t v92 = *(void *)(a2 + v91);
            unint64_t v93 = v92 + 1;
            if (v92 == -1 || v93 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v94 = *(unsigned char *)(*(void *)(a2 + *v8) + v92);
              *(void *)(a2 + v91) = v93;
              v42 |= (unint64_t)(v94 & 0x7F) << v89;
              if (v94 < 0)
              {
                v89 += 7;
                BOOL v24 = v90++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_144:
          uint64_t v107 = 16;
          goto LABEL_153;
        case 0xBu:
          char v95 = 0;
          unsigned int v96 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x100u;
          while (2)
          {
            uint64_t v97 = *v3;
            uint64_t v98 = *(void *)(a2 + v97);
            unint64_t v99 = v98 + 1;
            if (v98 == -1 || v99 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v100 = *(unsigned char *)(*(void *)(a2 + *v8) + v98);
              *(void *)(a2 + v97) = v99;
              v42 |= (unint64_t)(v100 & 0x7F) << v95;
              if (v100 < 0)
              {
                v95 += 7;
                BOOL v24 = v96++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_148:
          uint64_t v107 = 44;
          goto LABEL_153;
        case 0xCu:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[88]) |= 0x80u;
          break;
        default:
          uint64_t v34 = v9;
          unint64_t v35 = v10;
          uint64_t v36 = v11;
          unint64_t v37 = v7;
          uint64_t v38 = v12;
          uint64_t result = PBReaderSkipValueWithTag();
          uint64_t v12 = v38;
          v5 = (int *)MEMORY[0x1E4F940C8];
          char v7 = v37;
          unint64_t v13 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          uint64_t v11 = v36;
          char v14 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          unint64_t v10 = v35;
          int v16 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          unsigned int v9 = v34;
          uint64_t v15 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v103 = *v3;
        uint64_t v104 = *(void *)(a2 + v103);
        unint64_t v105 = v104 + 1;
        if (v104 == -1 || v105 > *(void *)(a2 + *v4)) {
          break;
        }
        char v106 = *(unsigned char *)(*(void *)(a2 + *v8) + v104);
        *(void *)(a2 + v103) = v105;
        v42 |= (unint64_t)(v106 & 0x7F) << v101;
        if ((v106 & 0x80) == 0) {
          goto LABEL_150;
        }
        v101 += 7;
        BOOL v24 = v102++ >= 9;
        if (v24)
        {
          LODWORD(v42) = 0;
          goto LABEL_152;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_150:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v42) = 0;
      }
LABEL_152:
      uint64_t v107 = 40;
LABEL_153:
      *(_DWORD *)(a1 + v107) = v42;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVIOInertialCovarianceInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    char v8 = (int *)MEMORY[0x1E4F940B8];
    unsigned int v9 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    unint64_t v10 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    uint64_t v11 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    uint64_t v12 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    unint64_t v13 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    char v14 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    uint64_t v15 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    int v16 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v19 = 0;
      while (1)
      {
        uint64_t v20 = *v3;
        uint64_t v21 = *(void *)(a2 + v20);
        unint64_t v22 = v21 + 1;
        if (v21 == -1 || v22 > *(void *)(a2 + *v4)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)(a2 + *v8) + v21);
        *(void *)(a2 + v20) = v22;
        v19 |= (unint64_t)(v23 & 0x7F) << v17;
        if ((v23 & 0x80) == 0) {
          goto LABEL_12;
        }
        v17 += 7;
        BOOL v24 = v18++ >= 9;
        if (v24)
        {
          unint64_t v19 = 0;
          int v25 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v25 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v19 = 0;
      }
LABEL_14:
      if (v25 || (v19 & 7) == 4) {
        break;
      }
      switch((v19 >> 3))
      {
        case 1u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *(_WORD *)(a1 + v7[75]) |= 1u;
          while (1)
          {
            uint64_t v30 = *v3;
            uint64_t v31 = *(void *)(a2 + v30);
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)(a2 + *v8) + v31);
            *(void *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_106;
            }
            v27 += 7;
            BOOL v24 = v28++ >= 9;
            if (v24)
            {
              uint64_t v29 = 0;
              goto LABEL_108;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_106:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v29 = 0;
          }
LABEL_108:
          *(void *)(a1 + v9[76]) = v29;
          continue;
        case 2u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 8u;
          while (2)
          {
            uint64_t v43 = *v3;
            uint64_t v44 = *(void *)(a2 + v43);
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v46 = *(unsigned char *)(*(void *)(a2 + *v8) + v44);
              *(void *)(a2 + v43) = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                BOOL v24 = v41++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_112:
          uint64_t v107 = v10[77];
          goto LABEL_153;
        case 3u:
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x40u;
          while (2)
          {
            uint64_t v49 = *v3;
            uint64_t v50 = *(void *)(a2 + v49);
            unint64_t v51 = v50 + 1;
            if (v50 == -1 || v51 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v52 = *(unsigned char *)(*(void *)(a2 + *v8) + v50);
              *(void *)(a2 + v49) = v51;
              v42 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                BOOL v24 = v48++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_116;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_116:
          uint64_t v107 = v11[78];
          goto LABEL_153;
        case 4u:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x80u;
          while (2)
          {
            uint64_t v55 = *v3;
            uint64_t v56 = *(void *)(a2 + v55);
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)(a2 + *v8) + v56);
              *(void *)(a2 + v55) = v57;
              v42 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                BOOL v24 = v54++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_120;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_120:
          uint64_t v107 = v12[79];
          goto LABEL_153;
        case 5u:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x10u;
          while (2)
          {
            uint64_t v61 = *v3;
            uint64_t v62 = *(void *)(a2 + v61);
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)(a2 + *v8) + v62);
              *(void *)(a2 + v61) = v63;
              v42 |= (unint64_t)(v64 & 0x7F) << v59;
              if (v64 < 0)
              {
                v59 += 7;
                BOOL v24 = v60++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_124:
          uint64_t v107 = v13[80];
          goto LABEL_153;
        case 6u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x20u;
          while (2)
          {
            uint64_t v67 = *v3;
            uint64_t v68 = *(void *)(a2 + v67);
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)(a2 + *v8) + v68);
              *(void *)(a2 + v67) = v69;
              v42 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                BOOL v24 = v66++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_128;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_128:
          uint64_t v107 = v14[81];
          goto LABEL_153;
        case 7u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x400u;
          while (2)
          {
            uint64_t v73 = *v3;
            uint64_t v74 = *(void *)(a2 + v73);
            unint64_t v75 = v74 + 1;
            if (v74 == -1 || v75 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v76 = *(unsigned char *)(*(void *)(a2 + *v8) + v74);
              *(void *)(a2 + v73) = v75;
              v42 |= (unint64_t)(v76 & 0x7F) << v71;
              if (v76 < 0)
              {
                v71 += 7;
                BOOL v24 = v72++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_132:
          uint64_t v107 = v15[82];
          goto LABEL_153;
        case 8u:
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x800u;
          while (2)
          {
            uint64_t v79 = *v3;
            uint64_t v80 = *(void *)(a2 + v79);
            unint64_t v81 = v80 + 1;
            if (v80 == -1 || v81 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)(a2 + *v8) + v80);
              *(void *)(a2 + v79) = v81;
              v42 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                BOOL v24 = v78++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_136:
          uint64_t v107 = v16[83];
          goto LABEL_153;
        case 9u:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 2u;
          while (2)
          {
            uint64_t v85 = *v3;
            uint64_t v86 = *(void *)(a2 + v85);
            unint64_t v87 = v86 + 1;
            if (v86 == -1 || v87 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v88 = *(unsigned char *)(*(void *)(a2 + *v8) + v86);
              *(void *)(a2 + v85) = v87;
              v42 |= (unint64_t)(v88 & 0x7F) << v83;
              if (v88 < 0)
              {
                v83 += 7;
                BOOL v24 = v84++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_140:
          uint64_t v107 = 16;
          goto LABEL_153;
        case 0xAu:
          char v89 = 0;
          unsigned int v90 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 4u;
          while (2)
          {
            uint64_t v91 = *v3;
            uint64_t v92 = *(void *)(a2 + v91);
            unint64_t v93 = v92 + 1;
            if (v92 == -1 || v93 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v94 = *(unsigned char *)(*(void *)(a2 + *v8) + v92);
              *(void *)(a2 + v91) = v93;
              v42 |= (unint64_t)(v94 & 0x7F) << v89;
              if (v94 < 0)
              {
                v89 += 7;
                BOOL v24 = v90++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_144:
          uint64_t v107 = 20;
          goto LABEL_153;
        case 0xBu:
          char v95 = 0;
          unsigned int v96 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x100u;
          while (2)
          {
            uint64_t v97 = *v3;
            uint64_t v98 = *(void *)(a2 + v97);
            unint64_t v99 = v98 + 1;
            if (v98 == -1 || v99 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v100 = *(unsigned char *)(*(void *)(a2 + *v8) + v98);
              *(void *)(a2 + v97) = v99;
              v42 |= (unint64_t)(v100 & 0x7F) << v95;
              if (v100 < 0)
              {
                v95 += 7;
                BOOL v24 = v96++ >= 9;
                if (v24)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v42) = 0;
          }
LABEL_148:
          uint64_t v107 = 44;
          goto LABEL_153;
        case 0xCu:
          char v101 = 0;
          unsigned int v102 = 0;
          uint64_t v42 = 0;
          *(_WORD *)(a1 + v7[75]) |= 0x200u;
          break;
        default:
          uint64_t v34 = v9;
          unint64_t v35 = v10;
          uint64_t v36 = v11;
          unint64_t v37 = v7;
          uint64_t v38 = v12;
          uint64_t result = PBReaderSkipValueWithTag();
          uint64_t v12 = v38;
          v5 = (int *)MEMORY[0x1E4F940C8];
          char v7 = v37;
          unint64_t v13 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          uint64_t v11 = v36;
          char v14 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          unint64_t v10 = v35;
          int v16 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          unsigned int v9 = v34;
          uint64_t v15 = &OBJC_IVAR___CLPInertialOdometry__timestamp;
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v103 = *v3;
        uint64_t v104 = *(void *)(a2 + v103);
        unint64_t v105 = v104 + 1;
        if (v104 == -1 || v105 > *(void *)(a2 + *v4)) {
          break;
        }
        char v106 = *(unsigned char *)(*(void *)(a2 + *v8) + v104);
        *(void *)(a2 + v103) = v105;
        v42 |= (unint64_t)(v106 & 0x7F) << v101;
        if ((v106 & 0x80) == 0) {
          goto LABEL_150;
        }
        v101 += 7;
        BOOL v24 = v102++ >= 9;
        if (v24)
        {
          LODWORD(v42) = 0;
          goto LABEL_152;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_150:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v42) = 0;
      }
LABEL_152:
      uint64_t v107 = 48;
LABEL_153:
      *(_DWORD *)(a1 + v107) = v42;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVLLocalizationDebugInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unsigned int v18 = objc_alloc_init(CLPLOGENTRYVISIONVLLocalizationMaps488Details);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark()
          || (CLPLOGENTRYVISIONVLLocalizationMaps488DetailsReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVLLocalizationMaps488DetailsReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v15 = v9++ >= 9;
          if (v15)
          {
            unint64_t v10 = 0;
            uint64_t v16 = *v5;
            int v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(unsigned char *)(a2 + v16)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v20 = 0;
              unsigned int v21 = 0;
              uint64_t v22 = 0;
              *(unsigned char *)(a1 + 384) |= 4u;
              while (1)
              {
                uint64_t v23 = *v3;
                uint64_t v24 = *(void *)(a2 + v23);
                unint64_t v25 = v24 + 1;
                if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
                  break;
                }
                char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v25;
                v22 |= (unint64_t)(v26 & 0x7F) << v20;
                if ((v26 & 0x80) == 0) {
                  goto LABEL_194;
                }
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  uint64_t v22 = 0;
                  goto LABEL_196;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_194:
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v22 = 0;
              }
LABEL_196:
              uint64_t v115 = 360;
              goto LABEL_209;
            case 2u:
              if (v18 != 2) {
                goto LABEL_245;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                char v27 = (unint64_t *)(a2 + *v3);
                unint64_t v28 = *v27;
                unint64_t v29 = *(void *)(a2 + *v4);
                if (*v27 >= v29) {
                  break;
                }
                uint64_t v30 = *v5;
                if (*(unsigned char *)(a2 + v30)) {
                  break;
                }
                if (v28 > 0xFFFFFFFFFFFFFFFBLL || v28 + 4 > v29) {
                  *(unsigned char *)(a2 + v30) = 1;
                }
                else {
                  *char v27 = v28 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 3u:
              if (v18 != 2) {
                goto LABEL_250;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                uint64_t v31 = (unint64_t *)(a2 + *v3);
                unint64_t v32 = *v31;
                unint64_t v33 = *(void *)(a2 + *v4);
                if (*v31 >= v33) {
                  break;
                }
                uint64_t v34 = *v5;
                if (*(unsigned char *)(a2 + v34)) {
                  break;
                }
                if (v32 > 0xFFFFFFFFFFFFFFF7 || v32 + 8 > v33) {
                  *(unsigned char *)(a2 + v34) = 1;
                }
                else {
                  *uint64_t v31 = v32 + 8;
                }
                PBRepeatedDoubleAdd();
              }
              goto LABEL_192;
            case 4u:
              if (v18 != 2)
              {
                char v116 = 0;
                unsigned int v117 = 0;
                uint64_t v118 = 0;
                while (1)
                {
                  uint64_t v119 = *v3;
                  uint64_t v120 = *(void *)(a2 + v119);
                  unint64_t v121 = v120 + 1;
                  if (v120 == -1 || v121 > *(void *)(a2 + *v4)) {
                    goto LABEL_243;
                  }
                  char v122 = *(unsigned char *)(*(void *)(a2 + *v7) + v120);
                  *(void *)(a2 + v119) = v121;
                  v118 |= (unint64_t)(v122 & 0x7F) << v116;
                  if (v122 < 0)
                  {
                    v116 += 7;
                    BOOL v15 = v117++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_244;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v35 = 0;
                unsigned int v36 = 0;
                uint64_t v37 = 0;
                while (1)
                {
                  uint64_t v38 = *v3;
                  uint64_t v39 = *(void *)(a2 + v38);
                  unint64_t v40 = v39 + 1;
                  if (v39 == -1 || v40 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
                  *(void *)(a2 + v38) = v40;
                  v37 |= (unint64_t)(v41 & 0x7F) << v35;
                  if (v41 < 0)
                  {
                    v35 += 7;
                    BOOL v15 = v36++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_58;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_58:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 5u:
              if (v18 != 2) {
                goto LABEL_250;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                uint64_t v42 = (unint64_t *)(a2 + *v3);
                unint64_t v43 = *v42;
                unint64_t v44 = *(void *)(a2 + *v4);
                if (*v42 >= v44) {
                  break;
                }
                uint64_t v45 = *v5;
                if (*(unsigned char *)(a2 + v45)) {
                  break;
                }
                if (v43 > 0xFFFFFFFFFFFFFFF7 || v43 + 8 > v44) {
                  *(unsigned char *)(a2 + v45) = 1;
                }
                else {
                  *uint64_t v42 = v43 + 8;
                }
                PBRepeatedDoubleAdd();
              }
              goto LABEL_192;
            case 6u:
              char v46 = 0;
              unsigned int v47 = 0;
              uint64_t v22 = 0;
              *(unsigned char *)(a1 + 384) |= 8u;
              while (2)
              {
                uint64_t v48 = *v3;
                uint64_t v49 = *(void *)(a2 + v48);
                unint64_t v50 = v49 + 1;
                if (v49 == -1 || v50 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v51 = *(unsigned char *)(*(void *)(a2 + *v7) + v49);
                  *(void *)(a2 + v48) = v50;
                  v22 |= (unint64_t)(v51 & 0x7F) << v46;
                  if (v51 < 0)
                  {
                    v46 += 7;
                    BOOL v15 = v47++ >= 9;
                    if (v15)
                    {
                      uint64_t v22 = 0;
                      goto LABEL_200;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v22 = 0;
              }
LABEL_200:
              uint64_t v115 = 368;
              goto LABEL_209;
            case 7u:
              if (v18 != 2) {
                goto LABEL_245;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                char v52 = (unint64_t *)(a2 + *v3);
                unint64_t v53 = *v52;
                unint64_t v54 = *(void *)(a2 + *v4);
                if (*v52 >= v54) {
                  break;
                }
                uint64_t v55 = *v5;
                if (*(unsigned char *)(a2 + v55)) {
                  break;
                }
                if (v53 > 0xFFFFFFFFFFFFFFFBLL || v53 + 4 > v54) {
                  *(unsigned char *)(a2 + v55) = 1;
                }
                else {
                  *char v52 = v53 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 8u:
              char v56 = 0;
              unsigned int v57 = 0;
              uint64_t v22 = 0;
              *(unsigned char *)(a1 + 384) |= 1u;
              while (2)
              {
                uint64_t v58 = *v3;
                uint64_t v59 = *(void *)(a2 + v58);
                unint64_t v60 = v59 + 1;
                if (v59 == -1 || v60 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v61 = *(unsigned char *)(*(void *)(a2 + *v7) + v59);
                  *(void *)(a2 + v58) = v60;
                  v22 |= (unint64_t)(v61 & 0x7F) << v56;
                  if (v61 < 0)
                  {
                    v56 += 7;
                    BOOL v15 = v57++ >= 9;
                    if (v15)
                    {
                      uint64_t v22 = 0;
                      goto LABEL_204;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v22 = 0;
              }
LABEL_204:
              uint64_t v115 = 344;
              goto LABEL_209;
            case 9u:
              uint64_t v62 = PBReaderReadData();
              unint64_t v63 = *(void **)(a1 + 376);
              *(void *)(a1 + 376) = v62;

              goto LABEL_255;
            case 0xAu:
              if (v18 != 2)
              {
                char v123 = 0;
                unsigned int v124 = 0;
                uint64_t v125 = 0;
                while (1)
                {
                  uint64_t v126 = *v3;
                  uint64_t v127 = *(void *)(a2 + v126);
                  unint64_t v128 = v127 + 1;
                  if (v127 == -1 || v128 > *(void *)(a2 + *v4)) {
                    goto LABEL_243;
                  }
                  char v129 = *(unsigned char *)(*(void *)(a2 + *v7) + v127);
                  *(void *)(a2 + v126) = v128;
                  v125 |= (unint64_t)(v129 & 0x7F) << v123;
                  if (v129 < 0)
                  {
                    v123 += 7;
                    BOOL v15 = v124++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_244;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v64 = 0;
                unsigned int v65 = 0;
                uint64_t v66 = 0;
                while (1)
                {
                  uint64_t v67 = *v3;
                  uint64_t v68 = *(void *)(a2 + v67);
                  unint64_t v69 = v68 + 1;
                  if (v68 == -1 || v69 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v70 = *(unsigned char *)(*(void *)(a2 + *v7) + v68);
                  *(void *)(a2 + v67) = v69;
                  v66 |= (unint64_t)(v70 & 0x7F) << v64;
                  if (v70 < 0)
                  {
                    v64 += 7;
                    BOOL v15 = v65++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_104;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_104:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 0xBu:
              if (v18 != 2) {
                goto LABEL_245;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                char v71 = (unint64_t *)(a2 + *v3);
                unint64_t v72 = *v71;
                unint64_t v73 = *(void *)(a2 + *v4);
                if (*v71 >= v73) {
                  break;
                }
                uint64_t v74 = *v5;
                if (*(unsigned char *)(a2 + v74)) {
                  break;
                }
                if (v72 > 0xFFFFFFFFFFFFFFFBLL || v72 + 4 > v73) {
                  *(unsigned char *)(a2 + v74) = 1;
                }
                else {
                  *char v71 = v72 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0xCu:
              if (v18 != 2)
              {
                char v130 = 0;
                unsigned int v131 = 0;
                uint64_t v132 = 0;
                while (1)
                {
                  uint64_t v133 = *v3;
                  uint64_t v134 = *(void *)(a2 + v133);
                  unint64_t v135 = v134 + 1;
                  if (v134 == -1 || v135 > *(void *)(a2 + *v4)) {
                    goto LABEL_243;
                  }
                  char v136 = *(unsigned char *)(*(void *)(a2 + *v7) + v134);
                  *(void *)(a2 + v133) = v135;
                  v132 |= (unint64_t)(v136 & 0x7F) << v130;
                  if (v136 < 0)
                  {
                    v130 += 7;
                    BOOL v15 = v131++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_244;
                }
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v75 = 0;
                unsigned int v76 = 0;
                uint64_t v77 = 0;
                while (1)
                {
                  uint64_t v78 = *v3;
                  uint64_t v79 = *(void *)(a2 + v78);
                  unint64_t v80 = v79 + 1;
                  if (v79 == -1 || v80 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v81 = *(unsigned char *)(*(void *)(a2 + *v7) + v79);
                  *(void *)(a2 + v78) = v80;
                  v77 |= (unint64_t)(v81 & 0x7F) << v75;
                  if (v81 < 0)
                  {
                    v75 += 7;
                    BOOL v15 = v76++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_126;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_126:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 0xDu:
              char v82 = 0;
              unsigned int v83 = 0;
              uint64_t v22 = 0;
              *(unsigned char *)(a1 + 384) |= 2u;
              while (2)
              {
                uint64_t v84 = *v3;
                uint64_t v85 = *(void *)(a2 + v84);
                unint64_t v86 = v85 + 1;
                if (v85 == -1 || v86 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v87 = *(unsigned char *)(*(void *)(a2 + *v7) + v85);
                  *(void *)(a2 + v84) = v86;
                  v22 |= (unint64_t)(v87 & 0x7F) << v82;
                  if (v87 < 0)
                  {
                    v82 += 7;
                    BOOL v15 = v83++ >= 9;
                    if (v15)
                    {
                      uint64_t v22 = 0;
                      goto LABEL_208;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                uint64_t v22 = 0;
              }
LABEL_208:
              uint64_t v115 = 352;
LABEL_209:
              *(void *)(a1 + v115) = v22;
              goto LABEL_255;
            case 0xEu:
              if (v18 != 2)
              {
                char v137 = 0;
                unsigned int v138 = 0;
                uint64_t v139 = 0;
                while (1)
                {
                  uint64_t v140 = *v3;
                  uint64_t v141 = *(void *)(a2 + v140);
                  unint64_t v142 = v141 + 1;
                  if (v141 == -1 || v142 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v143 = *(unsigned char *)(*(void *)(a2 + *v7) + v141);
                  *(void *)(a2 + v140) = v142;
                  v139 |= (unint64_t)(v143 & 0x7F) << v137;
                  if (v143 < 0)
                  {
                    v137 += 7;
                    BOOL v15 = v138++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_244;
                }
LABEL_243:
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_244:
                PBRepeatedInt32Add();
                goto LABEL_255;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
              {
                char v88 = 0;
                unsigned int v89 = 0;
                uint64_t v90 = 0;
                while (1)
                {
                  uint64_t v91 = *v3;
                  uint64_t v92 = *(void *)(a2 + v91);
                  unint64_t v93 = v92 + 1;
                  if (v92 == -1 || v93 > *(void *)(a2 + *v4)) {
                    break;
                  }
                  char v94 = *(unsigned char *)(*(void *)(a2 + *v7) + v92);
                  *(void *)(a2 + v91) = v93;
                  v90 |= (unint64_t)(v94 & 0x7F) << v88;
                  if (v94 < 0)
                  {
                    v88 += 7;
                    BOOL v15 = v89++ >= 9;
                    if (!v15) {
                      continue;
                    }
                  }
                  goto LABEL_146;
                }
                *(unsigned char *)(a2 + *v5) = 1;
LABEL_146:
                PBRepeatedInt32Add();
              }
              goto LABEL_192;
            case 0xFu:
              if (v18 != 2) {
                goto LABEL_245;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                char v95 = (unint64_t *)(a2 + *v3);
                unint64_t v96 = *v95;
                unint64_t v97 = *(void *)(a2 + *v4);
                if (*v95 >= v97) {
                  break;
                }
                uint64_t v98 = *v5;
                if (*(unsigned char *)(a2 + v98)) {
                  break;
                }
                if (v96 > 0xFFFFFFFFFFFFFFFBLL || v96 + 4 > v97) {
                  *(unsigned char *)(a2 + v98) = 1;
                }
                else {
                  *char v95 = v96 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0x10u:
              if (v18 != 2) {
                goto LABEL_245;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                unint64_t v99 = (unint64_t *)(a2 + *v3);
                unint64_t v100 = *v99;
                unint64_t v101 = *(void *)(a2 + *v4);
                if (*v99 >= v101) {
                  break;
                }
                uint64_t v102 = *v5;
                if (*(unsigned char *)(a2 + v102)) {
                  break;
                }
                if (v100 > 0xFFFFFFFFFFFFFFFBLL || v100 + 4 > v101) {
                  *(unsigned char *)(a2 + v102) = 1;
                }
                else {
                  *unint64_t v99 = v100 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0x11u:
              if (v18 != 2)
              {
LABEL_245:
                uint64_t v144 = *v3;
                unint64_t v145 = *(void *)(a2 + v144);
                if (v145 <= 0xFFFFFFFFFFFFFFFBLL && v145 + 4 <= *(void *)(a2 + *v4)) {
                  *(void *)(a2 + v144) = v145 + 4;
                }
                else {
                  *(unsigned char *)(a2 + v16) = 1;
                }
                PBRepeatedFloatAdd();
                goto LABEL_255;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                uint64_t v103 = (unint64_t *)(a2 + *v3);
                unint64_t v104 = *v103;
                unint64_t v105 = *(void *)(a2 + *v4);
                if (*v103 >= v105) {
                  break;
                }
                uint64_t v106 = *v5;
                if (*(unsigned char *)(a2 + v106)) {
                  break;
                }
                if (v104 > 0xFFFFFFFFFFFFFFFBLL || v104 + 4 > v105) {
                  *(unsigned char *)(a2 + v106) = 1;
                }
                else {
                  *uint64_t v103 = v104 + 4;
                }
                PBRepeatedFloatAdd();
              }
              goto LABEL_192;
            case 0x12u:
              if (v18 != 2) {
                goto LABEL_250;
              }
              uint64_t result = PBReaderPlaceMark();
              if (!result) {
                return result;
              }
              while (1)
              {
                uint64_t v107 = (unint64_t *)(a2 + *v3);
                unint64_t v108 = *v107;
                unint64_t v109 = *(void *)(a2 + *v4);
                if (*v107 >= v109) {
                  break;
                }
                uint64_t v110 = *v5;
                if (*(unsigned char *)(a2 + v110)) {
                  break;
                }
                if (v108 > 0xFFFFFFFFFFFFFFF7 || v108 + 8 > v109) {
                  *(unsigned char *)(a2 + v110) = 1;
                }
                else {
                  *uint64_t v107 = v108 + 8;
                }
                PBRepeatedDoubleAdd();
              }
              goto LABEL_192;
            case 0x13u:
              if (v18 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (1)
                {
                  char v111 = (unint64_t *)(a2 + *v3);
                  unint64_t v112 = *v111;
                  unint64_t v113 = *(void *)(a2 + *v4);
                  if (*v111 >= v113) {
                    break;
                  }
                  uint64_t v114 = *v5;
                  if (*(unsigned char *)(a2 + v114)) {
                    break;
                  }
                  if (v112 > 0xFFFFFFFFFFFFFFF7 || v112 + 8 > v113) {
                    *(unsigned char *)(a2 + v114) = 1;
                  }
                  else {
                    *char v111 = v112 + 8;
                  }
                  PBRepeatedDoubleAdd();
                }
LABEL_192:
                PBReaderRecallMark();
              }
              else
              {
LABEL_250:
                uint64_t v146 = *v3;
                unint64_t v147 = *(void *)(a2 + v146);
                if (v147 <= 0xFFFFFFFFFFFFFFF7 && v147 + 8 <= *(void *)(a2 + *v4)) {
                  *(void *)(a2 + v146) = v147 + 8;
                }
                else {
                  *(unsigned char *)(a2 + v16) = 1;
                }
                PBRepeatedDoubleAdd();
              }
LABEL_255:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_255;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVLLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v19 = *v3;
        unint64_t v20 = *(void *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v21 = *(void *)(*(void *)(a2 + *v7) + v20);
          *(void *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v21 = 0;
        }
        *(void *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        int v18 = objc_alloc_init(CLPLOGENTRYVISIONSimdDoubleM);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONSimdDoubleMReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVLMatrixfMxNReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        int v18 = objc_alloc_init(CLPLOGENTRYVISIONVLVectorfM);
        [a1 addRows:v18];
        if (!PBReaderPlaceMark() || (CLPLOGENTRYVISIONVLVectorfMReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLOGENTRYVISIONVLVectorfMReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v6 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        uint64_t v11 = *(void *)(a2 + v10);
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        if (v8++ >= 9)
        {
          unint64_t v9 = 0;
          uint64_t v15 = *v5;
          int v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v15 = *v5;
      int v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(unsigned char *)(a2 + v15)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v17 = v9 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            unint64_t v20 = (unint64_t *)(a2 + *v3);
            unint64_t v21 = *v20;
            unint64_t v22 = *(void *)(a2 + *v4);
            if (*v20 >= v22) {
              break;
            }
            uint64_t v23 = *v5;
            if (*(unsigned char *)(a2 + v23)) {
              break;
            }
            if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22) {
              *(unsigned char *)(a2 + v23) = 1;
            }
            else {
              *unint64_t v20 = v21 + 4;
            }
            PBRepeatedFloatAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v24) = v25 + 4;
          }
          else {
            *(unsigned char *)(a2 + v15) = 1;
          }
          PBRepeatedFloatAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPSatelliteReportReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  char v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        int v18 = objc_alloc_init(CLPSatelliteInfo);
        uint64_t v19 = 24;
        goto LABEL_25;
      case 2u:
        int v18 = objc_alloc_init(CLPSatelliteInfo);
        uint64_t v19 = 16;
        goto LABEL_25;
      case 3u:
        int v18 = objc_alloc_init(CLPSatelliteInfo);
        uint64_t v19 = 32;
        goto LABEL_25;
      case 4u:
        int v18 = objc_alloc_init(CLPSatelliteInfo);
        uint64_t v19 = 8;
LABEL_25:
        objc_storeStrong((id *)(a1 + v19), v18);
        if PBReaderPlaceMark() && (CLPSatelliteInfoReadFrom((uint64_t)v18, a2))
        {
          PBReaderRecallMark();

LABEL_28:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_28;
    }
  }
}

uint64_t CLPPipelineDiagnosticReportReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v15 = v9++ >= 9;
          if (v15)
          {
            unint64_t v10 = 0;
            uint64_t v16 = *v5;
            int v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(unsigned char *)(a2 + v16)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v20 = 0;
              unsigned int v21 = 0;
              uint64_t v22 = 0;
              *(_WORD *)(a1 + 124) |= 0x1000u;
              while (1)
              {
                uint64_t v23 = *v3;
                uint64_t v24 = *(void *)(a2 + v23);
                unint64_t v25 = v24 + 1;
                if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
                  break;
                }
                char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v25;
                v22 |= (unint64_t)(v26 & 0x7F) << v20;
                if ((v26 & 0x80) == 0) {
                  goto LABEL_82;
                }
                v20 += 7;
                BOOL v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_84;
                }
              }
              *(unsigned char *)(a2 + *v5) = 1;
LABEL_82:
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v22) = 0;
              }
LABEL_84:
              uint64_t v64 = 120;
              goto LABEL_93;
            case 2u:
              *(_WORD *)(a1 + 124) |= 0x100u;
              uint64_t v27 = *v3;
              unint64_t v28 = *(void *)(a2 + v27);
              if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v28);
                *(void *)(a2 + v27) = v28 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 96;
              goto LABEL_118;
            case 3u:
              *(_WORD *)(a1 + 124) |= 1u;
              uint64_t v30 = *v3;
              unint64_t v31 = *(void *)(a2 + v30);
              if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v31);
                *(void *)(a2 + v30) = v31 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 32;
              goto LABEL_118;
            case 4u:
              *(_WORD *)(a1 + 124) |= 0x200u;
              uint64_t v32 = *v3;
              unint64_t v33 = *(void *)(a2 + v32);
              if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v33);
                *(void *)(a2 + v32) = v33 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 104;
              goto LABEL_118;
            case 5u:
              *(_WORD *)(a1 + 124) |= 2u;
              uint64_t v34 = *v3;
              unint64_t v35 = *(void *)(a2 + v34);
              if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v35);
                *(void *)(a2 + v34) = v35 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 40;
              goto LABEL_118;
            case 6u:
              *(_WORD *)(a1 + 124) |= 0x80u;
              uint64_t v36 = *v3;
              unint64_t v37 = *(void *)(a2 + v36);
              if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v37);
                *(void *)(a2 + v36) = v37 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 88;
              goto LABEL_118;
            case 7u:
              *(_WORD *)(a1 + 124) |= 0x40u;
              uint64_t v38 = *v3;
              unint64_t v39 = *(void *)(a2 + v38);
              if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v39);
                *(void *)(a2 + v38) = v39 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 80;
              goto LABEL_118;
            case 8u:
              if (v18 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (1)
                {
                  unint64_t v40 = (unint64_t *)(a2 + *v3);
                  unint64_t v41 = *v40;
                  unint64_t v42 = *(void *)(a2 + *v4);
                  if (*v40 >= v42) {
                    break;
                  }
                  uint64_t v43 = *v5;
                  if (*(unsigned char *)(a2 + v43)) {
                    break;
                  }
                  if (v41 > 0xFFFFFFFFFFFFFFF7 || v41 + 8 > v42) {
                    *(unsigned char *)(a2 + v43) = 1;
                  }
                  else {
                    unint64_t *v40 = v41 + 8;
                  }
                  PBRepeatedDoubleAdd();
                }
                PBReaderRecallMark();
              }
              else
              {
                uint64_t v65 = *v3;
                unint64_t v66 = *(void *)(a2 + v65);
                if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(void *)(a2 + *v4)) {
                  *(void *)(a2 + v65) = v66 + 8;
                }
                else {
                  *(unsigned char *)(a2 + v16) = 1;
                }
                PBRepeatedDoubleAdd();
              }
LABEL_119:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            case 9u:
              *(_WORD *)(a1 + 124) |= 0x10u;
              uint64_t v44 = *v3;
              unint64_t v45 = *(void *)(a2 + v44);
              if (v45 <= 0xFFFFFFFFFFFFFFF7 && v45 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v45);
                *(void *)(a2 + v44) = v45 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 64;
              goto LABEL_118;
            case 0xAu:
              *(_WORD *)(a1 + 124) |= 0x20u;
              uint64_t v46 = *v3;
              unint64_t v47 = *(void *)(a2 + v46);
              if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v47);
                *(void *)(a2 + v46) = v47 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 72;
              goto LABEL_118;
            case 0xBu:
              *(_WORD *)(a1 + 124) |= 8u;
              uint64_t v48 = *v3;
              unint64_t v49 = *(void *)(a2 + v48);
              if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v49);
                *(void *)(a2 + v48) = v49 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 56;
              goto LABEL_118;
            case 0xCu:
              *(_WORD *)(a1 + 124) |= 4u;
              uint64_t v50 = *v3;
              unint64_t v51 = *(void *)(a2 + v50);
              if (v51 <= 0xFFFFFFFFFFFFFFF7 && v51 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v29 = *(void *)(*(void *)(a2 + *v7) + v51);
                *(void *)(a2 + v50) = v51 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v29 = 0;
              }
              uint64_t v67 = 48;
LABEL_118:
              *(void *)(a1 + v67) = v29;
              goto LABEL_119;
            case 0xDu:
              char v52 = 0;
              unsigned int v53 = 0;
              uint64_t v22 = 0;
              *(_WORD *)(a1 + 124) |= 0x400u;
              while (2)
              {
                uint64_t v54 = *v3;
                uint64_t v55 = *(void *)(a2 + v54);
                unint64_t v56 = v55 + 1;
                if (v55 == -1 || v56 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v57 = *(unsigned char *)(*(void *)(a2 + *v7) + v55);
                  *(void *)(a2 + v54) = v56;
                  v22 |= (unint64_t)(v57 & 0x7F) << v52;
                  if (v57 < 0)
                  {
                    v52 += 7;
                    BOOL v15 = v53++ >= 9;
                    if (v15)
                    {
                      LODWORD(v22) = 0;
                      goto LABEL_88;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v22) = 0;
              }
LABEL_88:
              uint64_t v64 = 112;
              goto LABEL_93;
            case 0xEu:
              char v58 = 0;
              unsigned int v59 = 0;
              uint64_t v22 = 0;
              *(_WORD *)(a1 + 124) |= 0x800u;
              while (2)
              {
                uint64_t v60 = *v3;
                uint64_t v61 = *(void *)(a2 + v60);
                unint64_t v62 = v61 + 1;
                if (v61 == -1 || v62 > *(void *)(a2 + *v4))
                {
                  *(unsigned char *)(a2 + *v5) = 1;
                }
                else
                {
                  char v63 = *(unsigned char *)(*(void *)(a2 + *v7) + v61);
                  *(void *)(a2 + v60) = v62;
                  v22 |= (unint64_t)(v63 & 0x7F) << v58;
                  if (v63 < 0)
                  {
                    v58 += 7;
                    BOOL v15 = v59++ >= 9;
                    if (v15)
                    {
                      LODWORD(v22) = 0;
                      goto LABEL_92;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(unsigned char *)(a2 + *v5)) {
                LODWORD(v22) = 0;
              }
LABEL_92:
              uint64_t v64 = 116;
LABEL_93:
              *(_DWORD *)(a1 + v64) = v22;
              goto LABEL_119;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_119;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLocationProcessingMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_29;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPVehicleTypeReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_29;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_31;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_29:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_31:
        *(unsigned char *)(a1 + 8) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLocationCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  char v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 56), v18);
        if PBReaderPlaceMark() && (CLPMetaReadFrom((uint64_t)v18, a2)) {
          goto LABEL_60;
        }
        goto LABEL_77;
      case 2u:
        char v18 = objc_alloc_init(CLPLocation);
        [(id)a1 addLocation:v18];
        goto LABEL_55;
      case 3u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 24;
        goto LABEL_27;
      case 4u:
        uint64_t v20 = PBReaderReadString();
        uint64_t v21 = 88;
LABEL_27:
        uint64_t v22 = *(void **)(a1 + v21);
        *(void *)(a1 + v21) = v20;

        goto LABEL_75;
      case 5u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 96) |= 4u;
        while (2)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
            *(void *)(a2 + v26) = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v15 = v24++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_65:
        uint64_t v42 = 80;
        goto LABEL_74;
      case 6u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 96) |= 1u;
        while (2)
        {
          uint64_t v32 = *v3;
          uint64_t v33 = *(void *)(a2 + v32);
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v34;
            v25 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v15 = v31++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_69;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_69:
        uint64_t v42 = 48;
        goto LABEL_74;
      case 7u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + 96) |= 2u;
        while (2)
        {
          uint64_t v38 = *v3;
          uint64_t v39 = *(void *)(a2 + v38);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
            *(void *)(a2 + v38) = v40;
            v25 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              BOOL v15 = v37++ >= 9;
              if (v15)
              {
                LODWORD(v25) = 0;
                goto LABEL_73;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_73:
        uint64_t v42 = 64;
LABEL_74:
        *(_DWORD *)(a1 + v42) = v25;
        goto LABEL_75;
      case 8u:
        PBReaderReadString();
        char v18 = (CLPMeta *)objc_claimAutoreleasedReturnValue();
        if (v18) {
          [(id)a1 addAppBundleIds:v18];
        }
        goto LABEL_61;
      case 9u:
        char v18 = objc_alloc_init(CLPAccessoryMeta);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || !CLPAccessoryMetaReadFrom((uint64_t)v18, a2)) {
          goto LABEL_77;
        }
        goto LABEL_60;
      case 0xAu:
        char v18 = objc_alloc_init(CLPLocation);
        [(id)a1 addAccessoryLocation:v18];
LABEL_55:
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_77;
        }
        goto LABEL_60;
      case 0xBu:
        char v18 = objc_alloc_init(CLPLocationProcessingPipelineMetadata);
        objc_storeStrong((id *)(a1 + 72), v18);
        if (PBReaderPlaceMark() && CLPLocationProcessingPipelineMetadataReadFrom((uint64_t)v18, a2))
        {
LABEL_60:
          PBReaderRecallMark();
LABEL_61:

LABEL_75:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_77:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_75;
    }
  }
}

BOOL CLPLocationProcessingPipelineMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v18 = objc_alloc_init(CLPPrivacySanitization);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (CLPPrivacySanitizationReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v18 = objc_alloc_init(CLPConsolidation);
    objc_storeStrong((id *)(a1 + 8), v18);
    if (!PBReaderPlaceMark() || (CLPConsolidationReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLocationCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLocationConsumptionScoreInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(unsigned char *)(a1 + 36) |= 1u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v33 = 8;
          goto LABEL_43;
        case 2u:
          *(unsigned char *)(a1 + 36) |= 2u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v33 = 16;
LABEL_43:
          *(void *)(a1 + v33) = v20;
          continue;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v24;

          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v3;
        uint64_t v30 = *(void *)(a2 + v29);
        unint64_t v31 = v30 + 1;
        if (v30 == -1 || v31 > *(void *)(a2 + *v4)) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
        *(void *)(a2 + v29) = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0) {
          goto LABEL_36;
        }
        v26 += 7;
        BOOL v15 = v27++ >= 9;
        if (v15)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_36:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v28) = 0;
      }
LABEL_38:
      *(_DWORD *)(a1 + 32) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPLocationConsumptionScoreInfoRequestReadFrom(void *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v18 = objc_alloc_init(CLPLocationConsumptionScoreInfo);
        [a1 addLocationConsumptionScoreInfo:v18];
        if (!PBReaderPlaceMark() || (CLPLocationConsumptionScoreInfoReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPPrivacySanitizationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        char v26 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPRegulatoryDomainEstimateReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          uint64_t v24 = *(void *)(a2 + v23);
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0) {
            goto LABEL_31;
          }
          v20 += 7;
          BOOL v15 = v21++ >= 9;
          if (v15)
          {
            uint64_t v22 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v22 != 0;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v18 = PBReaderReadString();
        unsigned int v19 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v18;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPPassCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v18 == 2)
      {
        unsigned int v19 = objc_alloc_init(CLPPassLocation);
        [(id)a1 addPassLocation:v19];
        if (!PBReaderPlaceMark() || (CLPPassLocationReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_33:

          return 0;
        }
LABEL_27:
        PBReaderRecallMark();
LABEL_28:

        goto LABEL_30;
      }
      if (v18 == 1)
      {
        unsigned int v19 = objc_alloc_init(CLPMeta);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v20 = PBReaderReadData();
    unsigned int v19 = *(CLPPassLocation **)(a1 + 24);
    *(void *)(a1 + 24) = v20;
    goto LABEL_28;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPPassLocationReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  char v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      uint64_t v12 = *(void *)(a2 + v11);
      unint64_t v13 = v12 + 1;
      if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
        break;
      }
      char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v15 = v9++ >= 9;
      if (v15)
      {
        unint64_t v10 = 0;
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v16 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v18 = PBReaderReadString();
        unsigned int v19 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v18;

        goto LABEL_56;
      case 2u:
        PBReaderReadString();
        unsigned int v21 = (CLPLocation *)objc_claimAutoreleasedReturnValue();
        if (v21) {
          [(id)a1 addAssociatedStoreId:v21];
        }
        goto LABEL_37;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        while (2)
        {
          uint64_t v25 = *v3;
          uint64_t v26 = *(void *)(a2 + v25);
          unint64_t v27 = v26 + 1;
          if (v26 == -1 || v27 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v26);
            *(void *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              BOOL v15 = v23++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_48:
        uint64_t v38 = 32;
        goto LABEL_53;
      case 4u:
        *(unsigned char *)(a1 + 52) |= 1u;
        uint64_t v29 = *v3;
        unint64_t v30 = *(void *)(a2 + v29);
        if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v30);
          *(void *)(a2 + v29) = v30 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v31 = 0;
        }
        *(void *)(a1 + 8) = v31;
        goto LABEL_56;
      case 5u:
        unsigned int v21 = objc_alloc_init(CLPLocation);
        objc_storeStrong((id *)(a1 + 24), v21);
        if PBReaderPlaceMark() && (CLPLocationReadFrom((uint64_t)v21, a2))
        {
          PBReaderRecallMark();
LABEL_37:

LABEL_56:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      case 6u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v24 = 0;
        *(unsigned char *)(a1 + 52) |= 2u;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v36;
            v24 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v15 = v33++ >= 9;
              if (v15)
              {
                LODWORD(v24) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v24) = 0;
        }
LABEL_52:
        uint64_t v38 = 48;
LABEL_53:
        *(_DWORD *)(a1 + v38) = v24;
        goto LABEL_56;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_56;
    }
  }
}

uint64_t CLPPassCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPPoiCollectionRequestReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 2, v18);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v18 = objc_alloc_init(CLPPoiHarvest);
    [a1 addHarvests:v18];
    if (!PBReaderPlaceMark() || !CLPPoiHarvestReadFrom((id *)&v18->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPPoiHarvestReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unsigned int v19 = objc_alloc_init(CLPPoiWifiAccessPoint);
        [a1 addAccessPoints:v19];
        if (!PBReaderPlaceMark() || (CLPPoiWifiAccessPointReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v18 == 2) {
        break;
      }
      if (v18 == 1)
      {
        unsigned int v19 = objc_alloc_init(CLPPoiTriggerEvent);
        objc_storeStrong(a1 + 3, v19);
        if (!PBReaderPlaceMark() || (CLPPoiTriggerEventReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unsigned int v19 = objc_alloc_init(CLPLocation);
    [a1 addLocations:v19];
    if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v19, a2) & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPPoiCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPPoiTriggerEventReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_53;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              uint64_t v20 = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v20 = 0;
          }
LABEL_55:
          *(void *)(a1 + 8) = v20;
          continue;
        case 2u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 2u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v28) = 0;
          }
LABEL_59:
          uint64_t v48 = 24;
          goto LABEL_68;
        case 3u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 8u;
          while (2)
          {
            uint64_t v35 = *v3;
            uint64_t v36 = *(void *)(a2 + v35);
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v37;
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v15 = v34++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v28) = 0;
          }
LABEL_63:
          uint64_t v48 = 32;
          goto LABEL_68;
        case 4u:
          *(unsigned char *)(a1 + 36) |= 1u;
          uint64_t v39 = *v3;
          unint64_t v40 = *(void *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v41 = *(void *)(*(void *)(a2 + *v7) + v40);
            *(void *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v41 = 0;
          }
          *(void *)(a1 + 16) = v41;
          continue;
        case 5u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v28 = 0;
          *(unsigned char *)(a1 + 36) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v44 = *v3;
        uint64_t v45 = *(void *)(a2 + v44);
        unint64_t v46 = v45 + 1;
        if (v45 == -1 || v46 > *(void *)(a2 + *v4)) {
          break;
        }
        char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
        *(void *)(a2 + v44) = v46;
        v28 |= (unint64_t)(v47 & 0x7F) << v42;
        if ((v47 & 0x80) == 0) {
          goto LABEL_65;
        }
        v42 += 7;
        BOOL v15 = v43++ >= 9;
        if (v15)
        {
          LODWORD(v28) = 0;
          goto LABEL_67;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_65:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v28) = 0;
      }
LABEL_67:
      uint64_t v48 = 28;
LABEL_68:
      *(_DWORD *)(a1 + v48) = v28;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPPoiWifiAccessPointReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          unsigned int v19 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v18;

          continue;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v24 = *v3;
            uint64_t v25 = *(void *)(a2 + v24);
            unint64_t v26 = v25 + 1;
            if (v25 == -1 || v26 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
              *(void *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v23) = 0;
          }
LABEL_45:
          uint64_t v39 = 40;
          goto LABEL_50;
        case 3u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v23 = 0;
          break;
        case 4u:
          *(unsigned char *)(a1 + 44) |= 1u;
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v35);
            *(void *)(a2 + v34) = v35 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v40 = 8;
          goto LABEL_55;
        case 5u:
          *(unsigned char *)(a1 + 44) |= 2u;
          uint64_t v37 = *v3;
          unint64_t v38 = *(void *)(a2 + v37);
          if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v36 = *(void *)(*(void *)(a2 + *v7) + v38);
            *(void *)(a2 + v37) = v38 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v36 = 0;
          }
          uint64_t v40 = 16;
LABEL_55:
          *(void *)(a1 + v40) = v36;
          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v30 = *v3;
        uint64_t v31 = *(void *)(a2 + v30);
        unint64_t v32 = v31 + 1;
        if (v31 == -1 || v32 > *(void *)(a2 + *v4)) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
        *(void *)(a2 + v30) = v32;
        v23 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0) {
          goto LABEL_47;
        }
        v28 += 7;
        BOOL v15 = v29++ >= 9;
        if (v15)
        {
          LODWORD(v23) = 0;
          goto LABEL_49;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_47:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v23) = 0;
      }
LABEL_49:
      uint64_t v39 = 24;
LABEL_50:
      *(_DWORD *)(a1 + v39) = v23;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPPressureReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v5;
          int v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v16 = *v5;
      int v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(unsigned char *)(a2 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v17 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v19 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v22 = 0;
        }
        char v27 = &OBJC_IVAR___CLPPressure__std;
        goto LABEL_38;
      }
      if (v19 == 2) {
        break;
      }
      if (v19 == 1)
      {
        uint64_t v20 = *v3;
        unint64_t v21 = *(void *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + v16) = 1;
          uint64_t v22 = 0;
        }
        char v27 = &OBJC_IVAR___CLPPressure__timestamp;
LABEL_38:
        *(void *)(a1 + *v27) = v22;
        goto LABEL_39;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_39:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v25 = *v3;
    unint64_t v26 = *(void *)(a2 + v25);
    if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v26);
      *(void *)(a2 + v25) = v26 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + v16) = 1;
      uint64_t v22 = 0;
    }
    char v27 = &OBJC_IVAR___CLPPressure__value;
    goto LABEL_38;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPPressureCollectionRequestReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        unint64_t v19 = objc_alloc_init(CLPLocation);
        objc_storeStrong(a1 + 3, v19);
        if (!PBReaderPlaceMark() || (CLPLocationReadFrom((uint64_t)v19, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v18 == 2) {
        break;
      }
      if (v18 == 1)
      {
        unint64_t v19 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 1, v19);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0) {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v19 = objc_alloc_init(CLPPressure);
    objc_storeStrong(a1 + 2, v19);
    if (!PBReaderPlaceMark() || !CLPPressureReadFrom((uint64_t)v19, a2)) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPPressureCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        unint64_t v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPRTVisitReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        *(unsigned char *)(a1 + 24) |= 1u;
        uint64_t v18 = *v3;
        unint64_t v19 = *(void *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
          *(void *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v20 = 0;
        }
        unint64_t v23 = &OBJC_IVAR___CLPRTVisit__entryTime;
LABEL_32:
        *(void *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_33:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    *(unsigned char *)(a1 + 24) |= 2u;
    uint64_t v21 = *v3;
    unint64_t v22 = *(void *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
    {
      uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v22);
      *(void *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(unsigned char *)(a2 + *v5) = 1;
      uint64_t v20 = 0;
    }
    unint64_t v23 = &OBJC_IVAR___CLPRTVisit__exitTime;
    goto LABEL_32;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPSatelliteInfoReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  v6 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v7 = 0;
    unsigned int v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = *v3;
      uint64_t v11 = *(void *)(a2 + v10);
      unint64_t v12 = v11 + 1;
      if (v11 == -1 || v12 > *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
      *(void *)(a2 + v10) = v12;
      v9 |= (unint64_t)(v13 & 0x7F) << v7;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v7 += 7;
      BOOL v14 = v8++ >= 9;
      if (v14)
      {
        unint64_t v9 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v9 = 0;
    }
LABEL_14:
    int v16 = v9 & 7;
    if (v15 || v16 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v9 >> 3))
    {
      case 1u:
        if (v16 != 2)
        {
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v63 = 0;
          do
          {
            uint64_t v64 = *v3;
            uint64_t v65 = *(void *)(a2 + v64);
            unint64_t v66 = v65 + 1;
            if (v65 == -1 || v66 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
              break;
            }
            char v67 = *(unsigned char *)(*(void *)(a2 + *v6) + v65);
            *(void *)(a2 + v64) = v66;
            v63 |= (unint64_t)(v67 & 0x7F) << v61;
            if ((v67 & 0x80) == 0) {
              break;
            }
            v61 += 7;
            BOOL v14 = v62++ >= 9;
          }
          while (!v14);
LABEL_127:
          PBRepeatedInt32Add();
LABEL_128:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
        uint64_t result = PBReaderPlaceMark();
        if (result)
        {
          while (1)
          {
            if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4) || *(unsigned char *)(a2 + *v5)) {
              goto LABEL_86;
            }
            char v19 = 0;
            unsigned int v20 = 0;
            uint64_t v21 = 0;
            while (1)
            {
              uint64_t v22 = *v3;
              uint64_t v23 = *(void *)(a2 + v22);
              unint64_t v24 = v23 + 1;
              if (v23 == -1 || v24 > *(void *)(a2 + *v4)) {
                break;
              }
              char v25 = *(unsigned char *)(*(void *)(a2 + *v6) + v23);
              *(void *)(a2 + v22) = v24;
              v21 |= (unint64_t)(v25 & 0x7F) << v19;
              if (v25 < 0)
              {
                v19 += 7;
                BOOL v14 = v20++ >= 9;
                if (!v14) {
                  continue;
                }
              }
              goto LABEL_31;
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt32Add();
          }
        }
        return result;
      case 2u:
        if (v16 != 2)
        {
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v70 = 0;
          while (1)
          {
            uint64_t v71 = *v3;
            uint64_t v72 = *(void *)(a2 + v71);
            unint64_t v73 = v72 + 1;
            if (v72 == -1 || v73 > *(void *)(a2 + *v4)) {
              goto LABEL_122;
            }
            char v74 = *(unsigned char *)(*(void *)(a2 + *v6) + v72);
            *(void *)(a2 + v71) = v73;
            v70 |= (unint64_t)(v74 & 0x7F) << v68;
            if (v74 < 0)
            {
              v68 += 7;
              BOOL v14 = v69++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_127;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v35 = 0;
          while (1)
          {
            uint64_t v36 = *v3;
            uint64_t v37 = *(void *)(a2 + v36);
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)(a2 + *v4)) {
              break;
            }
            char v39 = *(unsigned char *)(*(void *)(a2 + *v6) + v37);
            *(void *)(a2 + v36) = v38;
            v35 |= (unint64_t)(v39 & 0x7F) << v33;
            if (v39 < 0)
            {
              v33 += 7;
              BOOL v14 = v34++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_59;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_59:
          PBRepeatedInt32Add();
        }
        goto LABEL_86;
      case 3u:
        if (v16 != 2)
        {
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v77 = 0;
          while (1)
          {
            uint64_t v78 = *v3;
            uint64_t v79 = *(void *)(a2 + v78);
            unint64_t v80 = v79 + 1;
            if (v79 == -1 || v80 > *(void *)(a2 + *v4)) {
              goto LABEL_122;
            }
            char v81 = *(unsigned char *)(*(void *)(a2 + *v6) + v79);
            *(void *)(a2 + v78) = v80;
            v77 |= (unint64_t)(v81 & 0x7F) << v75;
            if (v81 < 0)
            {
              v75 += 7;
              BOOL v14 = v76++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_127;
          }
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          while (1)
          {
            uint64_t v43 = *v3;
            uint64_t v44 = *(void *)(a2 + v43);
            unint64_t v45 = v44 + 1;
            if (v44 == -1 || v45 > *(void *)(a2 + *v4)) {
              break;
            }
            char v46 = *(unsigned char *)(*(void *)(a2 + *v6) + v44);
            *(void *)(a2 + v43) = v45;
            v42 |= (unint64_t)(v46 & 0x7F) << v40;
            if (v46 < 0)
            {
              v40 += 7;
              BOOL v14 = v41++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_72;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_72:
          PBRepeatedInt32Add();
        }
        goto LABEL_86;
      case 4u:
        if (v16 != 2)
        {
          char v82 = 0;
          unsigned int v83 = 0;
          uint64_t v84 = 0;
          while (1)
          {
            uint64_t v85 = *v3;
            uint64_t v86 = *(void *)(a2 + v85);
            unint64_t v87 = v86 + 1;
            if (v86 == -1 || v87 > *(void *)(a2 + *v4)) {
              break;
            }
            char v88 = *(unsigned char *)(*(void *)(a2 + *v6) + v86);
            *(void *)(a2 + v85) = v87;
            v84 |= (unint64_t)(v88 & 0x7F) << v82;
            if (v88 < 0)
            {
              v82 += 7;
              BOOL v14 = v83++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_127;
          }
LABEL_122:
          *(unsigned char *)(a2 + *v5) = 1;
          goto LABEL_127;
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v47 = 0;
          unsigned int v48 = 0;
          uint64_t v49 = 0;
          while (1)
          {
            uint64_t v50 = *v3;
            uint64_t v51 = *(void *)(a2 + v50);
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)(a2 + *v4)) {
              break;
            }
            char v53 = *(unsigned char *)(*(void *)(a2 + *v6) + v51);
            *(void *)(a2 + v50) = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              BOOL v14 = v48++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_85;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_85:
          PBRepeatedInt32Add();
        }
LABEL_86:
        PBReaderRecallMark();
        goto LABEL_128;
      case 5u:
        if (v16 != 2)
        {
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0;
          while (1)
          {
            uint64_t v57 = *v3;
            uint64_t v58 = *(void *)(a2 + v57);
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)(a2 + *v4)) {
              break;
            }
            char v60 = *(unsigned char *)(*(void *)(a2 + *v6) + v58);
            *(void *)(a2 + v57) = v59;
            v56 |= (unint64_t)(v60 & 0x7F) << v54;
            if (v60 < 0)
            {
              v54 += 7;
              BOOL v14 = v55++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_125;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_125:
          PBRepeatedBOOLAdd();
          goto LABEL_128;
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4) && !*(unsigned char *)(a2 + *v5))
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          while (1)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4)) {
              break;
            }
            char v32 = *(unsigned char *)(*(void *)(a2 + *v6) + v30);
            *(void *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              BOOL v14 = v27++ >= 9;
              if (!v14) {
                continue;
              }
            }
            goto LABEL_44;
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_44:
          PBRepeatedBOOLAdd();
        }
        goto LABEL_86;
      default:
        if (PBReaderSkipValueWithTag()) {
          goto LABEL_128;
        }
        return 0;
    }
  }
}

uint64_t CLPTraceCollectionRequestReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v23 = *v3;
          uint64_t v24 = *(void *)(a2 + v23);
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)(a2 + *v4)) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
          *(void *)(a2 + v23) = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0) {
            goto LABEL_37;
          }
          v20 += 7;
          BOOL v15 = v21++ >= 9;
          if (v15)
          {
            LODWORD(v22) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v22) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else
      {
        if (v18 == 2)
        {
          char v19 = objc_alloc_init(CLPIndoorEvent);
          [(id)a1 addEvents:v19];
          if (!PBReaderPlaceMark() || (CLPIndoorEventReadFrom((uint64_t)v19, a2) & 1) == 0)
          {
LABEL_42:

            return 0;
          }
        }
        else
        {
          if (v18 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v19 = objc_alloc_init(CLPMeta);
          objc_storeStrong((id *)(a1 + 16), v19);
          if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v19, a2) & 1) == 0) {
            goto LABEL_42;
          }
        }
        PBReaderRecallMark();
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPTraceCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        char v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL CLPWtwCollectionRequestReadFrom(id *a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v18 = objc_alloc_init(CLPMeta);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || (CLPMetaReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v18 = objc_alloc_init(CLPWifiAPLocation);
    [a1 addWtwLocation:v18];
    if (!PBReaderPlaceMark() || (CLPWifiAPLocationReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t CLPWtwCollectionResponseReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    char v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v25 = PBReaderReadString();
        char v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          uint64_t v22 = *(void *)(a2 + v21);
          unint64_t v23 = v22 + 1;
          if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v18 += 7;
          BOOL v15 = v19++ >= 9;
          if (v15)
          {
            uint64_t v20 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v20 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteSint32Field()
{
  return MEMORY[0x1F4147210]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedBOOLAdd()
{
  return MEMORY[0x1F41472B8]();
}

uint64_t PBRepeatedBOOLClear()
{
  return MEMORY[0x1F41472C0]();
}

uint64_t PBRepeatedBOOLCopy()
{
  return MEMORY[0x1F41472C8]();
}

uint64_t PBRepeatedBOOLHash()
{
  return MEMORY[0x1F41472D0]();
}

uint64_t PBRepeatedBOOLIsEqual()
{
  return MEMORY[0x1F41472D8]();
}

uint64_t PBRepeatedBOOLNSArray()
{
  return MEMORY[0x1F41472E0]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1F41472F0]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1F41472F8]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1F4147300]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1F4147308]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1F4147310]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1F4147318]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1F4147328]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1F4147330]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1F4147338]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1F4147340]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1F4147348]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1F4147350]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1F4147360]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1F4147368]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1F4147370]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1F4147378]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1F4147380]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x1F4147388]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}