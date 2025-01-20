@interface ETMessageHeaderReader
+ (double)sendTimeInArchive:(id)a3;
+ (id)identifierInArchive:(id)a3;
+ (unsigned)messageTypeInArchive:(id)a3;
+ (void)getSendTime:(double *)a3 type:(unsigned __int16 *)a4 inArchive:(id)a5;
@end

@implementation ETMessageHeaderReader

+ (id)identifierInArchive:(id)a3
{
  id v3 = a3;
  v4 = (unsigned char *)[objc_alloc(MEMORY[0x263F62228]) initWithData:v3];
  v5 = (int *)MEMORY[0x263F62298];
  v6 = (int *)MEMORY[0x263F62288];
  if (*(void *)&v4[*MEMORY[0x263F62298]] < *(void *)&v4[*MEMORY[0x263F62288]])
  {
    v7 = (int *)MEMORY[0x263F62270];
    v8 = (int *)MEMORY[0x263F62268];
    do
    {
      if (v4[*v7]) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v5;
        uint64_t v13 = *(void *)&v4[v12];
        unint64_t v14 = v13 + 1;
        if (v13 == -1 || v14 > *(void *)&v4[*v6]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
        *(void *)&v4[v12] = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          LODWORD(v11) = 0;
          int v17 = v4[*v7];
          goto LABEL_14;
        }
      }
      v4[*v7] = 1;
LABEL_12:
      int v17 = v4[*v7];
      if (v4[*v7]) {
        LODWORD(v11) = 0;
      }
LABEL_14:
      if (v17 || (v11 & 7) == 4) {
        break;
      }
      if ((v11 & 0x7FFF8) == 0x28)
      {
        v19 = PBReaderReadString();
        v20 = v19;
        if (!v4[*v7]) {
          goto LABEL_24;
        }
      }
      else if (!PBReaderSkipValueWithTag())
      {
        break;
      }
    }
    while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
  }
  v20 = 0;
LABEL_24:

  return v20;
}

+ (unsigned)messageTypeInArchive:(id)a3
{
  id v3 = a3;
  v4 = (unsigned char *)[objc_alloc(MEMORY[0x263F62228]) initWithData:v3];
  v5 = (int *)MEMORY[0x263F62298];
  v6 = (int *)MEMORY[0x263F62288];
  if (*(void *)&v4[*MEMORY[0x263F62298]] < *(void *)&v4[*MEMORY[0x263F62288]])
  {
    v7 = (int *)MEMORY[0x263F62270];
    LODWORD(v8) = *MEMORY[0x263F62270];
    char v9 = (int *)MEMORY[0x263F62268];
    do
    {
      if (v4[(int)v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v5;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v6]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_12;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          LODWORD(v12) = 0;
          int v18 = v4[*v7];
          goto LABEL_14;
        }
      }
      v4[*v7] = 1;
LABEL_12:
      int v18 = v4[*v7];
      if (v4[*v7]) {
        LODWORD(v12) = 0;
      }
LABEL_14:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      if ((v12 & 0x7FFF8) == 8)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        while (1)
        {
          uint64_t v23 = *v5;
          uint64_t v24 = *(void *)&v4[v23];
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)&v4[*v6]) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
          *(void *)&v4[v23] = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0) {
            goto LABEL_29;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            uint64_t v8 = *v7;
            int v27 = v4[v8];
            goto LABEL_31;
          }
        }
        v4[*v7] = 1;
LABEL_29:
        uint64_t v8 = *v7;
        int v27 = v4[v8];
        if (v4[v8]) {
          LODWORD(v22) = 0;
        }
LABEL_31:
        if (!v27)
        {
          unsigned int v30 = v22 - 1;
          if (v30 >= 6) {
            break;
          }
          unsigned __int16 v28 = word_23B58D828[v30];
          goto LABEL_34;
        }
      }
      else
      {
        if (!PBReaderSkipValueWithTag())
        {
          unsigned __int16 v28 = 0;
          goto LABEL_34;
        }
        LODWORD(v8) = *v7;
      }
    }
    while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
  }
  unsigned __int16 v28 = -1;
LABEL_34:

  return v28;
}

+ (void)getSendTime:(double *)a3 type:(unsigned __int16 *)a4 inArchive:(id)a5
{
  id v39 = a5;
  *a4 = -1;
  *a3 = 0.0;
  v7 = (unsigned char *)[objc_alloc(MEMORY[0x263F62228]) initWithData:v39];
  char v8 = 0;
  char v9 = 0;
  char v10 = (int *)MEMORY[0x263F62298];
  unsigned int v11 = (int *)MEMORY[0x263F62288];
  uint64_t v12 = (int *)MEMORY[0x263F62270];
  uint64_t v13 = (int *)MEMORY[0x263F62268];
  while (*(void *)&v7[*v10] < *(void *)&v7[*v11] && !v7[*v12])
  {
    char v14 = 0;
    unsigned int v15 = 0;
    uint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = *v10;
      uint64_t v18 = *(void *)&v7[v17];
      unint64_t v19 = v18 + 1;
      if (v18 == -1 || v19 > *(void *)&v7[*v11]) {
        break;
      }
      char v20 = *(unsigned char *)(*(void *)&v7[*v13] + v18);
      *(void *)&v7[v17] = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << v14;
      if ((v20 & 0x80) == 0) {
        goto LABEL_12;
      }
      v14 += 7;
      BOOL v21 = v15++ >= 9;
      if (v21)
      {
        LODWORD(v16) = 0;
        uint64_t v22 = *v12;
        int v23 = v7[v22];
        goto LABEL_14;
      }
    }
    v7[*v12] = 1;
LABEL_12:
    uint64_t v22 = *v12;
    int v23 = v7[v22];
    if (v7[v22]) {
      LODWORD(v16) = 0;
    }
LABEL_14:
    if (v23 || (v16 & 7) == 4) {
      break;
    }
    int v25 = (unsigned __int16)(v16 >> 3);
    if (v25 == 2)
    {
      uint64_t v33 = *v10;
      unint64_t v34 = *(void *)&v7[v33];
      if (v34 <= 0xFFFFFFFFFFFFFFF7 && (unint64_t v35 = v34 + 8, v34 + 8 <= *(void *)&v7[*v11]))
      {
        uint64_t v36 = *(void *)(*(void *)&v7[*v13] + v34);
        *(void *)&v7[v33] = v35;
      }
      else
      {
        uint64_t v36 = 0;
        v7[v22] = 1;
      }
      if (!v7[*v12]) {
        *a3 = (double)v36 / 1000.0;
      }
      char v9 = 1;
    }
    else
    {
      if (v25 == 1)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        while (1)
        {
          uint64_t v29 = *v10;
          uint64_t v30 = *(void *)&v7[v29];
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)&v7[*v11]) {
            break;
          }
          char v32 = *(unsigned char *)(*(void *)&v7[*v13] + v30);
          *(void *)&v7[v29] = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0) {
            goto LABEL_34;
          }
          v26 += 7;
          BOOL v21 = v27++ >= 9;
          if (v21)
          {
            LODWORD(v28) = 0;
            if (v7[*v12]) {
              goto LABEL_45;
            }
            goto LABEL_35;
          }
        }
        v7[*v12] = 1;
LABEL_34:
        if (v7[*v12]) {
          goto LABEL_45;
        }
LABEL_35:
        unsigned int v37 = v28 - 1;
        if (v37 > 5) {
          unsigned __int16 v38 = -1;
        }
        else {
          unsigned __int16 v38 = word_23B58D828[v37];
        }
        *a4 = v38;
LABEL_45:
        char v8 = 1;
        goto LABEL_46;
      }
      if (!PBReaderSkipValueWithTag()) {
        break;
      }
    }
    if (v8)
    {
LABEL_46:
      if (v9) {
        break;
      }
    }
  }
}

+ (double)sendTimeInArchive:(id)a3
{
  id v3 = a3;
  v4 = (unsigned char *)[objc_alloc(MEMORY[0x263F62228]) initWithData:v3];
  v5 = (int *)MEMORY[0x263F62298];
  v6 = (int *)MEMORY[0x263F62288];
  double v7 = 0.0;
  if (*(void *)&v4[*MEMORY[0x263F62298]] < *(void *)&v4[*MEMORY[0x263F62288]])
  {
    char v8 = (int *)MEMORY[0x263F62270];
    LODWORD(v9) = *MEMORY[0x263F62270];
    char v10 = (int *)MEMORY[0x263F62268];
    do
    {
      if (v4[(int)v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v5;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v6]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_12;
        }
        v11 += 7;
        if (v12++ >= 9)
        {
          LODWORD(v13) = 0;
          uint64_t v19 = *v8;
          int v20 = v4[v19];
          goto LABEL_14;
        }
      }
      v4[*v8] = 1;
LABEL_12:
      uint64_t v19 = *v8;
      int v20 = v4[v19];
      if (v4[v19]) {
        LODWORD(v13) = 0;
      }
LABEL_14:
      if (v20 || (v13 & 7) == 4) {
        break;
      }
      if ((v13 & 0x7FFF8) == 0x10)
      {
        uint64_t v22 = *v5;
        unint64_t v23 = *(void *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && (unint64_t v24 = v23 + 8, v23 + 8 <= *(void *)&v4[*v6]))
        {
          uint64_t v25 = *(void *)(*(void *)&v4[*v10] + v23);
          *(void *)&v4[v22] = v24;
        }
        else
        {
          uint64_t v25 = 0;
          v4[v19] = 1;
        }
        uint64_t v9 = *v8;
        if (!v4[v9])
        {
          double v7 = (double)v25 / 1000.0;
          break;
        }
      }
      else
      {
        if (!PBReaderSkipValueWithTag()) {
          break;
        }
        LODWORD(v9) = *v8;
      }
    }
    while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
  }

  return v7;
}

@end