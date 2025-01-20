@interface C3DRendererContextFillTextureWithImage
@end

@implementation C3DRendererContextFillTextureWithImage

void ___C3DRendererContextFillTextureWithImage_block_invoke(uint64_t a1, int a2, CFArrayRef theArray, GLenum target, __n128 a5)
{
  if (target - 34075 <= 0xFFFFFFF9)
  {
    if (*(uint64_t *)(a1 + 32) <= 1) {
      GLint v8 = 9729;
    }
    else {
      GLint v8 = 9985;
    }
    glTexParameteri(target, 0x2801u, v8);
  }
  uint64_t v9 = 0;
  a5.n128_u64[0] = (unint64_t)vcvt_s32_f32(*(float32x2_t *)(a1 + 40));
  __n128 v23 = a5;
  while (1)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    CFIndex v11 = v9 >= v10 ? v10 - 1 : v9;
    CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(theArray, v11);
    pixels = CFDataGetBytePtr(ValueAtIndex);
    GLsizei Length = CFDataGetLength(ValueAtIndex);
    v15 = *(_DWORD **)(a1 + 48);
    if (*v15)
    {
      glCompressedTexImage2D(target, v9, v15[6], v23.n128_i32[0], v23.n128_i32[1], 0, Length, pixels);
    }
    else
    {
      GLint v16 = v15[6];
      uint64_t v17 = *(void *)(a1 + 56);
      if (v17)
      {
        int v18 = *(_DWORD *)(v17 + 16);
        int v19 = v16 == 32856 ? 6408 : v16;
        GLenum v20 = v18 == 1 ? 3317 : 3314;
        if (v18 == 1) {
          GLint v16 = v19;
        }
      }
      else
      {
        GLenum v20 = 3314;
      }
      glPixelStorei(v20, v23.n128_i32[1]);
      glTexImage2D(target, v9, v16, v23.n128_i32[0], v23.n128_i32[1], 0, *(_DWORD *)(*(void *)(a1 + 48) + 28), *(_DWORD *)(*(void *)(a1 + 48) + 32), pixels);
    }
    int8x8_t v21 = vmvn_s8((int8x8_t)vceq_s32((int32x2_t)v23.n128_u64[0], (int32x2_t)0x100000001));
    if (((v21.i32[0] | v21.i32[1]) & 1) == 0) {
      break;
    }
    v22.n128_u64[1] = v23.n128_u64[1];
    v22.n128_u64[0] = (unint64_t)vmax_s32(vshr_n_s32((int32x2_t)v23.n128_u64[0], 1uLL), (int32x2_t)0x100000001);
    __n128 v23 = v22;
    ++v9;
  }
}

void ___C3DRendererContextFillTextureWithImage_block_invoke_52(uint64_t a1, GLenum target, const GLvoid *a3)
{
  glTexImage2D(target, 0, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), 0, *(_DWORD *)(a1 + 60), *(_DWORD *)(a1 + 64), 0);
  glTexSubImage2D(target, 0, 0, 0, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 60), *(_DWORD *)(a1 + 64), a3);
  if (*(unsigned char *)(a1 + 68)) {
    glGenerateMipmap(target);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    int v7 = *(_DWORD *)(a1 + 40) * *(_DWORD *)(a1 + 32);
    *(_DWORD *)(v6 + 276) += v7 * C3DGLTextureTypePixelSize(*(_DWORD *)(a1 + 60), *(_DWORD *)(a1 + 64));
  }
}

uint64_t ___C3DRendererContextFillTextureWithImage_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end