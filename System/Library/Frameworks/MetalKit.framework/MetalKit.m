void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void sub_2156A1554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_2156A196C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _mtkLinkedOnOrAfter(uint64_t a1)
{
  if (a1)
  {
    if (a1 != 1) {
      _mtkLinkedOnOrAfter_cold_1();
    }
    uint64_t v2 = 0x7E30901FFFFFFFFLL;
  }
  else
  {
    uint64_t v2 = 0x7E00901FFFFFFFFLL;
  }
  return MEMORY[0x270ED9718](v2);
}

BOOL reflectImage(void *a1, void *a2, vImagePixelCount a3, vImagePixelCount a4, size_t a5, uint64_t a6, uint64_t a7)
{
  src.data = a1;
  src.height = a4;
  src.width = a3;
  src.rowBytes = a5;
  v9.data = a2;
  v9.height = a4;
  v9.width = a3;
  v9.rowBytes = a5;
  if (a7 == 4)
  {
    switch(a6)
    {
      case 128:
        vImage_Error v7 = vImageVerticalReflect_ARGBFFFF(&src, &v9, 0);
        return v7 == 0;
      case 64:
        vImage_Error v7 = vImageVerticalReflect_ARGB16U(&src, &v9, 0);
        return v7 == 0;
      case 32:
        vImage_Error v7 = vImageVerticalReflect_ARGB8888(&src, &v9, 0);
        return v7 == 0;
    }
LABEL_11:
    vImage_Error v7 = 0;
    return v7 == 0;
  }
  if (a7 != 1) {
    goto LABEL_11;
  }
  if (a6 == 32)
  {
    vImage_Error v7 = vImageVerticalReflect_PlanarF(&src, &v9, 0);
    return v7 == 0;
  }
  if (a6 == 16)
  {
    vImage_Error v7 = vImageVerticalReflect_Planar16U(&src, &v9, 0);
    return v7 == 0;
  }
  if (a6 != 8) {
    goto LABEL_11;
  }
  vImage_Error v7 = vImageVerticalReflect_Planar8(&src, &v9, 0);
  return v7 == 0;
}

uint64_t selectRGBPixelFormat(uint64_t result)
{
  if (result <= 132)
  {
    if (result <= 70)
    {
      if (result == 11)
      {
        return 10;
      }
      else if (result == 31)
      {
        return 30;
      }
    }
    else
    {
      switch(result)
      {
        case 71:
          return 70;
        case 81:
          return 80;
        case 131:
          return 130;
      }
    }
  }
  else
  {
    switch(result)
    {
      case 153:
        result = 152;
        break;
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 162:
      case 164:
      case 166:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 180:
      case 182:
      case 184:
        return result;
      case 161:
        result = 160;
        break;
      case 163:
        result = 162;
        break;
      case 165:
        result = 164;
        break;
      case 167:
        result = 166;
        break;
      case 179:
        result = 178;
        break;
      case 181:
        result = 180;
        break;
      case 183:
        result = 182;
        break;
      case 185:
        result = 203;
        break;
      case 186:
        result = 204;
        break;
      case 187:
        result = 205;
        break;
      case 188:
        result = 206;
        break;
      case 189:
        result = 207;
        break;
      case 190:
        result = 208;
        break;
      case 191:
        result = 209;
        break;
      case 192:
        result = 210;
        break;
      case 193:
        result = 211;
        break;
      case 194:
        result = 212;
        break;
      case 195:
        result = 213;
        break;
      case 196:
        result = 214;
        break;
      case 197:
        result = 215;
        break;
      case 198:
        result = 216;
        break;
      case 199:
        result = 217;
        break;
      case 200:
        result = 218;
        break;
      default:
        if (result == 133)
        {
          result = 132;
        }
        else if (result == 135)
        {
          result = 134;
        }
        break;
    }
  }
  return result;
}

uint64_t _mtkLinkedBefore(uint64_t a1)
{
  return _mtkLinkedOnOrAfter(a1) ^ 1;
}

void sub_2156A490C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2156A4E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2156A50B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2156A5408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2156A92A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2156A948C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2156AAFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2156AB1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t selectSRGBFormat(uint64_t result)
{
  if (result <= 177)
  {
    if (result > 133)
    {
      switch(result)
      {
        case 160:
          result = 161;
          break;
        case 161:
        case 163:
        case 165:
          return result;
        case 162:
          result = 163;
          break;
        case 164:
          result = 165;
          break;
        case 166:
          result = 167;
          break;
        default:
          if (result == 134)
          {
            result = 135;
          }
          else if (result == 152)
          {
            result = 153;
          }
          break;
      }
    }
    else if (result > 79)
    {
      switch(result)
      {
        case 80:
          return 81;
        case 130:
          return 131;
        case 132:
          return 133;
      }
    }
    else
    {
      switch(result)
      {
        case 10:
          return 11;
        case 30:
          return 31;
        case 70:
          return 71;
      }
    }
  }
  else
  {
    switch(result)
    {
      case 178:
        result = 179;
        break;
      case 180:
        result = 181;
        break;
      case 182:
        result = 183;
        break;
      case 203:
        result = 185;
        break;
      case 204:
        result = 186;
        break;
      case 205:
        result = 187;
        break;
      case 206:
        result = 188;
        break;
      case 207:
        result = 189;
        break;
      case 208:
        result = 190;
        break;
      case 209:
        result = 191;
        break;
      case 210:
        result = 192;
        break;
      case 211:
        result = 193;
        break;
      case 212:
        result = 194;
        break;
      case 213:
        result = 195;
        break;
      case 214:
        result = 196;
        break;
      case 215:
        result = 197;
        break;
      case 216:
        result = 198;
        break;
      case 217:
        result = 199;
        break;
      case 218:
        result = 200;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t _newMTKTextureErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v6[0] = @"MTKTextureLoaderErrorKey";
  v6[1] = v3;
  v7[0] = a2;
  v7[1] = a2;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  return [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MTKTextureLoaderErrorDomain" code:a1 userInfo:v4];
}

uint64_t _newMTKTextureErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x263F087E8]);

  return [v4 initWithDomain:@"MTKTextureLoaderErrorDomain" code:a1 userInfo:a2];
}

uint64_t _newMTKTextureErrorWithCode(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F087E8]);

  return [v2 initWithDomain:@"MTKTextureLoaderErrorDomain" code:a1 userInfo:0];
}

uint64_t expandRGBToRGBA(char *__src, char *__dst, uint64_t a3, unint64_t a4, uint64_t a5, size_t __n, size_t a7, int a8)
{
  int __srca = a8;
  if (!__src) {
    expandRGBToRGBA_cold_1();
  }
  v8 = __dst;
  if (!__dst) {
    expandRGBToRGBA_cold_2();
  }
  if (a4)
  {
    uint64_t v12 = __src;
    LODWORD(v13) = 0;
    uint64_t v14 = 4 * a3 * a7;
    do
    {
      uint64_t v15 = a3;
      uint64_t v16 = v8;
      for (i = v12; v15; --v15)
      {
        memcpy(v16, i, __n);
        v18 = &v16[__n];
        i += __n;
        memcpy(v18, &__srca, a7);
        uint64_t v16 = &v18[a7];
      }
      v12 += a5;
      v8 += v14;
      unint64_t v13 = (v13 + 1);
    }
    while (v13 < a4);
  }
  return 1;
}

uint64_t arrayTextureTypeFromTextureType(unint64_t a1)
{
  if (a1 >= 0xA) {
    arrayTextureTypeFromTextureType_cold_1();
  }
  return qword_2156B2F58[a1];
}

MDLVertexFormat MTKModelIOVertexFormatFromMetal(MTLVertexFormat vertexFormat)
{
  if (vertexFormat - 1 > 0x34) {
    return 0;
  }
  else {
    return qword_2156B2FB0[vertexFormat - 1];
  }
}

MTLVertexFormat MTKMetalVertexFormatFromModelIO(MDLVertexFormat vertexFormat)
{
  MTLVertexFormat result = MTLVertexFormatInvalid;
  if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatUShortNormalizedBits)
  {
    if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatCharNormalizedBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatShort:
          MTLVertexFormat result = MTLVertexFormatShort;
          break;
        case MDLVertexFormatShort2:
          MTLVertexFormat result = MTLVertexFormatShort2;
          break;
        case MDLVertexFormatShort3:
          MTLVertexFormat result = MTLVertexFormatShort3;
          break;
        case MDLVertexFormatShort4:
          MTLVertexFormat result = MTLVertexFormatShort4;
          break;
        default:
          return result;
      }
    }
    else if (vertexFormat <= MDLVertexFormatCharNormalizedBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatUChar:
          MTLVertexFormat result = MTLVertexFormatUChar;
          break;
        case MDLVertexFormatUChar2:
          MTLVertexFormat result = MTLVertexFormatUChar2;
          break;
        case MDLVertexFormatUChar3:
          MTLVertexFormat result = MTLVertexFormatUChar3;
          break;
        case MDLVertexFormatUChar4:
          MTLVertexFormat result = MTLVertexFormatUChar4;
          break;
        default:
LABEL_48:
          JUMPOUT(0);
      }
    }
    else
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatUCharNormalized:
          MTLVertexFormat result = MTLVertexFormatUCharNormalized;
          break;
        case MDLVertexFormatUChar2Normalized:
          MTLVertexFormat result = MTLVertexFormatUChar2Normalized;
          break;
        case MDLVertexFormatUChar3Normalized:
          MTLVertexFormat result = MTLVertexFormatUChar3Normalized;
          break;
        case MDLVertexFormatUChar4Normalized:
          MTLVertexFormat result = MTLVertexFormatUChar4Normalized;
          break;
        default:
          return result;
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
          MTLVertexFormat result = MTLVertexFormatInt;
          break;
        case MDLVertexFormatInt2:
          MTLVertexFormat result = MTLVertexFormatInt2;
          break;
        case MDLVertexFormatInt3:
          MTLVertexFormat result = MTLVertexFormatInt3;
          break;
        case MDLVertexFormatInt4:
          MTLVertexFormat result = MTLVertexFormatInt4;
          break;
        default:
          BOOL v3 = vertexFormat == MDLVertexFormatInt1010102Normalized;
          MTLVertexFormat v4 = MTLVertexFormatInt1010102Normalized;
LABEL_36:
          if (v3) {
            MTLVertexFormat result = v4;
          }
          else {
            MTLVertexFormat result = MTLVertexFormatInvalid;
          }
          break;
      }
    }
    else
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatFloat:
          MTLVertexFormat result = MTLVertexFormatFloat;
          break;
        case MDLVertexFormatFloat2:
          MTLVertexFormat result = MTLVertexFormatFloat2;
          break;
        case MDLVertexFormatFloat3:
          MTLVertexFormat result = MTLVertexFormatFloat3;
          break;
        case MDLVertexFormatFloat4:
          MTLVertexFormat result = MTLVertexFormatFloat4;
          break;
        default:
          return result;
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
          return 51;
        case MDLVertexFormatUShort2Normalized:
          return 19;
        case MDLVertexFormatUShort3Normalized:
          return 20;
        case MDLVertexFormatUShort4Normalized:
          return 21;
        default:
          goto LABEL_48;
      }
    }
    switch(vertexFormat)
    {
      case MDLVertexFormatUInt:
        MTLVertexFormat result = MTLVertexFormatUInt;
        break;
      case MDLVertexFormatUInt2:
        MTLVertexFormat result = MTLVertexFormatUInt2;
        break;
      case MDLVertexFormatUInt3:
        MTLVertexFormat result = MTLVertexFormatUInt3;
        break;
      case MDLVertexFormatUInt4:
        MTLVertexFormat result = MTLVertexFormatUInt4;
        break;
      default:
        BOOL v3 = vertexFormat == MDLVertexFormatUInt1010102Normalized;
        MTLVertexFormat v4 = MTLVertexFormatUInt1010102Normalized;
        goto LABEL_36;
    }
  }
  return result;
}

MDLVertexDescriptor *__cdecl MTKModelIOVertexDescriptorFromMetalWithError(MTLVertexDescriptor *metalDescriptor, NSError **error)
{
  BOOL v3 = metalDescriptor;
  id v4 = objc_alloc_init(getMDLVertexDescriptorClass());
  for (unint64_t i = 0; i != 31; ++i)
  {
    v6 = [(MTLVertexDescriptor *)v3 attributes];
    vImage_Error v7 = [v6 objectAtIndexedSubscript:i];
    uint64_t v8 = [v7 format];

    if (v8)
    {
      uint64_t v9 = [v4 attributes];
      unint64_t v10 = [v9 count];

      if (i >= v10) {
        MTKModelIOVertexDescriptorFromMetalWithError_cold_2(error);
      }
      v11 = [(MTLVertexDescriptor *)v3 attributes];
      uint64_t v12 = [v11 objectAtIndexedSubscript:i];
      MDLVertexFormat v13 = MTKModelIOVertexFormatFromMetal((MTLVertexFormat)[v12 format]);

      if (v13 == MDLVertexFormatInvalid)
      {
        if (error)
        {
          _MTKModelErrorWithCodeAndErrorString(0, @"No compatible MDLVertexFormat format for MTLVertexAttribute format");
          id v37 = 0;
          *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v37 = 0;
        }
        goto LABEL_16;
      }
      uint64_t v14 = [v4 attributes];
      uint64_t v15 = [v14 objectAtIndexedSubscript:i];
      [v15 setFormat:v13];

      uint64_t v16 = [(MTLVertexDescriptor *)v3 attributes];
      v17 = [v16 objectAtIndexedSubscript:i];
      uint64_t v18 = [v17 bufferIndex];
      v19 = [v4 attributes];
      v20 = [v19 objectAtIndexedSubscript:i];
      [v20 setBufferIndex:v18];

      v21 = [(MTLVertexDescriptor *)v3 attributes];
      v22 = [v21 objectAtIndexedSubscript:i];
      uint64_t v23 = [v22 offset];
      v24 = [v4 attributes];
      v25 = [v24 objectAtIndexedSubscript:i];
      [v25 setOffset:v23];
    }
  }
  for (unint64_t j = 0; j != 31; ++j)
  {
    v27 = [(MTLVertexDescriptor *)v3 layouts];
    v28 = [v27 objectAtIndexedSubscript:j];
    uint64_t v29 = [v28 stride];

    if (v29)
    {
      v30 = [v4 layouts];
      unint64_t v31 = [v30 count];

      if (j >= v31) {
        MTKModelIOVertexDescriptorFromMetalWithError_cold_1(error);
      }
      v32 = [(MTLVertexDescriptor *)v3 layouts];
      v33 = [v32 objectAtIndexedSubscript:j];
      uint64_t v34 = [v33 stride];
      v35 = [v4 layouts];
      v36 = [v35 objectAtIndexedSubscript:j];
      [v36 setStride:v34];
    }
  }
  id v37 = v4;
LABEL_16:

  return (MDLVertexDescriptor *)v37;
}

MDLVertexDescriptor *__cdecl MTKModelIOVertexDescriptorFromMetal(MTLVertexDescriptor *metalDescriptor)
{
  return MTKModelIOVertexDescriptorFromMetalWithError(metalDescriptor, 0);
}

MTLVertexDescriptor *__cdecl MTKMetalVertexDescriptorFromModelIOWithError(MDLVertexDescriptor *modelIODescriptor, NSError **error)
{
  BOOL v3 = modelIODescriptor;
  id v4 = objc_alloc_init(MEMORY[0x263F12A80]);
  for (unint64_t i = 0; i != 31; ++i)
  {
    v6 = [(MDLVertexDescriptor *)v3 attributes];
    unint64_t v7 = [v6 count];

    if (i >= v7) {
      break;
    }
    uint64_t v8 = [(MDLVertexDescriptor *)v3 attributes];
    uint64_t v9 = [v8 objectAtIndexedSubscript:i];
    uint64_t v10 = [v9 format];

    if (v10)
    {
      v11 = [(MDLVertexDescriptor *)v3 attributes];
      uint64_t v12 = [v11 objectAtIndexedSubscript:i];
      MTLVertexFormat v13 = MTKMetalVertexFormatFromModelIO((MDLVertexFormat)[v12 format]);

      if (v13 == MTLVertexFormatInvalid)
      {
        if (error)
        {
          _MTKModelErrorWithCodeAndErrorString(0, @"No compatible MTLVertexFormat format for MDLVertexAttribute format");
          id v37 = 0;
          *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v37 = 0;
        }
        goto LABEL_13;
      }
      uint64_t v14 = [v4 attributes];
      uint64_t v15 = [v14 objectAtIndexedSubscript:i];
      [v15 setFormat:v13];

      uint64_t v16 = [(MDLVertexDescriptor *)v3 attributes];
      v17 = [v16 objectAtIndexedSubscript:i];
      uint64_t v18 = [v17 bufferIndex];
      v19 = [v4 attributes];
      v20 = [v19 objectAtIndexedSubscript:i];
      [v20 setBufferIndex:v18];

      v21 = [(MDLVertexDescriptor *)v3 attributes];
      v22 = [v21 objectAtIndexedSubscript:i];
      uint64_t v23 = [v22 offset];
      v24 = [v4 attributes];
      v25 = [v24 objectAtIndexedSubscript:i];
      [v25 setOffset:v23];
    }
  }
  for (unint64_t j = 0; j != 31; ++j)
  {
    v27 = [(MDLVertexDescriptor *)v3 layouts];
    unint64_t v28 = [v27 count];

    if (j >= v28) {
      break;
    }
    uint64_t v29 = [(MDLVertexDescriptor *)v3 layouts];
    v30 = [v29 objectAtIndexedSubscript:j];
    uint64_t v31 = [v30 stride];

    if (v31)
    {
      v32 = [(MDLVertexDescriptor *)v3 layouts];
      v33 = [v32 objectAtIndexedSubscript:j];
      uint64_t v34 = [v33 stride];
      v35 = [v4 layouts];
      v36 = [v35 objectAtIndexedSubscript:j];
      [v36 setStride:v34];
    }
  }
  id v37 = v4;
LABEL_13:

  return (MTLVertexDescriptor *)v37;
}

MTLVertexDescriptor *__cdecl MTKMetalVertexDescriptorFromModelIO(MDLVertexDescriptor *modelIODescriptor)
{
  return MTKMetalVertexDescriptorFromModelIOWithError(modelIODescriptor, 0);
}

Class initMDLSubmesh()
{
  if (ModelIOLibrary_sOnce != -1) {
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global_0);
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

void *__ModelIOLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/ModelIO.framework/ModelIO", 2);
  ModelIOLibrary_sLib = (uint64_t)result;
  return result;
}

Class initMDLMesh()
{
  if (ModelIOLibrary_sOnce != -1) {
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global_0);
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

Class initMDLVertexDescriptor()
{
  if (ModelIOLibrary_sOnce != -1) {
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global_0);
  }
  Class result = objc_getClass("MDLVertexDescriptor");
  classMDLVertexDescriptor = (uint64_t)result;
  getMDLVertexDescriptorClass = (uint64_t (*)())MDLVertexDescriptorFunction;
  return result;
}

id MDLVertexDescriptorFunction()
{
  return (id)classMDLVertexDescriptor;
}

void sub_2156AE494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t ComputeSequenceLengthInBits(unint64_t result, int a2)
{
  switch(a2)
  {
    case 0:
      return result;
    case 1:
      return ((8 * result) | 4u) / 5uLL;
    case 2:
      return (2 * result);
    case 3:
      unsigned int v2 = 7 * result + 2;
      goto LABEL_12;
    case 4:
      int v3 = 13;
      goto LABEL_14;
    case 5:
      return (3 * result);
    case 6:
      int v4 = 10;
      goto LABEL_11;
    case 7:
      int v3 = 18;
      goto LABEL_14;
    case 8:
      return (4 * result);
    case 9:
      int v4 = 13;
LABEL_11:
      unsigned int v2 = result * v4 + 2;
LABEL_12:
      Class result = v2 / 3uLL;
      break;
    case 10:
      int v3 = 23;
LABEL_14:
      Class result = (result * v3 + 4) / 5uLL;
      break;
    case 11:
      Class result = (5 * result);
      break;
    default:
      Class result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

Class initMDLMeshBufferMap()
{
  if (ModelIOLibrary_sOnce_0 != -1) {
    dispatch_once(&ModelIOLibrary_sOnce_0, &__block_literal_global_1);
  }
  Class result = objc_getClass("MDLMeshBufferMap");
  classMDLMeshBufferMap = (uint64_t)result;
  getMDLMeshBufferMapClass = MDLMeshBufferMapFunction;
  return result;
}

uint64_t MDLMeshBufferMapFunction()
{
  return classMDLMeshBufferMap;
}

void *__ModelIOLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/Frameworks/ModelIO.framework/ModelIO", 2);
  ModelIOLibrary_sLib_0 = (uint64_t)result;
  return result;
}

id _MTKModelErrorWithCodeAndErrorString(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = @"MTKModelErrorKey";
  v10[0] = a2;
  int v4 = NSDictionary;
  id v5 = a2;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  unint64_t v7 = [v3 errorWithDomain:@"MTKModelErrorDomain" code:a1 userInfo:v6];

  return v7;
}

uint64_t _MTKModelErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"MTKModelErrorDomain" code:a1 userInfo:a2];
}

uint64_t _MTKModelErrorWithCode(uint64_t a1)
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"MTKModelErrorDomain" code:a1 userInfo:0];
}

uint64_t printIndices16(uint64_t a1, unint64_t a2)
{
  puts("16Bit idnices:");
  if (a2)
  {
    uint64_t v4 = 0;
    unsigned int v5 = 0;
    do
    {
      printf("%d ", *(unsigned __int16 *)(a1 + 2 * v4));
      if (v5 && 100 * (v5 / 0x64) == v5) {
        putchar(10);
      }
      uint64_t v4 = ++v5;
    }
    while (v5 < a2);
  }

  return putchar(10);
}

uint64_t printIndices32(uint64_t a1, unint64_t a2)
{
  puts("32Bit idnices:");
  if (a2)
  {
    uint64_t v4 = 0;
    unsigned int v5 = 0;
    do
    {
      printf("%d ", *(_DWORD *)(a1 + 4 * v4));
      if (v5 && 100 * (v5 / 0x64) == v5) {
        putchar(10);
      }
      uint64_t v4 = ++v5;
    }
    while (v5 < a2);
  }

  return putchar(10);
}

uint64_t _mtkLinkedOSVersion()
{
  if (_mtkLinkedOSVersion_once != -1) {
    dispatch_once(&_mtkLinkedOSVersion_once, &__block_literal_global_2);
  }
  return _mtkLinkedOSVersion_version;
}

uint64_t ___mtkLinkedOSVersion_block_invoke()
{
  uint64_t result = dyld_get_program_sdk_version();
  _mtkLinkedOSVersion_version = result;
  return result;
}

void expandRGBToRGBA_cold_1()
{
  __assert_rtn("expandRGBToRGBA", "MTKTextureLoader_Internal.m", 89, "source != nil");
}

void expandRGBToRGBA_cold_2()
{
  __assert_rtn("expandRGBToRGBA", "MTKTextureLoader_Internal.m", 90, "destination != nil");
}

void arrayTextureTypeFromTextureType_cold_1()
{
}

void MTKModelIOVertexDescriptorFromMetalWithError_cold_1(void *a1)
{
  if (a1)
  {
    _MTKModelErrorWithCodeAndErrorString(0, @"Too many vertex layouts in MTLVertexDescriptor to create a MDLVertexDescriptor");
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  __assert_rtn("MTKModelIOVertexDescriptorFromMetalWithError", "MTKModel.m", 634, "!\"Model I/O vertex descriptor layouts count should be at least MTL_MAX_VERTEX_BUFFERS\"");
}

void MTKModelIOVertexDescriptorFromMetalWithError_cold_2(void *a1)
{
  if (a1)
  {
    _MTKModelErrorWithCodeAndErrorString(0, @"Too many vertex attributes in MTLVertexDescriptor to create a MDLVertexDescriptor");
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  __assert_rtn("MTKModelIOVertexDescriptorFromMetalWithError", "MTKModel.m", 612, "!\"Model I/O vertex descriptor attribute count should be at least MTL_MAX_VERTEX_ATTRIBUTES\"");
}

void _mtkLinkedOnOrAfter_cold_1()
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
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

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
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

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
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

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x270EF5EF0]();
}

uint64_t MTLTextureTypeString()
{
  return MEMORY[0x270EF5FB0]();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
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

void exit(int a1)
{
}

void free(void *a1)
{
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

vImage_Error vImageVerticalReflect_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3D0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3D8](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3E0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3E8](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3F0](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF3F8](src, dest, *(void *)&flags);
}