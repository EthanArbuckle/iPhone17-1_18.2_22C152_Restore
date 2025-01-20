@interface CUIMutablePSDImageRef
- (BOOL)saveToURL:(id)a3 completionHandler:(id)a4;
- (BOOL)saveWithCompletionHandler:(id)a3;
- (CUIMutablePSDImageRef)initWithPixelWidth:(unint64_t)a3 pixelHeight:(unint64_t)a4;
- (__CFData)copyDefaultICCProfileData;
- (unsigned)newSliceRectsArray:(PSDRect *)a3 withSliceRects:(id)a4;
- (unsigned)newSliceRectsArray:(PSDRect *)a3 withXCutPositions:(id)a4 yCutPositions:(id)a5;
- (unsigned)newUInt32CArray:(unsigned int *)a3 withNSArray:(id)a4 prependNumber:(id)a5 appendNumber:(id)a6;
- (unsigned)psdLayerBlendModeForCGBlendMode:(int)a3;
- (void)addLayer:(id)a3;
- (void)addLayoutMetricsChannel:(id)a3;
- (void)addOrUpdateSlicesWithSliceRects:(id)a3;
- (void)addOrUpdateSlicesWithXCutPositions:(id)a3 yCutPositions:(id)a4;
- (void)newPSDGradientFromCUIPSDGradient:(id)a3;
- (void)setFileURL:(id)a3;
- (void)updateSliceName:(id)a3 atIndex:(unsigned int)a4;
@end

@implementation CUIMutablePSDImageRef

- (__CFData)copyDefaultICCProfileData
{
  v2 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  v3 = CGColorSpaceCopyICCData(v2);
  CGColorSpaceRelease(v2);
  return v3;
}

- (CUIMutablePSDImageRef)initWithPixelWidth:(unint64_t)a3 pixelHeight:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CUIMutablePSDImageRef;
  v6 = [(CUIMutablePSDImageRef *)&v14 init];
  v7 = v6;
  if (v6)
  {
    [(CUIPSDImageRef *)v6 setFile:0xFFFFFFFFLL];
    v8 = (CPSDFile *)operator new();
    CPSDFile::CPSDFile(v8);
    [(CUIPSDImageRef *)v7 setPsd:v8];
    CFDataRef v9 = [(CUIMutablePSDImageRef *)v7 copyDefaultICCProfileData];
    if (v9)
    {
      CFDataRef v10 = v9;
      BytePtr = CFDataGetBytePtr(v9);
      size_t Length = CFDataGetLength(v10);
      CPSDFile::Init((CPSDFile *)[(CUIPSDImageRef *)v7 psd], v5, v4, BytePtr, Length);
      CFRelease(v10);
    }
    else
    {
      CPSDFile::Init((CPSDFile *)[(CUIPSDImageRef *)v7 psd], v5, v4, 0, 0);
    }
  }
  return v7;
}

- (void)addLayoutMetricsChannel:(id)a3
{
  int v5 = NewCPSDStringFromNSString((NSString *)[a3 name]);
  unsigned int v6 = *((_DWORD *)[(CUIPSDImageRef *)self psd] + 36);
  unsigned int v7 = *((_DWORD *)[(CUIPSDImageRef *)self psd] + 37);
  unsigned int v8 = v7 * v6;
  CFDataRef v9 = (unsigned __int8 *)malloc_type_calloc(v7 * v6, 1uLL, 0x100004077774924uLL);
  [a3 edgeInsets];
  unsigned int v11 = v10;
  [a3 edgeInsets];
  double v13 = v12;
  [a3 edgeInsets];
  uint64_t v15 = ((double)v6 - v14 - (double)v11);
  [a3 edgeInsets];
  if (v15)
  {
    uint64_t v17 = v13;
    size_t v18 = ((double)v7 - v16 - (double)v17);
    unsigned int v19 = v11 * v7;
    do
    {
      memset(&v9[v17 + v19], 255, v18);
      v19 += v7;
      --v15;
    }
    while (v15);
  }
  CPSDFile::AddExtraAlphaChannel((CPSDFile *)[(CUIPSDImageRef *)self psd], v9, v8, v5);
}

- (void)newPSDGradientFromCUIPSDGradient:(id)a3
{
  int v4 = (char *)operator new();
  *(void *)int v4 = 0;
  *((void *)v4 + 1) = 0;
  *(_DWORD *)(v4 + 15) = 0;
  *((void *)v4 + 4) = 0;
  *((void *)v4 + 5) = 0;
  *((void *)v4 + 3) = 0;
  *((_DWORD *)v4 + 12) = 1282306592;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *(_OWORD *)(v4 + 104) = 0u;
  *(_OWORD *)(v4 + 120) = 0u;
  [a3 drawingAngle];
  *(void *)int v4 = v5;
  int v6 = [a3 gradientStyle];
  if (v6 == 1382312992) {
    int v7 = 1382312992;
  }
  else {
    int v7 = 1282306592;
  }
  if (v6 == 1382444131) {
    int v8 = 1382444131;
  }
  else {
    int v8 = v7;
  }
  if (v6 == 1148022372) {
    int v9 = 1148022372;
  }
  else {
    int v9 = 1282306592;
  }
  if (v6 == 1097754476) {
    int v10 = 1097754476;
  }
  else {
    int v10 = v9;
  }
  if (v6 <= 1382312991) {
    int v11 = v10;
  }
  else {
    int v11 = v8;
  }
  *((_DWORD *)v4 + 12) = v11;
  id v82 = [a3 evaluator];
  if (v82)
  {
    [v82 smoothingCoefficient];
    *((double *)v4 + 1) = v12 * 4096.0;
    v4[17] = [v82 isDithered];
    [v82 fillColor];
    double v14 = v13 * 255.0;
    [v82 fillColor];
    double v16 = v15 * 255.0;
    [v82 fillColor];
    double v18 = v17 * 255.0;
    [v82 fillColor];
    *((double *)v4 + 7) = v14;
    *((double *)v4 + 8) = v16;
    *((double *)v4 + 9) = v18;
    *((double *)v4 + 10) = v19 * 255.0;
    v4[18] = 1;
    id v20 = objc_msgSend(objc_msgSend(v82, "colorMidpointLocations"), "count");
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id obj = [v82 colorStops];
    id v21 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
    if (v21)
    {
      uint64_t v22 = 0;
      v23 = (void **)(v4 + 88);
      uint64_t v24 = *(void *)v88;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v88 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v87 + 1) + 8 * i);
          [v26 gradientColor];
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          if (v22 >= (uint64_t)v20)
          {
            double v34 = 50.0;
          }
          else
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v82, "colorMidpointLocations"), "objectAtIndex:", v22), "doubleValue");
            double v34 = v33 * 100.0;
          }
          [v26 location];
          unsigned int v35 = v34;
          double v36 = v28 * 255.0;
          double v37 = v30 * 255.0;
          double v38 = v32 * 255.0;
          unsigned int v40 = vcvtd_n_u64_f64(v39, 0xCuLL);
          v42 = (double *)*((void *)v4 + 12);
          unint64_t v41 = *((void *)v4 + 13);
          if ((unint64_t)v42 >= v41)
          {
            v44 = (double *)*v23;
            uint64_t v45 = ((char *)v42 - (unsigned char *)*v23) >> 5;
            unint64_t v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 59) {
              std::vector<CPSDChannelBlendingInfo>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v47 = v41 - (void)v44;
            if (v47 >> 4 > v46) {
              unint64_t v46 = v47 >> 4;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v48 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v48 = v46;
            }
            if (v48)
            {
              v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PSDGradientColorStop>>((uint64_t)(v4 + 104), v48);
              v44 = (double *)*((void *)v4 + 11);
              v42 = (double *)*((void *)v4 + 12);
            }
            else
            {
              v49 = 0;
            }
            v50 = (double *)&v49[32 * v45];
            double *v50 = v36;
            v50[1] = v37;
            v50[2] = v38;
            *((_DWORD *)v50 + 6) = v40;
            *((_DWORD *)v50 + 7) = v35;
            v51 = v50;
            if (v42 != v44)
            {
              do
              {
                long long v52 = *((_OWORD *)v42 - 1);
                *((_OWORD *)v51 - 2) = *((_OWORD *)v42 - 2);
                *((_OWORD *)v51 - 1) = v52;
                v51 -= 4;
                v42 -= 4;
              }
              while (v42 != v44);
              v44 = (double *)*v23;
            }
            v43 = v50 + 4;
            *((void *)v4 + 11) = v51;
            *((void *)v4 + 12) = v50 + 4;
            *((void *)v4 + 13) = &v49[32 * v48];
            if (v44) {
              operator delete(v44);
            }
          }
          else
          {
            double *v42 = v36;
            v42[1] = v37;
            v42[2] = v38;
            v43 = v42 + 4;
            *((_DWORD *)v42 + 6) = v40;
            *((_DWORD *)v42 + 7) = v35;
          }
          *((void *)v4 + 12) = v43;
          ++v22;
        }
        id v21 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
      }
      while (v21);
    }
    id v53 = objc_msgSend(objc_msgSend(v82, "opacityMidpointLocations"), "count");
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obja = [v82 opacityStops];
    id v54 = [obja countByEnumeratingWithState:&v83 objects:v91 count:16];
    if (v54)
    {
      uint64_t v55 = 0;
      v56 = (void **)(v4 + 112);
      uint64_t v57 = *(void *)v84;
      do
      {
        for (j = 0; j != v54; j = (char *)j + 1)
        {
          if (*(void *)v84 != v57) {
            objc_enumerationMutation(obja);
          }
          v59 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
          if (v55 >= (uint64_t)v53)
          {
            double v61 = 50.0;
          }
          else
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v82, "opacityMidpointLocations"), "objectAtIndex:", v55), "doubleValue");
            double v61 = v60 * 100.0;
          }
          [v59 opacity];
          double v63 = v62;
          [v59 location];
          unsigned int v64 = v61;
          double v65 = v63 * 100.0;
          unsigned int v67 = vcvtd_n_u64_f64(v66, 0xCuLL);
          v69 = (double *)*((void *)v4 + 15);
          unint64_t v68 = *((void *)v4 + 16);
          if ((unint64_t)v69 >= v68)
          {
            v71 = (double *)*v56;
            uint64_t v72 = ((char *)v69 - (unsigned char *)*v56) >> 4;
            unint64_t v73 = v72 + 1;
            if ((unint64_t)(v72 + 1) >> 60) {
              std::vector<CPSDChannelBlendingInfo>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v74 = v68 - (void)v71;
            if (v74 >> 3 > v73) {
              unint64_t v73 = v74 >> 3;
            }
            if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v75 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v75 = v73;
            }
            if (v75)
            {
              v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CPSDString>>((uint64_t)(v4 + 128), v75);
              v71 = (double *)*((void *)v4 + 14);
              v69 = (double *)*((void *)v4 + 15);
            }
            else
            {
              v76 = 0;
            }
            v77 = &v76[16 * v72];
            *(double *)v77 = v65;
            *((_DWORD *)v77 + 2) = v67;
            *((_DWORD *)v77 + 3) = v64;
            v78 = v77;
            if (v69 != v71)
            {
              do
              {
                *((_OWORD *)v78 - 1) = *((_OWORD *)v69 - 1);
                v78 -= 16;
                v69 -= 2;
              }
              while (v69 != v71);
              v71 = (double *)*v56;
            }
            v70 = (double *)(v77 + 16);
            *((void *)v4 + 14) = v78;
            *((void *)v4 + 15) = v77 + 16;
            *((void *)v4 + 16) = &v76[16 * v75];
            if (v71) {
              operator delete(v71);
            }
          }
          else
          {
            double *v69 = v65;
            v70 = v69 + 2;
            *((_DWORD *)v69 + 2) = v67;
            *((_DWORD *)v69 + 3) = v64;
          }
          *((void *)v4 + 15) = v70;
          ++v55;
        }
        id v54 = [obja countByEnumeratingWithState:&v83 objects:v91 count:16];
      }
      while (v54);
    }
  }
  return v4;
}

- (unsigned)psdLayerBlendModeForCGBlendMode:(int)a3
{
  if ((a3 - 1) > 0xE) {
    return 1852797549;
  }
  else {
    return *(_DWORD *)&aLumnrcsrevokra[4 * a3 - 4];
  }
}

- (void)addLayer:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 opacity];
    int v7 = (int)(v6 * 255.0);
    int v8 = -[CUIMutablePSDImageRef psdLayerBlendModeForCGBlendMode:](self, "psdLayerBlendModeForCGBlendMode:", [a3 blendMode]);
    int v9 = NewCPSDStringFromNSString((NSString *)[a3 name]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(_OWORD *)double v19 = 0u;
      long long v20 = 0u;
      int v10 = (CGImage *)[a3 cgImageRef];
      LODWORD(v11) = *((_DWORD *)[(CUIPSDImageRef *)self psd] + 37);
      CGFloat v12 = (double)v11;
      LODWORD(v13) = *((_DWORD *)[(CUIPSDImageRef *)self psd] + 36);
      LODWORD(v10) = CUIGetChannelDataForImage(v10, (void **)v19, v12, (double)v13);
      CPSDFile::AddLayer((CPSDFile *)[(CUIPSDImageRef *)self psd], v19, (int)v10, (const UniChar **)v9, v7, v8);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v14 = -[CUIMutablePSDImageRef newPSDGradientFromCUIPSDGradient:](self, "newPSDGradientFromCUIPSDGradient:", [a3 gradient]);
        CPSDFile::AddLayer((uint64_t)[(CUIPSDImageRef *)self psd], (uint64_t)v14, (const UniChar **)v9, v7, v8);
        if (v14)
        {
          double v15 = (void *)v14[14];
          if (v15)
          {
            v14[15] = v15;
            operator delete(v15);
          }
          double v16 = (void *)v14[11];
          if (v16)
          {
            v14[12] = v16;
            operator delete(v16);
          }
          MEMORY[0x1A6230DF0](v14, 0x1020C40E61DAC95);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CPSDFile::AddLayerGroupStart((CPSDFile *)[(CUIPSDImageRef *)self psd]);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v17 = 0;
            if (!v9) {
              goto LABEL_19;
            }
            goto LABEL_16;
          }
          CPSDFile::AddLayerGroupEnd((CPSDFile *)[(CUIPSDImageRef *)self psd], (const UniChar **)v9, v7, 1885434739);
        }
      }
    }
    char v17 = 1;
    if (!v9) {
      goto LABEL_19;
    }
LABEL_16:
    uint64_t v18 = *((void *)v9 + 1);
    if (v18)
    {
      MEMORY[0x1A6230DD0](v18, 0x1000C80BDFB0063);
      *((void *)v9 + 1) = 0;
    }
    MEMORY[0x1A6230DF0](v9, 0x1010C4082113244);
LABEL_19:
    if (v17) {
      return;
    }
  }
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CUIMutablePSDImageRef.mm", 434, @"AddLayer called with object of unexpected class:%@", [a3 description]);
}

- (unsigned)newUInt32CArray:(unsigned int *)a3 withNSArray:(id)a4 prependNumber:(id)a5 appendNumber:(id)a6
{
  unsigned int v10 = [a4 count];
  unsigned int v11 = v10;
  if (a5) {
    unsigned int v12 = v10 + 1;
  }
  else {
    unsigned int v12 = v10;
  }
  if (a6) {
    unsigned int v13 = v12 + 1;
  }
  else {
    unsigned int v13 = v12;
  }
  double v14 = (unsigned int *)malloc_type_malloc(4 * v13, 0x100004052888210uLL);
  double v15 = v14;
  if (v14)
  {
    uint64_t v16 = v11;
    if (v11)
    {
      uint64_t v17 = 0;
      uint64_t v18 = &v14[a5 != 0];
      do
      {
        v18[v17] = objc_msgSend(objc_msgSend(a4, "objectAtIndex:", v17), "unsignedIntegerValue");
        ++v17;
      }
      while (v16 != v17);
    }
    if (a5) {
      *double v15 = [a5 unsignedIntegerValue];
    }
    if (a6) {
      v15[v12++] = [a6 unsignedIntegerValue];
    }
  }
  else
  {
    unsigned int v12 = 0;
  }
  *a3 = v15;
  return v12;
}

- (unsigned)newSliceRectsArray:(PSDRect *)a3 withSliceRects:(id)a4
{
  unsigned int v6 = [a4 count];
  if (v6)
  {
    int v7 = (PSDRect *)operator new[]();
    bzero(v7, 16 * v6);
    uint64_t v8 = 0;
    int v9 = (_DWORD *)((char *)v7 + 8);
    do
    {
      CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[a4 objectAtIndex:v8], &v11);
      *(v9 - 1) = CGRectGetMinX(v11);
      v9[1] = CGRectGetMaxX(v11);
      *(v9 - 2) = CGRectGetMinY(v11);
      *int v9 = CGRectGetMaxY(v11);
      v9 += 4;
      ++v8;
    }
    while (v6 != v8);
  }
  else
  {
    int v7 = 0;
  }
  *a3 = v7;
  return v6;
}

- (unsigned)newSliceRectsArray:(PSDRect *)a3 withXCutPositions:(id)a4 yCutPositions:(id)a5
{
  double v30 = 0;
  unsigned int v8 = [(CUIMutablePSDImageRef *)self newUInt32CArray:&v30 withNSArray:a4 prependNumber:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0) appendNumber:+[NSNumber numberWithInteger:*((unsigned int *)[(CUIPSDImageRef *)self psd] + 37)]];
  if (v30)
  {
    unsigned int v9 = v8;
    uint64_t v29 = 0;
    unsigned int v10 = [(CUIMutablePSDImageRef *)self newUInt32CArray:&v29 withNSArray:a5 prependNumber:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0) appendNumber:+[NSNumber numberWithInteger:*((unsigned int *)[(CUIPSDImageRef *)self psd] + 37)]];
    if (v29)
    {
      unsigned int v11 = v10;
      uint64_t v12 = v10 - 1;
      signed int v13 = v12 * (v9 - 1);
      if (v13 <= 0)
      {
        double v14 = 0;
        double v15 = (int *)v30;
      }
      else
      {
        double v14 = (PSDRect *)operator new[]();
        bzero(v14, 16 * v12 * (v9 - 1));
        double v15 = (int *)v30;
        if ((int)(v11 - 2) >= 0)
        {
          uint64_t v16 = 0;
          unsigned int v17 = 0;
          uint64_t v18 = v29;
          do
          {
            if (((v9 - 2) & 0x80000000) != 0)
            {
              uint64_t v19 = v16 + 1;
            }
            else
            {
              uint64_t v19 = v16 + 1;
              int v20 = *v15;
              int v21 = *(_DWORD *)(v18 + 4 * v16);
              int v22 = *(_DWORD *)(v18 + 4 * v19);
              v23 = v15 + 1;
              uint64_t v24 = v9 - 1;
              do
              {
                v25 = (_DWORD *)((char *)v14 + 16 * v17);
                v25[1] = v20;
                int v26 = *v23++;
                int v20 = v26;
                _DWORD *v25 = v21;
                v25[2] = v22;
                v25[3] = v26;
                ++v17;
                --v24;
              }
              while (v24);
            }
            uint64_t v16 = v19;
          }
          while (v19 != v12);
        }
      }
      free(v15);
      double v27 = (void **)&v29;
    }
    else
    {
      double v14 = 0;
      signed int v13 = 0;
      double v27 = &v30;
    }
    free(*v27);
    *a3 = v14;
  }
  else
  {
    signed int v13 = 0;
    *a3 = 0;
  }
  return v13;
}

- (void)addOrUpdateSlicesWithSliceRects:(id)a3
{
  unsigned int v6 = 0;
  int v4 = [(CUIMutablePSDImageRef *)self newSliceRectsArray:&v6 withSliceRects:a3];
  uint64_t v5 = [(CUIPSDImageRef *)self psd];
  CPSDFile::AddOrUpdateSlices(v5, (int32x4_t *)v6, v4);
  if (v6) {
    MEMORY[0x1A6230DD0](v6, 0x1000C80451B5BE8);
  }
}

- (void)addOrUpdateSlicesWithXCutPositions:(id)a3 yCutPositions:(id)a4
{
  int v7 = 0;
  int v5 = [(CUIMutablePSDImageRef *)self newSliceRectsArray:&v7 withXCutPositions:a3 yCutPositions:a4];
  unsigned int v6 = [(CUIPSDImageRef *)self psd];
  CPSDFile::AddOrUpdateSlices(v6, (int32x4_t *)v7, v5);
  if (v7) {
    MEMORY[0x1A6230DD0](v7, 0x1000C80451B5BE8);
  }
}

- (void)updateSliceName:(id)a3 atIndex:(unsigned int)a4
{
  unsigned int v8 = 0;
  unsigned int v6 = (const unsigned __int16 *)NSStringToUTF16LEBytes((NSString *)a3, &v8);
  int v7 = [(CUIPSDImageRef *)self psd];
  CPSDFile::UpdateSliceNameAtIndex(v7, v6, v8, a4);
}

- (void)setFileURL:(id)a3
{
  if (([a3 isFileURL] & 1) == 0) {
    objc_exception_throw(+[NSException exceptionWithName:@"Bad URL" reason:@"CUIMutablePSDImageRef setFileURL called with non-file URL" userInfo:0]);
  }
  id v5 = [a3 path];
  [(CUIPSDImageRef *)self setPath:v5];
}

- (BOOL)saveWithCompletionHandler:(id)a3
{
  uint64_t File = CreateFile((char *)[+[NSFileManager defaultManager] fileSystemRepresentationWithPath:[(CUIPSDImageRef *)self path]], 1538);
  unsigned int v6 = [(CUIPSDImageRef *)self psd];
  (*(void (**)(void *, uint64_t))(*(void *)v6 + 56))(v6, File);
  CloseHandle(File);
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
  return 1;
}

- (BOOL)saveToURL:(id)a3 completionHandler:(id)a4
{
  [(CUIMutablePSDImageRef *)self setFileURL:a3];
  return [(CUIMutablePSDImageRef *)self saveWithCompletionHandler:a4];
}

- (uint64_t)saveWithCompletionHandler:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSError **a4)
{
  uint64_t v7 = *((void *)__cxa_get_exception_ptr(a1) + 1);
  unsigned int v10 = &unk_1EF485F50;
  uint64_t v11 = v7;
  __cxa_begin_catch(a1);
  CStdException::~CStdException((CStdException *)&v10);
  __cxa_end_catch();
  if (!a3) {
    return 1;
  }
  unsigned int v8 = +[NSError errorWithDomain:@"CUIMutablePSDImageRef", 0, 0, v10, v11 code userInfo];
  uint64_t result = 0;
  *a4 = v8;
  return result;
}

@end