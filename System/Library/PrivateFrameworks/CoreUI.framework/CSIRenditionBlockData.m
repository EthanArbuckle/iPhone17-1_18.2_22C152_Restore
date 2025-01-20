@interface CSIRenditionBlockData
@end

@implementation CSIRenditionBlockData

char *__45___CSIRenditionBlockData__allocateImageBytes__block_invoke()
{
  result = getenv("COREUI_USE_MALLOC");
  if (result) {
    _allocateImageBytes___use_malloc = 1;
  }
  return result;
}

void __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke(uint64_t a1)
{
  v58 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(unsigned int *)(a1 + 72);
  uint64_t v5 = *(void *)(v2 + 32);
  v6 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)(a1 + 48), *(void *)(a1 + 56), kCFAllocatorNull);
  if (v6)
  {
    v7 = v6;
    CFReadStreamOpen(v6);
    _StreamSys_init_read((unint64_t)&v58, (uint64_t)v7);
    *(void *)v57 = 0;
    int v8 = *(_DWORD *)(*(void *)(a1 + 64) + 8);
    if (v8 == 3) {
      char v9 = 4;
    }
    else {
      char v9 = 5;
    }
    if (v8 == 2) {
      char v10 = 1;
    }
    else {
      char v10 = v9;
    }
    if (_BOMFileNewFromCFReadStreamSys(v57, (long long *)v58, v10))
    {
      CFRelease(v7);
      v56 = CUIConvertCompressionTypeToString(*(_DWORD *)(*(void *)(a1 + 64) + 8));
      _CUILog(4, (uint64_t)"CoreUI: Unable to create BOMFile from decompress stream for CSI '%s' image block data.", v11, v12, v13, v14, v15, v16, (uint64_t)v56);
    }
    else
    {
      v24 = (char *)(v3 + v5 * v4);
      uint64_t v25 = *(void *)(a1 + 32);
      unint64_t v26 = *(void *)(v25 + 184);
      if (!v26)
      {
        if (*(_DWORD *)(v25 + 12) > 1u) {
          unint64_t v26 = *(void *)(v25 + 32);
        }
        else {
          unint64_t v26 = (4 * *(_DWORD *)(a1 + 88));
        }
      }
      size_t v27 = *(void *)(v25 + 32);
      if (v27 <= v26) {
        size_t v28 = v26;
      }
      else {
        size_t v28 = v27;
      }
      v29 = (UInt8 *)malloc_type_malloc(v28, 0x100004077774924uLL);
      if (*(void *)(*(void *)(a1 + 32) + 32) == v26)
      {
        int64_t v30 = BOMFileRead(*(uint64_t *)v57, v29, v26);
        if (v30 >= 1)
        {
          for (uint64_t i = v30; i > 0; uint64_t i = BOMFileRead(*(uint64_t *)v57, v29, *(void *)(*(void *)(a1 + 32) + 32)))
          {
            memcpy(v24, v29, i);
            v24 += i;
            atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 40), i);
          }
        }
      }
      else if (*(_DWORD *)(a1 + 76))
      {
        unsigned int v32 = 0;
        uint64_t v33 = 0;
        do
        {
          if (atomic_load((unint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))) {
            goto LABEL_46;
          }
          if (v26)
          {
            v35 = v24;
            unint64_t v36 = v26;
            while (!atomic_load((unint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)))
            {
              if (v36 >= v26) {
                unint64_t v38 = v26;
              }
              else {
                unint64_t v38 = v36;
              }
              size_t v39 = BOMFileRead(*(uint64_t *)v57, v29, v38);
              if ((v39 & 0x8000000000000000) != 0 || (size_t v40 = v39) == 0 && BOMFileIsEOF(*(uint64_t *)v57))
              {
                v49 = CUIConvertCompressionTypeToString(*(_DWORD *)(*(void *)(a1 + 64) + 8));
                _CUILog(4, (uint64_t)"CoreUI: Error while decoding '%s' compressed image block data got an %s name:'%s' pixelFormat:%d at row %d", v50, v51, v52, v53, v54, v55, (uint64_t)v49);
                break;
              }
              if (*(void *)(*(void *)(a1 + 32) + 32) >= v40) {
                size_t v41 = v40;
              }
              else {
                size_t v41 = *(void *)(*(void *)(a1 + 32) + 32);
              }
              memcpy(v35, v29, v41);
              v35 += v40;
              v33 += v40;
              v36 -= v40;
              if (!v36) {
                goto LABEL_39;
              }
            }
LABEL_46:
            BOMFileClose(*(uint64_t *)v57);
            BomSys_free(v58);
            CFRelease(v7);
            free(v29);
            atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1uLL);
            return;
          }
LABEL_39:
          if (v33 >= 1) {
            v24 += *(void *)(*(void *)(a1 + 32) + 32);
          }
          ++v32;
        }
        while (v32 < *(_DWORD *)(a1 + 76));
        if (v33 == -1)
        {
          atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1uLL);
          v42 = CUIConvertCompressionTypeToString(*(_DWORD *)(*(void *)(a1 + 64) + 8));
          _CUILog(4, (uint64_t)"CoreUI: Error while decoding '%s' compressed image block data name: '%s' (rows %d rowbytes %zu format %d)", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
        }
      }
      BOMFileClose(*(uint64_t *)v57);
      BomSys_free(v58);
      CFRelease(v7);
      free(v29);
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 56);
    CUIConvertCompressionTypeToString(*(_DWORD *)(*(void *)(a1 + 64) + 8));
    _CUILog(4, (uint64_t)"CoreUI: Unable to create decompress stream for CSI bytes of length %ld '%s' image block data.", v18, v19, v20, v21, v22, v23, v17);
  }
}

uint64_t __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t (*)(void))*((void *)[*(id *)(a1 + 32) objectAtIndex:a2] + 2);
  return v2();
}

id __37___CSIRenditionBlockData_sharedCache__block_invoke()
{
  id v0 = objc_alloc_init((Class)NSCache);
  sharedCache_sharedCache = (uint64_t)v0;
  return [v0 setTotalCostLimit:5242880];
}

@end