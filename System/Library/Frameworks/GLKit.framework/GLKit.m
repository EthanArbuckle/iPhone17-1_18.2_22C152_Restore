uint64_t _modelviewMatrixMask(uint64_t result)
{
  void *v1;
  void *v2;
  int8x16_t *v3;
  int8x16_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  float v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  unsigned char v24[128];
  unsigned char v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x263EF8340];
  if (result)
  {
    v1 = (void *)result;
    v2 = *(void **)(*(void *)(result + 144) + 152);
    if (!v2 || (result = [v2 enabled], result != 1))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v5 = (void *)v1[7];
      v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6)
      {
        v7 = v6;
        v8 = *(void *)v21;
LABEL_9:
        v9 = 0;
        while (1)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          result = _reflectionMappingEnabled(*(void *)(*((void *)&v20 + 1) + 8 * v9));
          if (result) {
            break;
          }
          if (v7 == ++v9)
          {
            v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
            if (v7) {
              goto LABEL_9;
            }
            goto LABEL_15;
          }
        }
      }
      else
      {
LABEL_15:
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v10 = (void *)v1[19];
        result = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (!result)
        {
LABEL_25:
          v3 = (int8x16_t *)v1[26];
          v4 = vbicq_s8(*v3, (int8x16_t)xmmword_267BDA4C0);
          goto LABEL_5;
        }
        v11 = result;
        v12 = *(void *)v17;
LABEL_17:
        v13 = 0;
        while (1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
          if ([v14 enabled])
          {
            result = [v14 position];
            if (v15 != 0.0) {
              break;
            }
            result = [v14 isAttenuated];
            if (result) {
              break;
            }
          }
          if (v11 == ++v13)
          {
            result = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            v11 = result;
            if (result) {
              goto LABEL_17;
            }
            goto LABEL_25;
          }
        }
      }
    }
    v3 = (int8x16_t *)v1[26];
    v4 = vorrq_s8(*v3, (int8x16_t)xmmword_267BDA4C0);
LABEL_5:
    *v3 = v4;
  }
  return result;
}

uint64_t _useTexCoordAttribMask(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = *(void **)(result + 56);
    result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v9;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v2);
          }
          result = [*(id *)(*((void *)&v8 + 1) + 8 * v5) useTexCoordAttribMask];
          if (result)
          {
            v6 = *(int8x16_t **)(v1 + 200);
            *(int8x16_t *)*(void *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA470);
            int8x16_t v7 = vorrq_s8(*v6, (int8x16_t)xmmword_267BDA540);
            goto LABEL_12;
          }
          ++v5;
        }
        while (v3 != v5);
        result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v3 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
    v6 = *(int8x16_t **)(v1 + 200);
    *(int8x16_t *)*(void *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA470);
    int8x16_t v7 = vbicq_s8(*v6, (int8x16_t)xmmword_267BDA540);
LABEL_12:
    int8x16_t *v6 = v7;
  }
  return result;
}

uint64_t _texturingEnabledMask(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 48) = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v2 = *(void **)(result + 56);
    result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v9;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v2);
          }
          result = [*(id *)(*((void *)&v8 + 1) + 8 * v5) enabled];
          if (result)
          {
            *(unsigned char *)(v1 + 48) = 1;
            goto LABEL_13;
          }
          ++v5;
        }
        while (v3 != v5);
        result = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v3 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
    if (*(unsigned char *)(v1 + 48))
    {
LABEL_13:
      v6 = *(int8x16_t **)(v1 + 200);
      *(int8x16_t *)*(void *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA480);
      int8x16_t v7 = vorrq_s8(*v6, (int8x16_t)xmmword_267BDA550);
    }
    else
    {
      v6 = *(int8x16_t **)(v1 + 200);
      *(int8x16_t *)*(void *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA480);
      int8x16_t v7 = vbicq_s8(*v6, (int8x16_t)xmmword_267BDA550);
    }
    int8x16_t *v6 = v7;
  }
  return result;
}

uint64_t _normalizedNormalsMask(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 72) && !*(unsigned char *)(result + 73))
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      uint64_t v4 = *(void **)(result + 56);
      result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (!result)
      {
LABEL_15:
        v2 = *(int8x16_t **)(v1 + 208);
        int8x16_t v3 = vbicq_s8(*v2, (int8x16_t)xmmword_267BDA490);
        goto LABEL_5;
      }
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v9;
LABEL_9:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        result = [*(id *)(*((void *)&v8 + 1) + 8 * v7) normalizedNormalsMask];
        if (result) {
          break;
        }
        if (v5 == ++v7)
        {
          result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
          if (result) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
    }
    v2 = *(int8x16_t **)(v1 + 208);
    int8x16_t v3 = vorrq_s8(*v2, (int8x16_t)xmmword_267BDA490);
LABEL_5:
    int8x16_t *v2 = v3;
  }
  return result;
}

uint64_t _vNormalEyeMask(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(unsigned char *)(result + 73))
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      uint64_t v4 = *(void **)(result + 56);
      result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (!result)
      {
LABEL_14:
        v2 = *(int8x16_t **)(v1 + 200);
        *(int8x16_t *)*(void *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA4B0);
        int8x16_t v3 = vbicq_s8(*v2, (int8x16_t)xmmword_267BDA570);
        goto LABEL_4;
      }
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v9;
LABEL_8:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        result = [*(id *)(*((void *)&v8 + 1) + 8 * v7) vNormalEyeMask];
        if (result) {
          break;
        }
        if (v5 == ++v7)
        {
          result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
          uint64_t v5 = result;
          if (result) {
            goto LABEL_8;
          }
          goto LABEL_14;
        }
      }
    }
    v2 = *(int8x16_t **)(v1 + 200);
    *(int8x16_t *)*(void *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA4B0);
    int8x16_t v3 = vorrq_s8(*v2, (int8x16_t)xmmword_267BDA570);
LABEL_4:
    int8x16_t *v2 = v3;
  }
  return result;
}

uint64_t _vPositionEyeMask(uint64_t result)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v2 = *(void **)(result + 56);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v21;
LABEL_4:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v20 + 1) + 8 * v6) vPositionEyeMask]) {
          break;
        }
        if (v4 == ++v6)
        {
          uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v4) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      if (!*(unsigned char *)(v1 + 73)
        || (long long v18 = 0u,
            long long v19 = 0u,
            long long v16 = 0u,
            long long v17 = 0u,
            uint64_t v7 = *(void **)(v1 + 152),
            (uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16]) == 0))
      {
LABEL_20:
        v14 = *(int8x16_t **)(v1 + 200);
        *(int8x16_t *)*(void *)(v1 + 208) = vbicq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA4A0);
        int8x16_t v15 = vbicq_s8(*v14, (int8x16_t)xmmword_267BDA560);
LABEL_22:
        int8x16_t *v14 = v15;
        return _modelviewMatrixMask(v1);
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
LABEL_13:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        if ([v12 enabled])
        {
          [v12 position];
          if (v13 != 0.0) {
            break;
          }
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9) {
            goto LABEL_13;
          }
          goto LABEL_20;
        }
      }
    }
    v14 = *(int8x16_t **)(v1 + 200);
    *(int8x16_t *)*(void *)(v1 + 208) = vorrq_s8(*(int8x16_t *)*(void *)(v1 + 208), (int8x16_t)xmmword_267BDA4A0);
    int8x16_t v15 = vorrq_s8(*v14, (int8x16_t)xmmword_267BDA560);
    goto LABEL_22;
  }
  return result;
}

uint64_t _lightStateChanged(uint64_t result)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  *(_WORD *)(result + 72) = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = *(void **)(result + 152);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v4 = &xmmword_267BDA530;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v18 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
      if ([v8 enabled]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_13;
      }
    }
    if ([v8 lightingType])
    {
      *(unsigned char *)(v1 + 73) = 1;
      goto LABEL_13;
    }
    *(unsigned char *)(v1 + 72) = 1;
    goto LABEL_16;
  }
LABEL_13:
  if (*(unsigned char *)(v1 + 72))
  {
LABEL_16:
    uint64_t v10 = *(int8x16_t **)(v1 + 200);
    v12 = *(int8x16_t **)(v1 + 208);
    int8x16_t *v12 = vorrq_s8(*v12, (int8x16_t)xmmword_267BDA460);
    uint64_t v9 = (uint64_t *)&xmmword_267BDA530 + 1;
    uint64_t v11 = &xmmword_267BDA530;
    goto LABEL_17;
  }
  uint64_t v9 = (uint64_t *)&xmmword_267BDA460 + 1;
  uint64_t v10 = *(int8x16_t **)(v1 + 208);
  uint64_t v11 = &xmmword_267BDA460;
  v12 = v10;
LABEL_17:
  v13.i64[0] = *(void *)v11;
  v13.i64[1] = *v9;
  *uint64_t v10 = vbicq_s8(*v10, v13);
  v14 = *(int8x16_t **)(v1 + 200);
  if (*(unsigned char *)(v1 + 73))
  {
    int8x16_t *v14 = vorrq_s8(*v14, (int8x16_t)xmmword_267BDA530);
    int8x16_t v15 = (uint64_t *)&xmmword_267BDA460 + 1;
    uint64_t v4 = &xmmword_267BDA460;
    v14 = v12;
  }
  else
  {
    int8x16_t v15 = (uint64_t *)&xmmword_267BDA530 + 1;
  }
  v16.i64[0] = *(void *)v4;
  v16.i64[1] = *v15;
  int8x16_t *v14 = vbicq_s8(*v14, v16);
  _lightModelTwoSidedMask(v1);
  _normalizedNormalsMask(v1);
  return _vNormalEyeMask(v1);
}

uint64_t _lightModelTwoSidedMask(uint64_t result)
{
  if (*(unsigned char *)(result + 17) && *(unsigned char *)(result + 72))
  {
    uint64_t v1 = *(int8x16_t **)(result + 200);
    *(int8x16_t *)*(void *)(result + 208) = vorrq_s8(*(int8x16_t *)*(void *)(result + 208), (int8x16_t)xmmword_267BDA450);
    int8x16_t v2 = vorrq_s8(*v1, (int8x16_t)xmmword_267BDA4F0);
    *uint64_t v1 = v2;
    int8x16_t v3 = vbicq_s8(v2, (int8x16_t)xmmword_267BDA500);
  }
  else
  {
    uint64_t v1 = *(int8x16_t **)(result + 200);
    uint64_t v4 = *(int8x16_t **)(result + 208);
    *uint64_t v1 = vorrq_s8(*v1, (int8x16_t)xmmword_267BDA500);
    *uint64_t v4 = vbicq_s8(*v4, (int8x16_t)xmmword_267BDA450);
    int8x16_t v3 = vbicq_s8(*v1, (int8x16_t)xmmword_267BDA4F0);
  }
  *uint64_t v1 = v3;
  if (*(unsigned char *)(result + 17) && *(unsigned char *)(result + 73))
  {
    uint64_t v5 = v3.i64[0] | xmmword_267BDA510;
    uint64_t v6 = v3.i64[1] | *((void *)&xmmword_267BDA510 + 1);
    v1->i64[0] = v3.i64[0] | xmmword_267BDA510;
    v1->i64[1] = v6;
    uint64_t v7 = &qword_267BDA528;
    uint64_t v8 = &qword_267BDA520;
  }
  else
  {
    uint64_t v8 = (uint64_t *)&xmmword_267BDA510;
    uint64_t v5 = v3.i64[0] | qword_267BDA520;
    uint64_t v6 = v3.i64[1] | qword_267BDA528;
    v1->i64[0] = v3.i64[0] | qword_267BDA520;
    v1->i64[1] = v6;
    uint64_t v7 = (uint64_t *)&xmmword_267BDA510 + 1;
  }
  uint64_t v9 = v6 & ~*v7;
  v1->i64[0] = v5 & ~*v8;
  v1->i64[1] = v9;
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

GLKVertexAttributeParameters GLKVertexAttributeParametersFromModelIO(MDLVertexFormat vertexFormat)
{
  int v1 = 0;
  if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatUShortNormalizedBits)
  {
    if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatCharNormalizedBits)
    {
      uint64_t v2 = 0;
      uint64_t v3 = 0;
      switch(vertexFormat)
      {
        case MDLVertexFormatShort:
          int v1 = 0;
          uint64_t v2 = 0x100000000;
          goto LABEL_33;
        case MDLVertexFormatShort2:
          int v1 = 0;
          uint64_t v2 = 0x200000000;
          goto LABEL_33;
        case MDLVertexFormatShort3:
          int v1 = 0;
          uint64_t v2 = 0x300000000;
          goto LABEL_33;
        case MDLVertexFormatShort4:
          int v1 = 0;
          uint64_t v2 = 0x400000000;
LABEL_33:
          uint64_t v3 = 5122;
          break;
        default:
          break;
      }
    }
    else if (vertexFormat <= MDLVertexFormatCharNormalizedBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatUChar:
          int v1 = 0;
          uint64_t v2 = 0x100000000;
          break;
        case MDLVertexFormatUChar2:
          int v1 = 0;
          uint64_t v2 = 0x200000000;
          break;
        case MDLVertexFormatUChar3:
          int v1 = 0;
          uint64_t v2 = 0x300000000;
          break;
        case MDLVertexFormatUChar4:
          int v1 = 0;
          uint64_t v2 = 0x400000000;
          break;
        default:
LABEL_59:
          JUMPOUT(0);
      }
      uint64_t v3 = 5121;
    }
    else
    {
      uint64_t v2 = 0;
      uint64_t v3 = 0;
      switch(vertexFormat)
      {
        case MDLVertexFormatUCharNormalized:
          uint64_t v2 = 0x100000000;
          goto LABEL_25;
        case MDLVertexFormatUChar2Normalized:
          uint64_t v2 = 0x200000000;
          goto LABEL_25;
        case MDLVertexFormatUChar3Normalized:
          uint64_t v2 = 0x300000000;
          goto LABEL_25;
        case MDLVertexFormatUChar4Normalized:
          uint64_t v2 = 0x400000000;
LABEL_25:
          uint64_t v3 = 5121;
LABEL_57:
          int v1 = 1;
          break;
        default:
          break;
      }
    }
  }
  else if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatIntBits)
  {
    if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatHalfBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatInt:
          int v1 = 0;
          uint64_t v2 = 0x100000000;
          goto LABEL_48;
        case MDLVertexFormatInt2:
          int v1 = 0;
          uint64_t v2 = 0x200000000;
          goto LABEL_48;
        case MDLVertexFormatInt3:
          int v1 = 0;
          uint64_t v2 = 0x300000000;
          goto LABEL_48;
        case MDLVertexFormatInt4:
          int v1 = 0;
          uint64_t v2 = 0x400000000;
LABEL_48:
          uint64_t v3 = 5124;
          break;
        default:
          BOOL v4 = vertexFormat == MDLVertexFormatInt1010102Normalized;
          uint64_t v2 = 0x400000000;
          uint64_t v3 = 36255;
LABEL_40:
          int v1 = v4;
          if (!v4)
          {
            uint64_t v2 = 0;
            uint64_t v3 = 0;
          }
          break;
      }
    }
    else
    {
      uint64_t v2 = 0;
      uint64_t v3 = 0;
      switch(vertexFormat)
      {
        case MDLVertexFormatFloat:
          int v1 = 0;
          uint64_t v2 = 0x100000000;
          goto LABEL_29;
        case MDLVertexFormatFloat2:
          int v1 = 0;
          uint64_t v2 = 0x200000000;
          goto LABEL_29;
        case MDLVertexFormatFloat3:
          int v1 = 0;
          uint64_t v2 = 0x300000000;
          goto LABEL_29;
        case MDLVertexFormatFloat4:
          int v1 = 0;
          uint64_t v2 = 0x400000000;
LABEL_29:
          uint64_t v3 = 5126;
          break;
        default:
          break;
      }
    }
  }
  else
  {
    if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatUIntBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatUShortNormalized:
          uint64_t v2 = 0x100000000;
          goto LABEL_52;
        case MDLVertexFormatUShort2Normalized:
          uint64_t v2 = 0x200000000;
          goto LABEL_52;
        case MDLVertexFormatUShort3Normalized:
          uint64_t v2 = 0x300000000;
          goto LABEL_52;
        case MDLVertexFormatUShort4Normalized:
          uint64_t v2 = 0x400000000;
LABEL_52:
          uint64_t v3 = 5123;
          goto LABEL_57;
        default:
          goto LABEL_59;
      }
    }
    switch(vertexFormat)
    {
      case MDLVertexFormatUInt:
        int v1 = 0;
        uint64_t v2 = 0x100000000;
        break;
      case MDLVertexFormatUInt2:
        int v1 = 0;
        uint64_t v2 = 0x200000000;
        break;
      case MDLVertexFormatUInt3:
        int v1 = 0;
        uint64_t v2 = 0x300000000;
        break;
      case MDLVertexFormatUInt4:
        int v1 = 0;
        uint64_t v2 = 0x400000000;
        break;
      default:
        BOOL v4 = vertexFormat == MDLVertexFormatUInt1010102Normalized;
        uint64_t v2 = 0x400000000;
        uint64_t v3 = 33640;
        goto LABEL_40;
    }
    uint64_t v3 = 5125;
  }
  uint64_t v5 = v3 | v2;
  result.type = v5;
  result.size = HIDWORD(v5);
  result.normalized = v1;
  return result;
}

Class initMDLMeshBufferMap()
{
  if (ModelIOLibrary_sOnce != -1) {
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global);
  }
  Class result = objc_getClass("MDLMeshBufferMap");
  classMDLMeshBufferMap = (uint64_t)result;
  getMDLMeshBufferMapClass = (uint64_t (*)())MDLMeshBufferMapFunction;
  return result;
}

id MDLMeshBufferMapFunction()
{
  return (id)classMDLMeshBufferMap;
}

void *__ModelIOLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/ModelIO.framework/ModelIO", 2);
  ModelIOLibrary_sLib = (uint64_t)result;
  return result;
}

Class initMDLSubmesh()
{
  if (ModelIOLibrary_sOnce != -1) {
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global);
  }
  Class result = objc_getClass("MDLSubmesh");
  classMDLSubmesh = (uint64_t)result;
  getMDLSubmeshClass = (uint64_t (*)())MDLSubmeshFunction;
  return result;
}

id MDLSubmeshFunction()
{
  return (id)classMDLSubmesh;
}

Class initMDLMesh()
{
  if (ModelIOLibrary_sOnce != -1) {
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global);
  }
  Class result = objc_getClass("MDLMesh");
  classMDLMesh = (uint64_t)result;
  getMDLMeshClass = (uint64_t (*)())MDLMeshFunction;
  return result;
}

id MDLMeshFunction()
{
  return (id)classMDLMesh;
}

uint64_t _setMasks(uint64_t a1)
{
  int v2 = [(id)a1 isSpot];
  uint64_t v3 = *(int *)(a1 + 256);
  uint64_t v4 = 6;
  if (v2) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = 12;
  }
  *(int8x16_t *)**(void **)(a1 + 24) = vorrq_s8(*(int8x16_t *)**(void **)(a1 + 24), *(int8x16_t *)&_staticVshMasks_0[2 * v3 + v5]);
  *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks[2 * v3 + v5]);
  if (v2) {
    uint64_t v4 = 12;
  }
  *(int8x16_t *)**(void **)(a1 + 24) = vbicq_s8(*(int8x16_t *)**(void **)(a1 + 24), *(int8x16_t *)&_staticVshMasks_0[2 * v3 + v4]);
  *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks[2 * v3 + v4]);
  _attenuateMask(a1);
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v6 = *(int8x16_t ***)(a1 + 24);
    if (*(_DWORD *)(a1 + 260))
    {
      uint64_t v7 = *(int *)(a1 + 256);
      *v6[2] = vorrq_s8(*v6[2], *(int8x16_t *)&_staticFshMasks[2 * v7]);
      uint64_t v8 = **(void ***)(a1 + 24);
      uint64_t v9 = &_staticVshMasks_0[2 * v7];
      goto LABEL_12;
    }
    uint64_t v10 = *v6;
    uint64_t v11 = *(int *)(a1 + 256);
    int8x16_t v12 = vorrq_s8(*v10, *(int8x16_t *)&_staticVshMasks_0[2 * v11]);
  }
  else
  {
    uint64_t v10 = **(int8x16_t ***)(a1 + 24);
    uint64_t v11 = *(int *)(a1 + 256);
    int8x16_t v12 = vbicq_s8(*v10, *(int8x16_t *)&_staticVshMasks_0[2 * v11]);
  }
  *uint64_t v10 = v12;
  uint64_t v8 = *(void **)(*(void *)(a1 + 24) + 16);
  uint64_t v9 = &_staticFshMasks[2 * v11];
LABEL_12:
  *v8 &= ~*v9;
  v8[1] &= ~v9[1];
  _positionalLightMask(a1);

  return _directionalLightMask(a1);
}

uint64_t _attenuateMask(uint64_t a1)
{
  uint64_t result = [(id)a1 isAttenuated];
  if (!result)
  {
    uint64_t v8 = *(int *)(a1 + 256);
    uint64_t v9 = &_staticVshMasks_0[2 * v8];
    *(int8x16_t *)**(void **)(a1 + 24) = vorrq_s8(*(int8x16_t *)**(void **)(a1 + 24), *((int8x16_t *)v9 + 12));
    uint64_t v10 = **(int8x16_t ***)(a1 + 24);
    int8x16_t v11 = *((int8x16_t *)v9 + 9);
LABEL_6:
    *uint64_t v10 = vbicq_s8(*v10, v11);
    uint64_t v6 = (int8x16_t *)&_staticFshMasks[2 * v8];
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v6[12]);
    uint64_t v7 = *(void **)(*(void *)(a1 + 24) + 16);
    goto LABEL_7;
  }
  uint64_t v3 = *(int8x16_t ***)(a1 + 24);
  if (!*(_DWORD *)(a1 + 260))
  {
    uint64_t v8 = *(int *)(a1 + 256);
    int8x16_t v12 = &_staticVshMasks_0[2 * v8];
    **uint64_t v3 = vorrq_s8(**v3, *((int8x16_t *)v12 + 9));
    uint64_t v10 = **(int8x16_t ***)(a1 + 24);
    int8x16_t v11 = *((int8x16_t *)v12 + 12);
    goto LABEL_6;
  }
  uint64_t v4 = *(int *)(a1 + 256);
  uint64_t v5 = (int8x16_t *)&_staticFshMasks[2 * v4];
  *v3[2] = vorrq_s8(*v3[2], v5[9]);
  *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v5[12]);
  uint64_t v6 = (int8x16_t *)&_staticVshMasks_0[2 * v4];
  *(int8x16_t *)**(void **)(a1 + 24) = vorrq_s8(*(int8x16_t *)**(void **)(a1 + 24), v6[12]);
  uint64_t v7 = **(void ***)(a1 + 24);
LABEL_7:
  *v7 &= ~v6[9].i64[0];
  v7[1] &= ~v6[9].i64[1];
  return result;
}

uint64_t _positionalLightMask(uint64_t result)
{
  if (*(float *)(result + 108) == 0.0)
  {
    uint64_t v2 = *(int *)(result + 256);
    uint64_t v5 = **(int8x16_t ***)(result + 24);
    int8x16_t v6 = vbicq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 30]);
LABEL_6:
    *uint64_t v5 = v6;
    uint64_t v3 = *(void **)(*(void *)(result + 24) + 16);
    uint64_t v4 = _staticFshMasks;
    goto LABEL_7;
  }
  int v1 = *(int8x16_t ***)(result + 24);
  if (!*(_DWORD *)(result + 260))
  {
    uint64_t v2 = *(int *)(result + 256);
    uint64_t v5 = *v1;
    int8x16_t v6 = vorrq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 30]);
    goto LABEL_6;
  }
  uint64_t v2 = *(int *)(result + 256);
  *v1[2] = vorrq_s8(*v1[2], *(int8x16_t *)&_staticFshMasks[2 * v2 + 30]);
  uint64_t v3 = **(void ***)(result + 24);
  uint64_t v4 = _staticVshMasks_0;
LABEL_7:
  uint64_t v7 = &v4[2 * v2];
  *v3 &= ~v7[30];
  v3[1] &= ~v7[31];
  return result;
}

uint64_t _directionalLightMask(uint64_t result)
{
  if (*(float *)(result + 108) != 0.0)
  {
    uint64_t v2 = *(int *)(result + 256);
    uint64_t v5 = **(int8x16_t ***)(result + 24);
    int8x16_t v6 = vbicq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 36]);
LABEL_6:
    *uint64_t v5 = v6;
    uint64_t v3 = *(void **)(*(void *)(result + 24) + 16);
    uint64_t v4 = _staticFshMasks;
    goto LABEL_7;
  }
  int v1 = *(int8x16_t ***)(result + 24);
  if (!*(_DWORD *)(result + 260))
  {
    uint64_t v2 = *(int *)(result + 256);
    uint64_t v5 = *v1;
    int8x16_t v6 = vorrq_s8(*v5, *(int8x16_t *)&_staticVshMasks_0[2 * v2 + 36]);
    goto LABEL_6;
  }
  uint64_t v2 = *(int *)(result + 256);
  *v1[2] = vorrq_s8(*v1[2], *(int8x16_t *)&_staticFshMasks[2 * v2 + 36]);
  uint64_t v3 = **(void ***)(result + 24);
  uint64_t v4 = _staticVshMasks_0;
LABEL_7:
  uint64_t v7 = &v4[2 * v2];
  *v3 &= ~v7[36];
  v3[1] &= ~v7[37];
  return result;
}

int8x16_t _texGenSMask(uint64_t a1)
{
  uint64_t v2 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
  uint64_t v3 = *(int *)(a1 + 92);
  int8x16_t v4 = *v2;
  if (*(void *)(a1 + 136))
  {
    int8x16_t *v2 = vorrq_s8(v4, *(int8x16_t *)&_staticFshMasks_1[2 * v3 + 18]);
    int v5 = [*(id *)(a1 + 136) mode];
    int8x16_t v6 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    uint64_t v7 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v8 = v7[45].i64[0];
    if (v5)
    {
      int8x16_t *v6 = vbicq_s8(*v6, v7[45]);
    }
    else
    {
      uint64_t v12 = v6->i64[1] | v7[45].i64[1];
      v6->i64[0] |= v8;
      v6->i64[1] = v12;
    }
    int v13 = [*(id *)(a1 + 136) mode];
    v14 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    int8x16_t v15 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v16 = v15[54].i64[0];
    if (v13 == 1)
    {
      uint64_t v17 = v14->i64[1] | v15[54].i64[1];
      v14->i64[0] |= v16;
      v14->i64[1] = v17;
    }
    else
    {
      int8x16_t *v14 = vbicq_s8(*v14, v15[54]);
    }
    int v18 = [*(id *)(a1 + 136) mode];
    long long v19 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    long long v20 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v21 = v20[63].i64[0];
    if (v18 == 2)
    {
      uint64_t v22 = v19->i64[1] | v20[63].i64[1];
      v19->i64[0] |= v21;
      v19->i64[1] = v22;
    }
    else
    {
      int8x16_t result = vbicq_s8(*v19, v20[63]);
      *long long v19 = result;
    }
  }
  else
  {
    uint64_t v9 = (int8x16_t *)&_staticFshMasks_1[2 * v3];
    int8x16_t *v2 = vorrq_s8(v4, v9[18]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[9]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[45]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[54]);
    uint64_t v10 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    int8x16_t result = vbicq_s8(*v10, v9[63]);
    *uint64_t v10 = result;
  }
  return result;
}

uint64_t _reflectionMapMask(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)
    && (uint64_t v2 = *(void **)(a1 + 152)) != 0
    && *(void *)(a1 + 136)
    && *(void *)(a1 + 144)
    && [v2 mode] == 3
    && *(_DWORD *)(a1 + 80) == 34067)
  {
    uint64_t v3 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v3[3]);
    int8x16_t v4 = *(void **)(*(void *)(a1 + 24) + 16);
    *v4 &= ~v3[6].i64[0];
    int v5 = &v3[6].i64[1];
  }
  else
  {
    int8x16_t v6 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v6[6]);
    int8x16_t v4 = *(void **)(*(void *)(a1 + 24) + 16);
    *v4 &= ~v6[3].i64[0];
    int v5 = &v6[3].i64[1];
  }
  v4[1] &= ~*v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 24) + 32);

  return _modelviewMatrixMask(v7);
}

int8x16_t _texGenTMask(uint64_t a1)
{
  uint64_t v2 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
  uint64_t v3 = *(int *)(a1 + 92);
  int8x16_t v4 = *v2;
  if (*(void *)(a1 + 144))
  {
    int8x16_t *v2 = vorrq_s8(v4, *(int8x16_t *)&_staticFshMasks_1[2 * v3 + 24]);
    int v5 = [*(id *)(a1 + 144) mode];
    int8x16_t v6 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    uint64_t v7 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v8 = v7[48].i64[0];
    if (v5)
    {
      int8x16_t *v6 = vbicq_s8(*v6, v7[48]);
    }
    else
    {
      uint64_t v12 = v6->i64[1] | v7[48].i64[1];
      v6->i64[0] |= v8;
      v6->i64[1] = v12;
    }
    int v13 = [*(id *)(a1 + 144) mode];
    v14 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    int8x16_t v15 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v16 = v15[57].i64[0];
    if (v13 == 1)
    {
      uint64_t v17 = v14->i64[1] | v15[57].i64[1];
      v14->i64[0] |= v16;
      v14->i64[1] = v17;
    }
    else
    {
      int8x16_t *v14 = vbicq_s8(*v14, v15[57]);
    }
    int v18 = [*(id *)(a1 + 144) mode];
    long long v19 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    long long v20 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v21 = v20[66].i64[0];
    if (v18 == 2)
    {
      uint64_t v22 = v19->i64[1] | v20[66].i64[1];
      v19->i64[0] |= v21;
      v19->i64[1] = v22;
    }
    else
    {
      int8x16_t result = vbicq_s8(*v19, v20[66]);
      *long long v19 = result;
    }
  }
  else
  {
    uint64_t v9 = (int8x16_t *)&_staticFshMasks_1[2 * v3];
    int8x16_t *v2 = vorrq_s8(v4, v9[21]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[12]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[48]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[57]);
    uint64_t v10 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    int8x16_t result = vbicq_s8(*v10, v9[66]);
    *uint64_t v10 = result;
  }
  return result;
}

int8x16_t _texGenRMask(uint64_t a1)
{
  uint64_t v2 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
  uint64_t v3 = *(int *)(a1 + 92);
  int8x16_t v4 = *v2;
  if (*(void *)(a1 + 152))
  {
    int8x16_t *v2 = vorrq_s8(v4, *(int8x16_t *)&_staticFshMasks_1[2 * v3 + 30]);
    int v5 = [*(id *)(a1 + 152) mode];
    int8x16_t v6 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    uint64_t v7 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v8 = v7[51].i64[0];
    if (v5)
    {
      int8x16_t *v6 = vbicq_s8(*v6, v7[51]);
    }
    else
    {
      uint64_t v12 = v6->i64[1] | v7[51].i64[1];
      v6->i64[0] |= v8;
      v6->i64[1] = v12;
    }
    int v13 = [*(id *)(a1 + 152) mode];
    v14 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    int8x16_t v15 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v16 = v15[60].i64[0];
    if (v13 == 1)
    {
      uint64_t v17 = v14->i64[1] | v15[60].i64[1];
      v14->i64[0] |= v16;
      v14->i64[1] = v17;
    }
    else
    {
      int8x16_t *v14 = vbicq_s8(*v14, v15[60]);
    }
    int v18 = [*(id *)(a1 + 152) mode];
    long long v19 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    long long v20 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(a1 + 92)];
    uint64_t v21 = v20[69].i64[0];
    if (v18 == 2)
    {
      uint64_t v22 = v19->i64[1] | v20[69].i64[1];
      v19->i64[0] |= v21;
      v19->i64[1] = v22;
    }
    else
    {
      int8x16_t result = vbicq_s8(*v19, v20[69]);
      *long long v19 = result;
    }
  }
  else
  {
    uint64_t v9 = (int8x16_t *)&_staticFshMasks_1[2 * v3];
    int8x16_t *v2 = vorrq_s8(v4, v9[24]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[15]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[51]);
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), v9[60]);
    uint64_t v10 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
    int8x16_t result = vbicq_s8(*v10, v9[69]);
    *uint64_t v10 = result;
  }
  return result;
}

uint64_t _setMasks_0(uint64_t a1)
{
  uint64_t v2 = *(int *)(a1 + 92);
  uint64_t v3 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v4 = v3->i64[1] | _staticFshMasks_1[2 * v2 + 1];
    v3->i64[0] |= _staticFshMasks_1[2 * v2];
    v3->i64[1] = v4;
  }
  else
  {
    *uint64_t v3 = vbicq_s8(*v3, *(int8x16_t *)&_staticFshMasks_1[2 * v2]);
  }
  int v5 = *(int8x16_t **)(*(void *)(a1 + 24) + 16);
  int8x16_t v6 = (int8x16_t *)&_staticFshMasks_1[2 * v2];
  uint64_t v7 = v6[42].i64[0];
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v8 = v5->i64[1] | v6[42].i64[1];
    v5->i64[0] |= v7;
    v5->i64[1] = v8;
  }
  else
  {
    *int v5 = vbicq_s8(*v5, v6[42]);
  }
  int v9 = *(_DWORD *)(a1 + 80);
  if (v9 == 3553)
  {
    unsigned int v10 = 10;
    unsigned int v11 = 9;
  }
  else
  {
    if (v9 != 34067) {
      goto LABEL_12;
    }
    unsigned int v10 = 9;
    unsigned int v11 = 10;
  }
  *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks_1[6 * v11 + 2 * v2]);
  *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), *(int8x16_t *)&_staticFshMasks_1[6 * v10 + 2 * v2]);
LABEL_12:
  _envModeMask(a1);
  uint64_t v12 = *(void **)(a1 + 136);
  if (v12 && ![v12 mode]
    || (int v13 = *(void **)(a1 + 144)) != 0 && ![v13 mode]
    || (v14 = *(void **)(a1 + 152)) != 0 && ![v14 mode])
  {
    int8x16_t v15 = **(void ***)(a1 + 24);
    uint64_t v16 = v15[1] | _staticVshVPositionMask_1;
    *v15 |= _staticVshVPositionMask_0;
    uint64_t v17 = *(void *)(a1 + 24);
    v15[1] = v16;
    int v18 = *(void **)(v17 + 16);
    uint64_t v19 = v18[1] | _staticFshVPositionMask_1;
    *v18 |= _staticFshVPositionMask_0;
    v18[1] = v19;
  }
  else
  {
    *(int8x16_t *)**(void **)(a1 + 24) = vbicq_s8(*(int8x16_t *)**(void **)(a1 + 24), (int8x16_t)__PAIR128__(_staticVshVPositionMask_1, _staticVshVPositionMask_0));
    *(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(a1 + 24) + 16), (int8x16_t)__PAIR128__(_staticFshVPositionMask_1, _staticFshVPositionMask_0));
  }
  _texGenSMask(a1);
  _texGenTMask(a1);
  _texGenRMask(a1);

  return _reflectionMapMask(a1);
}

uint64_t _envModeMask(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 84);
  if (v1 == 2)
  {
    int v5 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(result + 92)];
    *(int8x16_t *)*(void *)(*(void *)(result + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(result + 24)+ 16), v5[39]);
    *(int8x16_t *)*(void *)(*(void *)(result + 24) + 16) = vbicq_s8(*(int8x16_t *)*(void *)(*(void *)(result + 24)+ 16), v5[33]);
    int8x16_t v6 = *(void **)(*(void *)(result + 24) + 16);
    *v6 &= ~v5[36].i64[0];
    uint64_t v7 = &v5[36].i64[1];
  }
  else
  {
    if (v1 == 1)
    {
      uint64_t v2 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(result + 92)];
      *(int8x16_t *)*(void *)(*(void *)(result + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(result + 24)+ 16), v2[36]);
      uint64_t v3 = *(int8x16_t **)(*(void *)(result + 24) + 16);
      int8x16_t v4 = v2[33];
    }
    else
    {
      if (v1) {
        return result;
      }
      uint64_t v2 = (int8x16_t *)&_staticFshMasks_1[2 * *(int *)(result + 92)];
      *(int8x16_t *)*(void *)(*(void *)(result + 24) + 16) = vorrq_s8(*(int8x16_t *)*(void *)(*(void *)(result + 24)+ 16), v2[33]);
      uint64_t v3 = *(int8x16_t **)(*(void *)(result + 24) + 16);
      int8x16_t v4 = v2[36];
    }
    *uint64_t v3 = vbicq_s8(*v3, v4);
    int8x16_t v6 = *(void **)(*(void *)(result + 24) + 16);
    *v6 &= ~v2[39].i64[0];
    uint64_t v7 = &v2[39].i64[1];
  }
  v6[1] &= ~*v7;
  return result;
}

BOOL _reflectionMappingEnabled(uint64_t a1)
{
  int v1 = *(void **)(*(void *)(a1 + 24) + 16);
  uint64_t v2 = &_staticFshMasks_1[2 * *(int *)(a1 + 92)];
  return (v2[6] & *v1) != 0 || (v2[7] & v1[1]) != 0;
}

uint64_t glkLinkedOSVersion()
{
  if (glkLinkedOSVersion_once != -1) {
    dispatch_once(&glkLinkedOSVersion_once, &__block_literal_global_0);
  }
  return glkLinkedOSVersion_version;
}

uint64_t __glkLinkedOSVersion_block_invoke()
{
  uint64_t result = dyld_get_program_sdk_version();
  glkLinkedOSVersion_version = result;
  return result;
}

GLKMatrix4 *__cdecl GLKMatrix4Invert(GLKMatrix4 *__return_ptr retstr, GLKMatrix4 *matrix, BOOL *isInvertible)
{
  uint64_t v3 = 0;
  uint64_t v66 = *MEMORY[0x263EF8340];
  int8x16_t v4 = 0uLL;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v64 = 0;
  long long v61 = 0u;
  int v60 = -1;
  LODWORD(v62) = -1;
  DWORD1(v63) = -1;
  int v65 = -1;
  int32x4_t v5 = *(int32x4_t *)&matrix->m[4];
  int32x4_t v6 = *(int32x4_t *)&matrix->m[8];
  int32x4_t v7 = *(int32x4_t *)&matrix->m[12];
  int32x4_t v8 = vzip1q_s32(*(int32x4_t *)&matrix->m00, v6);
  int32x4_t v9 = vzip2q_s32(*(int32x4_t *)&matrix->m00, v6);
  int32x4_t v10 = vzip1q_s32(v5, v7);
  int32x4_t v11 = vzip2q_s32(v5, v7);
  float32x4_t v12 = (float32x4_t)vzip1q_s32(v8, v10);
  float32x4_t v13 = (float32x4_t)vzip2q_s32(v8, v10);
  float32x4_t v14 = (float32x4_t)vzip1q_s32(v9, v11);
  float32x4_t v15 = (float32x4_t)vzip2q_s32(v9, v11);
  uint32x2_t v16 = (uint32x2_t)-1;
  v17.i64[0] = 0x8000000080000000;
  v17.i64[1] = 0x8000000080000000;
  unsigned int v18 = 50462976;
  __asm { FMOV            V19.4S, #1.0 }
  int8x16_t v24 = 0uLL;
  do
  {
    int8x16_t v25 = vbicq_s8((int8x16_t)v12, v17);
    uint32x2_t v26 = (uint32x2_t)vextq_s8(v25, v25, 8uLL).u64[0];
    int8x8_t v27 = (int8x8_t)vcgt_u32(v26, *(uint32x2_t *)v25.i8);
    *(uint32x2_t *)v25.i8 = vmax_u32(*(uint32x2_t *)v25.i8, v26);
    int32x2_t v28 = (int32x2_t)vbsl_s8(v27, (int8x8_t)0xF0E0D0C0B0A0908, (int8x8_t)0x706050403020100);
    int32x4_t v29 = vdupq_lane_s32((int32x2_t)vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)vrev64_s32(*(int32x2_t *)v25.i8), *(uint32x2_t *)v25.i8), (int8x8_t)vdup_lane_s32(v28, 1), (int8x8_t)v28), 0);
    uint32x2_t v16 = vmin_u32(v16, vpmax_u32(*(uint32x2_t *)v25.i8, *(uint32x2_t *)v25.i8));
    int8x16_t v4 = vbslq_s8(*(int8x16_t *)((char *)&v60 + v3), (int8x16_t)v29, v4);
    int8x16_t v30 = (int8x16_t)vceqq_s32(v29, (int32x4_t)xmmword_2187C1560);
    int8x16_t v24 = vbslq_s8(v30, (int8x16_t)vdupq_n_s32(v18), v24);
    v18 += 67372036;
    float32x4_t v31 = vrecpeq_f32(v12);
    float32x4_t v32 = vmulq_f32(v31, vrecpsq_f32(v12, v31));
    int8x16_t v33 = (int8x16_t)vmulq_f32(vrecpsq_f32(v12, v32), v32);
    float32x4_t v34 = (float32x4_t)vbslq_s8(v30, v33, _Q19);
    float32x4_t v35 = vmulq_f32(v13, v34);
    float32x4_t v36 = vmulq_f32(v14, v34);
    float32x4_t v37 = vmulq_f32(v15, v34);
    float32x4_t v38 = (float32x4_t)vandq_s8(v33, v30);
    *(int8x8_t *)v33.i8 = vqtbl1_s8((int8x16_t)v35, *(int8x8_t *)v29.i8);
    *(int8x8_t *)v39.i8 = vqtbl1_s8((int8x16_t)v36, *(int8x8_t *)v29.i8);
    *(int8x8_t *)v40.i8 = vqtbl1_s8((int8x16_t)v37, *(int8x8_t *)v29.i8);
    *(int8x8_t *)v29.i8 = vqtbl1_s8((int8x16_t)v38, *(int8x8_t *)v29.i8);
    v33.i64[1] = v33.i64[0];
    v39.i64[1] = v39.i64[0];
    v40.i64[1] = v40.i64[0];
    v29.i64[1] = v29.i64[0];
    float32x4_t v41 = vmulq_f32(vnegq_f32(v12), v34);
    float32x4_t v12 = vmlaq_f32(v35, (float32x4_t)vbicq_s8(v33, v30), v41);
    float32x4_t v13 = vmlaq_f32(v36, (float32x4_t)vbicq_s8(v39, v30), v41);
    float32x4_t v14 = vmlaq_f32(v37, (float32x4_t)vbicq_s8(v40, v30), v41);
    float32x4_t v15 = vmlaq_f32(v38, (float32x4_t)vbicq_s8((int8x16_t)v29, v30), v41);
    int8x16_t v17 = vorrq_s8(v17, v30);
    v3 += 16;
  }
  while (v3 != 64);
  if (v16.i32[0])
  {
    int8x8_t v42 = (int8x8_t)vextq_s8(v4, v4, 8uLL).u64[0];
    *(int8x8_t *)v43.i8 = vqtbl1_s8((int8x16_t)v12, *(int8x8_t *)v4.i8);
    v43.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v12, v42);
    *(int8x8_t *)v44.i8 = vqtbl1_s8((int8x16_t)v13, *(int8x8_t *)v4.i8);
    v44.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v13, v42);
    *(int8x8_t *)v45.i8 = vqtbl1_s8((int8x16_t)v14, *(int8x8_t *)v4.i8);
    v45.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v14, v42);
    *(int8x8_t *)v46.i8 = vqtbl1_s8((int8x16_t)v15, *(int8x8_t *)v4.i8);
    v46.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v15, v42);
    int32x4_t v47 = vzip1q_s32(v43, v45);
    int32x4_t v48 = vzip2q_s32(v43, v45);
    int32x4_t v49 = vzip1q_s32(v44, v46);
    int32x4_t v50 = vzip2q_s32(v44, v46);
    int8x16_t v51 = (int8x16_t)vzip1q_s32(v47, v49);
    int8x16_t v52 = (int8x16_t)vzip2q_s32(v47, v49);
    int8x16_t v53 = (int8x16_t)vzip1q_s32(v48, v50);
    int8x16_t v54 = (int8x16_t)vzip2q_s32(v48, v50);
    int8x8_t v55 = (int8x8_t)vextq_s8(v24, v24, 8uLL).u64[0];
    *(int8x8_t *)&long long v56 = vqtbl1_s8(v51, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v56 + 1) = vqtbl1_s8(v51, v55);
    *(int8x8_t *)&long long v57 = vqtbl1_s8(v52, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v57 + 1) = vqtbl1_s8(v52, v55);
    *(int8x8_t *)&long long v58 = vqtbl1_s8(v53, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v58 + 1) = vqtbl1_s8(v53, v55);
    *(int8x8_t *)&long long v59 = vqtbl1_s8(v54, *(int8x8_t *)v24.i8);
    *((int8x8_t *)&v59 + 1) = vqtbl1_s8(v54, v55);
    if (isInvertible) {
      *isInvertible = 1;
    }
    *(_OWORD *)&retstr->m00 = v56;
    *(_OWORD *)&retstr->m[4] = v57;
    *(_OWORD *)&retstr->m[8] = v58;
  }
  else
  {
    if (isInvertible) {
      *isInvertible = 0;
    }
    *(_OWORD *)&retstr->m00 = *(_OWORD *)&GLKMatrix4Identity.m00;
    *(_OWORD *)&retstr->m[4] = *(_OWORD *)&GLKMatrix4Identity.m[4];
    long long v59 = *(_OWORD *)&GLKMatrix4Identity.m[12];
    *(_OWORD *)&retstr->m[8] = *(_OWORD *)&GLKMatrix4Identity.m[8];
  }
  *(_OWORD *)&retstr->m[12] = v59;
  return matrix;
}

GLKMatrix4 *__cdecl GLKMatrix4InvertAndTranspose(GLKMatrix4 *__return_ptr retstr, GLKMatrix4 *matrix, BOOL *isInvertible)
{
  float32x4_t v3 = *(float32x4_t *)&matrix->m[4];
  v7.val[0] = *(float32x4_t *)&matrix->m00;
  v7.val[1] = v3;
  float32x4_t v4 = *(float32x4_t *)&matrix->m[12];
  v7.val[2] = *(float32x4_t *)&matrix->m[8];
  v7.val[3] = v4;
  int32x4_t v5 = &v7;
  float32x4x4_t v8 = vld4q_f32((const float *)v5);
  float32x4x4_t v7 = v8;
  return GLKMatrix4Invert(retstr, (GLKMatrix4 *)&v7, isInvertible);
}

GLKQuaternion GLKQuaternionMakeWithMatrix3(GLKMatrix3 *matrix)
{
  *(void *)&result.x = matrix;
  return result;
}

GLKQuaternion GLKQuaternionMakeWithMatrix4(GLKMatrix4 *matrix)
{
  *(void *)&result.x = matrix;
  return result;
}

float GLKQuaternionAngle(GLKQuaternion quaternion)
{
  if (v4 > 1.0 || v4 < -1.0)
  {
    v1.i32[1] = v2;
    v1.i64[1] = __PAIR64__(LODWORD(v4), v3);
    float32x4_t v6 = vmulq_f32(v1, v1);
    v6.i64[0] = vpaddq_f32(v6, v6).u64[0];
    float v4 = v4 * (float)(1.0 / sqrtf(vpadd_f32(*(float32x2_t *)v6.f32, *(float32x2_t *)v6.f32).f32[0]));
  }
  float v7 = acosf(v4);
  return v7 + v7;
}

GLKVector3 GLKQuaternionAxis(GLKQuaternion quaternion)
{
  v1.i32[1] = v2;
  v1.i64[1] = __PAIR64__(v4, v3);
  float32x4_t v5 = vmulq_f32(v1, v1);
  v5.i64[0] = vpaddq_f32(v5, v5).u64[0];
  _S0 = vmulq_n_f32(v1, 1.0 / sqrtf(COERCE_FLOAT(vpadd_f32(*(float32x2_t *)&v5, *(float32x2_t *)&v5)))).i32[3];
  __asm { FMLS            S3, S0, V1.S[3] }
  *(void *)&result.x = *(void *)&quaternion.x;
  result.z = quaternion.z;
  return result;
}

GLKQuaternion GLKQuaternionSlerp(GLKQuaternion quaternionStart, GLKQuaternion quaternionEnd, float t)
{
  float v10 = (float)((float)((float)(v3 * v7) + (float)(t * v6)) + (float)(v4 * v8)) + (float)(v5 * v9);
  double v11 = v10;
  if (v10 < 0.0) {
    double v11 = -v11;
  }
  if (1.0 - v11 > 0.00100000005)
  {
    long double v12 = acos(v11);
    sin(v12);
    sin((1.0 - v13) * v12);
    sin(v12 * v13);
  }
  return quaternionStart;
}

void GLKQuaternionRotateVector3Array(GLKQuaternion quaternion, GLKVector3 *vectors, size_t vectorCount)
{
  if (*(void *)&quaternion.q[2])
  {
    float v7 = -v5;
    float v8 = -v3;
    v9.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
    float v10 = -v4;
    v9.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
    float32x4_t v11 = vmulq_f32(v9, v9);
    v11.i64[0] = vpaddq_f32(v11, v11).u64[0];
    int8x16_t v12 = veorq_s8((int8x16_t)vmulq_n_f32(v9, 1.0 / vpadd_f32(*(float32x2_t *)v11.f32, *(float32x2_t *)v11.f32).f32[0]), (int8x16_t)xmmword_2187C15C0);
    float v13 = (float *)(*(void *)&quaternion.x + 8);
    do
    {
      float v14 = *(v13 - 2);
      float v15 = *(v13 - 1);
      float v16 = (float)((float)((float)(v3 * 0.0) + (float)(v6 * v14)) + (float)(v4 * *v13)) + (float)(v7 * v15);
      float v17 = (float)((float)((float)(v4 * 0.0) + (float)(v6 * v15)) + (float)(v5 * v14)) + (float)(v8 * *v13);
      float v18 = (float)((float)((float)(v5 * 0.0) + (float)(v6 * *v13)) + (float)(v3 * v15)) + (float)(v10 * v14);
      float v19 = (float)((float)((float)(v14 * v8) + (float)(v6 * 0.0)) + (float)(v10 * v15)) + (float)(v7 * *v13);
      *(v13 - 2) = (float)((float)((float)(v16 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)v12.i32))
                         + (float)(v17 * *(float *)&v12.i32[2]))
                 - (float)(v18 * *(float *)&v12.i32[1]);
      *(v13 - 1) = (float)((float)((float)(v17 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[1]))
                         + (float)(v18 * *(float *)v12.i32))
                 - (float)(v16 * *(float *)&v12.i32[2]);
      *float v13 = (float)((float)((float)(v18 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[2]))
                   + (float)(v16 * *(float *)&v12.i32[1]))
           - (float)(v17 * *(float *)v12.i32);
      v13 += 3;
      --*(void *)&quaternion.q[2];
    }
    while (*(void *)&quaternion.q[2]);
  }
}

void GLKQuaternionRotateVector4Array(GLKQuaternion quaternion, GLKVector4 *vectors, size_t vectorCount)
{
  if (*(void *)&quaternion.q[2])
  {
    float v7 = -v5;
    float v8 = -v3;
    v9.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
    float v10 = -v4;
    v9.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
    float32x4_t v11 = vmulq_f32(v9, v9);
    v11.i64[0] = vpaddq_f32(v11, v11).u64[0];
    int8x16_t v12 = veorq_s8((int8x16_t)vmulq_n_f32(v9, 1.0 / vpadd_f32(*(float32x2_t *)v11.f32, *(float32x2_t *)v11.f32).f32[0]), (int8x16_t)xmmword_2187C15C0);
    float v13 = (float *)(*(void *)&quaternion.x + 8);
    do
    {
      float v14 = *(v13 - 2);
      float v15 = *(v13 - 1);
      float v16 = (float)((float)((float)(v3 * 0.0) + (float)(v6 * v14)) + (float)(v4 * *v13)) + (float)(v7 * v15);
      float v17 = (float)((float)((float)(v4 * 0.0) + (float)(v6 * v15)) + (float)(v5 * v14)) + (float)(v8 * *v13);
      float v18 = (float)((float)((float)(v5 * 0.0) + (float)(v6 * *v13)) + (float)(v3 * v15)) + (float)(v10 * v14);
      float v19 = (float)((float)((float)(v14 * v8) + (float)(v6 * 0.0)) + (float)(v10 * v15)) + (float)(v7 * *v13);
      *(v13 - 2) = (float)((float)((float)(v16 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)v12.i32))
                         + (float)(v17 * *(float *)&v12.i32[2]))
                 - (float)(v18 * *(float *)&v12.i32[1]);
      *(v13 - 1) = (float)((float)((float)(v17 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[1]))
                         + (float)(v18 * *(float *)v12.i32))
                 - (float)(v16 * *(float *)&v12.i32[2]);
      *float v13 = (float)((float)((float)(v18 * *(float *)&v12.i32[3]) + (float)(v19 * *(float *)&v12.i32[2]))
                   + (float)(v16 * *(float *)&v12.i32[1]))
           - (float)(v17 * *(float *)v12.i32);
      v13 += 4;
      --*(void *)&quaternion.q[2];
    }
    while (*(void *)&quaternion.q[2]);
  }
}

GLKMatrixStackRef GLKMatrixStackCreate(CFAllocatorRef alloc)
{
  if (GLKMatrixStackGetTypeID_pred != -1) {
    dispatch_once_f(&GLKMatrixStackGetTypeID_pred, 0, (dispatch_function_t)_GLKMatrixStackRegisterClass);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  __int32 v2 = (_GLKMatrixStack *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    float v3 = malloc_type_calloc(0x28uLL, 1uLL, 0x11EDA976uLL);
    *(_DWORD *)float v3 = 1;
    v3[1] = 80;
    *((_DWORD *)v3 + 4) = 16;
    float v4 = (char *)malloc_type_calloc(0x50uLL, 0x10uLL, 0x41427E63uLL);
    v3[3] = v4;
    *((void *)v2 + 2) = v3;
    if (*(int *)v3 >= 2)
    {
      int v5 = *(_DWORD *)v3 - 1;
      float v6 = v3;
      do
      {
        float v6 = (void *)v6[4];
        --v5;
      }
      while (v5);
      float v4 = (char *)v6[3];
    }
    float v7 = &v4[v3[1] * *((int *)v3 + 1)];
    *(GLKMatrix4 *)float v7 = GLKMatrix4Identity;
    *((void *)v7 + 8) = 0x3F80000000000005;
  }
  return v2;
}

CFTypeID GLKMatrixStackGetTypeID(void)
{
  if (GLKMatrixStackGetTypeID_pred != -1) {
    dispatch_once_f(&GLKMatrixStackGetTypeID_pred, 0, (dispatch_function_t)_GLKMatrixStackRegisterClass);
  }
  return _GLKMatrixStackTypeID;
}

uint64_t _GLKMatrixStackRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  _GLKMatrixStackTypeID = result;
  return result;
}

uint64_t GLKMatrixStackGetModifyCount(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = v1;
  if (*(int *)v1 >= 2)
  {
    int v3 = *(_DWORD *)v1 - 1;
    uint64_t v2 = *(void *)(a1 + 16);
    do
    {
      uint64_t v2 = *(void *)(v2 + 32);
      --v3;
    }
    while (v3);
  }
  return *(unsigned int *)(*(void *)(v2 + 24) + *(void *)(v1 + 8) * *(int *)(v1 + 4) + 72);
}

void GLKMatrixStackPush(GLKMatrixStackRef stack)
{
  uint64_t v1 = *((void *)stack + 2);
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 < 2)
  {
    float v8 = (int *)(v1 + 4);
    uint64_t v7 = *(int *)(v1 + 4);
    float v10 = (size_t *)(v1 + 8);
    size_t v9 = *(void *)(v1 + 8);
    int8x16_t v12 = (const void *)(*(void *)(v1 + 24) + v9 * v7);
    float32x4_t v11 = (void *)*((void *)stack + 2);
  }
  else
  {
    int v3 = v2 - 1;
    int v4 = v2 - 1;
    uint64_t v5 = *((void *)stack + 2);
    do
    {
      uint64_t v5 = *(void *)(v5 + 32);
      --v4;
    }
    while (v4);
    uint64_t v6 = *(void *)(v5 + 24);
    float v8 = (int *)(v1 + 4);
    uint64_t v7 = *(int *)(v1 + 4);
    float v10 = (size_t *)(v1 + 8);
    size_t v9 = *(void *)(v1 + 8);
    float32x4_t v11 = (void *)*((void *)stack + 2);
    do
    {
      float32x4_t v11 = (void *)v11[4];
      --v3;
    }
    while (v3);
    int8x16_t v12 = (const void *)(v6 + v9 * v7);
  }
  int v13 = v7 + 1;
  *(_DWORD *)(v1 + 4) = v7 + 1;
  int v14 = *(_DWORD *)(v1 + 16);
  if ((int)v7 >= v14 - 1)
  {
    *(void *)uint64_t v1 = (v2 + 1);
    if (v11[4])
    {
      int v13 = 0;
      float32x4_t v11 = (void *)v11[4];
    }
    else
    {
      float v15 = malloc_type_calloc(0x28uLL, 1uLL, 0x11EDA976uLL);
      *(_DWORD *)float v15 = 1;
      v15[1] = v9;
      *((_DWORD *)v15 + 4) = v14;
      v15[3] = malloc_type_calloc(v9, v14, 0x41427E63uLL);
      v11[4] = v15;
      int v13 = *v8;
      size_t v9 = *v10;
      float32x4_t v11 = v15;
    }
  }
  float v16 = (void *)(v11[3] + v9 * v13);

  memcpy(v16, v12, v9);
}

void GLKMatrixStackPop(GLKMatrixStackRef stack)
{
  uint64_t v1 = (int *)*((void *)stack + 2);
  int v2 = *v1;
  int v3 = v1[1];
  if (*v1 < 2)
  {
    if (v3 <= 0) {
      int v4 = 0;
    }
    else {
      int v4 = v3 - 1;
    }
    goto LABEL_8;
  }
  v1[1] = v3 - 1;
  if (v3 < 1)
  {
    *uint64_t v1 = v2 - 1;
    int v4 = v1[4] - 1;
LABEL_8:
    v1[1] = v4;
  }
}

int GLKMatrixStackSize(GLKMatrixStackRef stack)
{
  return *(_DWORD *)(*((void *)stack + 2) + 4)
       + (**((_DWORD **)stack + 2) - 1) * *(_DWORD *)(*((void *)stack + 2) + 16)
       + 1;
}

void GLKMatrixStackLoadMatrix4(GLKMatrixStackRef stack, GLKMatrix4 *matrix)
{
  uint64_t v2 = *((void *)stack + 2);
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *((void *)stack + 2);
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = *(void *)(v3 + 24) + *(void *)(v2 + 8) * *(int *)(v2 + 4);
  long long v7 = *(_OWORD *)&matrix->m[8];
  long long v6 = *(_OWORD *)&matrix->m[12];
  long long v8 = *(_OWORD *)&matrix->m[4];
  *(_OWORD *)uint64_t v5 = *(_OWORD *)&matrix->m00;
  *(_OWORD *)(v5 + 16) = v8;
  *(_OWORD *)(v5 + 32) = v7;
  *(_OWORD *)(v5 + 48) = v6;
  if (((*(_DWORD *)(v5 + 28) | *(_DWORD *)(v5 + 12) | *(_DWORD *)(v5 + 44)) & 0x7FFFFFFF) != 0
    || *(_DWORD *)(v5 + 60) != 1065353216)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = 2;
  }
  *(_DWORD *)(v5 + 64) = v9;
  ++*(_DWORD *)(v5 + 72);
}

GLKMatrix4 *__cdecl GLKMatrixStackGetMatrix4(GLKMatrix4 *__return_ptr retstr, GLKMatrix4 *stack)
{
  uint64_t v2 = *(void *)&stack->m[4];
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *(void *)&stack->m[4];
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = (_OWORD *)(*(void *)(v3 + 24) + *(void *)(v2 + 8) * *(int *)(v2 + 4));
  long long v6 = v5[1];
  *(_OWORD *)&retstr->m00 = *v5;
  *(_OWORD *)&retstr->m[4] = v6;
  long long v7 = v5[3];
  *(_OWORD *)&retstr->m[8] = v5[2];
  *(_OWORD *)&retstr->m[12] = v7;
  return stack;
}

GLKMatrix3 *__cdecl GLKMatrixStackGetMatrix3(GLKMatrix3 *__return_ptr retstr, GLKMatrix3 *stack)
{
  uint64_t v2 = *(void *)&stack->m[4];
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *(void *)&stack->m[4];
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = *(void *)(v3 + 24) + *(void *)(v2 + 8) * *(int *)(v2 + 4);
  *(void *)&long long v6 = *(void *)(v5 + 4);
  float v7 = *(float *)(v5 + 24);
  float v8 = *(float *)(v5 + 40);
  *((void *)&v6 + 1) = *(void *)(v5 + 16);
  retstr->m00 = *(float *)v5;
  *(_OWORD *)&retstr->m[1] = v6;
  retstr->m12 = v7;
  *(void *)&retstr->m[6] = *(void *)(v5 + 32);
  retstr->m22 = v8;
  return stack;
}

GLKMatrix2 GLKMatrixStackGetMatrix2(GLKMatrixStackRef stack)
{
  int v1 = **((_DWORD **)stack + 2);
  if (v1 >= 2)
  {
    int v2 = v1 - 1;
    uint64_t v3 = *((void *)stack + 2);
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v2;
    }
    while (v2);
  }
  *(void *)&result.m00 = stack;
  return result;
}

GLKMatrix4 *__cdecl GLKMatrixStackGetMatrix4Inverse(GLKMatrix4 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3 = *((void *)stack + 2);
  uint64_t v4 = v3;
  if (*(int *)v3 >= 2)
  {
    int v5 = *(_DWORD *)v3 - 1;
    uint64_t v4 = *((void *)stack + 2);
    do
    {
      uint64_t v4 = *(void *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  uint64_t v6 = *(int *)(v3 + 4);
  uint64_t v7 = *(void *)(v3 + 8);
  float v8 = (float *)(*(void *)(v4 + 24) + v7 * v6);
  GLKMatrix2 result = (GLKMatrix4 *)*((unsigned int *)v8 + 16);
  if (result == 2)
  {
    GLKMatrix2 result = (GLKMatrix4 *)_GLKMatrix4Classify(*(void *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = result;
  }
  if (result >= 3)
  {
    float v10 = v8[17];
    float m00 = v10 * *v8;
    float m10 = v10 * v8[1];
    float m20 = v10 * v8[2];
    float m01 = v10 * v8[4];
    float m11 = v10 * v8[5];
    float m21 = v10 * v8[6];
    float v17 = v10 * v8[8];
    *(float *)&unsigned int v18 = v10 * v8[9];
    *(float *)&unsigned int v19 = v10 * v8[10];
    float v20 = v8[12];
    float v21 = v8[13];
    float v22 = v8[14];
    float m30 = -(float)((float)((float)(m10 * v21) + (float)(m00 * v20)) + (float)(m20 * v22));
    float m31 = -(float)((float)((float)(m11 * v21) + (float)(m01 * v20)) + (float)(m21 * v22));
    float v25 = -(float)((float)((float)(*(float *)&v18 * v21) + (float)(v17 * v20)) + (float)(*(float *)&v19 * v22));
    uint64_t v26 = LODWORD(v20);
    *(float *)&uint64_t v26 = v17;
    uint64_t v27 = v18;
    uint64_t v28 = v19;
    __asm { FMOV            V19.2S, #1.0 }
    *(float *)&_D19 = v25;
LABEL_12:
    retstr->float m00 = m00;
    retstr->float m01 = m01;
    *(void *)&retstr->m[2] = v26;
    retstr->float m10 = m10;
    retstr->float m11 = m11;
    *(void *)&retstr->m[6] = v27;
    retstr->float m20 = m20;
    retstr->float m21 = m21;
    *(void *)&retstr->m[10] = v28;
    retstr->float m30 = m30;
    retstr->float m31 = m31;
    *(void *)&retstr->m[14] = _D19;
    return result;
  }
  if (!result)
  {
    long long v61 = *(_OWORD *)v8;
    long long v62 = *((_OWORD *)v8 + 1);
    long long v63 = *((_OWORD *)v8 + 3);
    *(_OWORD *)&v64.m[8] = *((_OWORD *)v8 + 2);
    *(_OWORD *)&v64.m[12] = v63;
    *(_OWORD *)&v64.float m00 = v61;
    *(_OWORD *)&v64.m[4] = v62;
    GLKMatrix2 result = GLKMatrix4Invert(&v65, &v64, 0);
    float m01 = v65.m01;
    float m00 = v65.m00;
    uint64_t v26 = *(void *)&v65.m[2];
    float m11 = v65.m11;
    float m10 = v65.m10;
    uint64_t v27 = *(void *)&v65.m[6];
    float m21 = v65.m21;
    float m20 = v65.m20;
    uint64_t v28 = *(void *)&v65.m[10];
    float m31 = v65.m31;
    float m30 = v65.m30;
    _D19 = *(void *)&v65.m[14];
    goto LABEL_12;
  }
  float v34 = *v8;
  float v35 = v8[1];
  float v36 = v8[2];
  float v37 = v8[4];
  float v38 = v8[5];
  float v39 = v8[6];
  float v40 = v8[8];
  float v41 = v8[9];
  float v42 = v8[10];
  float v43 = (float)(v35 * v39) - (float)(v38 * v36);
  float v44 = (float)(v41 * v36) - (float)(v35 * v42);
  float v45 = (float)(v38 * v42) - (float)(v39 * v41);
  float v46 = (float)((float)(v37 * v44) + (float)(v40 * v43)) + (float)(*v8 * v45);
  if (v46 != 0.0)
  {
    float v47 = 1.0 / v46;
    float v48 = (float)(v40 * v39) - (float)(v37 * v42);
    float v49 = (float)(v37 * v41) - (float)(v40 * v38);
    float v50 = (float)(v34 * v42) - (float)(v40 * v36);
    float v51 = (float)(v40 * v35) - (float)(v34 * v41);
    float v52 = (float)(v37 * v36) - (float)(v34 * v39);
    float v53 = (float)(v34 * v38) - (float)(v37 * v35);
    float m00 = v45 * v47;
    float m10 = v48 * v47;
    float m20 = v49 * v47;
    float m01 = v44 * v47;
    float m11 = v50 * v47;
    float m21 = v51 * v47;
    float v54 = v43 * v47;
    float v55 = v52 * v47;
    *(float *)&unsigned int v56 = v53 * v47;
    float v57 = v8[12];
    float v58 = v8[13];
    float v59 = v8[14];
    float m30 = (float)((float)-(float)(v58 * m10) - (float)(m00 * v57)) - (float)(m20 * v59);
    float m31 = (float)((float)-(float)(v58 * m11) - (float)(m01 * v57)) - (float)(m21 * v59);
    float v60 = (float)((float)-(float)(v58 * v55) - (float)(v54 * v57)) - (float)(*(float *)&v56 * v59);
    uint64_t v26 = LODWORD(v57);
    *(float *)&uint64_t v26 = v54;
    uint64_t v27 = LODWORD(v58);
    *(float *)&uint64_t v27 = v55;
    uint64_t v28 = v56;
    __asm { FMOV            V19.2S, #1.0 }
    *(float *)&_D19 = v60;
    goto LABEL_12;
  }
  *retstr = GLKMatrix4Identity;
  return result;
}

GLKMatrix4 *__cdecl GLKMatrixStackGetMatrix4InverseTranspose(GLKMatrix4 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3 = *((void *)stack + 2);
  uint64_t v4 = v3;
  if (*(int *)v3 >= 2)
  {
    int v5 = *(_DWORD *)v3 - 1;
    uint64_t v4 = *((void *)stack + 2);
    do
    {
      uint64_t v4 = *(void *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  uint64_t v6 = *(int *)(v3 + 4);
  uint64_t v7 = *(void *)(v3 + 8);
  float v8 = (float *)(*(void *)(v4 + 24) + v7 * v6);
  GLKMatrix2 result = (GLKMatrix4 *)*((unsigned int *)v8 + 16);
  if (result == 2)
  {
    GLKMatrix2 result = (GLKMatrix4 *)_GLKMatrix4Classify(*(void *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = result;
  }
  if (result < 3)
  {
    if (result)
    {
      float v34 = *v8;
      float v35 = v8[1];
      float v36 = v8[2];
      float v37 = v8[4];
      float v38 = v8[5];
      float v39 = v8[6];
      float v40 = v8[8];
      float v41 = v8[9];
      float v42 = v8[10];
      float v43 = (float)(v35 * v39) - (float)(v38 * v36);
      float v44 = (float)(v41 * v36) - (float)(v35 * v42);
      float v45 = (float)(v38 * v42) - (float)(v39 * v41);
      float v46 = (float)((float)(v37 * v44) + (float)(v40 * v43)) + (float)(*v8 * v45);
      if (v46 == 0.0)
      {
        *retstr = GLKMatrix4Identity;
        goto LABEL_13;
      }
      float v47 = 1.0 / v46;
      float v48 = (float)(v40 * v39) - (float)(v37 * v42);
      float v49 = (float)(v37 * v41) - (float)(v40 * v38);
      float v50 = (float)(v34 * v42) - (float)(v40 * v36);
      float v51 = (float)(v40 * v35) - (float)(v34 * v41);
      float v52 = (float)(v37 * v36) - (float)(v34 * v39);
      float v53 = (float)(v34 * v38) - (float)(v37 * v35);
      float m00 = v45 * v47;
      float m10 = v48 * v47;
      float m20 = v49 * v47;
      float m01 = v44 * v47;
      float m11 = v50 * v47;
      float m21 = v51 * v47;
      float v54 = v43 * v47;
      float v55 = v52 * v47;
      *(float *)&unsigned int v56 = v53 * v47;
      float v57 = v8[12];
      float v58 = v8[13];
      float v59 = v8[14];
      float m30 = (float)((float)-(float)(v58 * m10) - (float)(m00 * v57)) - (float)(m20 * v59);
      float m31 = (float)((float)-(float)(v58 * m11) - (float)(m01 * v57)) - (float)(m21 * v59);
      float v60 = (float)((float)-(float)(v58 * v55) - (float)(v54 * v57)) - (float)(*(float *)&v56 * v59);
      uint64_t v26 = LODWORD(v57);
      *(float *)&uint64_t v26 = v54;
      uint64_t v27 = LODWORD(v58);
      *(float *)&uint64_t v27 = v55;
      uint64_t v28 = v56;
      __asm { FMOV            V19.2S, #1.0 }
      *(float *)&_D19 = v60;
    }
    else
    {
      long long v61 = *(_OWORD *)v8;
      long long v62 = *((_OWORD *)v8 + 1);
      long long v63 = *((_OWORD *)v8 + 3);
      *(_OWORD *)&v67.m[8] = *((_OWORD *)v8 + 2);
      *(_OWORD *)&v67.m[12] = v63;
      *(_OWORD *)&v67.float m00 = v61;
      *(_OWORD *)&v67.m[4] = v62;
      GLKMatrix2 result = GLKMatrix4Invert(&v68, &v67, 0);
      float m01 = v68.m01;
      float m00 = v68.m00;
      uint64_t v26 = *(void *)&v68.m[2];
      float m11 = v68.m11;
      float m10 = v68.m10;
      uint64_t v27 = *(void *)&v68.m[6];
      float m21 = v68.m21;
      float m20 = v68.m20;
      uint64_t v28 = *(void *)&v68.m[10];
      float m31 = v68.m31;
      float m30 = v68.m30;
      _D19 = *(void *)&v68.m[14];
    }
  }
  else
  {
    float v10 = v8[17];
    float m00 = v10 * *v8;
    float m10 = v10 * v8[1];
    float m20 = v10 * v8[2];
    float m01 = v10 * v8[4];
    float m11 = v10 * v8[5];
    float m21 = v10 * v8[6];
    float v17 = v10 * v8[8];
    *(float *)&unsigned int v18 = v10 * v8[9];
    *(float *)&unsigned int v19 = v10 * v8[10];
    float v20 = v8[12];
    float v21 = v8[13];
    float v22 = v8[14];
    float m30 = -(float)((float)((float)(m10 * v21) + (float)(m00 * v20)) + (float)(m20 * v22));
    float m31 = -(float)((float)((float)(m11 * v21) + (float)(m01 * v20)) + (float)(m21 * v22));
    float v25 = -(float)((float)((float)(*(float *)&v18 * v21) + (float)(v17 * v20)) + (float)(*(float *)&v19 * v22));
    uint64_t v26 = LODWORD(v20);
    *(float *)&uint64_t v26 = v17;
    uint64_t v27 = v18;
    uint64_t v28 = v19;
    __asm { FMOV            V19.2S, #1.0 }
    *(float *)&_D19 = v25;
  }
  retstr->float m00 = m00;
  retstr->float m01 = m01;
  *(void *)&retstr->m[2] = v26;
  retstr->float m10 = m10;
  retstr->float m11 = m11;
  *(void *)&retstr->m[6] = v27;
  retstr->float m20 = m20;
  retstr->float m21 = m21;
  *(void *)&retstr->m[10] = v28;
  retstr->float m30 = m30;
  retstr->float m31 = m31;
  *(void *)&retstr->m[14] = _D19;
LABEL_13:
  long long v64 = *(_OWORD *)&retstr->m[4];
  *(_OWORD *)&v68.float m00 = *(_OWORD *)&retstr->m00;
  *(_OWORD *)&v68.m[4] = v64;
  long long v65 = *(_OWORD *)&retstr->m[12];
  *(_OWORD *)&v68.m[8] = *(_OWORD *)&retstr->m[8];
  *(_OWORD *)&v68.m[12] = v65;
  uint64_t v66 = &v68;
  float32x4x4_t v69 = vld4q_f32(&v66->m00);
  *(float32x4x4_t *)retstr = v69;
  return result;
}

GLKMatrix3 *__cdecl GLKMatrixStackGetMatrix3Inverse(GLKMatrix3 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3 = *((void *)stack + 2);
  uint64_t v4 = v3;
  if (*(int *)v3 >= 2)
  {
    int v5 = *(_DWORD *)v3 - 1;
    uint64_t v4 = *((void *)stack + 2);
    do
    {
      uint64_t v4 = *(void *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  uint64_t v6 = *(int *)(v3 + 4);
  uint64_t v7 = *(void *)(v3 + 8);
  float v8 = (float *)(*(void *)(v4 + 24) + v7 * v6);
  GLKMatrix2 result = (GLKMatrix3 *)*((unsigned int *)v8 + 16);
  if (result == 2)
  {
    GLKMatrix2 result = (GLKMatrix3 *)_GLKMatrix4Classify(*(void *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = result;
  }
  if (result < 3)
  {
    if (result)
    {
      float v20 = *v8;
      float v21 = v8[1];
      float v22 = v8[2];
      float v23 = v8[4];
      float v24 = v8[5];
      float v25 = v8[6];
      float v26 = v8[8];
      float v27 = v8[9];
      float v28 = v8[10];
      float v29 = (float)(v21 * v25) - (float)(v24 * v22);
      float v30 = (float)(v27 * v22) - (float)(v21 * v28);
      float v31 = (float)(v24 * v28) - (float)(v25 * v27);
      float v32 = (float)((float)(v23 * v30) + (float)(v26 * v29)) + (float)(*v8 * v31);
      if (v32 == 0.0)
      {
        float m00 = 1.0;
        float m01 = 0.0;
        float m02 = 0.0;
        float m10 = 0.0;
        float m11 = 1.0;
        float m12 = 0.0;
        float m20 = 0.0;
        float m21 = 0.0;
        float m22 = 1.0;
      }
      else
      {
        float v33 = (float)(v26 * v25) - (float)(v23 * v28);
        float v34 = (float)(v20 * v28) - (float)(v26 * v22);
        float v35 = (float)(v23 * v27) - (float)(v26 * v24);
        float v36 = (float)(v26 * v21) - (float)(v20 * v27);
        float v37 = (float)(v23 * v22) - (float)(v20 * v25);
        float v38 = (float)(v20 * v24) - (float)(v23 * v21);
        float v39 = 1.0 / v32;
        float m00 = v31 * v39;
        float m10 = v33 * v39;
        float m20 = v35 * v39;
        float m01 = v30 * v39;
        float m11 = v34 * v39;
        float m21 = v36 * v39;
        float m02 = v29 * v39;
        float m12 = v37 * v39;
        float m22 = v38 * v39;
      }
    }
    else
    {
      long long v40 = *(_OWORD *)v8;
      long long v41 = *((_OWORD *)v8 + 1);
      long long v42 = *((_OWORD *)v8 + 3);
      *(_OWORD *)&v43.m[8] = *((_OWORD *)v8 + 2);
      *(_OWORD *)&v43.m[12] = v42;
      *(_OWORD *)&v43.float m00 = v40;
      *(_OWORD *)&v43.m[4] = v41;
      GLKMatrix2 result = (GLKMatrix3 *)GLKMatrix4Invert(&v44, &v43, 0);
      float m01 = v44.m01;
      float m00 = v44.m00;
      float m02 = v44.m02;
      float m11 = v44.m11;
      float m10 = v44.m10;
      float m12 = v44.m12;
      float m21 = v44.m21;
      float m20 = v44.m20;
      float m22 = v44.m22;
    }
  }
  else
  {
    float v10 = v8[17];
    float m00 = v10 * *v8;
    float m10 = v10 * v8[1];
    float m20 = v10 * v8[2];
    float m01 = v10 * v8[4];
    float m11 = v10 * v8[5];
    float m21 = v10 * v8[6];
    float m02 = v10 * v8[8];
    float m12 = v10 * v8[9];
    float m22 = v10 * v8[10];
  }
  retstr->float m00 = m00;
  retstr->float m01 = m01;
  retstr->float m02 = m02;
  retstr->float m10 = m10;
  retstr->float m11 = m11;
  retstr->float m12 = m12;
  retstr->float m20 = m20;
  retstr->float m21 = m21;
  retstr->float m22 = m22;
  return result;
}

GLKMatrix3 *__cdecl GLKMatrixStackGetMatrix3InverseTranspose(GLKMatrix3 *__return_ptr retstr, GLKMatrixStackRef stack)
{
  uint64_t v3 = *((void *)stack + 2);
  uint64_t v4 = v3;
  if (*(int *)v3 >= 2)
  {
    int v5 = *(_DWORD *)v3 - 1;
    uint64_t v4 = *((void *)stack + 2);
    do
    {
      uint64_t v4 = *(void *)(v4 + 32);
      --v5;
    }
    while (v5);
  }
  uint64_t v6 = *(int *)(v3 + 4);
  uint64_t v7 = *(void *)(v3 + 8);
  float v8 = (float *)(*(void *)(v4 + 24) + v7 * v6);
  GLKMatrix2 result = (GLKMatrix3 *)*((unsigned int *)v8 + 16);
  if (result == 2)
  {
    GLKMatrix2 result = (GLKMatrix3 *)_GLKMatrix4Classify(*(void *)(v4 + 24) + v7 * v6, v8 + 17);
    *((_DWORD *)v8 + 16) = result;
  }
  if (result < 3)
  {
    if (result)
    {
      float v34 = *v8;
      float v35 = v8[1];
      float v36 = v8[2];
      float v37 = v8[4];
      float v38 = v8[5];
      float v39 = v8[6];
      float v40 = v8[8];
      float v41 = v8[9];
      float v42 = v8[10];
      float v43 = (float)(v35 * v39) - (float)(v38 * v36);
      float v44 = (float)(v41 * v36) - (float)(v35 * v42);
      float v45 = (float)(v38 * v42) - (float)(v39 * v41);
      float v46 = (float)((float)(v37 * v44) + (float)(v40 * v43)) + (float)(*v8 * v45);
      if (v46 == 0.0)
      {
        long long v11 = *(_OWORD *)&GLKMatrix4Identity.m00;
        long long v12 = *(_OWORD *)&GLKMatrix4Identity.m[4];
        long long v13 = *(_OWORD *)&GLKMatrix4Identity.m[8];
        long long v23 = *(_OWORD *)&GLKMatrix4Identity.m[12];
        goto LABEL_13;
      }
      float v47 = 1.0 / v46;
      float v48 = (float)(v40 * v39) - (float)(v37 * v42);
      float v49 = (float)(v37 * v41) - (float)(v40 * v38);
      float v50 = (float)(v34 * v42) - (float)(v40 * v36);
      float v51 = (float)(v40 * v35) - (float)(v34 * v41);
      float v52 = (float)(v37 * v36) - (float)(v34 * v39);
      float v53 = (float)(v34 * v38) - (float)(v37 * v35);
      *(float *)&long long v11 = v45 * v47;
      *(float *)&long long v12 = v48 * v47;
      *(float *)&long long v13 = v49 * v47;
      float m01 = v44 * v47;
      float m11 = v50 * v47;
      float m21 = v51 * v47;
      float v54 = v43 * v47;
      *(float *)&unsigned int v55 = v52 * v47;
      float v56 = v8[12];
      float v57 = v8[13];
      float v58 = v8[14];
      *(float *)&long long v23 = (float)((float)-(float)(v57 * *(float *)&v12) - (float)((float)(v45 * v47) * v56))
                     - (float)(*(float *)&v13 * v58);
      float m31 = (float)((float)-(float)(v57 * m11) - (float)((float)(v44 * v47) * v56)) - (float)(m21 * v58);
      float v59 = (float)((float)-(float)(v57 * *(float *)&v55) - (float)(v54 * v56)) - (float)((float)(v53 * v47) * v58);
      __asm { FMOV            V16.2S, #1.0 }
      *(float *)&_D16 = v59;
      HIDWORD(v31) = 0;
      *(float *)&uint64_t v31 = v53 * v47;
      uint64_t v33 = LODWORD(v58);
      uint64_t v32 = v55;
      *(float *)&uint64_t v33 = v54;
    }
    else
    {
      long long v60 = *(_OWORD *)v8;
      long long v61 = *((_OWORD *)v8 + 1);
      long long v62 = *((_OWORD *)v8 + 3);
      *(_OWORD *)&v64.m[8] = *((_OWORD *)v8 + 2);
      *(_OWORD *)&v64.m[12] = v62;
      *(_OWORD *)&v64.float m00 = v60;
      *(_OWORD *)&v64.m[4] = v61;
      GLKMatrix2 result = (GLKMatrix3 *)GLKMatrix4Invert(&v65, &v64, 0);
      float m01 = v65.m01;
      *(float *)&long long v11 = v65.m00;
      uint64_t v33 = *(void *)&v65.m[2];
      float m11 = v65.m11;
      *(float *)&long long v12 = v65.m10;
      uint64_t v32 = *(void *)&v65.m[6];
      float m21 = v65.m21;
      *(float *)&long long v13 = v65.m20;
      uint64_t v31 = *(void *)&v65.m[10];
      float m31 = v65.m31;
      *(float *)&long long v23 = v65.m30;
      _D16 = *(void *)&v65.m[14];
    }
  }
  else
  {
    float v10 = v8[17];
    *(float *)&long long v11 = v10 * *v8;
    *(float *)&long long v12 = v10 * v8[1];
    *(float *)&long long v13 = v10 * v8[2];
    float m01 = v10 * v8[4];
    float m11 = v10 * v8[5];
    float m21 = v10 * v8[6];
    float v17 = v10 * v8[8];
    *(float *)&unsigned int v18 = v10 * v8[9];
    *(float *)&unsigned int v19 = v10 * v8[10];
    float v20 = v8[12];
    float v21 = v8[13];
    float v22 = v8[14];
    *(float *)&long long v23 = -(float)((float)((float)(*(float *)&v12 * v21) + (float)(*(float *)&v11 * v20))
                            + (float)(*(float *)&v13 * v22));
    float m31 = -(float)((float)((float)(m11 * v21) + (float)(m01 * v20)) + (float)(m21 * v22));
    float v25 = -(float)((float)((float)(*(float *)&v18 * v21) + (float)(v17 * v20)) + (float)(*(float *)&v19 * v22));
    __asm { FMOV            V16.2S, #1.0 }
    *(float *)&_D16 = v25;
    uint64_t v31 = v19;
    uint64_t v33 = LODWORD(v22);
    uint64_t v32 = v18;
    *(float *)&uint64_t v33 = v17;
  }
  *((float *)&v11 + 1) = m01;
  *((void *)&v11 + 1) = v33;
  *((float *)&v12 + 1) = m11;
  *((void *)&v12 + 1) = v32;
  *((float *)&v13 + 1) = m21;
  *((void *)&v13 + 1) = v31;
  *((float *)&v23 + 1) = m31;
  *((void *)&v23 + 1) = _D16;
LABEL_13:
  *(_OWORD *)&v65.float m00 = v11;
  *(_OWORD *)&v65.m[4] = v12;
  *(_OWORD *)&v65.m[8] = v13;
  *(_OWORD *)&v65.m[12] = v23;
  long long v63 = &v65;
  float32x4x4_t v66 = vld4q_f32(&v63->m00);
  v66.val[0].i32[3] = v66.val[1].i32[0];
  *(float32x4_t *)&retstr->float m00 = v66.val[0];
  *(int8x16_t *)&retstr->m[4] = vextq_s8(vextq_s8((int8x16_t)v66.val[1], (int8x16_t)v66.val[1], 0xCuLL), (int8x16_t)v66.val[2], 8uLL);
  LODWORD(retstr->m22) = v66.val[2].i32[2];
  return result;
}

void GLKMatrixStackMultiplyMatrix4(GLKMatrixStackRef stack, GLKMatrix4 *matrix)
{
  uint64_t v2 = *((void *)stack + 2);
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *((void *)stack + 2);
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  int v5 = (float32x4_t *)(*(void *)(v3 + 24) + *(void *)(v2 + 8) * *(int *)(v2 + 4));
  float32x4_t v6 = v5[1];
  float32x4_t v7 = v5[2];
  float32x4_t v8 = v5[3];
  float32x4_t v9 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m[4])), v6, *(float32x2_t *)&matrix->m[4], 1), v7, *(float32x4_t *)&matrix->m[4], 2), v8, *(float32x4_t *)&matrix->m[4], 3);
  float32x4_t v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m[8])), v6, *(float32x2_t *)&matrix->m[8], 1), v7, *(float32x4_t *)&matrix->m[8], 2), v8, *(float32x4_t *)&matrix->m[8], 3);
  float32x4_t v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m[12])), v6, *(float32x2_t *)&matrix->m[12], 1), v7, *(float32x4_t *)&matrix->m[12], 2), v8, *(float32x4_t *)&matrix->m[12], 3);
  *int v5 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v5, COERCE_FLOAT(*(_OWORD *)&matrix->m00)), v6, *(float32x2_t *)&matrix->m00, 1), v7, *(float32x4_t *)&matrix->m00, 2), v8, *(float32x4_t *)&matrix->m00, 3);
  v5[1] = v9;
  v5[2] = v10;
  v5[3] = v11;
  if (((LODWORD(matrix->m13) | LODWORD(matrix->m03) | LODWORD(matrix->m23)) & 0x7FFFFFFF) != 0
    || LODWORD(matrix->m33) != 1065353216)
  {
    unsigned int v12 = 0;
  }
  else
  {
    unsigned int v12 = 2;
  }
  if (v5[4].i32[0] < v12) {
    unsigned int v12 = v5[4].u32[0];
  }
  v5[4].i32[0] = v12;
  ++v5[4].i32[2];
}

void GLKMatrixStackMultiplyMatrixStack(GLKMatrixStackRef stackLeft, GLKMatrixStackRef stackRight)
{
  uint64_t v2 = *((void *)stackLeft + 2);
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *((void *)stackLeft + 2);
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v6 = *(int *)(v2 + 4);
  uint64_t v7 = *(void *)(v2 + 8);
  uint64_t v8 = *((void *)stackRight + 2);
  uint64_t v9 = v8;
  if (*(int *)v8 >= 2)
  {
    int v10 = *(_DWORD *)v8 - 1;
    uint64_t v9 = *((void *)stackRight + 2);
    do
    {
      uint64_t v9 = *(void *)(v9 + 32);
      --v10;
    }
    while (v10);
  }
  float32x4_t v11 = (float32x4_t *)(v5 + v7 * v6);
  unsigned int v12 = (float32x2_t *)(*(void *)(v9 + 24) + *(void *)(v8 + 8) * *(int *)(v8 + 4));
  float32x4_t v13 = v11[1];
  float32x4_t v14 = v11[2];
  float32x4_t v15 = v11[3];
  float32x4_t v16 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12[2].f32)), v13, v12[2], 1), v14, *(float32x4_t *)v12[2].f32, 2), v15, *(float32x4_t *)v12[2].f32, 3);
  float32x4_t v17 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12[4].f32)), v13, v12[4], 1), v14, *(float32x4_t *)v12[4].f32, 2), v15, *(float32x4_t *)v12[4].f32, 3);
  float32x4_t v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12[6].f32)), v13, v12[6], 1), v14, *(float32x4_t *)v12[6].f32, 2), v15, *(float32x4_t *)v12[6].f32, 3);
  *float32x4_t v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*v11, COERCE_FLOAT(*(_OWORD *)v12->f32)), v13, *v12, 1), v14, *(float32x4_t *)v12->f32, 2), v15, *(float32x4_t *)v12->f32, 3);
  v11[1] = v16;
  v11[2] = v17;
  v11[3] = v18;
  unsigned __int32 v19 = v12[8].u32[0];
  if (v11[4].i32[0] < v19) {
    unsigned __int32 v19 = v11[4].u32[0];
  }
  v11[4].i32[0] = v19;
  ++v11[4].i32[2];
}

void GLKMatrixStackTranslate(GLKMatrixStackRef stack, float tx, float ty, float tz)
{
  uint64_t v4 = *((void *)stack + 2);
  uint64_t v5 = v4;
  if (*(int *)v4 >= 2)
  {
    int v6 = *(_DWORD *)v4 - 1;
    uint64_t v5 = *((void *)stack + 2);
    do
    {
      uint64_t v5 = *(void *)(v5 + 32);
      --v6;
    }
    while (v6);
  }
  uint64_t v7 = (float32x4_t *)(*(void *)(v5 + 24) + *(void *)(v4 + 8) * *(int *)(v4 + 4));
  v7[3] = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v7[1], ty), *v7, tx), v7[2], tz), v7[3]);
  unsigned int v8 = v7[4].u32[0];
  if (v8 >= 4) {
    unsigned int v8 = 4;
  }
  v7[4].i32[0] = v8;
  ++v7[4].i32[2];
}

void GLKMatrixStackTranslateWithVector3(GLKMatrixStackRef stack, GLKVector3 translationVector)
{
  uint64_t v5 = *((void *)stack + 2);
  uint64_t v6 = v5;
  if (*(int *)v5 >= 2)
  {
    int v7 = *(_DWORD *)v5 - 1;
    uint64_t v6 = *((void *)stack + 2);
    do
    {
      uint64_t v6 = *(void *)(v6 + 32);
      --v7;
    }
    while (v7);
  }
  unsigned int v8 = (float32x4_t *)(*(void *)(v6 + 24) + *(void *)(v5 + 8) * *(int *)(v5 + 4));
  v8[3] = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v8[1], v3), *v8, v2), v8[2], v4), v8[3]);
  unsigned int v9 = v8[4].u32[0];
  if (v9 >= 4) {
    unsigned int v9 = 4;
  }
  v8[4].i32[0] = v9;
  ++v8[4].i32[2];
}

void GLKMatrixStackTranslateWithVector4(GLKMatrixStackRef stack, GLKVector4 translationVector)
{
  uint64_t v5 = *((void *)stack + 2);
  uint64_t v6 = v5;
  if (*(int *)v5 >= 2)
  {
    int v7 = *(_DWORD *)v5 - 1;
    uint64_t v6 = *((void *)stack + 2);
    do
    {
      uint64_t v6 = *(void *)(v6 + 32);
      --v7;
    }
    while (v7);
  }
  unsigned int v8 = (float32x4_t *)(*(void *)(v6 + 24) + *(void *)(v5 + 8) * *(int *)(v5 + 4));
  v8[3] = vaddq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v8[1], v3), *v8, v2), v8[2], v4), v8[3]);
  unsigned int v9 = v8[4].u32[0];
  if (v9 >= 4) {
    unsigned int v9 = 4;
  }
  v8[4].i32[0] = v9;
  ++v8[4].i32[2];
}

void GLKMatrixStackScale(GLKMatrixStackRef stack, float sx, float sy, float sz)
{
  uint64_t v4 = *((void *)stack + 2);
  uint64_t v5 = v4;
  if (*(int *)v4 >= 2)
  {
    int v6 = *(_DWORD *)v4 - 1;
    uint64_t v5 = *((void *)stack + 2);
    do
    {
      uint64_t v5 = *(void *)(v5 + 32);
      --v6;
    }
    while (v6);
  }
  int v7 = (float32x4_t *)(*(void *)(v5 + 24) + *(void *)(v4 + 8) * *(int *)(v4 + 4));
  float32x4_t v8 = vmulq_n_f32(v7[1], sy);
  float32x4_t v9 = vmulq_n_f32(v7[2], sz);
  *int v7 = vmulq_n_f32(*v7, sx);
  v7[1] = v8;
  v7[2] = v9;
  BOOL v10 = SLODWORD(sx) == SLODWORD(sy);
  BOOL v11 = SLODWORD(sy) == SLODWORD(sz);
  float v12 = 1.0 / sx;
  BOOL v13 = !v10 || !v11;
  if (v10 && v11) {
    unsigned int v14 = 3;
  }
  else {
    unsigned int v14 = 1;
  }
  if (v13) {
    float v12 = 0.0;
  }
  if (v7[4].i32[0] < v14) {
    unsigned int v14 = v7[4].u32[0];
  }
  v7[4].i32[0] = v14;
  v7[4].f32[1] = (float)(v12 * v12) * v7[4].f32[1];
  ++v7[4].i32[2];
}

void GLKMatrixStackRotate(GLKMatrixStackRef stack, float radians, float x, float y, float z)
{
  uint64_t v5 = *((void *)stack + 2);
  uint64_t v6 = v5;
  if (*(int *)v5 >= 2)
  {
    int v7 = *(_DWORD *)v5 - 1;
    uint64_t v6 = *((void *)stack + 2);
    do
    {
      uint64_t v6 = *(void *)(v6 + 32);
      --v7;
    }
    while (v7);
  }
  float32x4_t v8 = (float32x4_t *)(*(void *)(v6 + 24) + *(void *)(v5 + 8) * *(int *)(v5 + 4));
  float32x4_t v17 = *v8;
  float32x4_t v18 = v8[1];
  float32x4_t v19 = v8[2];
  float32x4_t v20 = v8[3];
  float v9 = 1.0 / sqrtf((float)((float)(y * y) + (float)(x * x)) + (float)(z * z));
  float v10 = v9 * x;
  float v11 = v9 * y;
  float v12 = v9 * z;
  __float2 v13 = __sincosf_stret(radians);
  float v14 = (float)(1.0 - v13.__cosval) * v10;
  float v15 = (float)(1.0 - v13.__cosval) * v11;
  *float32x4_t v8 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v17, v13.__cosval + (float)(v14 * v10)), v18, (float)(v13.__sinval * v12) + (float)(v14 * v11)), v19, -(float)((float)(v13.__sinval * v11) - (float)(v14 * v12))), (float32x4_t)0, v20);
  v8[1] = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v17, -(float)((float)(v13.__sinval * v12) - (float)(v14 * v11))), v18, v13.__cosval + (float)(v15 * v11)), v19, (float)(v13.__sinval * v10) + (float)(v15 * v12)), (float32x4_t)0, v20);
  v8[2] = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v17, (float)(v13.__sinval * v11) + (float)(v14 * v12)), v18, -(float)((float)(v13.__sinval * v10) - (float)(v15 * v12))), v19, v13.__cosval + (float)((float)((float)(1.0 - v13.__cosval) * v12) * v12)), (float32x4_t)0, v20);
  v8[3] = vaddq_f32(v20, vmlaq_f32(vmlaq_f32(vmulq_f32(v17, (float32x4_t)0), (float32x4_t)0, v18), (float32x4_t)0, v19));
  unsigned int v16 = v8[4].u32[0];
  if (v16 >= 4) {
    unsigned int v16 = 4;
  }
  v8[4].i32[0] = v16;
  ++v8[4].i32[2];
}

void GLKMatrixStackRotateX(GLKMatrixStackRef stack, float radians)
{
  uint64_t v2 = *((void *)stack + 2);
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *((void *)stack + 2);
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = (float32x4_t *)(*(void *)(v3 + 24) + *(void *)(v2 + 8) * *(int *)(v2 + 4));
  float32x4_t v10 = *v5;
  float32x4_t v11 = v5[1];
  float32x4_t v12 = v5[2];
  float32x4_t v13 = v5[3];
  __float2 v7 = __sincosf_stret(radians);
  v6.f32[0] = v7.__sinval;
  float32x4_t v8 = vmulq_f32(v10, (float32x4_t)0);
  *uint64_t v5 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v10, (float32x4_t)0, v11), (float32x4_t)0, v12), (float32x4_t)0, v13);
  v5[1] = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(v8, v11, v7.__cosval), v12, v7.__sinval), (float32x4_t)0, v13);
  v5[2] = vmlaq_f32(vmlaq_n_f32(vmlsq_lane_f32(v8, v11, v6, 0), v12, v7.__cosval), (float32x4_t)0, v13);
  v5[3] = vaddq_f32(v13, vmlaq_f32(vmlaq_f32(v8, (float32x4_t)0, v11), (float32x4_t)0, v12));
  unsigned int v9 = v5[4].u32[0];
  if (v9 >= 4) {
    unsigned int v9 = 4;
  }
  v5[4].i32[0] = v9;
  ++v5[4].i32[2];
}

void GLKMatrixStackRotateY(GLKMatrixStackRef stack, float radians)
{
  uint64_t v2 = *((void *)stack + 2);
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *((void *)stack + 2);
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = (float32x4_t *)(*(void *)(v3 + 24) + *(void *)(v2 + 8) * *(int *)(v2 + 4));
  float32x4_t v10 = *v5;
  float32x4_t v11 = v5[1];
  float32x4_t v12 = v5[2];
  float32x4_t v13 = v5[3];
  __float2 v7 = __sincosf_stret(radians);
  v6.f32[0] = v7.__sinval;
  float32x4_t v8 = vmulq_f32(v10, (float32x4_t)0);
  *uint64_t v5 = vmlaq_f32(vmlsq_lane_f32(vmlaq_f32(vmulq_n_f32(v10, v7.__cosval), (float32x4_t)0, v11), v12, v6, 0), (float32x4_t)0, v13);
  v5[1] = vmlaq_f32(vmlaq_f32(vaddq_f32(v11, v8), (float32x4_t)0, v12), (float32x4_t)0, v13);
  v5[2] = vmlaq_f32(vmlaq_n_f32(vmlaq_f32(vmulq_n_f32(v10, v7.__sinval), (float32x4_t)0, v11), v12, v7.__cosval), (float32x4_t)0, v13);
  v5[3] = vaddq_f32(v13, vmlaq_f32(vmlaq_f32(v8, (float32x4_t)0, v11), (float32x4_t)0, v12));
  unsigned int v9 = v5[4].u32[0];
  if (v9 >= 4) {
    unsigned int v9 = 4;
  }
  v5[4].i32[0] = v9;
  ++v5[4].i32[2];
}

void GLKMatrixStackRotateZ(GLKMatrixStackRef stack, float radians)
{
  uint64_t v2 = *((void *)stack + 2);
  uint64_t v3 = v2;
  if (*(int *)v2 >= 2)
  {
    int v4 = *(_DWORD *)v2 - 1;
    uint64_t v3 = *((void *)stack + 2);
    do
    {
      uint64_t v3 = *(void *)(v3 + 32);
      --v4;
    }
    while (v4);
  }
  uint64_t v5 = (float32x4_t *)(*(void *)(v3 + 24) + *(void *)(v2 + 8) * *(int *)(v2 + 4));
  float32x4_t v9 = *v5;
  float32x4_t v10 = v5[1];
  float32x4_t v11 = v5[2];
  float32x4_t v12 = v5[3];
  __float2 v6 = __sincosf_stret(radians);
  float32x4_t v7 = vmlaq_f32(vmulq_f32(v9, (float32x4_t)0), (float32x4_t)0, v10);
  *uint64_t v5 = vmlaq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v9, v6.__cosval), v10, v6.__sinval), (float32x4_t)0, v11), (float32x4_t)0, v12);
  v5[1] = vmlaq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v9, -v6.__sinval), v10, v6.__cosval), (float32x4_t)0, v11), (float32x4_t)0, v12);
  v5[2] = vmlaq_f32(vaddq_f32(v11, v7), (float32x4_t)0, v12);
  v5[3] = vaddq_f32(v12, vmlaq_f32(v7, (float32x4_t)0, v11));
  unsigned int v8 = v5[4].u32[0];
  if (v8 >= 4) {
    unsigned int v8 = 4;
  }
  v5[4].i32[0] = v8;
  ++v5[4].i32[2];
}

void _GLKMatrixDestroy(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    do
    {
      uint64_t v2 = *(void *)(v1 + 32);
      free(*(void **)(v1 + 24));
      free((void *)v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

CFStringRef _GLKMatrixFormatDescription(void *cf, const __CFDictionary *a2)
{
  if (!cf) {
    return 0;
  }
  uint64_t v4 = cf[2];
  uint64_t v5 = v4;
  if (*(int *)v4 >= 2)
  {
    int v6 = *(_DWORD *)v4 - 1;
    uint64_t v5 = cf[2];
    do
    {
      uint64_t v5 = *(void *)(v5 + 32);
      --v6;
    }
    while (v6);
  }
  uint64_t v7 = *(void *)(v5 + 24);
  if (!v7) {
    return 0;
  }
  unsigned int v8 = (float *)(v7 + *(void *)(v4 + 8) * *(int *)(v4 + 4));
  CFAllocatorRef v9 = CFGetAllocator(cf);
  return CFStringCreateWithFormat(v9, a2, @"<GLKMatrixStack %p [%p]>\nstack size: %d\ncurrent matrix:\n%f %f %f %f\n%f %f %f %f\n%f %f %f %f\n%f %f %f %f", cf, v9, (*(_DWORD *)(cf[2] + 4) + (*(_DWORD *)cf[2] - 1) * *(_DWORD *)(cf[2] + 16) + 1), *v8, v8[1], v8[2], v8[3], v8[4], v8[5], v8[6], v8[7], v8[8], v8[9], v8[10], v8[11], v8[12],
           v8[13],
           v8[14],
           v8[15]);
}

CFStringRef _GLKMatrixDebugDescription(void *a1)
{
  return _GLKMatrixFormatDescription(a1, 0);
}

uint64_t _GLKMatrix4Classify(uint64_t a1, float *a2)
{
  if (((*(_DWORD *)(a1 + 28) | *(_DWORD *)(a1 + 12) | *(_DWORD *)(a1 + 44)) & 0x7FFFFFFF) != 0
    || *(_DWORD *)(a1 + 60) != 1065353216)
  {
    return 0;
  }
  float v2 = *(float *)a1;
  float v3 = *(float *)(a1 + 4);
  float v4 = *(float *)(a1 + 8);
  float v5 = *(float *)(a1 + 16);
  float v6 = *(float *)(a1 + 20);
  float v7 = *(float *)(a1 + 24);
  float v8 = (float)((float)(v3 * v3) + (float)(v2 * v2)) + (float)(v4 * v4);
  float v9 = v8 * 0.0078125;
  if (fabsf((float)((float)(v3 * v6) + (float)(*(float *)a1 * v5)) + (float)(v4 * v7)) > (float)(v8 * 0.0078125)) {
    return 1;
  }
  float v10 = *(float *)(a1 + 32);
  float v11 = *(float *)(a1 + 36);
  float v12 = *(float *)(a1 + 40);
  float v13 = fabsf((float)((float)(v6 * v11) + (float)(v5 * v10)) + (float)(v7 * v12));
  BOOL v14 = fabsf((float)((float)(v3 * v11) + (float)(v2 * v10)) + (float)(v4 * v12)) <= v9 && v13 <= v9;
  if (!v14
    || vabds_f32(v8, (float)((float)(v6 * v6) + (float)(v5 * v5)) + (float)(v7 * v7)) > v9
    || vabds_f32(v8, (float)((float)(v11 * v11) + (float)(v10 * v10)) + (float)(v12 * v12)) > v9)
  {
    return 1;
  }
  *a2 = 1.0 / v8;
  if (fabsf(v8 + -1.0) <= v9) {
    return 4;
  }
  else {
    return 3;
  }
}

uint64_t _GLKTextureErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSDictionary dictionaryWithObject:a2 forKey:@"GLKTextureLoaderErrorKey"];
  float v4 = (void *)MEMORY[0x263F087E8];

  return [v4 errorWithDomain:@"GLKTextureLoaderErrorDomain" code:a1 userInfo:v3];
}

uint64_t _GLKTextureErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"GLKTextureLoaderErrorDomain" code:a1 userInfo:a2];
}

uint64_t _GLKTextureErrorWithCode(uint64_t a1)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"GLKTextureLoaderErrorDomain" code:a1 userInfo:0];
}

GLKMatrix3 *__cdecl GLKMatrix3Invert(GLKMatrix3 *__return_ptr retstr, GLKMatrix3 *matrix, BOOL *isInvertible)
{
  uint64_t v3 = 0;
  uint64_t v56 = *MEMORY[0x263EF8340];
  int8x16_t v4 = 0uLL;
  memset(v55, 0, sizeof(v55));
  long long v54 = 0u;
  int v53 = -1;
  *(_DWORD *)unsigned int v55 = -1;
  *(_DWORD *)&v55[20] = -1;
  int32x2_t v5 = *(int32x2_t *)&matrix->m[3];
  int32x2_t v6 = *(int32x2_t *)&matrix->m[5];
  *(int32x2_t *)v7.f32 = vzip1_s32(*(int32x2_t *)&matrix->m00, v5);
  *(int32x2_t *)v10.f32 = vzip2_s32(*(int32x2_t *)&matrix->m00, v5);
  *(int32x2_t *)v13.f32 = vzip1_s32(*(int32x2_t *)&matrix->m[2], v6);
  *(int32x2_t *)&v7.u32[2] = vdup_lane_s32(v6, 1);
  p_float m21 = &matrix->m21;
  float32x2_t v9 = vld1_dup_f32(p_m21);
  *(float32x2_t *)&v10.u32[2] = v9;
  p_float m22 = &matrix->m22;
  float32x2_t v12 = vld1_dup_f32(p_m22);
  *(float32x2_t *)&v13.u32[2] = v12;
  uint32x2_t v14 = (uint32x2_t)-1;
  int8x16_t v15 = (int8x16_t)xmmword_2187C15F0;
  unsigned int v16 = 50462976;
  __asm { FMOV            V18.4S, #1.0 }
  int8x16_t v22 = 0uLL;
  do
  {
    int8x16_t v23 = vbicq_s8((int8x16_t)v7, v15);
    uint32x2_t v24 = (uint32x2_t)vextq_s8(v23, v23, 8uLL).u64[0];
    int8x8_t v25 = (int8x8_t)vcgt_u32(v24, *(uint32x2_t *)v23.i8);
    *(uint32x2_t *)v23.i8 = vmax_u32(*(uint32x2_t *)v23.i8, v24);
    int32x2_t v26 = (int32x2_t)vbsl_s8(v25, (int8x8_t)0xF0E0D0C0B0A0908, (int8x8_t)0x706050403020100);
    int32x4_t v27 = vdupq_lane_s32((int32x2_t)vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)vrev64_s32(*(int32x2_t *)v23.i8), *(uint32x2_t *)v23.i8), (int8x8_t)vdup_lane_s32(v26, 1), (int8x8_t)v26), 0);
    uint32x2_t v14 = vmin_u32(v14, vpmax_u32(*(uint32x2_t *)v23.i8, *(uint32x2_t *)v23.i8));
    int8x16_t v4 = vbslq_s8(*(int8x16_t *)((char *)&v53 + v3), (int8x16_t)v27, v4);
    int8x16_t v28 = (int8x16_t)vceqq_s32(v27, (int32x4_t)xmmword_2187C1560);
    int8x16_t v22 = vbslq_s8(v28, (int8x16_t)vdupq_n_s32(v16), v22);
    v16 += 67372036;
    float32x4_t v29 = vrecpeq_f32(v7);
    float32x4_t v30 = vmulq_f32(v29, vrecpsq_f32(v7, v29));
    int8x16_t v31 = (int8x16_t)vmulq_f32(vrecpsq_f32(v7, v30), v30);
    float32x4_t v32 = (float32x4_t)vbslq_s8(v28, v31, _Q18);
    float32x4_t v33 = vmulq_f32(v10, v32);
    float32x4_t v34 = vmulq_f32(v13, v32);
    float32x4_t v35 = (float32x4_t)vandq_s8(v31, v28);
    *(int8x8_t *)v31.i8 = vqtbl1_s8((int8x16_t)v33, *(int8x8_t *)v27.i8);
    *(int8x8_t *)v36.i8 = vqtbl1_s8((int8x16_t)v34, *(int8x8_t *)v27.i8);
    *(int8x8_t *)v27.i8 = vqtbl1_s8((int8x16_t)v35, *(int8x8_t *)v27.i8);
    v31.i64[1] = v31.i64[0];
    v36.i64[1] = v36.i64[0];
    v27.i64[1] = v27.i64[0];
    float32x4_t v37 = vmulq_f32(vnegq_f32(v7), v32);
    float32x4_t v7 = vmlaq_f32(v33, (float32x4_t)vbicq_s8(v31, v28), v37);
    float32x4_t v10 = vmlaq_f32(v34, (float32x4_t)vbicq_s8(v36, v28), v37);
    float32x4_t v13 = vmlaq_f32(v35, (float32x4_t)vbicq_s8((int8x16_t)v27, v28), v37);
    int8x16_t v15 = vorrq_s8(v15, v28);
    v3 += 16;
  }
  while (v3 != 48);
  if (v14.i32[0])
  {
    int8x8_t v38 = (int8x8_t)vextq_s8(v4, v4, 8uLL).u64[0];
    *(int8x8_t *)v39.i8 = vqtbl1_s8((int8x16_t)v7, *(int8x8_t *)v4.i8);
    v39.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v7, v38);
    *(int8x8_t *)v40.i8 = vqtbl1_s8((int8x16_t)v10, *(int8x8_t *)v4.i8);
    v40.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v10, v38);
    *(int8x8_t *)v41.i8 = vqtbl1_s8((int8x16_t)v13, *(int8x8_t *)v4.i8);
    v41.u64[1] = (unint64_t)vqtbl1_s8((int8x16_t)v13, v38);
    int32x4_t v42 = vzip1q_s32(v39, v41);
    int32x4_t v43 = vzip1q_s32(v40, v40);
    int8x16_t v44 = (int8x16_t)vzip1q_s32(v42, v43);
    int8x16_t v45 = (int8x16_t)vzip2q_s32(v42, v43);
    int8x16_t v46 = (int8x16_t)vzip1q_s32(vzip2q_s32(v39, v41), vdupq_laneq_s32(v40, 2));
    v39.i64[0] = vextq_s8(v22, v22, 8uLL).u64[0];
    LODWORD(v47) = vqtbl1_s8(v44, *(int8x8_t *)v39.i8).u32[0];
    int8x8_t v48 = vqtbl1_s8(v44, *(int8x8_t *)v22.i8);
    int8x8_t v49 = vqtbl1_s8(v45, *(int8x8_t *)v22.i8);
    LODWORD(v50) = vqtbl1_s8(v45, *(int8x8_t *)v39.i8).u32[0];
    int8x8_t v51 = vqtbl1_s8(v46, *(int8x8_t *)v22.i8);
    LODWORD(v52) = vqtbl1_s8(v46, *(int8x8_t *)v39.i8).u32[0];
    if (isInvertible) {
      *isInvertible = 1;
    }
    *(int8x8_t *)&retstr->float m00 = v48;
    retstr->float m02 = v47;
    *(int8x8_t *)&retstr->m[3] = v49;
    retstr->float m12 = v50;
    *(int8x8_t *)&retstr->m[6] = v51;
    retstr->float m22 = v52;
  }
  else
  {
    if (isInvertible) {
      *isInvertible = 0;
    }
    retstr->float m22 = 1.0;
    *(_OWORD *)&retstr->float m00 = *(_OWORD *)&GLKMatrix3Identity.m00;
    *(_OWORD *)&retstr->m[4] = *(_OWORD *)&GLKMatrix3Identity.m[4];
  }
  return matrix;
}

GLKMatrix3 *__cdecl GLKMatrix3InvertAndTranspose(GLKMatrix3 *__return_ptr retstr, GLKMatrix3 *matrix, BOOL *isInvertible)
{
  float m01 = matrix->m01;
  float m02 = matrix->m02;
  float m10 = matrix->m10;
  float m11 = matrix->m11;
  float m12 = matrix->m12;
  float m20 = matrix->m20;
  float m21 = matrix->m21;
  float m22 = matrix->m22;
  matrixa.float m00 = matrix->m00;
  *(void *)&matrixa.m[1] = __PAIR64__(LODWORD(m20), LODWORD(m10));
  *(void *)&matrixa.m[3] = __PAIR64__(LODWORD(m11), LODWORD(m01));
  *(void *)&matrixa.m[5] = __PAIR64__(LODWORD(m02), LODWORD(m21));
  *(void *)&matrixa.m[7] = __PAIR64__(LODWORD(m22), LODWORD(m12));
  return GLKMatrix3Invert(retstr, &matrixa, isInvertible);
}

void sub_2187BB584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2187BB75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSString *__cdecl NSStringFromGLKMatrix2(GLKMatrix2 matrix)
{
  return (NSString *)[NSString stringWithFormat:@"{{%g, %g}, {%g, %g}}", v1, v2, v3, v4];
}

NSString *__cdecl NSStringFromGLKMatrix3(GLKMatrix3 *matrix)
{
  return (NSString *)[NSString stringWithFormat:@"{{%g, %g, %g}, {%g, %g, %g}, {%g, %g, %g}}", matrix->m00, matrix->m01, matrix->m02, matrix->m10, matrix->m11, matrix->m12, matrix->m20, matrix->m21, matrix->m22];
}

NSString *__cdecl NSStringFromGLKMatrix4(GLKMatrix4 *matrix)
{
  return (NSString *)[NSString stringWithFormat:@"{{%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}}", matrix->m00, matrix->m01, matrix->m02, matrix->m03, matrix->m10, matrix->m11, matrix->m12, matrix->m13, matrix->m20, matrix->m21, matrix->m22, matrix->m23, matrix->m30, matrix->m31, matrix->m32, matrix->m33];
}

NSString *__cdecl NSStringFromGLKVector2(GLKVector2 vector)
{
  return (NSString *)[NSString stringWithFormat:@"{%g, %g}", v1, v2];
}

NSString *__cdecl NSStringFromGLKVector3(GLKVector3 vector)
{
  return (NSString *)[NSString stringWithFormat:@"{%g, %g, %g}", v1, v2, v3];
}

NSString *__cdecl NSStringFromGLKVector4(GLKVector4 vector)
{
  return (NSString *)[NSString stringWithFormat:@"{%g, %g, %g, %g}", v1, v2, v3, v4];
}

NSString *__cdecl NSStringFromGLKQuaternion(GLKQuaternion quaternion)
{
  return (NSString *)[NSString stringWithFormat:@"{{%g, %g, %g}, %g}", v1, v2, v3, v4];
}

GLKVector3 GLKMathProject(GLKVector3 object, GLKMatrix4 *model, GLKMatrix4 *projection, int *viewport)
{
  return object;
}

GLKVector3 GLKMathUnproject(GLKVector3 window, GLKMatrix4 *model, GLKMatrix4 *projection, int *viewport, BOOL *success)
{
  BOOL isInvertible = 0;
  float32x4_t v6 = *(float32x4_t *)(*(void *)&window.v[2] + 16);
  float32x4_t v7 = *(float32x4_t *)(*(void *)&window.v[2] + 32);
  float32x4_t v8 = *(float32x4_t *)(*(void *)&window.v[2] + 48);
  float32x4_t v9 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(*(_OWORD *)(*(void *)&window.x + 16))), v6, *(float32x2_t *)(*(void *)&window.x + 16), 1), v7, *(float32x4_t *)(*(void *)&window.x + 16), 2), v8, *(float32x4_t *)(*(void *)&window.x + 16), 3);
  float32x4_t v10 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(*(_OWORD *)(*(void *)&window.x + 32))), v6, *(float32x2_t *)(*(void *)&window.x + 32), 1), v7, *(float32x4_t *)(*(void *)&window.x + 32), 2), v8, *(float32x4_t *)(*(void *)&window.x + 32), 3);
  float32x4_t v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(*(_OWORD *)(*(void *)&window.x + 48))), v6, *(float32x2_t *)(*(void *)&window.x + 48), 1), v7, *(float32x4_t *)(*(void *)&window.x + 48), 2), v8, *(float32x4_t *)(*(void *)&window.x + 48), 3);
  *(float32x4_t *)&v14.float m00 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(**(float32x4_t **)&window.v[2], COERCE_FLOAT(**(_OWORD **)&window.x)), v6, **(float32x2_t **)&window.x, 1), v7, **(float32x4_t **)&window.x, 2), v8, **(float32x4_t **)&window.x, 3);
  *(float32x4_t *)&v14.m[4] = v9;
  *(float32x4_t *)&v14.m[8] = v10;
  *(float32x4_t *)&v14.m[12] = v11;
  float32x2_t v12 = GLKMatrix4Invert(&v15, &v14, &isInvertible);
  if (projection) {
    LOBYTE(projection->m00) = isInvertible;
  }
  *(void *)&result.x = v12;
  result.z = v13;
  return result;
}

uint64_t _GLKModelErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  float v3 = @"GLKModelErrorKey";
  v4[0] = a2;
  return objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GLKModelErrorDomain", a1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
}

uint64_t _GLKModelErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"GLKModelErrorDomain" code:a1 userInfo:a2];
}

uint64_t _GLKModelErrorWithCode(uint64_t a1)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"GLKModelErrorDomain" code:a1 userInfo:0];
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x270EE66D0]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x270EE66D8]();
}

uint64_t CGImageBlockGetRect()
{
  return MEMORY[0x270EE66E0]();
}

uint64_t CGImageBlockSetGetComponentType()
{
  return MEMORY[0x270EE6708]();
}

uint64_t CGImageBlockSetGetCount()
{
  return MEMORY[0x270EE6710]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x270EE6718]();
}

uint64_t CGImageBlockSetGetPixelSize()
{
  return MEMORY[0x270EE6720]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x270EE6730]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x270EE6810]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x270EE68A0]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x270EE68C8]();
}

uint64_t CGImageProviderGetSize()
{
  return MEMORY[0x270EE68E8]();
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x270ED96A8]();
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

void glActiveTexture(GLenum texture)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x270EF97E0]();
}

void glBlitFramebuffer(GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data)
{
}

GLenum glCheckFramebufferStatus(GLenum target)
{
  return MEMORY[0x270EF9828](*(void *)&target);
}

void glCompileShader(GLuint shader)
{
}

void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x270EF9868]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x270EF9870](*(void *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteProgram(GLuint program)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteShader(GLuint shader)
{
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
}

uint64_t glDeleteVertexArraysOES()
{
  return MEMORY[0x270EF98B8]();
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x270EF98E0]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

void glFinish(void)
{
}

void glFlush(void)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x270EF9960]();
}

void glGenerateMipmap(GLenum target)
{
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x270EF9980](*(void *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x270EF9990]();
}

void glGetIntegerv(GLenum pname, GLint *params)
{
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

const GLubyte *__cdecl glGetString(GLenum name)
{
  return (const GLubyte *)MEMORY[0x270EF99D8](*(void *)&name);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x270EF99E8](*(void *)&program, name);
}

void glLabelObjectEXT(GLenum type, GLuint object, GLsizei length, const GLchar *label)
{
}

void glLinkProgram(GLuint program)
{
}

GLvoid *__cdecl glMapBufferRange(GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access)
{
  return (GLvoid *)MEMORY[0x270EF9A10](*(void *)&target, offset, length, *(void *)&access);
}

void glPixelStorei(GLenum pname, GLint param)
{
}

void glPopGroupMarkerEXT(void)
{
}

void glPushGroupMarkerEXT(GLsizei length, const char *marker)
{
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
}

uint64_t glRenderbufferStorageMultisampleAPPLE()
{
  return MEMORY[0x270EF9A50]();
}

uint64_t glResolveMultisampleFramebufferAPPLE()
{
  return MEMORY[0x270EF9A58]();
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
}

void glUniform1f(GLint location, GLfloat x)
{
}

void glUniform1i(GLint location, GLint x)
{
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniformMatrix3fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

GLBOOLean glUnmapBuffer(GLenum target)
{
  return MEMORY[0x270EF9B58](*(void *)&target);
}

void glUseProgram(GLuint program)
{
}

void glValidateProgram(GLuint program)
{
}

void glVertexAttrib4fv(GLuint indx, const GLfloat *values)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF288](src, dest, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBAFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF290](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3D8](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3E0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3F0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3F8](src, dest, *(void *)&flags);
}