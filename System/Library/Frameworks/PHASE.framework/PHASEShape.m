@interface PHASEShape
+ (PHASEShape)new;
- (NSArray)elements;
- (PHASEEngine)engine;
- (PHASEShape)init;
- (PHASEShape)initWithEngine:(PHASEEngine *)engine mesh:(MDLMesh *)mesh;
- (PHASEShape)initWithEngine:(PHASEEngine *)engine mesh:(MDLMesh *)mesh materials:(NSArray *)materials;
- (PHASEShape)initWithEngine:(id)a3 mesh:(id)a4 materials:(id)a5 options:(id)a6;
- (PHASEShape)initWithEngine:(id)a3 mesh:(id)a4 options:(id)a5;
- (PHASEShape)initWithShape:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dumpState;
- (id)geoShapeHandlesForEntityType:(unsigned int)a3;
- (void)applyOptions:(id)a3;
- (void)buildLocalizedGeometryPermutations;
- (void)dealloc;
- (void)setEngine:(id)a3;
- (void)updateMaterialForElement:(id)a3;
- (void)updateMaterialForShape:(Handle64)a3 fromElementIndex:(unint64_t)a4;
@end

@implementation PHASEShape

- (PHASEShape)init
{
  return 0;
}

+ (PHASEShape)new
{
  return 0;
}

- (PHASEShape)initWithShape:(id)a3
{
  v4 = (char *)a3;
  v48.receiver = self;
  v48.super_class = (Class)PHASEShape;
  v5 = [(PHASEShape *)&v48 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_38;
  }
  id WeakRetained = objc_loadWeakRetained((id *)v4 + 10);
  v8 = (id *)(v5 + 80);
  objc_storeWeak((id *)v5 + 10, WeakRetained);

  v9 = (void **)*((void *)v4 + 2);
  if (v9 && *v9) {
    Phase::MdlMeshAsset::Initialize((Phase::MdlMeshAsset *)(v5 + 8), *v9);
  }
  *((_DWORD *)v5 + 8) = *((_DWORD *)v4 + 8);
  *((void *)v5 + 5) = *((void *)v4 + 5);
  v5[48] = v4[48];
  if (v5 != v4)
  {
    uint64_t v11 = *((void *)v4 + 7);
    uint64_t v10 = *((void *)v4 + 8);
    unint64_t v12 = 0x2E8BA2E8BA2E8BA3 * ((v10 - v11) >> 3);
    uint64_t v13 = *((void *)v5 + 9);
    uint64_t v14 = *((void *)v5 + 7);
    if (0x2E8BA2E8BA2E8BA3 * ((v13 - v14) >> 3) >= v12)
    {
      unint64_t v24 = 0x2E8BA2E8BA2E8BA3 * ((*((void *)v5 + 8) - v14) >> 3);
      if (v24 >= v12)
      {
        uint64_t v26 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *>(*((void *)v4 + 7), *((void *)v4 + 8), *((void *)v5 + 7));
        for (uint64_t i = *((void *)v5 + 8);
              i != v26;
              std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100](i))
        {
          i -= 88;
        }
        *((void *)v5 + 8) = v26;
        goto LABEL_27;
      }
      uint64_t v25 = v11 + 8 * ((*((void *)v5 + 8) - v14) >> 3);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *,Phase::LocalizedGeometryPermutation *>(*((void *)v4 + 7), v11 + 88 * v24, *((void *)v6 + 7));
      uint64_t v23 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*>(v25, v10, *((void *)v6 + 8));
    }
    else
    {
      if (v14)
      {
        v15 = v5 + 56;
        uint64_t v16 = *((void *)v5 + 8);
        v17 = (void *)*((void *)v6 + 7);
        if (v16 != v14)
        {
          do
          {
            v16 -= 88;
            std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100](v16);
          }
          while (v16 != v14);
          v17 = *(void **)v15;
        }
        *((void *)v6 + 8) = v14;
        operator delete(v17);
        uint64_t v13 = 0;
        *(void *)v15 = 0;
        *((void *)v15 + 1) = 0;
        *((void *)v15 + 2) = 0;
      }
      if (v12 > 0x2E8BA2E8BA2E8BALL) {
        goto LABEL_40;
      }
      unint64_t v18 = 0x2E8BA2E8BA2E8BA3 * (v13 >> 3);
      uint64_t v19 = 2 * v18;
      if (2 * v18 <= v12) {
        uint64_t v19 = 0x2E8BA2E8BA2E8BA3 * ((v10 - v11) >> 3);
      }
      unint64_t v20 = v18 >= 0x1745D1745D1745DLL ? 0x2E8BA2E8BA2E8BALL : v19;
      if (v20 > 0x2E8BA2E8BA2E8BALL) {
LABEL_40:
      }
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>>(v20);
      *((void *)v6 + 7) = v21;
      *((void *)v6 + 8) = v21;
      *((void *)v6 + 9) = &v21[88 * v22];
      uint64_t v23 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*,Phase::LocalizedGeometryPermutation*>(v11, v10, (uint64_t)v21);
    }
    *((void *)v6 + 8) = v23;
  }
LABEL_27:
  v28 = [v4 elements];
  uint64_t v29 = [v28 count];

  if (v29)
  {
    v46 = v8;
    v30 = [MEMORY[0x263EFF980] arrayWithCapacity:v29];
    for (uint64_t j = 0; j != v29; ++j)
    {
      v32 = [PHASEShapeElement alloc];
      v33 = [v4 elements];
      v34 = [v33 objectAtIndexedSubscript:j];
      v35 = [v34 material];
      v36 = [(PHASEShapeElement *)v32 initWithOwner:v6 material:v35];
      [v30 setObject:v36 atIndexedSubscript:j];
    }
    uint64_t v37 = [MEMORY[0x263EFF8C0] arrayWithArray:v30];
    v38 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v37;

    v8 = v46;
  }
  std::vector<unsigned int>::vector(&v47, 1uLL);
  begin = v47.__begin_;
  *v47.__begin_ = 1;
  uint64_t v40 = *((void *)v6 + 7);
  uint64_t v41 = *((void *)v6 + 8);
  if (v40 == v41) {
    goto LABEL_37;
  }
  do
  {
    if (*(void *)(v40 + 80))
    {
      id v42 = objc_loadWeakRetained(v8);
      uint64_t v43 = [v42 implementation];
      uint64_t v44 = (*(uint64_t (**)(void, void, std::vector<unsigned int> *))(**(void **)(v43 + 368) + 64))(*(void *)(v43 + 368), *(void *)(v40 + 80), &v47);

      if (!v44) {
        std::terminate();
      }
      *(void *)(v40 + 80) = v44;
    }
    v40 += 88;
  }
  while (v40 != v41);
  begin = v47.__begin_;
  if (v47.__begin_)
  {
LABEL_37:
    v47.__end_ = begin;
    operator delete(begin);
  }
LABEL_38:

  return (PHASEShape *)v6;
}

- (PHASEShape)initWithEngine:(PHASEEngine *)engine mesh:(MDLMesh *)mesh
{
  v6 = engine;
  v7 = mesh;
  v17.receiver = self;
  v17.super_class = (Class)PHASEShape;
  v8 = [(PHASEShape *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_engine, v6);
    Phase::MdlMeshAsset::Initialize((Phase::MdlMeshAsset *)&v9->_meshAsset, v7);
    v9->_voxelDensity = 64;
    v9->_flags = 7;
    v9->_isReal = 0;
    [(PHASEShape *)v9 buildLocalizedGeometryPermutations];
    uint64_t SubmeshCount = Phase::MdlMeshAsset::GetSubmeshCount((id **)&v9->_meshAsset);
    if (SubmeshCount)
    {
      uint64_t v11 = [MEMORY[0x263EFF980] arrayWithCapacity:SubmeshCount];
      uint64_t v12 = 0;
      do
      {
        uint64_t v13 = [[PHASEShapeElement alloc] initWithOwner:v9];
        [v11 setObject:v13 atIndexedSubscript:v12];

        ++v12;
      }
      while (SubmeshCount != v12);
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
      elements = v9->_elements;
      v9->_elements = (NSArray *)v14;
    }
  }

  return v9;
}

- (PHASEShape)initWithEngine:(PHASEEngine *)engine mesh:(MDLMesh *)mesh materials:(NSArray *)materials
{
  v8 = engine;
  v9 = mesh;
  uint64_t v10 = materials;
  uint64_t v11 = v10;
  if (v10 && [(NSArray *)v10 count])
  {
    uint64_t v12 = [(PHASEShape *)self initWithEngine:v8 mesh:v9];
    if (v12 && [(NSArray *)v11 count])
    {
      uint64_t v13 = 0;
      for (unint64_t i = 0; i < [(NSArray *)v12->_elements count]; ++i)
      {
        v15 = [(NSArray *)v11 objectAtIndexedSubscript:v13];
        uint64_t v16 = [(NSArray *)v12->_elements objectAtIndexedSubscript:i];
        [v16 setMaterial:v15];

        if (v13 + 1 < [(NSArray *)v11 count]) {
          ++v13;
        }
        else {
          uint64_t v13 = 0;
        }
      }
    }
    self = v12;
    objc_super v17 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"API Misuse" format:@"initWithEngine:mesh:materials - the materials array cannot be nil or empty"];
    objc_super v17 = 0;
  }

  return v17;
}

- (PHASEShape)initWithEngine:(id)a3 mesh:(id)a4 options:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v29 = a4;
  id v30 = a5;
  v32 = v8;
  v9 = [(PHASEShape *)self initWithEngine:v8 mesh:v29];
  uint64_t v10 = v9;
  if (v9)
  {
    [(PHASEShape *)v9 applyOptions:v30];
    [(PHASEShape *)v10 buildLocalizedGeometryPermutations];
  }
  v31 = v10;
  if (v10->_isReal)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = [v29 submeshes];
    uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v11)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v16 = [v15 material];
          objc_super v17 = [v16 propertyNamed:@"ARMeshGeometryClassification"];

          unint64_t v18 = [v15 material];
          uint64_t v19 = [v18 propertyNamed:@"ARMeshGeometryMaterial"];

          if (v17) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (!v20)
          {
            v38[0] = @"ARMeshClassificationID";
            v21 = NSNumber;
            [v17 floatValue];
            uint64_t v22 = objc_msgSend(v21, "numberWithFloat:");
            v38[1] = @"ARMeshMaterialID";
            v39[0] = v22;
            uint64_t v23 = NSNumber;
            [v19 floatValue];
            unint64_t v24 = objc_msgSend(v23, "numberWithFloat:");
            v39[1] = v24;
            uint64_t v25 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];

            uint64_t v26 = [[PHASEMaterial alloc] initWithEngine:v32 semantics:v25];
            v27 = [(NSArray *)v31->_elements objectAtIndexedSubscript:v12 + i];
            [v27 setMaterial:v26];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
        v12 += i;
      }
      while (v11);
    }
  }
  return v31;
}

- (PHASEShape)initWithEngine:(id)a3 mesh:(id)a4 materials:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(PHASEShape *)self initWithEngine:v10 mesh:v11 materials:v12];
  v15 = v14;
  if (v14)
  {
    [(PHASEShape *)v14 applyOptions:v13];
    [(PHASEShape *)v15 buildLocalizedGeometryPermutations];
  }

  return v15;
}

- (id)geoShapeHandlesForEntityType:(unsigned int)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  begin = self->_localizedGeometryPermutations.__begin_;
  end = self->_localizedGeometryPermutations.__end_;
  if (begin == end)
  {
LABEL_31:
    if (a3 - 3 <= 2 && ![v33 count])
    {
      unint64_t v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(0)
                                                                                          + 432)));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = [(PHASEShape *)self dumpState];
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "PHASEShape.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 427;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = a3;
        __int16 v44 = 2112;
        v45 = v25;
        _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [PHASEShape geoShapeHandlesForEntityType] - Expected to find at least one geometry permutation with a matching entity type: %u.\n%@", buf, 0x22u);
      }
    }
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithArray:v33];
    goto LABEL_40;
  }
  location = (id *)&self->_engine;
  while (1)
  {
    v4 = (_DWORD *)*((void *)begin + 6);
    v5 = (_DWORD *)*((void *)begin + 7);
    if (v4 != v5) {
      break;
    }
LABEL_30:
    begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
    if (begin == end) {
      goto LABEL_31;
    }
  }
  uint64_t v34 = (uint64_t)begin + 8;
  while (1)
  {
    if (*v4 != a3) {
      goto LABEL_29;
    }
    uint64_t v6 = *((void *)begin + 10);
    if (!v6)
    {
      if ([(NSArray *)self->_elements count])
      {
        v31 = self->_elements;
        std::vector<unsigned long long>::vector(&__p, [(NSArray *)v31 count]);
        v7 = (uint64_t *)__p;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v8 = v31;
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v39 objects:buf count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v40 != v10) {
                objc_enumerationMutation(v8);
              }
              id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v13 = [v12 material];
              BOOL v14 = v13 == 0;

              if (v14)
              {
                uint64_t v16 = 0;
              }
              else
              {
                v15 = [v12 material];
                uint64_t v16 = [v15 geoMaterialHandle];
              }
              *v7++ = v16;
            }
            uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v39 objects:buf count:16];
          }
          while (v9);
        }

        memset(buf, 0, sizeof(buf));
        std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(buf, __p, (uint64_t)v38, (v38 - (unsigned char *)__p) >> 3);
        int v46 = 10;
        Phase::UnorderedStringMap<Phase::OptionsValue>::Set(v34, (uint64_t)&Phase::Geometry::ShapeOptions::MaterialList, (uint64_t)buf);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,unsigned int,float,double,Phase::Vector<float,2ul>,Phase::Vector<float,3ul>,Phase::Vector<float,4ul>,std::string,std::vector<unsigned int>,std::vector<unsigned long long>,Phase::UnorderedStringMap<Phase::OptionsValue>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
        if (__p)
        {
          v38 = __p;
          operator delete(__p);
        }
      }
      if (a3 == 4)
      {
        *(_DWORD *)buf = *((_DWORD *)begin + 18) & 7;
        int v46 = 2;
        Phase::UnorderedStringMap<Phase::OptionsValue>::Set(v34, (uint64_t)&Phase::Geometry::ShapeOptions::SceneQueryFilter, (uint64_t)buf);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,unsigned int,float,double,Phase::Vector<float,2ul>,Phase::Vector<float,3ul>,Phase::Vector<float,4ul>,std::string,std::vector<unsigned int>,std::vector<unsigned long long>,Phase::UnorderedStringMap<Phase::OptionsValue>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
      }
      if (*(_DWORD *)begin == 2)
      {
        *(_DWORD *)buf = self->_voxelDensity;
        int v46 = 1;
        Phase::UnorderedStringMap<Phase::OptionsValue>::Set(v34, (uint64_t)&Phase::Geometry::VoxelTreeOptions::Resolution, (uint64_t)buf);
        std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,int,unsigned int,float,double,Phase::Vector<float,2ul>,Phase::Vector<float,3ul>,Phase::Vector<float,4ul>,std::string,std::vector<unsigned int>,std::vector<unsigned long long>,Phase::UnorderedStringMap<Phase::OptionsValue>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
      }
      id WeakRetained = objc_loadWeakRetained(location);
      uint64_t v18 = [WeakRetained implementation];
      uint64_t v6 = (*(uint64_t (**)(void, void, MdlMeshAsset *, uint64_t))(**(void **)(v18 + 368) + 40))(*(void *)(v18 + 368), *(_DWORD *)begin, &self->_meshAsset, v34);
      *((void *)begin + 10) = v6;

      if (!v6) {
        goto LABEL_29;
      }
    }
    id v19 = objc_loadWeakRetained(location);
    uint64_t v20 = *(void *)([v19 implementation] + 368);
    memset(buf, 0, sizeof(buf));
    uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint8_t *))(*(void *)v20 + 64))(v20, v6, buf);
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }

    if (!v21) {
      break;
    }
    uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v21];
    [v33 addObject:v23];

LABEL_29:
    if (++v4 == v5) {
      goto LABEL_30;
    }
  }
  v27 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v22)
                                                                                      + 432)));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = [(PHASEShape *)self dumpState];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "PHASEShape.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 402;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    __int16 v44 = 2112;
    v45 = v28;
    _os_log_impl(&dword_221E5E000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEShape geoShapeHandlesForEntityType] - Failed to copy shapetype: %u.\n%@", buf, 0x22u);
  }
  uint64_t v26 = 0;
LABEL_40:

  return v26;
}

- (void)updateMaterialForElement:(id)a3
{
  id v8 = a3;
  unint64_t v4 = -[NSArray indexOfObject:](self->_elements, "indexOfObject:");
  if (v4 >= [(NSArray *)self->_elements count]) {
    std::terminate();
  }
  begin = self->_localizedGeometryPermutations.__begin_;
  end = self->_localizedGeometryPermutations.__end_;
  while (begin != end)
  {
    uint64_t v7 = *((void *)begin + 10);
    if (v7) {
      [(PHASEShape *)self updateMaterialForShape:v7 fromElementIndex:v4];
    }
    begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
  }
}

- (void)updateMaterialForShape:(Handle64)a3 fromElementIndex:(unint64_t)a4
{
  if (!a3.mData) {
    std::terminate();
  }
  id v11 = [(NSArray *)self->_elements objectAtIndexedSubscript:a4];
  uint64_t v7 = [v11 material];

  if (v7)
  {
    id v8 = [v11 material];
    uint64_t v7 = (void *)[v8 geoMaterialHandle];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v10 = [WeakRetained implementation];
  (*(void (**)(void, unint64_t, unint64_t, void *))(**(void **)(v10 + 368) + 80))(*(void *)(v10 + 368), a3.mData, a4, v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithShape:self];
}

- (void)dealloc
{
  p_engine = &self->_engine;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    begin = self->_localizedGeometryPermutations.__begin_;
    end = self->_localizedGeometryPermutations.__end_;
    while (begin != end)
    {
      if (*((void *)begin + 10))
      {
        id v7 = objc_loadWeakRetained((id *)p_engine);
        uint64_t v8 = [v7 implementation];
        (*(void (**)(void, void))(**(void **)(v8 + 368) + 304))(*(void *)(v8 + 368), *((void *)begin + 10));

        *((void *)begin + 10) = 0;
      }
      begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PHASEShape;
  [(PHASEShape *)&v9 dealloc];
}

- (void)applyOptions:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_super v9 = objc_msgSend(v4, "objectForKey:", v8, (void)v35);
        if ([v8 isEqualToString:@"PHASEVoxelDensityKey"])
        {
          objc_opt_class();
          uint64_t isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) == 0)
          {
            uint64_t v22 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)isKindOfClass)
                                                             + 432));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              long long v40 = "PHASEShape.mm";
              __int16 v41 = 1024;
              int v42 = 512;
              _os_log_impl(&dword_221E5E000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be of \" \"class NSNumber.\"", buf, 0x12u);
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be of class NSNumber.");
            goto LABEL_41;
          }
          id v11 = v9;
          id v12 = (Phase::Logger *)[v11 intValue];
          v13.i32[0] = (int)v12;
          uint8x8_t v14 = (uint8x8_t)vcnt_s8(v13);
          v14.i16[0] = vaddlv_u8(v14);
          if (v14.i32[0] != 1 || (v12 & 0xAAAAAAAA) != 0)
          {
            unint64_t v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v12)
                                                                                                + 432)));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              int v26 = [v11 intValue];
              *(_DWORD *)buf = 136315650;
              long long v40 = "PHASEShape.mm";
              __int16 v41 = 1024;
              int v42 = 505;
              __int16 v43 = 1024;
              LODWORD(v44) = v26;
              _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be a \" \"power of four. The value passed in == %d\"", buf, 0x18u);
            }

            v27 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(v27, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEVoxelDensityKey must be a power of four. The value passed in == %d");
            v27->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
          }
          self->_voxelDensity = [v11 intValue];
        }
        else if ([v8 isEqualToString:@"PHASEShapeCategoriesKey"])
        {
          objc_opt_class();
          uint64_t v16 = objc_opt_isKindOfClass();
          if ((v16 & 1) == 0)
          {
            v28 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v16) + 432);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              long long v40 = "PHASEShape.mm";
              __int16 v41 = 1024;
              int v42 = 538;
              _os_log_impl(&dword_221E5E000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must be of \" \"class NSNumber.\"", buf, 0x12u);
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must be of class NSNumber.");
            goto LABEL_41;
          }
          unint64_t v17 = [v9 unsignedIntegerValue];
          unint64_t v18 = v17;
          if ((v17 & 7) == 0)
          {
            id v29 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v17) + 432);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              long long v40 = "PHASEShape.mm";
              __int16 v41 = 1024;
              int v42 = 531;
              __int16 v43 = 2048;
              unint64_t v44 = v18;
              _os_log_impl(&dword_221E5E000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must \" \"contain a valid set of PHASESpatialPipelineFlags. The value passed in == %lu\"", buf, 0x1Cu);
            }
            id v30 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(v30, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeCategoriesKey must contain a valid set of PHASESpatialPipelineFlags. The value passed in == %lu");
            v30->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
          }
          self->_flags = v17;
        }
        else if ([v8 isEqualToString:@"PHASEShapeIsRealKey"])
        {
          objc_opt_class();
          uint64_t v19 = objc_opt_isKindOfClass();
          if ((v19 & 1) == 0)
          {
            v31 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)v19) + 432);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              long long v40 = "PHASEShape.mm";
              __int16 v41 = 1024;
              int v42 = 562;
              _os_log_impl(&dword_221E5E000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey must be of \" \"class NSNumber.\"", buf, 0x12u);
            }
            exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(exception, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey must be of class NSNumber.");
LABEL_41:
            exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
          }
          id v20 = v9;
          if ([v20 intValue])
          {
            uint64_t v21 = (Phase::Logger *)[v20 intValue];
            if (v21 != 1)
            {
              v32 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v21)
                                                                                                  + 432)));
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                int v33 = [v20 intValue];
                *(_DWORD *)buf = 136315650;
                long long v40 = "PHASEShape.mm";
                __int16 v41 = 1024;
                int v42 = 555;
                __int16 v43 = 1024;
                LODWORD(v44) = v33;
                _os_log_impl(&dword_221E5E000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::invalid_argument): \"[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey be either \" \"YES, NO, 1 (integer) or 0 (integer). The value passed in == %d\"", buf, 0x18u);
              }

              uint64_t v34 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
              std::logic_error::logic_error(v34, "[PHASEShape initWithEngine:mesh:materials:options] - The value for option PHASEShapeIsRealKey be either YES, NO, 1 (integer) or 0 (integer). The value passed in == %d");
              v34->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
            }
          }
          self->_isReal = [v20 BOOLValue];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v5);
  }
}

- (void)buildLocalizedGeometryPermutations
{
  begin = self->_localizedGeometryPermutations.__begin_;
  for (uint64_t i = self->_localizedGeometryPermutations.__end_;
        i != begin;
        std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100]((uint64_t)i))
  {
    uint64_t i = (LocalizedGeometryPermutation *)((char *)i - 88);
  }
  self->_localizedGeometryPermutations.__end_ = begin;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v6 = [WeakRetained implementation];
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  std::vector<Phase::Controller::GeometryPermutation>::__init_with_size[abi:ne180100]<Phase::Controller::GeometryPermutation*,Phase::Controller::GeometryPermutation*>(&v35, *(void *)(v6 + 544), *(void *)(v6 + 552), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(v6 + 552) - *(void *)(v6 + 544)) >> 4));

  uint64_t v7 = v35;
  for (uint64_t j = v36; v7 != j; v7 += 80)
  {
    unint64_t v9 = self->_flags & *(void *)(v7 + 72);
    if ((v9 & 7) != 0)
    {
      LODWORD(v28) = *(_DWORD *)v7;
      std::unordered_map<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalHash,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalEqualTo,std::allocator<std::pair<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey const,Phase::OptionsValue>>>::unordered_map((uint64_t)v29, v7 + 8);
      __p = 0;
      v31 = 0;
      uint64_t v32 = 0;
      std::vector<Phase::Geometry::EntityType>::__init_with_size[abi:ne180100]<Phase::Geometry::EntityType*,Phase::Geometry::EntityType*>(&__p, *(const void **)(v7 + 48), *(void *)(v7 + 56), (uint64_t)(*(void *)(v7 + 56) - *(void *)(v7 + 48)) >> 2);
      unint64_t v33 = v9;
      uint64_t v34 = 0;
      end = self->_localizedGeometryPermutations.__end_;
      value = self->_localizedGeometryPermutations.__end_cap_.__value_;
      if (end >= value)
      {
        int8x8_t v13 = self->_localizedGeometryPermutations.__begin_;
        uint64_t v14 = 0x2E8BA2E8BA2E8BA3 * ((end - v13) >> 3);
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) > 0x2E8BA2E8BA2E8BALL) {
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v16 = 0x2E8BA2E8BA2E8BA3 * ((value - v13) >> 3);
        if (2 * v16 > v15) {
          unint64_t v15 = 2 * v16;
        }
        if (v16 >= 0x1745D1745D1745DLL) {
          unint64_t v17 = 0x2E8BA2E8BA2E8BALL;
        }
        else {
          unint64_t v17 = v15;
        }
        p_end_cap = &self->_localizedGeometryPermutations.__end_cap_;
        if (v17) {
          unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<Phase::LocalizedGeometryPermutation>>(v17);
        }
        else {
          uint64_t v18 = 0;
        }
        unint64_t v38 = v17;
        v39.i64[0] = v17 + 88 * v14;
        v39.i64[1] = v39.i64[0];
        long long v40 = (LocalizedGeometryPermutation *)(v17 + 88 * v18);
        std::allocator<Phase::LocalizedGeometryPermutation>::construct[abi:ne180100]<Phase::LocalizedGeometryPermutation,Phase::LocalizedGeometryPermutation const&>(v39.i64[0], (uint64_t)&v28);
        uint64_t v19 = (LocalizedGeometryPermutation *)v39.i64[0];
        id v12 = (LocalizedGeometryPermutation *)(v39.i64[1] + 88);
        v39.i64[1] += 88;
        uint64_t v21 = self->_localizedGeometryPermutations.__begin_;
        id v20 = self->_localizedGeometryPermutations.__end_;
        if (v20 == v21)
        {
          int64x2_t v26 = vdupq_n_s64((unint64_t)v20);
        }
        else
        {
          uint64_t v22 = j;
          uint64_t v23 = 0;
          do
          {
            unint64_t v24 = (char *)v19 + v23;
            uint64_t v25 = (char *)v20 + v23;
            *(_DWORD *)((char *)v19 + v23 - 88) = *(_DWORD *)((char *)v20 + v23 - 88);
            std::__hash_table<std::__hash_value_type<int,Phase::Controller::Parameter<double>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Phase::Controller::Parameter<double>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Phase::Controller::Parameter<double>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Phase::Controller::Parameter<double>>>>::__hash_table((uint64_t)v19 + v23 - 80, (uint64_t *)((char *)v20 + v23 - 80));
            *((void *)v24 - 5) = 0;
            *((void *)v24 - 4) = 0;
            *((void *)v24 - 3) = 0;
            *(_OWORD *)(v24 - 40) = *(_OWORD *)((char *)v20 + v23 - 40);
            *((void *)v24 - 3) = *(void *)((char *)v20 + v23 - 24);
            *((void *)v25 - 5) = 0;
            *((void *)v25 - 4) = 0;
            *((void *)v25 - 3) = 0;
            *((_OWORD *)v24 - 1) = *(_OWORD *)((char *)v20 + v23 - 16);
            v23 -= 88;
          }
          while ((LocalizedGeometryPermutation *)((char *)v20 + v23) != v21);
          int64x2_t v26 = *(int64x2_t *)&self->_localizedGeometryPermutations.__begin_;
          id v12 = (LocalizedGeometryPermutation *)v39.i64[1];
          uint64_t v19 = (LocalizedGeometryPermutation *)((char *)v19 + v23);
          uint64_t j = v22;
        }
        self->_localizedGeometryPermutations.__begin_ = v19;
        self->_localizedGeometryPermutations.__end_ = v12;
        int64x2_t v39 = v26;
        v27 = self->_localizedGeometryPermutations.__end_cap_.__value_;
        self->_localizedGeometryPermutations.__end_cap_.__value_ = v40;
        long long v40 = v27;
        unint64_t v38 = v26.i64[0];
        std::__split_buffer<Phase::LocalizedGeometryPermutation>::~__split_buffer((uint64_t)&v38);
      }
      else
      {
        std::allocator<Phase::LocalizedGeometryPermutation>::construct[abi:ne180100]<Phase::LocalizedGeometryPermutation,Phase::LocalizedGeometryPermutation const&>((uint64_t)self->_localizedGeometryPermutations.__end_, (uint64_t)&v28);
        id v12 = (LocalizedGeometryPermutation *)((char *)end + 88);
        self->_localizedGeometryPermutations.__end_ = (LocalizedGeometryPermutation *)((char *)end + 88);
      }
      self->_localizedGeometryPermutations.__end_ = v12;
      if (__p)
      {
        v31 = __p;
        operator delete(__p);
      }
      std::__hash_table<std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>,std::__unordered_map_hasher<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalHash,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalEqualTo,true>,std::__unordered_map_equal<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalEqualTo,Phase::UnorderedStringMap<Phase::OptionsValue>::InternalHash,true>,std::allocator<std::__hash_value_type<Phase::UnorderedStringMap<Phase::OptionsValue>::InternalKey,Phase::OptionsValue>>>::~__hash_table((uint64_t)v29);
    }
  }
  v28 = (void **)&v35;
  std::vector<Phase::Controller::GeometryPermutation>::__destroy_vector::operator()[abi:ne180100](&v28);
}

- (id)dumpState
{
  v2 = self;
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"PHASEShape:%p: --- State ---", self);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_engine);
  uint64_t v5 = [WeakRetained implementation];
  uint64_t v23 = 0;
  unint64_t v24 = 0;
  uint64_t v25 = 0;
  std::vector<Phase::Controller::GeometryPermutation>::__init_with_size[abi:ne180100]<Phase::Controller::GeometryPermutation*,Phase::Controller::GeometryPermutation*>(&v23, *(void *)(v5 + 544), *(void *)(v5 + 552), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(v5 + 552) - *(void *)(v5 + 544)) >> 4));

  objc_msgSend(v3, "appendFormat:", @"\nGeometryPermutations (%lu):", 0xCCCCCCCCCCCCCCCDLL * (((char *)v24 - (char *)v23) >> 4));
  uint64_t v6 = v23;
  uint64_t v7 = v24;
  if (v23 != v24)
  {
    uint64_t v8 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"\n\t%d", v8);
      objc_msgSend(v3, "appendFormat:", @"\n\t\tShapeType = %d", *v6);
      unint64_t v9 = Phase::UnorderedStringMap<Phase::OptionsValue>::Find((void *)v6 + 1, (long long *)&Phase::Geometry::MeshOptions::SortPrimitives);
      if (v9)
      {
        uint64_t v10 = (unsigned int *)(v9 + 7);
        if (*((_DWORD *)v9 + 24) != 1) {
          uint64_t v10 = (unsigned int *)&dword_2645F71D8;
        }
      }
      else
      {
        uint64_t v10 = (unsigned int *)&dword_2645F71D8;
      }
      objc_msgSend(v3, "appendFormat:", @"\n\t\tPrimitiveSortType = %d", *v10);
      id v11 = v2;
      id v12 = (unsigned int *)*((void *)v6 + 6);
      int8x8_t v13 = (unsigned int *)*((void *)v6 + 7);
      while (v12 != v13)
        objc_msgSend(v3, "appendFormat:", @"\n\t\tEntityType (%d) = %d", 0, *v12++);
      objc_msgSend(v3, "appendFormat:", @"\n\t\tSpatialPipelineFlags = %lu", *((void *)v6 + 9));
      v2 = v11;
      uint64_t v8 = (v8 + 1);
      v6 += 20;
    }
    while (v6 != v7);
  }
  objc_msgSend(v3, "appendFormat:", @"\nLocalizedGeometryPermutations (%lu):", 0x2E8BA2E8BA2E8BA3* ((v2->_localizedGeometryPermutations.__end_ - v2->_localizedGeometryPermutations.__begin_) >> 3));
  begin = v2->_localizedGeometryPermutations.__begin_;
  end = (unsigned int *)v2->_localizedGeometryPermutations.__end_;
  if (begin != (LocalizedGeometryPermutation *)end)
  {
    uint64_t v16 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"\n\t%d", v16);
      objc_msgSend(v3, "appendFormat:", @"\n\t\tShapeType = %d", *(_DWORD *)begin);
      unint64_t v17 = Phase::UnorderedStringMap<Phase::OptionsValue>::Find((void *)begin + 1, (long long *)&Phase::Geometry::MeshOptions::SortPrimitives);
      if (v17)
      {
        uint64_t v18 = (unsigned int *)(v17 + 7);
        if (*((_DWORD *)v17 + 24) != 1) {
          uint64_t v18 = (unsigned int *)&dword_2645F71D8;
        }
      }
      else
      {
        uint64_t v18 = (unsigned int *)&dword_2645F71D8;
      }
      objc_msgSend(v3, "appendFormat:", @"\n\t\tPrimitiveSortType = %d", *v18);
      uint64_t v19 = (unsigned int *)*((void *)begin + 6);
      id v20 = (unsigned int *)*((void *)begin + 7);
      while (v19 != v20)
        objc_msgSend(v3, "appendFormat:", @"\n\t\tEntityType (%d) = %d", 0, *v19++);
      objc_msgSend(v3, "appendFormat:", @"\n\t\tSpatialPipelineFlags = %lu", *((void *)begin + 9));
      uint64_t v16 = (v16 + 1);
      begin = (LocalizedGeometryPermutation *)((char *)begin + 88);
    }
    while (begin != (LocalizedGeometryPermutation *)end);
  }
  uint64_t v21 = [NSString stringWithString:v3];
  int64x2_t v26 = &v23;
  std::vector<Phase::Controller::GeometryPermutation>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);

  return v21;
}

- (NSArray)elements
{
  return self->_elements;
}

- (PHASEEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return (PHASEEngine *)WeakRetained;
}

- (void)setEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
  begin = self->_localizedGeometryPermutations.__begin_;
  if (begin)
  {
    end = self->_localizedGeometryPermutations.__end_;
    uint64_t v5 = self->_localizedGeometryPermutations.__begin_;
    if (end != begin)
    {
      do
      {
        end = (LocalizedGeometryPermutation *)((char *)end - 88);
        std::allocator<Phase::LocalizedGeometryPermutation>::destroy[abi:ne180100]((uint64_t)end);
      }
      while (end != begin);
      uint64_t v5 = self->_localizedGeometryPermutations.__begin_;
    }
    self->_localizedGeometryPermutations.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_elements, 0);

  std::unique_ptr<Phase::details::MdlMeshAssetImplementation>::reset[abi:ne180100]((id **)&self->_meshAsset.mpImplementation, 0);
}

- (id).cxx_construct
{
  self->_meshAsset.mType = 1;
  operator new();
}

@end