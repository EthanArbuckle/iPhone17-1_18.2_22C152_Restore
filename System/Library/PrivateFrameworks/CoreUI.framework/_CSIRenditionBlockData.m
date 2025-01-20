@interface _CSIRenditionBlockData
+ (uint64_t)sharedCache;
- (BOOL)expandCSIBitmapData:(uint64_t)a3 fromSlice:(uint64_t)a4 makeReadOnly:(uint64_t)a5;
- (_BYTE)setRowBytes:(unsigned char *)result;
- initWithBytes:(uint64_t)a3 pixelWidth:(int)a4 pixelHeight:(uint64_t)a5 sourceRowbytes:(uint64_t)a6 pixelFormat:;
- initWithPixelWidth:(int)a3 pixelHeight:(uint64_t)a4 sourceRowbytes:(uint64_t)a5 pixelFormat:;
- (uint64_t)_makeReadOnly;
- (void)_allocateImageBytes;
- (void)_freeImageBytes;
- (void)dealloc;
@end

@implementation _CSIRenditionBlockData

- initWithBytes:(uint64_t)a3 pixelWidth:(int)a4 pixelHeight:(uint64_t)a5 sourceRowbytes:(uint64_t)a6 pixelFormat:
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)_CSIRenditionBlockData;
  v10 = objc_msgSendSuper2(&v14, sel_init);
  if (v10)
  {
    __bppFromBlockPixelFormat(a6);
    v10[3] = a6;
    v10[6] = a4;
    uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    *((void *)v10 + 4) = AlignedBytesPerRow;
    uint64_t v12 = AlignedBytesPerRow * v10[6];
    *((void *)v10 + 23) = a5;
    *((void *)v10 + 24) = v12;
    *((void *)v10 + 2) = a2;
  }
  return v10;
}

- (BOOL)expandCSIBitmapData:(uint64_t)a3 fromSlice:(uint64_t)a4 makeReadOnly:(uint64_t)a5
{
  if (!a1) {
    return 0;
  }
  v9 = *(void **)(a1 + 16);
  if (!v9) {
    return 0;
  }
  int v10 = a5;
  unsigned int v12 = *((_DWORD *)a2 + 1);
  atomic_store(0, (unint64_t *)(a1 + 40));
  switch(*((_DWORD *)a2 + 2))
  {
    case 0:
      size_t v20 = *((unsigned int *)a2 + 3);
      if (*(void *)(a1 + 192) < v20)
      {
        v68 = CUIConvertCompressionTypeToString(0);
        _CUILog(4, (uint64_t)"CoreUI: Unable to copy imagedata for rawbytes block data data. '%s'", v21, v22, v23, v24, v25, v26, (uint64_t)v68);
        goto LABEL_27;
      }
      memcpy(v9, a2 + 16, v20);
      atomic_store(*((unsigned int *)a2 + 3), (unint64_t *)(a1 + 40));
      goto LABEL_58;
    case 1:
      if (*((_DWORD *)a2 + 3))
      {
        pk_decompressData((int *)a2 + 4, (uint64_t)v9, a3, SHIDWORD(a3), a4, SHIDWORD(a4), *(void *)(a1 + 32), *(_DWORD *)a2 == 1296844099);
LABEL_58:
        BOOL v19 = 1;
      }
      else
      {
        unsigned int v27 = 1;
LABEL_26:
        v69 = CUIConvertCompressionTypeToString(v27);
        _CUILog(4, (uint64_t)"CoreUI: Unable to decompress stream for CSI image block data. '%s'", v28, v29, v30, v31, v32, v33, (uint64_t)v69);
LABEL_27:
        BOOL v19 = 0;
      }
      goto LABEL_59;
    case 2:
    case 3:
    case 4:
      dest.data = 0;
      dest.height = (vImagePixelCount)&dest;
      dest.width = 0x2020000000;
      atomic_store(0, &dest.rowBytes);
      v13 = a2 + 16;
      int v72 = *((_DWORD *)a2 + 1);
      int v71 = a5;
      if (v72)
      {
        unsigned int v15 = *((_DWORD *)a2 + 3);
        unsigned int v18 = *((_DWORD *)a2 + 8);
        if (*((_DWORD *)a2 + 4) == 1262699075)
        {
          unsigned int v18 = bswap32(v18);
          unsigned int v17 = bswap32(*((_DWORD *)a2 + 7));
          int v16 = 1;
        }
        else
        {
          int v16 = 0;
          unsigned int v17 = *((_DWORD *)a2 + 7);
        }
        objc_super v14 = a2 + 16;
        v13 = a2 + 36;
      }
      else
      {
        objc_super v14 = 0;
        unsigned int v15 = 0;
        int v16 = 0;
        unsigned int v17 = *(_DWORD *)(a1 + 24);
        unsigned int v18 = *((_DWORD *)a2 + 3);
      }
      int v40 = 0;
      id v41 = 0;
      if (v15 <= 1) {
        int v42 = 1;
      }
      else {
        int v42 = v15;
      }
      break;
    case 5:
      if (!CUIUncompressJPEGandLZFSEInfoData(a2 + 16, v9, *(void *)(a1 + 32), 8, 32, 8194, a7, a8)) {
        goto LABEL_25;
      }
      goto LABEL_58;
    case 6:
      if ((decodeRadiosity((unsigned __int16 *)a2 + 8, *((unsigned int *)a2 + 3), *(void *)(a1 + 32), (char *)v9) & 0x80000000) != 0) {
        goto LABEL_25;
      }
      goto LABEL_58;
    case 7:
    case 0xC:
      if (CUIExpandATECompressedDataIntoBuffer((uint64_t)(a2 + 16), (v12 >> 1) & 1, v9, *(unsigned int *)(a1 + 8), *(void *)(a1 + 32), a6, a7, a8))
      {
        goto LABEL_58;
      }
      goto LABEL_25;
    case 8:
      if (!CUIUncompressQuantizedImageData()) {
        goto LABEL_25;
      }
      goto LABEL_58;
    case 9:
      if (!CUIUncompressHEVCInfoData((uint64_t)(a2 + 16), v9, *(void *)(a1 + 32), *(unsigned int *)(a1 + 8), a5, a6, a7, a8))goto LABEL_25; {
      goto LABEL_58;
      }
    case 0xA:
      if (CUIUncompressDeepmapImageData((unsigned int *)a2 + 4, *((unsigned int *)a2 + 3), ((int)(*((_DWORD *)a2 + 1) << 31) >> 31) & *((_DWORD *)a2 + 3), (uint64_t)v9, (int)a4, a4 >> 32, *(void *)(a1 + 32), *(unsigned int *)(a1 + 8)))goto LABEL_58; {
LABEL_25:
      }
      unsigned int v27 = *((_DWORD *)a2 + 2);
      goto LABEL_26;
    case 0xB:
      if (CUIUncompressDeepmap2ImageData((unsigned int *)a2 + 4, *((unsigned int *)a2 + 3), ((int)(*((_DWORD *)a2 + 1) << 31) >> 31) & *((_DWORD *)a2 + 3), (uint64_t)v9, (int)a4, a4 >> 32, *(void *)(a1 + 32), *(unsigned int *)(a1 + 8)))goto LABEL_58; {
      v70 = CUIConvertCompressionTypeToString(*((_DWORD *)a2 + 2));
      }
      _CUILog(4, (uint64_t)"CoreUI: Unable to decompress 2.0 stream for CSI image block data. '%s'", v34, v35, v36, v37, v38, v39, (uint64_t)v70);
      goto LABEL_27;
    default:
      _CUILog(4, (uint64_t)"CoreUI: unhandled compressiontype for CSI image block data.%d", a3, a4, a5, a6, a7, a8, *((unsigned int *)a2 + 2));
      goto LABEL_27;
  }
  do
  {
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    uint64_t v43 = v18;
    v77[2] = __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke;
    v77[3] = &unk_1E5A58A48;
    v77[6] = v13;
    v77[7] = v18;
    v77[8] = a2;
    uint64_t v80 = a3;
    uint64_t v81 = a4;
    int v78 = v40;
    unsigned int v79 = v17;
    v77[4] = a1;
    v77[5] = &dest;
    if (v72)
    {
      if (!v41) {
        id v41 = objc_alloc_init((Class)NSMutableArray);
      }
      id v50 = [v77 copy];
      [v41 addObject:v50];
    }
    else
    {
      __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke((uint64_t)v77);
    }
    if (!--v42) {
      break;
    }
    v51 = (char *)v14 + v43;
    unsigned int v53 = *((_DWORD *)v51 + 5);
    objc_super v14 = v51 + 20;
    uint64_t v52 = v53;
    if (v16)
    {
      if (v52 == 1262699075)
      {
        v13 = v14 + 5;
        goto LABEL_47;
      }
    }
    else if (v52 == 1128416075)
    {
      v13 = v14 + 5;
LABEL_49:
      unsigned int v54 = v14[3];
      unsigned int v18 = v14[4];
      if (!v54) {
        break;
      }
      goto LABEL_50;
    }
    _CUILog(4, (uint64_t)"CoreUI: Can't find the correct chunk '%d'", v44, v45, v46, v47, v48, v49, v52);
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel_expandCSIBitmapData_fromSlice_makeReadOnly_ object:a1 file:@"CUIThemeRendition.m" lineNumber:966 description:@"CoreUI: Can't find the correct chunk"];
    v13 = v14 + 5;
    if (!v16) {
      goto LABEL_49;
    }
LABEL_47:
    unsigned int v18 = bswap32(v14[4]);
    unsigned int v54 = bswap32(v14[3]);
    if (!v54) {
      break;
    }
LABEL_50:
    v40 += v17;
    unint64_t v55 = atomic_load((unint64_t *)(dest.height + 24));
    unsigned int v17 = v54;
  }
  while (!v55);
  int v10 = v71;
  if ((v72 & 1) != 0 && !atomic_load((unint64_t *)(dest.height + 24)))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __69___CSIRenditionBlockData_expandCSIBitmapData_fromSlice_makeReadOnly___block_invoke_2;
    block[3] = &unk_1E5A519A8;
    block[4] = v41;
    dispatch_apply((size_t)[v41 count], 0, block);
  }
  unint64_t v57 = atomic_load((unint64_t *)(dest.height + 24));
  BOOL v19 = v57 == 0;
  if (v57) {
    _CUILog(4, (uint64_t)"CoreUI: Image data corrupted", v44, v45, v46, v47, v48, v49, v67);
  }

  _Block_object_dispose(&dest, 8);
LABEL_59:
  if (*(_DWORD *)(a1 + 8) == 1095911234 && *(_DWORD *)(a1 + 12) == 1)
  {
    vImagePixelCount v58 = *(unsigned int *)(a1 + 24);
    dest.data = *(void **)(a1 + 16);
    dest.height = v58;
    size_t v59 = *(void *)(a1 + 32);
    dest.width = (int)a4;
    dest.rowBytes = v59;
    *(_DWORD *)permuteMap = 50331906;
    if (vImagePermuteChannels_ARGB8888(&dest, &dest, permuteMap, 0) < 0) {
      _CUILog(4, (uint64_t)"CoreUI: Unable to permute pixel buffer", v60, v61, v62, v63, v64, v65, v67);
    }
  }
  if (v10) {
    -[_CSIRenditionBlockData _makeReadOnly](a1);
  }
  return v19;
}

- initWithPixelWidth:(int)a3 pixelHeight:(uint64_t)a4 sourceRowbytes:(uint64_t)a5 pixelFormat:
{
  if (!a1) {
    return 0;
  }
  v17.receiver = a1;
  v17.super_class = (Class)_CSIRenditionBlockData;
  v8 = objc_msgSendSuper2(&v17, sel_init);
  if (v8)
  {
    __bppFromBlockPixelFormat(a5);
    v8[3] = a5;
    v8[6] = a3;
    *((void *)v8 + 4) = CGBitmapGetAlignedBytesPerRow();
    *((void *)v8 + 23) = a4;
    [(_CSIRenditionBlockData *)(uint64_t)v8 _allocateImageBytes];
  }
  return v8;
}

- (uint64_t)_makeReadOnly
{
  if (result)
  {
    if ((~*(unsigned __int8 *)(result + 200) & 3) == 0) {
      return mach_vm_protect(mach_task_self_, *(void *)(result + 16), (vm_page_size + *(void *)(result + 32) * *(unsigned int *)(result + 24) - 1) & -(uint64_t)vm_page_size, 1, 1);
    }
  }
  return result;
}

- (void)_allocateImageBytes
{
  if (a1)
  {
    size_t v10 = *(void *)(a1 + 32) * *(unsigned int *)(a1 + 24);
    vm_size_t v11 = vm_page_size + v10 - 1;
    uint64_t v12 = -(uint64_t)vm_page_size;
    if (_allocateImageBytes___once != -1) {
      dispatch_once(&_allocateImageBytes___once, &__block_literal_global_12);
    }
    size_t v13 = v11 & v12;
    if (_allocateImageBytes___use_malloc)
    {
      *(void *)(a1 + 16) = -1;
      char v14 = *(unsigned char *)(a1 + 200);
    }
    else
    {
      uint64_t v15 = mmap(0, v13, 3, 4098, 1275068416, 0);
      *(void *)(a1 + 16) = v15;
      if (v15 != (void *)-1 && madvise(v15, v13, 3) < 0)
      {
        int v16 = __error();
        objc_super v17 = strerror(*v16);
        _CUILog(4, (uint64_t)"-[_CSIRenditionBlockData _allocateImageBytes] madvise failed error:'%s'", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
      }
      char v14 = *(unsigned char *)(a1 + 200) | 2;
    }
    *(unsigned char *)(a1 + 200) = v14 | 1;
    *(void *)(a1 + 192) = v13;
    objc_msgSend(+[CUIRuntimeStatistics sharedRuntimeStatistics](CUIRuntimeStatistics, "sharedRuntimeStatistics"), "addStatisticAllocatedImageSize:roundedSize:", v10, v13);
    if (*(void *)(a1 + 16) == -1)
    {
      if ((_allocateImageBytes___use_malloc & 1) == 0)
      {
        uint64_t v24 = __error();
        uint64_t v25 = strerror(*v24);
        _CUILog(4, (uint64_t)"-[_CSIRenditionBlockData _allocateImageBytes] mmap failed error:'%s' using malloc now", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
      }
      *(unsigned char *)(a1 + 200) &= ~2u;
      *(void *)(a1 + 16) = malloc_type_malloc(v10, 0xADE472FEuLL);
      __CFSetLastAllocationEventName();
      if (!*(void *)(a1 + 16))
      {
        _CUILog(4, (uint64_t)"-[_CSIRenditionBlockData _allocateImageBytes] malloc failed error", v32, v33, v34, v35, v36, v37, a9);
      }
    }
  }
}

- (void)dealloc
{
  -[_CSIRenditionBlockData _freeImageBytes]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_CSIRenditionBlockData;
  [(_CSIRenditionBlockData *)&v3 dealloc];
}

- (void)_freeImageBytes
{
  if (a1 && (*(unsigned char *)(a1 + 200) & 1) != 0)
  {
    if ((*(unsigned char *)(a1 + 200) & 2) != 0)
    {
      munmap(*(void **)(a1 + 16), (vm_page_size + *(void *)(a1 + 32) * *(unsigned int *)(a1 + 24) - 1) & -(uint64_t)vm_page_size);
      *(void *)(a1 + 16) = 0;
    }
    else
    {
      v2 = *(void **)(a1 + 16);
      free(v2);
    }
  }
}

+ (uint64_t)sharedCache
{
  if (sharedCache_once != -1) {
    dispatch_once(&sharedCache_once, &__block_literal_global_167);
  }
  return sharedCache_sharedCache;
}

- (_BYTE)setRowBytes:(unsigned char *)result
{
  if (result)
  {
    objc_super v3 = result;
    if (result[200]) {
      result = [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel_setRowBytes_ object:result file:@"CUIThemeRendition.m" lineNumber:574 description:@"You can't call setRowBytes: if _CSIRenditionBlockData was inited with initWithPixelWidth:pixelHeight:sourceRowbytes:pixelFormat:"];
    }
    *((void *)v3 + 4) = a2;
    *((void *)v3 + 24) = *((unsigned int *)v3 + 6) * a2;
  }
  return result;
}

@end