@interface VNContoursObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)_initializePolygonContainers;
- (BOOL)isEqual:(id)a3;
- (CGPath)normalizedPathInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (CGPathRef)normalizedPath;
- (NSArray)topLevelContours;
- (NSInteger)contourCount;
- (NSInteger)topLevelContourCount;
- (VNContour)contourAtIndex:(NSInteger)contourIndex error:(NSError *)error;
- (VNContour)contourAtIndexPath:(NSIndexPath *)indexPath error:(NSError *)error;
- (VNContoursObservation)initWithCoder:(id)a3;
- (VNContoursObservation)initWithOriginatingRequestSpecifier:(id)a3 compressedPoints:(id)a4 imageSize:(CGSize)a5;
- (const)childContourIndicesAtIndex:(int64_t)a3;
- (const)polygonList;
- (id).cxx_construct;
- (id)debugQuickLookObject;
- (id)vn_cloneObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNContoursObservation

- (id).cxx_construct
{
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 22) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_contourChildrenIndices = &self->_contourChildrenIndices;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_contourChildrenIndices);
  begin = self->_topLevelContoursIndices.__begin_;
  if (begin)
  {
    self->_topLevelContoursIndices.__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_polygonList.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_compressedPoints, 0);
}

- (id)debugQuickLookObject
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VNContoursObservation;
  v3 = [(VNObservation *)&v8 debugQuickLookObject];
  if (v3)
  {
    v4 = [(VNContoursObservation *)self normalizedPath];
    v9[0] = xmmword_1A4125528;
    v9[1] = unk_1A4125538;
    v5 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v9);
    VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v3, v5);
  }
  else
  {
    VNDebugPathFromNormalizedCGPath((uint64_t)[(VNContoursObservation *)self normalizedPath], self->_imageSize.width, self->_imageSize.height);
  v6 = };

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNContoursObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNCntsObs");
  [v4 encodeObject:self->_compressedPoints forKey:@"Points"];
  objc_msgSend(v4, "vn_encodeSize:forKey:", @"Size", self->_imageSize.width, self->_imageSize.height);
}

- (VNContoursObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNContoursObservation;
  objc_super v5 = [(VNObservation *)&v12 initWithCoder:v4];
  if (!v5
    || objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNCntsObs")
    || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"Points"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        compressedPoints = v5->_compressedPoints,
        v5->_compressedPoints = (NSData *)v8,
        compressedPoints,
        !v5->_compressedPoints))
  {
LABEL_3:
    v6 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v4, "vn_decodeSizeForKey:", @"Size");
  v6 = 0;
  v5->_imageSize.width = v11;
  v5->_imageSize.height = v10;
  if (v11 > 0.0 && v10 > 0.0)
  {
    if ([(VNContoursObservation *)v5 _initializePolygonContainers])
    {
      v6 = v5;
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_4:

  return v6;
}

- (id)vn_cloneObject
{
  v10.receiver = self;
  v10.super_class = (Class)VNContoursObservation;
  uint64_t v3 = [(VNObservation *)&v10 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSData *)self->_compressedPoints copy];
    objc_super v5 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v4;

    *(CGSize *)(v3 + 104) = self->_imageSize;
    ptr = self->_polygonList.__ptr_;
    cntrl = self->_polygonList.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = *(std::__shared_weak_count **)(v3 + 144);
    *(void *)(v3 + 136) = ptr;
    *(void *)(v3 + 144) = cntrl;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v8);
    }
    if ((VNContoursObservation *)v3 != self)
    {
      std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(v3 + 152), (char *)self->_topLevelContoursIndices.__begin_, (uint64_t)self->_topLevelContoursIndices.__end_, self->_topLevelContoursIndices.__end_ - self->_topLevelContoursIndices.__begin_);
      std::vector<std::vector<unsigned int>>::__assign_with_size[abi:ne180100]<std::vector<unsigned int>*,std::vector<unsigned int>*>((uint64_t *)(v3 + 176), (uint64_t)self->_contourChildrenIndices.__begin_, (uint64_t)self->_contourChildrenIndices.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_contourChildrenIndices.__end_ - (char *)self->_contourChildrenIndices.__begin_) >> 3));
    }
  }

  return (id)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNContoursObservation *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (self->_imageSize.width == v4->_imageSize.width
        ? (BOOL v5 = self->_imageSize.height == v4->_imageSize.height)
        : (BOOL v5 = 0),
          v5))
    {
      char v6 = [(NSData *)self->_compressedPoints isEqual:v4->_compressedPoints];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (const)childContourIndicesAtIndex:(int64_t)a3
{
  return (char *)self->_contourChildrenIndices.__begin_ + 24 * a3;
}

- (const)polygonList
{
  return self->_polygonList.__ptr_;
}

- (CGPathRef)normalizedPath
{
  p_pathLock = &self->_pathLock;
  os_unfair_lock_lock(&self->_pathLock);
  if (!self->_normalizedPath)
  {
    uint64_t v4 = [(VNContoursObservation *)self polygonList];
    apple::vision::libraries::autotrace::ContourToPath::ContourToPath((apple::vision::libraries::autotrace::ContourToPath *)v15, v5);
    if (v4->var0 < 1)
    {
LABEL_6:
      v13 = v16;
      v16 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      while ((apple::vision::libraries::autotrace::ContourToPath::autoTrace((apple::vision::libraries::autotrace::ContourToPath *)v15, (const apple::vision::libraries::autotrace::EPolygonList *)v4, (const apple::vision::libraries::autotrace::EPolygon *)((char *)v4->var2 + v11), v6, v7, v8, v9, v10) & 1) != 0)
      {
        ++v12;
        v11 += 40;
        if (v12 >= v4->var0) {
          goto LABEL_6;
        }
      }
      v13 = 0;
    }
    apple::vision::libraries::autotrace::ContourToPath::~ContourToPath(v15);
    self->_normalizedPath = v13;
  }
  os_unfair_lock_unlock(p_pathLock);
  return self->_normalizedPath;
}

- (VNContour)contourAtIndexPath:(NSIndexPath *)indexPath error:(NSError *)error
{
  uint64_t v6 = indexPath;
  uint64_t v7 = [(NSIndexPath *)v6 length];
  if (v7)
  {
    uint64_t v8 = 0;
    p_topLevelContoursIndices = &self->_topLevelContoursIndices;
    while (1)
    {
      unint64_t v10 = [(NSIndexPath *)v6 indexAtPosition:v8];
      if (v10 >= p_topLevelContoursIndices->__end_ - p_topLevelContoursIndices->__begin_) {
        break;
      }
      uint64_t v11 = (void *)p_topLevelContoursIndices->__begin_[v10];
      p_topLevelContoursIndices = (vector<unsigned int, std::allocator<unsigned int>> *)((char *)self->_contourChildrenIndices.__begin_
                                                                                       + 24 * v11);
      if (v7 == ++v8)
      {
        uint64_t v12 = [VNContour alloc];
        float v13 = self->_imageSize.width / self->_imageSize.height;
        v14 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)&v12->super.isa, self, v11, v6, v13);
        goto LABEL_12;
      }
    }
    if (error)
    {
      v15 = +[VNError errorForInvalidArgument:v6 named:@"indexPath"];
      goto LABEL_10;
    }
  }
  else if (error)
  {
    v15 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"argument indexPath cannot be empty"];
LABEL_10:
    v14 = 0;
    *error = (NSError *)v15;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_12:

  return (VNContour *)v14;
}

- (VNContour)contourAtIndex:(NSInteger)contourIndex error:(NSError *)error
{
  if (contourIndex < 0 || (ptr = self->_polygonList.__ptr_, ptr->var0 <= contourIndex))
  {
    if (error)
    {
      v34 = objc_msgSend(NSNumber, "numberWithInteger:");
      *error = +[VNError errorForInvalidArgument:v34 named:@"contourIndex"];
    }
    v33 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = contourIndex;
    var2 = ptr->var2;
    do
    {
      int v12 = *((_DWORD *)var2 + 10 * v10 + 8);
      if (v12 == -1) {
        p_topLevelContoursIndices = &self->_topLevelContoursIndices;
      }
      else {
        p_topLevelContoursIndices = (vector<unsigned int, std::allocator<unsigned int>> *)((char *)self->_contourChildrenIndices.__begin_
      }
                                                                                         + 24 * v12);
      begin = p_topLevelContoursIndices->__begin_;
      end = p_topLevelContoursIndices->__end_;
      v16 = begin;
      if (begin != end)
      {
        while (*v16 != v10)
        {
          if (++v16 == end)
          {
            v16 = end;
            break;
          }
        }
      }
      uint64_t v17 = v16 - begin;
      if ((unint64_t)v8 >= v9)
      {
        uint64_t v18 = v8 - v7;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v9 - (void)v7) >> 2 > v19) {
          unint64_t v19 = (uint64_t)(v9 - (void)v7) >> 2;
        }
        if (v9 - (unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v19;
        }
        if (v20) {
          unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v20);
        }
        else {
          uint64_t v21 = 0;
        }
        v22 = (uint64_t *)(v20 + 8 * v18);
        uint64_t *v22 = v17;
        v23 = v22 + 1;
        while (v8 != v7)
        {
          uint64_t v24 = *--v8;
          *--v22 = v24;
        }
        unint64_t v9 = v20 + 8 * v21;
        if (v7) {
          operator delete(v7);
        }
        uint64_t v7 = v22;
        uint64_t v8 = v23;
      }
      else
      {
        *v8++ = v17;
      }
      var2 = self->_polygonList.__ptr_->var2;
      uint64_t v10 = *((unsigned int *)var2 + 10 * v10 + 8);
    }
    while ((v10 & 0x80000000) == 0);
    v25 = v8 - 1;
    if (v7 != v8 && v25 > v7)
    {
      v27 = (char *)(v7 + 1);
      do
      {
        uint64_t v28 = *((void *)v27 - 1);
        *((void *)v27 - 1) = *v25;
        *v25-- = v28;
        BOOL v29 = v27 >= (char *)v25;
        v27 += 8;
      }
      while (!v29);
    }
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndexes:v7 length:v8 - v7];
    v31 = [VNContour alloc];
    float v32 = self->_imageSize.width / self->_imageSize.height;
    v33 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)&v31->super.isa, self, (void *)contourIndex, v30, v32);

    if (v7) {
      operator delete(v7);
    }
  }

  return (VNContour *)v33;
}

- (NSArray)topLevelContours
{
  p_topLevelContoursIndices = &self->_topLevelContoursIndices;
  begin = self->_topLevelContoursIndices.__begin_;
  end = self->_topLevelContoursIndices.__end_;
  unint64_t v6 = end - begin;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  if (end != begin)
  {
    uint64_t v8 = 0;
    if (v6 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v6;
    }
    do
    {
      uint64_t v10 = [VNContour alloc];
      uint64_t v11 = (void *)p_topLevelContoursIndices->__begin_[v8];
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndex:v8];
      float v13 = self->_imageSize.width / self->_imageSize.height;
      v14 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)&v10->super.isa, self, v11, v12, v13);
      [v7 addObject:v14];

      ++v8;
    }
    while (v9 != v8);
  }

  return (NSArray *)v7;
}

- (NSInteger)topLevelContourCount
{
  return self->_topLevelContoursIndices.__end_ - self->_topLevelContoursIndices.__begin_;
}

- (NSInteger)contourCount
{
  return self->_polygonList.__ptr_->var0;
}

- (BOOL)_initializePolygonContainers
{
}

uint64_t __53__VNContoursObservation__initializePolygonContainers__block_invoke(uint64_t a1, int *a2)
{
  std::vector<std::vector<unsigned int>>::vector(&v40, *a2);
  LODWORD(v9) = *a2;
  if (*a2 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    while (1)
    {
      int v14 = *(_DWORD *)(*((void *)a2 + 1) + 40 * v13 + 32);
      if (v14 == -1)
      {
        if ((unint64_t)v11 >= v12)
        {
          uint64_t v27 = (v11 - v10) >> 2;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62) {
LABEL_48:
          }
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v12 - (void)v10) >> 1 > v28) {
            unint64_t v28 = (uint64_t)(v12 - (void)v10) >> 1;
          }
          if (v12 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v28;
          }
          if (v29) {
            unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v29);
          }
          else {
            uint64_t v30 = 0;
          }
          v33 = (char *)(v29 + 4 * v27);
          *(_DWORD *)v33 = v13;
          v34 = v33 + 4;
          while (v11 != v10)
          {
            int v35 = *((_DWORD *)v11 - 1);
            v11 -= 4;
            *((_DWORD *)v33 - 1) = v35;
            v33 -= 4;
          }
          unint64_t v12 = v29 + 4 * v30;
          if (v10) {
            operator delete(v10);
          }
          uint64_t v10 = v33;
          uint64_t v11 = v34;
        }
        else
        {
          *(_DWORD *)uint64_t v11 = v13;
          v11 += 4;
        }
      }
      else
      {
        if (v14 >= (int)v9)
        {
          VNValidatedLog(4, @"parsePolygonList: index (%d) is outside of count (%d)", v3, v4, v5, v6, v7, v8, v13);
          uint64_t v37 = 0;
          goto LABEL_45;
        }
        uint64_t v15 = v40 + 24 * v14;
        uint64_t v17 = (_DWORD **)(v15 + 8);
        v16 = *(_DWORD **)(v15 + 8);
        unint64_t v18 = *(void *)(v15 + 16);
        if ((unint64_t)v16 >= v18)
        {
          unint64_t v20 = *(_DWORD **)v15;
          uint64_t v21 = ((uint64_t)v16 - *(void *)v15) >> 2;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 62) {
            goto LABEL_48;
          }
          uint64_t v23 = v18 - (void)v20;
          if (v23 >> 1 > v22) {
            unint64_t v22 = v23 >> 1;
          }
          BOOL v24 = (unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL;
          unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v24) {
            unint64_t v25 = v22;
          }
          if (v25)
          {
            unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v25);
            v16 = *v17;
            unint64_t v20 = *(_DWORD **)v15;
          }
          else
          {
            uint64_t v26 = 0;
          }
          v31 = (_DWORD *)(v25 + 4 * v21);
          _DWORD *v31 = v13;
          unint64_t v19 = v31 + 1;
          while (v16 != v20)
          {
            int v32 = *--v16;
            *--v31 = v32;
          }
          *(void *)uint64_t v15 = v31;
          *uint64_t v17 = v19;
          *(void *)(v15 + 16) = v25 + 4 * v26;
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          _DWORD *v16 = v13;
          unint64_t v19 = v16 + 1;
        }
        *uint64_t v17 = v19;
      }
      ++v13;
      uint64_t v9 = *a2;
      if (v13 >= v9) {
        goto LABEL_41;
      }
    }
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
LABEL_41:
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(*(void *)(a1 + 32) + 152), v10, (uint64_t)v11, (v11 - v10) >> 2);
  v36 = (uint64_t *)(*(void *)(a1 + 32) + 176);
  if (v36 != &v40) {
    std::vector<std::vector<unsigned int>>::__assign_with_size[abi:ne180100]<std::vector<unsigned int>*,std::vector<unsigned int>*>(v36, v40, v41, 0xAAAAAAAAAAAAAAABLL * ((v41 - v40) >> 3));
  }
  uint64_t v37 = 1;
LABEL_45:
  v42 = (void **)&v40;
  std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v42);
  if (v10) {
    operator delete(v10);
  }
  return v37;
}

uint64_t __53__VNContoursObservation__initializePolygonContainers__block_invoke_3(uint64_t a1)
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  v2 = (unsigned int *)[*(id *)(*(void *)(a1 + 32) + 96) bytes];
  *(_OWORD *)__dst = 0u;
  long long v168 = 0u;
  int32x2_t v169 = 0;
  size_t v3 = *v2;
  if (v3)
  {
    std::vector<unsigned char>::__append((unint64_t *)__dst, v3);
    size_t v4 = *v2;
    if (v4) {
      memmove(__dst[0], v2 + 2, v4);
    }
  }
  DWORD2(v168) = v2[1];
  v163 = *(apple::vision::libraries::autotrace::EPolygonList **)(*(void *)(a1 + 32) + 136);
  if (!apple::vision::libraries::autotrace::EPolygonList::init(v163)) {
    goto LABEL_174;
  }
  int32x2_t v169 = 0;
  HIDWORD(v168) = 0;
  __int32 v6 = DWORD2(v168);
  if (SDWORD2(v168) >= 1)
  {
    __int32 v7 = 0;
    int v8 = 0;
    uint64_t v9 = 0;
    v162 = @"%s: could not allocate new polygon (nPoints %d)";
    long long v164 = v5;
    float64x2_t v165 = (float64x2_t)vdupq_n_s64(0x3F70000000000000uLL);
    do
    {
      if (v7 == v6) {
        goto LABEL_174;
      }
      __int8 v10 = v169.i8[0];
      int v11 = HIDWORD(v168);
      unsigned int v12 = *((unsigned __int8 *)__dst[0] + SHIDWORD(v168));
      int32x2_t v13 = vadd_s32(v169, (int32x2_t)0x100000001);
      int32x2_t v169 = v13;
      __int8 v14 = v13.i8[0];
      if (v13.i32[0] == 8)
      {
        __int8 v14 = 0;
        int v11 = ++HIDWORD(v168);
        v169.i32[0] = 0;
      }
      __int32 v15 = v13.i32[1];
      if ((v12 >> v10))
      {
        if (v9)
        {
          if (v13.i32[1] == v6) {
            goto LABEL_174;
          }
          unsigned int v16 = *((unsigned __int8 *)__dst[0] + v11);
          int32x2_t v169 = vadd_s32(v169, (int32x2_t)0x100000001);
          if (v169.i32[0] == 8)
          {
            HIDWORD(v168) = v11 + 1;
            v169.i32[0] = 0;
          }
          if ((v16 >> v14)) {
            --v8;
          }
          else {
            v170[v8++] = -858993459 * (((unint64_t)v9 - *((void *)v163 + 1)) >> 3);
          }
        }
      }
      else
      {
        BOOL v17 = 0;
        int v18 = 0;
        unsigned int v19 = 0;
        while (v15 != v6)
        {
          unsigned int v20 = *((unsigned __int8 *)__dst[0] + v11);
          int32x2_t v21 = vadd_s32(v169, (int32x2_t)0x100000001);
          int32x2_t v169 = v21;
          __int8 v22 = v21.i8[0];
          if (v21.i32[0] == 8)
          {
            __int8 v22 = 0;
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          int v23 = (v20 >> v14) & 1;
          __int32 v15 = v21.i32[1];
          int v18 = v23 | (2 * v18);
          BOOL v17 = v19 > 0x1E;
          __int8 v14 = v22;
          if (++v19 == 32) {
            goto LABEL_25;
          }
        }
        if (!v17) {
          goto LABEL_174;
        }
        int v18 = 0;
        __int8 v22 = v14;
        __int32 v15 = v6;
LABEL_25:
        BOOL v24 = 0;
        int v25 = 0;
        unsigned int v26 = 0;
        while (v15 != v6)
        {
          unsigned int v27 = *((unsigned __int8 *)__dst[0] + v11);
          int32x2_t v28 = vadd_s32(v169, (int32x2_t)0x100000001);
          int32x2_t v169 = v28;
          __int8 v29 = v28.i8[0];
          if (v28.i32[0] == 8)
          {
            __int8 v29 = 0;
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          int v30 = (v27 >> v22) & 1;
          __int32 v15 = v28.i32[1];
          int v25 = v30 | (2 * v25);
          BOOL v24 = v26 > 0x1E;
          __int8 v22 = v29;
          if (++v26 == 32)
          {
            long long v31 = v164;
            LODWORD(v31) = v25;
            long long v164 = v31;
            __int8 v22 = v29;
            goto LABEL_32;
          }
        }
        __int32 v15 = v6;
        if (!v24) {
          goto LABEL_174;
        }
LABEL_32:
        BOOL v32 = 0;
        int v33 = 0;
        unsigned int v34 = 0;
        while (v15 != v6)
        {
          unsigned int v35 = *((unsigned __int8 *)__dst[0] + v11);
          int32x2_t v36 = vadd_s32(v169, (int32x2_t)0x100000001);
          int32x2_t v169 = v36;
          __int8 v37 = v36.i8[0];
          if (v36.i32[0] == 8)
          {
            __int8 v37 = 0;
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          int v38 = (v35 >> v22) & 1;
          __int32 v15 = v36.i32[1];
          int v33 = v38 | (2 * v33);
          BOOL v32 = v34 > 0x1E;
          __int8 v22 = v37;
          if (++v34 == 32)
          {
            long long v39 = v164;
            DWORD1(v39) = v33;
            long long v164 = v39;
            goto LABEL_39;
          }
        }
        __int32 v15 = v6;
        if (!v32) {
          goto LABEL_174;
        }
LABEL_39:
        BOOL v40 = 0;
        unsigned int v41 = 0;
        while (v15 != v6)
        {
          int32x2_t v42 = vadd_s32(v169, (int32x2_t)0x100000001);
          int32x2_t v169 = v42;
          if (v42.i32[0] == 8)
          {
            HIDWORD(v168) = ++v11;
            v169.i32[0] = 0;
          }
          __int32 v15 = v42.i32[1];
          BOOL v40 = v41++ > 2;
          if (v41 == 4) {
            goto LABEL_46;
          }
        }
        if (!v40) {
          goto LABEL_174;
        }
LABEL_46:
        v43 = (apple::vision::libraries::autotrace::EPolygon *)apple::vision::libraries::autotrace::EPolygonList::newPolygon(v163, v18, 0);
        uint64_t v9 = v43;
        if (!v43) {
          goto LABEL_176;
        }
        v50.i64[0] = v164;
        v50.i64[1] = DWORD1(v164);
        *(float32x2_t *)apple::vision::libraries::autotrace::EPolygon::addPointAtEnd(v43) = vcvt_f32_f64(vmulq_f64(vcvtq_f64_u64(v50), v165));
        v51 = (char *)malloc_type_malloc(4 * (v18 - 1), 0x100004052888210uLL);
        if (!v51)
        {
          v162 = @"%s: could not allocate deltas array for polygon (nPoints %d)";
LABEL_176:
          VNValidatedLog(4, (uint64_t)v162, v44, v45, v46, v47, v48, v49, (uint64_t)"polygonListWithBitString");
          goto LABEL_174;
        }
        int v52 = v18 - 1;
        if (v18 > 1)
        {
          v53 = (unsigned __int8 *)__dst[0];
          __int32 v54 = DWORD2(v168);
          int v55 = HIDWORD(v168);
          int v56 = 1;
          __int32 v57 = v169.i32[1];
          while (1)
          {
            if (v57 == v54) {
              goto LABEL_173;
            }
            unsigned int v58 = v53[v55];
            __int8 v59 = v169.i8[0];
            int32x2_t v60 = vadd_s32(v169, (int32x2_t)0x100000001);
            int32x2_t v169 = v60;
            __int8 v61 = v60.i8[0];
            if (v60.i32[0] == 8)
            {
              __int8 v61 = 0;
              HIDWORD(v168) = ++v55;
              v169.i32[0] = 0;
            }
            uint64_t v62 = v56 - 1;
            __int32 v57 = v60.i32[1];
            v63 = (unsigned __int8 *)__dst[0];
            BOOL v64 = 0;
            if (((v58 >> v59) & 1) == 0)
            {
              __int16 v71 = 0;
              unsigned int v72 = 0;
              while (v57 != v54)
              {
                unsigned int v73 = *((unsigned __int8 *)__dst[0] + v55);
                int32x2_t v74 = vadd_s32(v169, (int32x2_t)0x100000001);
                int32x2_t v169 = v74;
                __int8 v75 = v74.i8[0];
                if (v74.i32[0] == 8)
                {
                  __int8 v75 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                int v76 = (v73 >> v61) & 1;
                __int32 v57 = v74.i32[1];
                __int16 v71 = v76 | (2 * v71);
                BOOL v64 = v72 > 8;
                __int8 v61 = v75;
                if (++v72 == 10) {
                  goto LABEL_87;
                }
              }
              if (v64)
              {
                __int16 v71 = 0;
                __int8 v75 = v61;
                __int32 v57 = v54;
LABEL_87:
                BOOL v92 = 0;
                __int16 v93 = 0;
                unsigned int v94 = 0;
                while (v57 != v54)
                {
                  unsigned int v95 = *((unsigned __int8 *)__dst[0] + v55);
                  int32x2_t v96 = vadd_s32(v169, (int32x2_t)0x100000001);
                  int32x2_t v169 = v96;
                  __int8 v97 = v96.i8[0];
                  if (v96.i32[0] == 8)
                  {
                    __int8 v97 = 0;
                    HIDWORD(v168) = ++v55;
                    v169.i32[0] = 0;
                  }
                  int v98 = (v95 >> v75) & 1;
                  __int32 v57 = v96.i32[1];
                  __int16 v93 = v98 | (2 * v93);
                  BOOL v92 = v94 > 8;
                  __int8 v75 = v97;
                  if (++v94 == 10) {
                    goto LABEL_94;
                  }
                }
                __int32 v57 = v54;
                __int16 v93 = v71;
                if (v92)
                {
LABEL_94:
                  v99 = &v51[4 * v62];
                  *(_WORD *)v99 = v71 - 512;
                  *((_WORD *)v99 + 1) = v93 - 512;
                  goto LABEL_159;
                }
              }
              goto LABEL_173;
            }
            LODWORD(v65) = 0;
            int v66 = 0;
            while (v57 != v54)
            {
              unsigned int v67 = *((unsigned __int8 *)__dst[0] + v55);
              int32x2_t v68 = vadd_s32(v169, (int32x2_t)0x100000001);
              int32x2_t v169 = v68;
              __int8 v69 = v68.i8[0];
              if (v68.i32[0] == 8)
              {
                __int8 v69 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              int v70 = (v67 >> v61) & 1;
              __int32 v57 = v68.i32[1];
              uint64_t v65 = v70 | (2 * v65);
              BOOL v64 = v66 != 0;
              __int8 v61 = v69;
              if (++v66 == 2) {
                goto LABEL_68;
              }
            }
            if (!v64) {
              goto LABEL_173;
            }
            uint64_t v65 = 0;
            __int32 v57 = v54;
            __int8 v69 = v61;
LABEL_68:
            BOOL v77 = 0;
            LODWORD(v78) = 0;
            unsigned int v79 = 0;
            int v80 = (v65 & 1) != 0 ? 256 : -256;
            while (v57 != v54)
            {
              unsigned int v81 = *((unsigned __int8 *)__dst[0] + v55);
              int32x2_t v82 = vadd_s32(v169, (int32x2_t)0x100000001);
              int32x2_t v169 = v82;
              __int8 v83 = v82.i8[0];
              if (v82.i32[0] == 8)
              {
                __int8 v83 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              int v84 = (v81 >> v69) & 1;
              __int32 v57 = v82.i32[1];
              uint64_t v78 = v84 | (2 * v78);
              BOOL v77 = v79 > 2;
              __int8 v69 = v83;
              if (++v79 == 4) {
                goto LABEL_77;
              }
            }
            __int32 v57 = v54;
            __int8 v83 = v69;
            uint64_t v78 = v65;
            if (!v77) {
              goto LABEL_173;
            }
LABEL_77:
            if (v78 >= 0xF)
            {
              BOOL v86 = 0;
              LODWORD(v85) = 0;
              unsigned int v87 = 0;
              while (v57 != v54)
              {
                unsigned int v88 = *((unsigned __int8 *)__dst[0] + v55);
                int32x2_t v89 = vadd_s32(v169, (int32x2_t)0x100000001);
                int32x2_t v169 = v89;
                __int8 v90 = v89.i8[0];
                if (v89.i32[0] == 8)
                {
                  __int8 v90 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                int v91 = (v88 >> v83) & 1;
                __int32 v57 = v89.i32[1];
                uint64_t v85 = v91 | (2 * v85);
                BOOL v86 = v87 > 0x1E;
                __int8 v83 = v90;
                if (++v87 == 32) {
                  goto LABEL_96;
                }
              }
              __int32 v57 = v54;
              uint64_t v85 = v78;
              if (!v86) {
                goto LABEL_173;
              }
LABEL_96:
              uint64_t v78 = v85;
              if ((int)v85 < 1)
              {
                int v56 = v62;
                goto LABEL_159;
              }
            }
            else
            {
              LODWORD(v85) = v78 + 1;
            }
            int v100 = 0;
            __int32 v101 = DWORD2(v168);
            do
            {
              if (v57 == v54) {
                goto LABEL_173;
              }
              unsigned int v102 = v63[v55];
              __int8 v103 = v169.i8[0];
              int32x2_t v104 = vadd_s32(v169, (int32x2_t)0x100000001);
              int32x2_t v169 = v104;
              uint64_t v105 = v104.u32[0];
              if (v104.i32[0] == 8)
              {
                uint64_t v105 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              __int32 v57 = v104.i32[1];
              if (((v102 >> v103) & 1) == 0)
              {
                uint64_t v49 = 0;
                LODWORD(v117) = 0;
                uint64_t v110 = 0;
                while (v57 != v101)
                {
                  unsigned int v118 = *((unsigned __int8 *)__dst[0] + v55);
                  int32x2_t v119 = vadd_s32(v169, (int32x2_t)0x100000001);
                  int32x2_t v169 = v119;
                  uint64_t v112 = v119.u32[0];
                  if (v119.i32[0] == 8)
                  {
                    uint64_t v112 = 0;
                    HIDWORD(v168) = ++v55;
                    v169.i32[0] = 0;
                  }
                  int v120 = (v118 >> v105) & 1;
                  __int32 v57 = v119.i32[1];
                  uint64_t v117 = v120 | (2 * v117);
                  int v121 = v110 + 1;
                  uint64_t v49 = v110 > 3;
                  uint64_t v105 = v112;
                  uint64_t v110 = (v110 + 1);
                  if (v121 == 5) {
                    goto LABEL_144;
                  }
                }
                uint64_t v112 = v105;
                __int32 v57 = v101;
                uint64_t v117 = v78;
                if (v49)
                {
LABEL_144:
                  if (v117 < 0x1F)
                  {
                    uint64_t v106 = (v117 - 15);
                    goto LABEL_154;
                  }
                  uint64_t v110 = 0;
                  LODWORD(v140) = 0;
                  uint64_t v105 = 0;
                  while (v57 != v101)
                  {
                    unsigned int v141 = *((unsigned __int8 *)__dst[0] + v55);
                    int32x2_t v142 = vadd_s32(v169, (int32x2_t)0x100000001);
                    int32x2_t v169 = v142;
                    uint64_t v49 = v142.u32[0];
                    if (v142.i32[0] == 8)
                    {
                      uint64_t v49 = 0;
                      HIDWORD(v168) = ++v55;
                      v169.i32[0] = 0;
                    }
                    int v143 = (v141 >> v112) & 1;
                    __int32 v57 = v142.i32[1];
                    uint64_t v140 = v143 | (2 * v140);
                    int v144 = v105 + 1;
                    uint64_t v110 = v105 > 8;
                    uint64_t v112 = v49;
                    uint64_t v105 = (v105 + 1);
                    if (v144 == 10) {
                      goto LABEL_153;
                    }
                  }
                  __int32 v57 = v101;
                  uint64_t v140 = v117;
                  if (v110)
                  {
LABEL_153:
                    uint64_t v106 = (v140 - 512);
                    uint64_t v117 = v140;
LABEL_154:
                    if ((int)v62 < v18)
                    {
                      int v56 = v62 + 1;
                      v145 = &v51[4 * (int)v62];
                      if (v65 > 1)
                      {
                        *(_WORD *)v145 = v106;
                        *((_WORD *)v145 + 1) = v80;
                      }
                      else
                      {
                        *(_WORD *)v145 = v80;
                        *((_WORD *)v145 + 1) = v106;
                      }
                      goto LABEL_158;
                    }
LABEL_172:
                    VNValidatedLog(4, @"%s: max index exceeded in run", v105, v117, v106, v112, v110, v49, (uint64_t)"decodeRun");
                  }
                }
LABEL_173:
                free(v51);
LABEL_174:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x1A6255EF0](exception, "polygonListWithBitString failed");
                __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
              }
              if (v104.i32[1] == v101) {
                goto LABEL_173;
              }
              uint64_t v106 = v63[v55];
              int32x2_t v107 = vadd_s32(v169, (int32x2_t)0x100000001);
              int32x2_t v169 = v107;
              __int8 v108 = v107.i8[0];
              if (v107.i32[0] == 8)
              {
                __int8 v108 = 0;
                HIDWORD(v168) = ++v55;
                v169.i32[0] = 0;
              }
              BOOL v109 = 0;
              LODWORD(v110) = 0;
              unsigned int v111 = 0;
              __int32 v57 = v107.i32[1];
              uint64_t v112 = (uint64_t)__dst[0];
              while (v57 != v101)
              {
                unsigned int v113 = *((unsigned __int8 *)__dst[0] + v55);
                int32x2_t v114 = vadd_s32(v169, (int32x2_t)0x100000001);
                int32x2_t v169 = v114;
                __int8 v115 = v114.i8[0];
                if (v114.i32[0] == 8)
                {
                  __int8 v115 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                int v116 = (v113 >> v108) & 1;
                __int32 v57 = v114.i32[1];
                uint64_t v110 = v116 | (2 * v110);
                BOOL v109 = v111 > 8;
                __int8 v108 = v115;
                uint64_t v49 = ++v111;
                if (v111 == 10) {
                  goto LABEL_118;
                }
              }
              __int8 v115 = v108;
              __int32 v57 = v101;
              uint64_t v110 = v78;
              if (!v109) {
                goto LABEL_173;
              }
LABEL_118:
              BOOL v122 = 0;
              LODWORD(v123) = 0;
              unsigned int v124 = 0;
              int v125 = v110 - 512;
              do
              {
                if (v57 == v101)
                {
                  __int16 v130 = v110 - 512;
                  __int32 v57 = v101;
                  if (v122) {
                    goto LABEL_125;
                  }
                  goto LABEL_173;
                }
                unsigned int v126 = *((unsigned __int8 *)__dst[0] + v55);
                int32x2_t v127 = vadd_s32(v169, (int32x2_t)0x100000001);
                int32x2_t v169 = v127;
                __int8 v128 = v127.i8[0];
                if (v127.i32[0] == 8)
                {
                  __int8 v128 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                int v129 = (v126 >> v115) & 1;
                __int32 v57 = v127.i32[1];
                uint64_t v123 = v129 | (2 * v123);
                BOOL v122 = v124 > 8;
                __int8 v115 = v128;
                uint64_t v49 = ++v124;
              }
              while (v124 != 10);
              __int16 v130 = v123 - 512;
              __int8 v115 = v128;
              uint64_t v110 = v123;
LABEL_125:
              BOOL v131 = 0;
              LODWORD(v117) = 0;
              unsigned int v132 = 0;
              while (v57 != v101)
              {
                unsigned int v133 = *((unsigned __int8 *)__dst[0] + v55);
                int32x2_t v134 = vadd_s32(v169, (int32x2_t)0x100000001);
                int32x2_t v169 = v134;
                uint64_t v49 = v134.u32[0];
                if (v134.i32[0] == 8)
                {
                  uint64_t v49 = 0;
                  HIDWORD(v168) = ++v55;
                  v169.i32[0] = 0;
                }
                int v135 = (v133 >> v115) & 1;
                __int32 v57 = v134.i32[1];
                uint64_t v117 = v135 | (2 * v117);
                BOOL v131 = v132 > 8;
                __int8 v115 = v49;
                if (++v132 == 10) {
                  goto LABEL_132;
                }
              }
              __int32 v57 = v101;
              uint64_t v117 = v110;
              if (!v131) {
                goto LABEL_173;
              }
LABEL_132:
              if ((int)v62 >= v18) {
                goto LABEL_172;
              }
              unsigned int v136 = (v80 << ((v106 >> v105) & 1)) - v125;
              v137 = &v51[4 * (int)v62];
              if (v65 >= 2) {
                __int16 v138 = v130;
              }
              else {
                __int16 v138 = v125;
              }
              if (v65 >= 2)
              {
                uint64_t v49 = (v117 - 512);
              }
              else
              {
                LOWORD(v125) = v130;
                uint64_t v49 = v136;
              }
              *(_WORD *)v137 = v138;
              *((_WORD *)v137 + 1) = v125;
              if (v65 >= 2) {
                __int16 v139 = v136;
              }
              else {
                __int16 v139 = v117 - 512;
              }
              *((_WORD *)v137 + 2) = v49;
              *((_WORD *)v137 + 3) = v139;
              int v56 = v62 + 2;
              ++v100;
LABEL_158:
              ++v100;
              uint64_t v78 = v117;
              LODWORD(v62) = v56;
            }
            while (v100 < (int)v85);
LABEL_159:
            if (++v56 >= v18)
            {
              v146 = (__int16 *)v51;
              float32x2_t v147 = (float32x2_t)v164;
              int32x2_t v148 = (int32x2_t)v164;
              do
              {
                v147.i16[0] = *v146;
                v147.i16[2] = v146[1];
                int32x2_t v166 = (int32x2_t)v147;
                v149 = apple::vision::libraries::autotrace::EPolygon::addPointAtEnd(v9);
                int32x2_t v148 = vsra_n_s32(v148, vshl_n_s32(v166, 0x10uLL), 0x10uLL);
                v150.i64[0] = v148.i32[0];
                v150.i64[1] = v148.i32[1];
                float32x2_t v147 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_s64(v150), v165));
                *(float32x2_t *)v149 = v147;
                v146 += 2;
                --v52;
              }
              while (v52);
              break;
            }
          }
        }
        free(v51);
        *((unsigned char *)v9 + 20) = 1;
        if (v8 >= 1)
        {
          int v157 = v170[v8 - 1];
          uint64_t v158 = *((void *)v163 + 1);
          uint64_t v159 = v158 + 40 * v157;
          *((_DWORD *)v9 + 6) = *(_DWORD *)(v159 + 28);
          *(_DWORD *)(v159 + 28) = -858993459 * (((unint64_t)v9 - v158) >> 3);
          *((_DWORD *)v9 + 8) = v157;
          if (v157 < 0 || v157 >= *(_DWORD *)v163) {
            VNValidatedLog(4, @"%s: parent index out of whack", v151, v152, v153, v154, v155, v156, (uint64_t)"polygonListWithBitString");
          }
        }
      }
      __int32 v7 = v169.i32[1];
      __int32 v6 = DWORD2(v168);
    }
    while (v169.i32[1] < SDWORD2(v168));
  }
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }
  return 1;
}

- (void)dealloc
{
  CGPathRelease(self->_normalizedPath);
  v3.receiver = self;
  v3.super_class = (Class)VNContoursObservation;
  [(VNContoursObservation *)&v3 dealloc];
}

- (VNContoursObservation)initWithOriginatingRequestSpecifier:(id)a3 compressedPoints:(id)a4 imageSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  int v11 = 0;
  if (width > 0.0 && height > 0.0)
  {
    v14.receiver = self;
    v14.super_class = (Class)VNContoursObservation;
    unsigned int v12 = [(VNObservation *)&v14 initWithOriginatingRequestSpecifier:v9];
    self = v12;
    if (v12
      && (objc_storeStrong((id *)&v12->_compressedPoints, a4),
          self->_imageSize.double width = width,
          self->_imageSize.double height = height,
          self->_pathLock._os_unfair_lock_opaque = 0,
          [(VNContoursObservation *)self _initializePolygonContainers]))
    {
      self = self;
      int v11 = self;
    }
    else
    {
      int v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPath)normalizedPathInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  memset(v7, 0, sizeof(v7));
  size_t v4 = [(VNContoursObservation *)self normalizedPath];
  long long v5 = (const void *)MEMORY[0x1A62553C0](v4, v7);
  CFAutorelease(v5);
  return (CGPath *)v5;
}

@end