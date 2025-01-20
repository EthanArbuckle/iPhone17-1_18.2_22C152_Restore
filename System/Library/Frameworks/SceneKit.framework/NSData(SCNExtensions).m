@interface NSData(SCNExtensions)
- (id)_operateOnDataUsingCompressionAlgorithm:()SCNExtensions operation:;
- (id)scn_indexedDataDecodingDeltaWithBytesPerIndex:()SCNExtensions;
- (id)scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:()SCNExtensions;
- (id)scn_indexedDataEncodingDeltaWithBytesPerIndex:()SCNExtensions;
- (id)scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:()SCNExtensions;
- (uint64_t)scn_compressedDataUsingCompressionAlgorithm:()SCNExtensions;
- (uint64_t)scn_indexedDataDecodingTrianglePairsWithBytesPerIndex:()SCNExtensions;
- (uint64_t)scn_indexedDataEncodingTrianglePairsWithBytesPerIndex:()SCNExtensions;
- (uint64_t)scn_uncompressedDataUsingCompressionAlgorithm:()SCNExtensions;
@end

@implementation NSData(SCNExtensions)

- (id)_operateOnDataUsingCompressionAlgorithm:()SCNExtensions operation:
{
  if (![a1 length]) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  if (a4)
  {
    id v7 = 0;
    if (a4 != COMPRESSION_STREAM_DECODE) {
      return v7;
    }
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
  }
  if (compression_stream_init(&v12, a4, a3) == COMPRESSION_STATUS_ERROR) {
    return 0;
  }
  v12.src_ptr = (const uint8_t *)objc_msgSend(a1, "bytes", *(_OWORD *)&v12.dst_ptr, *(_OWORD *)&v12.src_ptr, v12.state);
  v12.src_size = [a1 length];
  v9 = (uint8_t *)malloc_type_malloc(0x1000uLL, 0x7548D3B7uLL);
  v12.dst_ptr = v9;
  v12.dst_size = 4096;
  id v7 = (id)objc_opt_new();
  while (1)
  {
    compression_status v10 = compression_stream_process(&v12, v8);
    if (v10) {
      break;
    }
    if (!v12.dst_size)
    {
      [v7 appendBytes:v9 length:4096];
      v12.dst_ptr = v9;
      v12.dst_size = 4096;
    }
  }
  if (v10 == COMPRESSION_STATUS_ERROR)
  {
    free(v9);
    return 0;
  }
  if (v10 == COMPRESSION_STATUS_END && v12.dst_ptr > v9) {
    [v7 appendBytes:v9 length:v12.dst_ptr - v9];
  }
  compression_stream_destroy(&v12);
  free(v9);
  objc_msgSend(v7, "setLength:", objc_msgSend(v7, "length"));
  return v7;
}

- (uint64_t)scn_compressedDataUsingCompressionAlgorithm:()SCNExtensions
{
  return [a1 _operateOnDataUsingCompressionAlgorithm:a3 operation:0];
}

- (uint64_t)scn_uncompressedDataUsingCompressionAlgorithm:()SCNExtensions
{
  return [a1 _operateOnDataUsingCompressionAlgorithm:a3 operation:1];
}

- (id)scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:()SCNExtensions
{
  v5 = (void *)[a1 mutableCopy];
  switch(a3)
  {
    case 4:
      v15 = (unsigned int *)[a1 bytes];
      v16 = (unsigned int *)[v5 bytes];
      unsigned int *v16 = *v15;
      unsigned int v17 = *v15;
      unint64_t v18 = [a1 length];
      if (v18 >= 8)
      {
        uint64_t v19 = (v18 >> 2) - 1;
        v20 = v16 + 1;
        v21 = v15 + 1;
        do
        {
          *v20++ = v17 - *v21;
          unsigned int v23 = *v21++;
          unsigned int v22 = v23;
          if (v23 > v17) {
            unsigned int v17 = v22;
          }
          --v19;
        }
        while (v19);
      }
      break;
    case 2:
      v24 = (unsigned __int16 *)[a1 bytes];
      v25 = (unsigned __int16 *)[v5 bytes];
      unsigned __int16 *v25 = *v24;
      unsigned __int16 v26 = *v24;
      unint64_t v27 = [a1 length];
      if (v27 >= 4)
      {
        uint64_t v28 = (v27 >> 1) - 1;
        v29 = v25 + 1;
        v30 = v24 + 1;
        do
        {
          *v29++ = v26 - *v30;
          unsigned int v32 = (unsigned __int16)*v30++;
          unsigned __int16 v31 = v32;
          if (v32 > v26) {
            unsigned __int16 v26 = v31;
          }
          --v28;
        }
        while (v28);
      }
      break;
    case 1:
      v6 = (unsigned __int8 *)[a1 bytes];
      id v7 = (unsigned __int8 *)[v5 bytes];
      *id v7 = *v6;
      unsigned __int8 v8 = *v6;
      unint64_t v9 = [a1 length];
      if (v9 >= 2)
      {
        unint64_t v10 = v9 - 1;
        v11 = v7 + 1;
        compression_stream v12 = v6 + 1;
        do
        {
          *v11++ = v8 - *v12;
          unsigned int v14 = *v12++;
          unsigned __int8 v13 = v14;
          if (v14 > v8) {
            unsigned __int8 v8 = v13;
          }
          --v10;
        }
        while (v10);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:]();
  }

  return v5;
}

- (id)scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:()SCNExtensions
{
  v5 = (void *)[a1 mutableCopy];
  switch(a3)
  {
    case 4:
      v15 = (unsigned int *)[a1 bytes];
      v16 = (unsigned int *)[v5 bytes];
      unsigned int *v16 = *v15;
      unsigned int v17 = *v15;
      unint64_t v18 = [a1 length];
      if (v18 >= 8)
      {
        uint64_t v19 = (v18 >> 2) - 1;
        v20 = v16 + 1;
        v21 = (int *)(v15 + 1);
        do
        {
          int v22 = *v21++;
          unsigned int v23 = v17 - v22;
          *v20++ = v17 - v22;
          if (v17 - v22 > v17) {
            unsigned int v17 = v23;
          }
          --v19;
        }
        while (v19);
      }
      break;
    case 2:
      v24 = (unsigned __int16 *)[a1 bytes];
      v25 = (unsigned __int16 *)[v5 bytes];
      unsigned __int16 *v25 = *v24;
      unsigned __int16 v26 = *v24;
      unint64_t v27 = [a1 length];
      if (v27 >= 4)
      {
        uint64_t v28 = (v27 >> 1) - 1;
        v29 = v25 + 1;
        v30 = (__int16 *)(v24 + 1);
        do
        {
          __int16 v31 = *v30++;
          unsigned int v32 = (unsigned __int16)(v26 - v31);
          *v29++ = v26 - v31;
          if (v32 > v26) {
            unsigned __int16 v26 = v32;
          }
          --v28;
        }
        while (v28);
      }
      break;
    case 1:
      v6 = (unsigned __int8 *)[a1 bytes];
      id v7 = (unsigned __int8 *)[v5 bytes];
      *id v7 = *v6;
      unsigned __int8 v8 = *v6;
      unint64_t v9 = [a1 length];
      if (v9 >= 2)
      {
        unint64_t v10 = v9 - 1;
        v11 = v7 + 1;
        compression_stream v12 = (char *)(v6 + 1);
        do
        {
          char v13 = *v12++;
          unsigned int v14 = (v8 - v13);
          *v11++ = v8 - v13;
          if (v14 > v8) {
            unsigned __int8 v8 = v14;
          }
          --v10;
        }
        while (v10);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:]();
  }

  return v5;
}

- (id)scn_indexedDataEncodingDeltaWithBytesPerIndex:()SCNExtensions
{
  v5 = (void *)[a1 mutableCopy];
  switch(a3)
  {
    case 4:
      compression_stream v12 = (_DWORD *)[a1 bytes];
      char v13 = (_DWORD *)[v5 bytes];
      *char v13 = *v12;
      unint64_t v14 = [a1 length];
      if (v14 >= 8)
      {
        uint64_t v15 = (v14 >> 2) - 1;
        v16 = v13 + 1;
        unsigned int v17 = v12 + 1;
        do
        {
          *v16++ = *v17 - *(v17 - 1);
          ++v17;
          --v15;
        }
        while (v15);
      }
      break;
    case 2:
      unint64_t v18 = (_WORD *)[a1 bytes];
      uint64_t v19 = (_WORD *)[v5 bytes];
      *uint64_t v19 = *v18;
      unint64_t v20 = [a1 length];
      if (v20 >= 4)
      {
        uint64_t v21 = (v20 >> 1) - 1;
        int v22 = v19 + 1;
        unsigned int v23 = v18 + 1;
        do
        {
          *v22++ = *v23 - *(v23 - 1);
          ++v23;
          --v21;
        }
        while (v21);
      }
      break;
    case 1:
      v6 = (unsigned char *)[a1 bytes];
      id v7 = (unsigned char *)[v5 bytes];
      *id v7 = *v6;
      unint64_t v8 = [a1 length];
      if (v8 >= 2)
      {
        unint64_t v9 = v8 - 1;
        unint64_t v10 = v7 + 1;
        v11 = v6 + 1;
        do
        {
          *v10++ = *v11 - *(v11 - 1);
          ++v11;
          --v9;
        }
        while (v9);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataEncodingDeltaWithBytesPerIndex:]();
  }

  return v5;
}

- (id)scn_indexedDataDecodingDeltaWithBytesPerIndex:()SCNExtensions
{
  v5 = (void *)[a1 mutableCopy];
  switch(a3)
  {
    case 4:
      uint64_t v15 = (int *)[a1 bytes];
      v16 = (int *)[v5 bytes];
      int *v16 = *v15;
      unint64_t v17 = [a1 length];
      if (v17 >= 8)
      {
        int v20 = *v16;
        uint64_t v19 = v16 + 1;
        int v18 = v20;
        uint64_t v21 = (v17 >> 2) - 1;
        int v22 = v15 + 1;
        do
        {
          int v23 = *v22++;
          v18 += v23;
          *v19++ = v18;
          --v21;
        }
        while (v21);
      }
      break;
    case 2:
      v24 = (_WORD *)[a1 bytes];
      v25 = (_WORD *)[v5 bytes];
      _WORD *v25 = *v24;
      unint64_t v26 = [a1 length];
      if (v26 >= 4)
      {
        int v29 = (unsigned __int16)*v25;
        uint64_t v28 = v25 + 1;
        int v27 = v29;
        uint64_t v30 = (v26 >> 1) - 1;
        __int16 v31 = v24 + 1;
        do
        {
          int v32 = *v31++;
          v27 += v32;
          *v28++ = v27;
          --v30;
        }
        while (v30);
      }
      break;
    case 1:
      v6 = (unsigned char *)[a1 bytes];
      id v7 = (unsigned char *)[v5 bytes];
      *id v7 = *v6;
      unint64_t v8 = [a1 length];
      if (v8 >= 2)
      {
        int v11 = *v7;
        unint64_t v10 = v7 + 1;
        int v9 = v11;
        unint64_t v12 = v8 - 1;
        char v13 = v6 + 1;
        do
        {
          int v14 = *v13++;
          v9 += v14;
          *v10++ = v9;
          --v12;
        }
        while (v12);
      }
      break;
    default:
      -[NSData(SCNExtensions) scn_indexedDataDecodingDeltaWithBytesPerIndex:]();
  }

  return v5;
}

- (uint64_t)scn_indexedDataEncodingTrianglePairsWithBytesPerIndex:()SCNExtensions
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 bytes];
  unint64_t v6 = [a1 length];
  unint64_t v7 = v6 / a3;
  unint64_t v8 = malloc_type_malloc(v6 / a3 * a3, 0xAEF6C906uLL);
  int v9 = v8;
  unint64_t v10 = v8;
  if (v6 >= a3)
  {
    unint64_t v11 = 0;
    unint64_t v10 = v8;
    do
    {
      unint64_t v12 = v11 + 3;
      if (v11 + 3 >= v7)
      {
        unint64_t v13 = v11 * a3;
      }
      else
      {
        unint64_t v13 = v11 * a3;
        int v14 = (unsigned __int16 *)(v5 + v11 * a3);
        switch(a3)
        {
          case 4uLL:
            int v15 = *(_DWORD *)v14;
            int v16 = *((_DWORD *)v14 + 1);
            HIDWORD(v45) = *(_DWORD *)v14;
            LODWORD(v46) = v16;
            int v17 = *((_DWORD *)v14 + 2);
            break;
          case 2uLL:
            int v15 = *v14;
            int v16 = v14[1];
            HIDWORD(v45) = v15;
            LODWORD(v46) = v16;
            int v17 = v14[2];
            break;
          case 1uLL:
            int v15 = *(unsigned __int8 *)v14;
            int v16 = *((unsigned __int8 *)v14 + 1);
            HIDWORD(v45) = v15;
            LODWORD(v46) = v16;
            int v17 = *((unsigned __int8 *)v14 + 2);
            break;
          default:
            goto LABEL_19;
        }
        HIDWORD(v46) = v17;
        if (v15 != v16 && v16 != v17 && v17 != v15)
        {
          int v23 = (unsigned __int16 *)(v5 + v12 * a3);
          if (a3 == 4)
          {
            uint64_t v44 = *(void *)v23;
            int v25 = *((_DWORD *)v23 + 2);
          }
          else if (a3 == 2)
          {
            int v26 = v23[1];
            LODWORD(v44) = *v23;
            HIDWORD(v44) = v26;
            int v25 = v23[2];
          }
          else
          {
            int v24 = *((unsigned __int8 *)v23 + 1);
            LODWORD(v44) = *(unsigned __int8 *)v23;
            HIDWORD(v44) = v24;
            int v25 = *((unsigned __int8 *)v23 + 2);
          }
          unint64_t v27 = 0;
          LODWORD(v45) = v25;
          BOOL v28 = 1;
LABEL_30:
          unint64_t v29 = 0;
          unint64_t v30 = v27;
          unsigned int v31 = *((_DWORD *)&v45 + ++v27);
          if (v27 == 3) {
            unint64_t v32 = 0;
          }
          else {
            unint64_t v32 = v30 + 1;
          }
          unsigned int v33 = *((_DWORD *)&v45 + v32 + 1);
          while (1)
          {
            if (*((_DWORD *)&v44 + v29) == v33)
            {
              int v34 = v29 > 1 ? -2 : 1;
              if (*((_DWORD *)&v44 + (v34 + v29)) == v31) {
                break;
              }
            }
            if (++v29 == 3)
            {
              BOOL v28 = v30 < 2;
              if (v27 != 3) {
                goto LABEL_30;
              }
              goto LABEL_19;
            }
          }
          unsigned int v35 = v30 + 2;
          unsigned int v36 = v30 - 1;
          if (v35 >= 3) {
            unsigned int v35 = v36;
          }
          int v37 = *((_DWORD *)&v45 + (int)v35 + 1);
          unsigned int v38 = v29 + 2;
          unsigned int v39 = v29 - 1;
          if (v38 < 3) {
            unsigned int v39 = v38;
          }
          int v40 = *((_DWORD *)&v44 + v39);
          if (v31 >= v33)
          {
            if (a3 == 4)
            {
              *(_DWORD *)unint64_t v10 = v33;
              *((_DWORD *)v10 + 1) = v31;
              *((_DWORD *)v10 + 2) = v40;
              *((_DWORD *)v10 + 3) = v37;
              if (!v28) {
                goto LABEL_60;
              }
            }
            else if (a3 == 2)
            {
              *(_WORD *)unint64_t v10 = v33;
              *((_WORD *)v10 + 1) = v31;
              *((_WORD *)v10 + 2) = v40;
              *((_WORD *)v10 + 3) = v37;
              if (!v28) {
                goto LABEL_63;
              }
            }
            else
            {
              *unint64_t v10 = v33;
              v10[1] = v31;
              v10[2] = v40;
              v10[3] = v37;
              if (!v28) {
                goto LABEL_22;
              }
            }
          }
          else if (a3 == 4)
          {
            *(_DWORD *)unint64_t v10 = v31;
            *((_DWORD *)v10 + 1) = v33;
            *((_DWORD *)v10 + 2) = v37;
            *((_DWORD *)v10 + 3) = v40;
            if (!v28) {
              goto LABEL_60;
            }
          }
          else if (a3 == 2)
          {
            *(_WORD *)unint64_t v10 = v31;
            *((_WORD *)v10 + 1) = v33;
            *((_WORD *)v10 + 2) = v37;
            *((_WORD *)v10 + 3) = v40;
            if (!v28) {
              goto LABEL_63;
            }
          }
          else
          {
            *unint64_t v10 = v31;
            v10[1] = v33;
            v10[2] = v37;
            v10[3] = v40;
            if (!v28) {
              goto LABEL_22;
            }
          }
          unint64_t v12 = v11 + 6;
          uint64_t v41 = 4 * a3;
          goto LABEL_83;
        }
      }
LABEL_19:
      int v14 = (unsigned __int16 *)(v5 + v13);
      switch(a3)
      {
        case 4uLL:
LABEL_60:
          unsigned int v20 = *(_DWORD *)v14;
          unsigned int v21 = *((_DWORD *)v14 + 1);
          unsigned int v22 = *((_DWORD *)v14 + 2);
          break;
        case 2uLL:
LABEL_63:
          unsigned int v20 = *v14;
          unsigned int v21 = v14[1];
          unsigned int v22 = v14[2];
          break;
        case 1uLL:
LABEL_22:
          unsigned int v20 = *(unsigned __int8 *)v14;
          unsigned int v21 = *((unsigned __int8 *)v14 + 1);
          unsigned int v22 = *((unsigned __int8 *)v14 + 2);
          break;
        default:
          unsigned int v22 = 0;
          unsigned int v20 = 0;
          unsigned int v21 = 0;
LABEL_69:
          switch(a3)
          {
            case 4uLL:
              *(_DWORD *)unint64_t v10 = v20;
              *((_DWORD *)v10 + 1) = v21;
              uint64_t v41 = 12;
              *((_DWORD *)v10 + 2) = v22;
              break;
            case 2uLL:
              *(_WORD *)unint64_t v10 = v20;
              *((_WORD *)v10 + 1) = v21;
              uint64_t v41 = 6;
              *((_WORD *)v10 + 2) = v22;
              break;
            case 1uLL:
              *unint64_t v10 = v20;
              v10[1] = v21;
              uint64_t v41 = 3;
              v10[2] = v22;
              break;
            default:
              uint64_t v41 = 3 * a3;
              break;
          }
          goto LABEL_83;
      }
      if (v20 >= v21) {
        goto LABEL_69;
      }
      if (v21 >= v22)
      {
        if (a3 == 4)
        {
          *(_DWORD *)unint64_t v10 = v21;
          *((_DWORD *)v10 + 1) = v22;
          uint64_t v41 = 12;
          *((_DWORD *)v10 + 2) = v20;
        }
        else if (a3 == 2)
        {
          *(_WORD *)unint64_t v10 = v21;
          *((_WORD *)v10 + 1) = v22;
          uint64_t v41 = 6;
          *((_WORD *)v10 + 2) = v20;
        }
        else
        {
          *unint64_t v10 = v21;
          v10[1] = v22;
          uint64_t v41 = 3;
          v10[2] = v20;
        }
      }
      else if (a3 == 4)
      {
        *(_DWORD *)unint64_t v10 = v22;
        *((_DWORD *)v10 + 1) = v20;
        uint64_t v41 = 12;
        *((_DWORD *)v10 + 2) = v21;
      }
      else if (a3 == 2)
      {
        *(_WORD *)unint64_t v10 = v22;
        *((_WORD *)v10 + 1) = v20;
        uint64_t v41 = 6;
        *((_WORD *)v10 + 2) = v21;
      }
      else
      {
        *unint64_t v10 = v22;
        v10[1] = v20;
        uint64_t v41 = 3;
        v10[2] = v21;
      }
LABEL_83:
      v10 += v41;
      unint64_t v11 = v12;
    }
    while (v12 < v7);
  }
  uint64_t v42 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v9, v10 - v9, v44, v45, v46);
  free(v9);
  return v42;
}

- (uint64_t)scn_indexedDataDecodingTrianglePairsWithBytesPerIndex:()SCNExtensions
{
  uint64_t v5 = [a1 bytes];
  unint64_t v6 = [a1 length];
  unint64_t v7 = (char *)malloc_type_malloc((((3 * (v6 / a3)) >> 1) & 0x3FFFFFFFFFFFFFFFLL) * a3, 0x32A3C3E3uLL);
  unint64_t v8 = v7;
  int v9 = v7;
  if (v6 >= a3)
  {
    unint64_t v10 = 0;
    uint64_t v11 = 3 * a3;
    int v9 = v7;
    do
    {
      unint64_t v12 = (unsigned __int8 *)(v5 + v10 * a3);
      switch(a3)
      {
        case 1uLL:
          unsigned int v13 = *v12;
          unsigned int v15 = v12[1];
          unsigned __int8 v17 = v12[2];
          char *v9 = v13;
          v9[1] = v15;
          v9[2] = v17;
          break;
        case 2uLL:
          unsigned int v13 = *(unsigned __int16 *)v12;
          unsigned int v15 = *((unsigned __int16 *)v12 + 1);
          __int16 v16 = *((_WORD *)v12 + 2);
          *(_WORD *)int v9 = v13;
          *((_WORD *)v9 + 1) = v15;
          *((_WORD *)v9 + 2) = v16;
          break;
        case 4uLL:
          unsigned int v13 = *(_DWORD *)v12;
          uint64_t v14 = *(void *)(v12 + 4);
          *(_DWORD *)int v9 = *(_DWORD *)v12;
          *(void *)(v9 + 4) = v14;
          unsigned int v15 = v14;
          break;
        default:
          unint64_t v18 = v10 + 3;
LABEL_17:
          v9 += v11;
          goto LABEL_18;
      }
      unint64_t v18 = v10 + 3;
      v9 += v11;
      if (v13 < v15)
      {
        unint64_t v19 = v18 * a3;
        if (a3 == 4)
        {
          int v21 = *(_DWORD *)(v5 + v19);
          *(_DWORD *)int v9 = v13;
          *((_DWORD *)v9 + 1) = v21;
          *((_DWORD *)v9 + 2) = v15;
        }
        else if (a3 == 2)
        {
          __int16 v22 = *(_WORD *)(v5 + v19);
          *(_WORD *)int v9 = v13;
          *((_WORD *)v9 + 1) = v22;
          *((_WORD *)v9 + 2) = v15;
        }
        else
        {
          char v20 = *(unsigned char *)(v5 + v19);
          char *v9 = v13;
          v9[1] = v20;
          v9[2] = v15;
        }
        unint64_t v18 = v10 + 4;
        goto LABEL_17;
      }
LABEL_18:
      unint64_t v10 = v18;
    }
    while (v18 < v6 / a3);
  }
  uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v9 - v7];
  free(v8);
  return v23;
}

- (void)scn_indexedDataEncodingHighWatermarkWithBytesPerIndex:()SCNExtensions .cold.1()
{
}

- (void)scn_indexedDataDecodingHighWatermarkWithBytesPerIndex:()SCNExtensions .cold.1()
{
}

- (void)scn_indexedDataEncodingDeltaWithBytesPerIndex:()SCNExtensions .cold.1()
{
}

- (void)scn_indexedDataDecodingDeltaWithBytesPerIndex:()SCNExtensions .cold.1()
{
}

@end