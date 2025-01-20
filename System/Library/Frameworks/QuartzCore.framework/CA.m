@interface CA
@end

@implementation CA

void *__CA_CGPathIsRectShape_block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(result[4] + 8);
  int v4 = *(_DWORD *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  switch(v4)
  {
    case 0:
      *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(_DWORD *)a2 == 0;
      *(_OWORD *)*(void *)(*(void *)(result[6] + 8) + 24) = *(_OWORD *)*(void *)(a2 + 8);
      break;
    case 1:
      if (*(_DWORD *)a2 == 1)
      {
        v16 = *(double **)(*(void *)(result[6] + 8) + 24);
        v17 = *(double **)(a2 + 8);
        char v18 = (*v16 == *v17) ^ (v16[1] == v17[1]);
      }
      else
      {
        char v18 = 0;
        v17 = *(double **)(a2 + 8);
      }
      *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v18;
      *(_OWORD *)(*(void *)(*(void *)(result[6] + 8) + 24) + 16) = *(_OWORD *)v17;
      break;
    case 2:
      if (*(_DWORD *)a2 == 1)
      {
        v5 = *(double **)(*(void *)(result[6] + 8) + 24);
        v6 = *(double **)(a2 + 8);
        double v7 = v6[1];
        if ((v5[2] == *v6) == (v5[3] == v7))
        {
          BOOL v9 = 0;
        }
        else
        {
          double v8 = v5[1];
          BOOL v9 = *v6 != *v5;
          if (v7 != v8) {
            BOOL v9 = 1;
          }
        }
      }
      else
      {
        BOOL v9 = 0;
        v6 = *(double **)(a2 + 8);
      }
      *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v9;
      *(_OWORD *)(*(void *)(*(void *)(result[6] + 8) + 24) + 32) = *(_OWORD *)v6;
      break;
    case 3:
      if (*(_DWORD *)a2 == 1)
      {
        v19 = *(double **)(*(void *)(result[6] + 8) + 24);
        v20 = *(double **)(a2 + 8);
        double v22 = *v20;
        double v21 = v20[1];
        if ((v19[4] == *v20) == (v19[5] == v21) || (*v19 == v22) == (v19[1] == v21))
        {
          BOOL v24 = 0;
        }
        else
        {
          double v23 = v19[3];
          BOOL v24 = v22 != v19[2];
          if (v21 != v23) {
            BOOL v24 = 1;
          }
        }
      }
      else
      {
        BOOL v24 = 0;
        v20 = *(double **)(a2 + 8);
      }
      *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v24;
      *(_OWORD *)(*(void *)(*(void *)(result[6] + 8) + 24) + 48) = *(_OWORD *)v20;
      break;
    case 4:
      if (*(_DWORD *)a2 == 4)
      {
        BOOL v15 = 1;
      }
      else if (*(_DWORD *)a2 == 1)
      {
        v10 = *(double **)(a2 + 8);
        double v11 = *v10;
        double v12 = v10[1];
        v13 = *(double **)(*(void *)(result[6] + 8) + 24);
        double v14 = v13[1];
        BOOL v15 = v11 == *v13;
        if (v12 != v14) {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
      goto LABEL_28;
    case 5:
      BOOL v15 = *(_DWORD *)a2 == 4;
LABEL_28:
      *(unsigned char *)(*(void *)(result[5] + 8) + 24) = v15;
      break;
    default:
      break;
  }
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

@end