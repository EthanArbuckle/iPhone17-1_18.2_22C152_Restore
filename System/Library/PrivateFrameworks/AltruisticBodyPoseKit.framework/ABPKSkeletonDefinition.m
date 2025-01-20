@interface ABPKSkeletonDefinition
+ (id)computeParentChildOrderFor:(const void *)a3 withRoot:(int64_t)a4;
- (ABPKSkeletonDefinition)init;
- (ABPKSkeletonDefinition)initWithPlist:(id)a3 fromBundle:(id)a4;
- (ABPKSkeletonDefinition)initWithType:(int64_t)a3;
- (NSArray)parentChildOrder;
- (id).cxx_construct;
- (id)getChildrenIndices:(int64_t)a3;
- (id)jointName:(int64_t)a3;
- (int64_t)indexOfJointWithName:(id)a3;
- (int64_t)parentJoint:(int64_t)a3;
- (int64_t)rootJointIndex;
- (unint64_t)jointCount;
- (void)enumerateChildrenJointIndicesOfJointAtIndex:(int64_t)a3 withBlock:(id)a4;
@end

@implementation ABPKSkeletonDefinition

- (ABPKSkeletonDefinition)init
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [(ABPKSkeletonDefinition *)self initWithPlist:@"ABPKDetection2dSkeletonDefinition.plist" fromBundle:v3];

  return v4;
}

- (ABPKSkeletonDefinition)initWithType:(int64_t)a3
{
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if ((unint64_t)a3 >= 5)
  {
    v6 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_ERROR, " ERROR: Unknown ABPKSkeletonType in ABPKSkeletonDefinition:initWithType. ", v8, 2u);
    }
  }
  else
  {
    self = [(ABPKSkeletonDefinition *)self initWithPlist:off_2643B6E50[a3] fromBundle:v5];
  }

  return self;
}

- (ABPKSkeletonDefinition)initWithPlist:(id)a3 fromBundle:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v70.receiver = self;
  v70.super_class = (Class)ABPKSkeletonDefinition;
  v8 = [(ABPKSkeletonDefinition *)&v70 init];
  if (v8)
  {
    uint64_t v9 = [v7 pathForResource:v6 ofType:0];
    v66 = (void *)v9;
    if (!v9)
    {
      v11 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v6;
        _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEFAULT, " Could not find path for resource %@. ", buf, 0xCu);
      }
      v43 = 0;
      goto LABEL_76;
    }
    v10 = [NSDictionary dictionaryWithContentsOfFile:v9];
    v11 = v10;
    if (!v10)
    {
      v44 = __ABPKLogSharedInstance();
      id obj = v44;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v66;
        _os_log_impl(&dword_21B7C6000, v44, OS_LOG_TYPE_ERROR, " Failed to init dictionary from plist at path %@. ", buf, 0xCu);
      }
      v43 = 0;
      goto LABEL_75;
    }
    id obj = [v10 objectForKey:@"JointNames"];
    if (!obj)
    {
      v12 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_ERROR, " Dictionary has not key 'JointNames' ", buf, 2u);
      }
      v43 = 0;
      goto LABEL_74;
    }
    v12 = [v11 objectForKey:@"ParentIndices"];
    if (v12)
    {
      uint64_t v13 = [obj count];
      if (v13 == [v12 count])
      {
        objc_storeStrong((id *)v8 + 1, obj);
        v14 = (void **)(v8 + 16);
        std::vector<long>::reserve((void **)v8 + 2, [v12 count]);
        for (unint64_t i = 0; i < [v12 count]; ++i)
        {
          uint64_t v69 = 0;
          v16 = [v12 objectAtIndexedSubscript:i];
          uint64_t v17 = [v16 integerValue];

          uint64_t v69 = v17;
          v19 = (uint64_t *)*((void *)v8 + 3);
          unint64_t v18 = *((void *)v8 + 4);
          if ((unint64_t)v19 >= v18)
          {
            v21 = (uint64_t *)*v14;
            uint64_t v22 = ((char *)v19 - (unsigned char *)*v14) >> 3;
            unint64_t v23 = v22 + 1;
            if ((unint64_t)(v22 + 1) >> 61) {
              goto LABEL_82;
            }
            uint64_t v24 = v18 - (void)v21;
            if (v24 >> 2 > v23) {
              unint64_t v23 = v24 >> 2;
            }
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v25 = v23;
            }
            if (v25)
            {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v8 + 32), v25);
              v21 = (uint64_t *)*((void *)v8 + 2);
              v19 = (uint64_t *)*((void *)v8 + 3);
              uint64_t v17 = v69;
            }
            else
            {
              v26 = 0;
            }
            v27 = (uint64_t *)&v26[8 * v22];
            uint64_t *v27 = v17;
            v20 = v27 + 1;
            while (v19 != v21)
            {
              uint64_t v28 = *--v19;
              *--v27 = v28;
            }
            *((void *)v8 + 2) = v27;
            *((void *)v8 + 3) = v20;
            *((void *)v8 + 4) = &v26[8 * v25];
            if (v21) {
              operator delete(v21);
            }
          }
          else
          {
            uint64_t *v19 = v17;
            v20 = v19 + 1;
          }
          *((void *)v8 + 3) = v20;
          if (v69 != -1)
          {
            *(void *)buf = &v69;
            v29 = std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)v8 + 5, &v69, (uint64_t)&std::piecewise_construct, (uint64_t **)buf);
            v30 = v29;
            v31 = (unint64_t *)v29[6];
            uint64_t v32 = (uint64_t)(v29 + 7);
            unint64_t v33 = v29[7];
            if ((unint64_t)v31 >= v33)
            {
              v35 = (unint64_t *)v29[5];
              uint64_t v36 = v31 - v35;
              if ((unint64_t)(v36 + 1) >> 61) {
LABEL_82:
              }
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              unint64_t v37 = v33 - (void)v35;
              unint64_t v38 = (uint64_t)(v33 - (void)v35) >> 2;
              if (v38 <= v36 + 1) {
                unint64_t v38 = v36 + 1;
              }
              if (v37 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v39 = v38;
              }
              if (v39)
              {
                v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v32, v39);
                v35 = (unint64_t *)v30[5];
                v31 = (unint64_t *)v30[6];
              }
              else
              {
                v40 = 0;
              }
              v41 = (unint64_t *)&v40[8 * v36];
              unint64_t *v41 = i;
              v34 = v41 + 1;
              while (v31 != v35)
              {
                unint64_t v42 = *--v31;
                *--v41 = v42;
              }
              v30[5] = (uint64_t)v41;
              v30[6] = (uint64_t)v34;
              v30[7] = (uint64_t)&v40[8 * v39];
              if (v35) {
                operator delete(v35);
              }
            }
            else
            {
              unint64_t *v31 = i;
              v34 = v31 + 1;
            }
            v30[6] = (uint64_t)v34;
          }
        }
        uint64_t v49 = *((void *)v8 + 2);
        uint64_t v50 = *((void *)v8 + 3);
        uint64_t v51 = v50 - v49;
        if (v50 == v49)
        {
          uint64_t v54 = -1;
LABEL_72:
          *((void *)v8 + 10) = v54;
          uint64_t v57 = +[ABPKSkeletonDefinition computeParentChildOrderFor:withRoot:](ABPKSkeletonDefinition, "computeParentChildOrderFor:withRoot:", v8 + 16);
          v58 = (void *)*((void *)v8 + 8);
          *((void *)v8 + 8) = v57;

          v59 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v8, "jointCount"));
          v60 = (void *)*((void *)v8 + 1);
          v67[0] = MEMORY[0x263EF8330];
          v67[1] = 3221225472;
          v67[2] = __51__ABPKSkeletonDefinition_initWithPlist_fromBundle___block_invoke;
          v67[3] = &unk_2643B6E30;
          v45 = v59;
          v68 = v45;
          [v60 enumerateObjectsUsingBlock:v67];
          uint64_t v61 = [v45 copy];
          v62 = (void *)*((void *)v8 + 9);
          *((void *)v8 + 9) = v61;

          v43 = v8;
          goto LABEL_73;
        }
        uint64_t v52 = 0;
        unint64_t v53 = v51 >> 3;
        if (v53 <= 1) {
          unint64_t v53 = 1;
        }
        uint64_t v54 = -1;
        while (1)
        {
          uint64_t v55 = *(void *)(v49 + 8 * v52);
          if (v55 < 0)
          {
            if (v55 != -1)
            {
              v45 = __ABPKLogSharedInstance();
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                goto LABEL_60;
              }
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v55;
              v46 = " Found parent index (%ld) < -1. ";
              v47 = v45;
              uint32_t v48 = 12;
              goto LABEL_59;
            }
            BOOL v56 = v54 == -1;
            uint64_t v54 = v52;
            if (!v56) {
              break;
            }
          }
          if (v53 == ++v52) {
            goto LABEL_72;
          }
        }
        v45 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v46 = " Found multiple joints without parent joint. ";
          goto LABEL_58;
        }
LABEL_60:
        v43 = 0;
LABEL_73:

LABEL_74:
LABEL_75:

LABEL_76:
        goto LABEL_77;
      }
      v45 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      v46 = " Mismatch in nr of elements between JointNames and ParentIndices. ";
    }
    else
    {
      v45 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      v46 = " Dictionary has not key 'ParentIndices' ";
    }
LABEL_58:
    v47 = v45;
    uint32_t v48 = 2;
LABEL_59:
    _os_log_impl(&dword_21B7C6000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
    goto LABEL_60;
  }
  v43 = 0;
LABEL_77:

  return v43;
}

void __51__ABPKSkeletonDefinition_initWithPlist_fromBundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setValue:v6 forKey:v7];
}

- (unint64_t)jointCount
{
  return [(NSArray *)self->_jointNames count];
}

- (id)jointName:(int64_t)a3
{
  if (a3 < 0)
  {
    id v6 = 0;
  }
  else
  {
    if ([(NSArray *)self->_jointNames count] <= a3)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(NSArray *)self->_jointNames objectAtIndex:a3];
    }
  }
  return v6;
}

- (int64_t)indexOfJointWithName:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_jointNamesToIndices objectForKey:a3];
  v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (int64_t)parentJoint:(int64_t)a3
{
  if (a3 < 0) {
    return -1;
  }
  begin = self->_jointParentIndicesVector.__begin_;
  if (a3 >= (unint64_t)(self->_jointParentIndicesVector.__end_ - begin)) {
    return -1;
  }
  else {
    return begin[a3];
  }
}

- (id)getChildrenIndices:(int64_t)a3
{
  uint64_t v10 = a3;
  if (a3 < 0
    || a3 >= (unint64_t)(self->_jointParentIndicesVector.__end_ - self->_jointParentIndicesVector.__begin_))
  {
    v8 = objc_opt_new();
  }
  else
  {
    v11 = &v10;
    uint64_t v3 = std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_parentsToChildIndicesMap, &v10, (uint64_t)&std::piecewise_construct, &v11);
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:(v3[6] - v3[5]) >> 3];
    uint64_t v5 = v3[5];
    if (v3[6] != v5)
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = [NSNumber numberWithLong:*(void *)(v5 + 8 * v6)];
        [v4 addObject:v7];

        ++v6;
        uint64_t v5 = v3[5];
      }
      while (v6 < (v3[6] - v5) >> 3);
    }
    v8 = (void *)[v4 copy];
  }
  return v8;
}

- (void)enumerateChildrenJointIndicesOfJointAtIndex:(int64_t)a3 withBlock:(id)a4
{
  uint64_t v10 = a3;
  unint64_t v6 = (void (**)(id, void))a4;
  if ((a3 & 0x8000000000000000) == 0
    && a3 < (unint64_t)(self->_jointParentIndicesVector.__end_ - self->_jointParentIndicesVector.__begin_))
  {
    v11 = &v10;
    id v7 = std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_parentsToChildIndicesMap, &v10, (uint64_t)&std::piecewise_construct, &v11);
    v8 = (void *)v7[5];
    for (unint64_t i = (void *)v7[6]; v8 != i; ++v8)
      v6[2](v6, *v8);
  }
}

+ (id)computeParentChildOrderFor:(const void *)a3 withRoot:(int64_t)a4
{
  std::vector<int>::size_type v6 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3;
  __x[0] = -1;
  std::vector<int>::vector(&v84, v6, __x);
  std::vector<int>::pointer begin = v84.__begin_;
  v84.__begin_[a4] = 0;
  *(void *)__x = 0;
  v82 = 0;
  v83 = 0;
  uint64_t v8 = *(void *)a3;
  if (*((void *)a3 + 1) == *(void *)a3)
  {
    v26 = 0;
    uint64_t v28 = 0;
    __p = 0;
    v79 = 0;
    v80 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      int v11 = begin[v10];
      v12 = v9;
      for (unint64_t i = v10; v11 < 0; v11 = v84.__begin_[i])
      {
        if (v12 >= (unint64_t *)v83)
        {
          v14 = *(unint64_t **)__x;
          uint64_t v15 = ((uint64_t)v12 - *(void *)__x) >> 3;
          unint64_t v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v17 = (uint64_t)&v83[-*(void *)__x];
          if ((uint64_t)&v83[-*(void *)__x] >> 2 > v16) {
            unint64_t v16 = v17 >> 2;
          }
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v18 = v16;
          }
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v83, v18);
            v14 = *(unint64_t **)__x;
            v12 = v82;
          }
          else
          {
            v19 = 0;
          }
          v20 = (unint64_t *)&v19[8 * v15];
          unint64_t *v20 = i;
          v21 = v20 + 1;
          while (v12 != v14)
          {
            unint64_t v22 = *--v12;
            *--v20 = v22;
          }
          *(void *)__x = v20;
          v82 = v21;
          v83 = &v19[8 * v18];
          if (v14) {
            operator delete(v14);
          }
          v12 = v21;
        }
        else
        {
          *v12++ = i;
        }
        v82 = v12;
        uint64_t v8 = *(void *)a3;
        unint64_t i = *(void *)(*(void *)a3 + 8 * i);
        std::vector<int>::pointer begin = v84.__begin_;
      }
      uint64_t v9 = *(unint64_t **)__x;
      if (v12 != *(unint64_t **)__x)
      {
        int v23 = v11 + 1;
        do
        {
          uint64_t v24 = *--v12;
          begin[v24] = v23++;
        }
        while (v12 != v9);
        v82 = v9;
      }
      ++v10;
      uint64_t v25 = *((void *)a3 + 1);
    }
    while (v10 < (v25 - v8) >> 3);
    __p = 0;
    v79 = 0;
    v80 = 0;
    if (v25 == v8)
    {
      v26 = 0;
      uint64_t v28 = 0;
    }
    else
    {
      v26 = 0;
      v27 = 0;
      uint64_t v28 = 0;
      unint64_t v29 = 0;
      do
      {
        uint64_t v30 = v84.__begin_[v29];
        unint64_t v31 = (v28 - v27) >> 2;
        if (v31 < v30 + 1)
        {
          do
          {
            if (v28 >= v80)
            {
              unint64_t v32 = v31 + 1;
              if ((v31 + 1) >> 62) {
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v33 = v80 - v27;
              if ((v80 - v27) >> 1 > v32) {
                unint64_t v32 = v33 >> 1;
              }
              if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v34 = v32;
              }
              if (v34)
              {
                v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v80, v34);
                v27 = (char *)__p;
                uint64_t v28 = v79;
              }
              else
              {
                v35 = 0;
              }
              v26 = &v35[4 * v31];
              *(_DWORD *)v26 = 0;
              uint64_t v36 = v26 + 4;
              while (v28 != v27)
              {
                int v37 = *((_DWORD *)v28 - 1);
                v28 -= 4;
                *((_DWORD *)v26 - 1) = v37;
                v26 -= 4;
              }
              __p = v26;
              v79 = v36;
              v80 = &v35[4 * v34];
              if (v27)
              {
                operator delete(v27);
                v26 = (char *)__p;
              }
              uint64_t v28 = v36;
            }
            else
            {
              *(_DWORD *)uint64_t v28 = 0;
              v28 += 4;
            }
            v79 = v28;
            unint64_t v31 = (v28 - v26) >> 2;
            v27 = v26;
          }
          while (v31 < v30 + 1);
          uint64_t v8 = *(void *)a3;
          uint64_t v25 = *((void *)a3 + 1);
          v27 = v26;
        }
        ++*(_DWORD *)&v27[4 * v30];
        ++v29;
      }
      while (v29 < (v25 - v8) >> 3);
    }
  }
  memset(&v77, 0, sizeof(v77));
  std::vector<int>::reserve(&v77, ((v28 - v26) >> 2) + 1);
  std::vector<unsigned int>::pointer end = v77.__end_;
  if (v77.__end_ >= v77.__end_cap_.__value_)
  {
    std::vector<unsigned int>::pointer v40 = v77.__begin_;
    int64_t v41 = v77.__end_ - v77.__begin_;
    unint64_t v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 62) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v43 = (char *)v77.__end_cap_.__value_ - (char *)v77.__begin_;
    if (((char *)v77.__end_cap_.__value_ - (char *)v77.__begin_) >> 1 > v42) {
      unint64_t v42 = v43 >> 1;
    }
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v44 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v44 = v42;
    }
    if (v44)
    {
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v77.__end_cap_, v44);
      std::vector<unsigned int>::pointer v40 = v77.__begin_;
      std::vector<unsigned int>::pointer end = v77.__end_;
    }
    else
    {
      v45 = 0;
    }
    v46 = (unsigned int *)&v45[4 * v41];
    v47 = (unsigned int *)&v45[4 * v44];
    unsigned int *v46 = 0;
    unint64_t v39 = v46 + 1;
    while (end != v40)
    {
      unsigned int v48 = *--end;
      *--v46 = v48;
    }
    v77.__begin_ = v46;
    v77.__end_ = v39;
    v77.__end_cap_.__value_ = v47;
    if (v40) {
      operator delete(v40);
    }
  }
  else
  {
    *v77.__end_ = 0;
    unint64_t v39 = end + 1;
  }
  v77.__end_ = v39;
  uint64_t v49 = (char *)__p;
  uint64_t v50 = v79;
  if (__p != v79)
  {
    do
    {
      int v51 = *(v39 - 1) + *(_DWORD *)v49;
      if (v39 >= v77.__end_cap_.__value_)
      {
        std::vector<unsigned int>::pointer v53 = v77.__begin_;
        uint64_t v54 = v39 - v77.__begin_;
        unint64_t v55 = v54 + 1;
        if ((unint64_t)(v54 + 1) >> 62) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        int64_t v56 = (char *)v77.__end_cap_.__value_ - (char *)v77.__begin_;
        if (((char *)v77.__end_cap_.__value_ - (char *)v77.__begin_) >> 1 > v55) {
          unint64_t v55 = v56 >> 1;
        }
        if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v57 = v55;
        }
        if (v57)
        {
          v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v77.__end_cap_, v57);
          std::vector<unsigned int>::pointer v53 = v77.__begin_;
          unint64_t v39 = v77.__end_;
        }
        else
        {
          v58 = 0;
        }
        v59 = (unsigned int *)&v58[4 * v54];
        unsigned int *v59 = v51;
        uint64_t v52 = v59 + 1;
        while (v39 != v53)
        {
          unsigned int v60 = *--v39;
          *--v59 = v60;
        }
        v77.__begin_ = v59;
        v77.__end_ = v52;
        v77.__end_cap_.__value_ = (unsigned int *)&v58[4 * v57];
        if (v53) {
          operator delete(v53);
        }
      }
      else
      {
        *unint64_t v39 = v51;
        uint64_t v52 = v39 + 1;
      }
      v77.__end_ = v52;
      v49 += 4;
      unint64_t v39 = v52;
    }
    while (v49 != v50);
  }
  std::vector<int>::size_type v61 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3;
  std::vector<int>::value_type v75 = -1;
  std::vector<int>::vector(&v76, v61, &v75);
  std::vector<int>::pointer v62 = v84.__begin_;
  std::vector<int>::pointer v63 = v76.__begin_;
  if (v84.__end_ != v84.__begin_)
  {
    uint64_t v64 = 0;
    unint64_t v65 = v84.__end_ - v84.__begin_;
    std::vector<unsigned int>::pointer v66 = v77.__begin_;
    if (v65 <= 1) {
      unint64_t v65 = 1;
    }
    do
    {
      uint64_t v67 = v62[v64];
      uint64_t v68 = (int)v66[v67];
      v66[v67] = v68 + 1;
      v63[v68] = v64++;
    }
    while (v65 != v64);
  }
  uint64_t v69 = [MEMORY[0x263EFF980] arrayWithCapacity:v76.__end_ - v63];
  std::vector<int>::pointer v70 = v76.__begin_;
  if (v76.__end_ != v76.__begin_)
  {
    unint64_t v71 = 0;
    do
    {
      uint64_t v72 = [NSNumber numberWithInt:v70[v71]];
      [v69 addObject:v72];

      ++v71;
      std::vector<int>::pointer v70 = v76.__begin_;
    }
    while (v71 < v76.__end_ - v76.__begin_);
  }
  v73 = (void *)[v69 copy];

  if (v76.__begin_)
  {
    v76.__end_ = v76.__begin_;
    operator delete(v76.__begin_);
  }
  if (v77.__begin_)
  {
    v77.__end_ = v77.__begin_;
    operator delete(v77.__begin_);
  }
  if (__p)
  {
    v79 = (char *)__p;
    operator delete(__p);
  }
  if (*(void *)__x)
  {
    v82 = *(unint64_t **)__x;
    operator delete(*(void **)__x);
  }
  if (v84.__begin_)
  {
    v84.__end_ = v84.__begin_;
    operator delete(v84.__begin_);
  }
  return v73;
}

- (int64_t)rootJointIndex
{
  return self->_rootJointIndex;
}

- (NSArray)parentChildOrder
{
  return self->_parentChildOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jointNamesToIndices, 0);
  objc_storeStrong((id *)&self->_parentChildOrder, 0);
  std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy((uint64_t)&self->_parentsToChildIndicesMap, (void *)self->_parentsToChildIndicesMap.__tree_.__pair1_.__value_.__left_);
  std::vector<int>::pointer begin = self->_jointParentIndicesVector.__begin_;
  if (begin)
  {
    self->_jointParentIndicesVector.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_jointNames, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = (char *)self + 48;
  return self;
}

@end