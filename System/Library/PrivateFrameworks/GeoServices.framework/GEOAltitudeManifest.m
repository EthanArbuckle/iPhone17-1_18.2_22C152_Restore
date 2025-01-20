@interface GEOAltitudeManifest
+ (id)sharedManager;
- (BOOL)hasDataVersionForRegion:(unsigned int)a3;
- (BOOL)isValidTourId:(unint64_t)a3;
- (BOOL)parseXml:(id)a3;
- (GEOAltitudeManifest)init;
- (GEOAltitudeManifest)initWithoutObserver;
- (double)getvalidFlyOverAnimationIDPool;
- (id)availableRegions;
- (id)nameForRegion:(unsigned int)a3;
- (id)tourIdsForRegion:(unsigned int)a3;
- (id)tripIdsForRegion:(unsigned int)a3;
- (unsigned)dataVersionForRegion:(unsigned int)a3;
- (unsigned)versionForRegion:(unsigned int)a3;
- (void)_reloadManifest;
- (void)commonInit;
- (void)dealloc;
- (void)parseManifest:(id)a3;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
@end

@implementation GEOAltitudeManifest

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v114 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v12 isEqualToString:@"trigger"] && objc_msgSend(v15, "count"))
  {
    v16 = [v15 objectForKey:@"region"];

    if (v16)
    {
      v17 = [v15 valueForKey:@"region"];
      unsigned int v18 = [v17 intValue];

      p_reservedTriggerData = (uint64_t **)&self->_reserved->_reservedTriggerData;
      int v115 = v18;
      v116[0] = 0;
      *(void *)((char *)v116 + 5) = 0;
      *(_OWORD *)v117 = 0u;
      long long v118 = 0u;
      uint64_t v120 = 0;
      uint64_t v121 = 0;
      __p = 0;
      v20 = std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,_GEOAltitudeTriggerData>>(p_reservedTriggerData, v18, (uint64_t)&v115);
      if (__p) {
        operator delete(__p);
      }
      if (v117[1]) {
        operator delete(v117[1]);
      }

      *((_DWORD *)v20 + 10) = v18;
      v21 = [v15 valueForKey:@"version"];
      *((_DWORD *)v20 + 11) = [v21 intValue];

      v22 = [v15 objectForKey:@"dataversion"];

      if (v22)
      {
        v20[52] = 1;
        v23 = [v15 valueForKey:@"dataversion"];
        *((_DWORD *)v20 + 12) = [v23 intValue];
      }
      v24 = [v15 valueForKey:@"name"];
      uint64_t v25 = [v24 copy];
      v26 = (void *)*((void *)v20 + 7);
      *((void *)v20 + 7) = v25;

      v27 = [v15 objectForKey:@"type"];
      LODWORD(v24) = [v27 isEqualToString:@"tour"];

      if (v24)
      {
        v28 = [v15 objectForKey:@"source"];
        unsigned __int8 v29 = [v28 isEqualToString:@"muid"];

        self->_reserved->_reservedTourServerType = v29;
      }
      self->_reserved->_unsigned int reservedCurrentRegion = v18;
    }
  }
  else if ([v12 isEqualToString:@"flyovertour"] && objc_msgSend(v15, "count"))
  {
    v30 = [v15 objectForKey:@"tourid"];

    if (v30)
    {
      id v31 = [v15 valueForKey:@"tourid"];
      unint64_t v32 = strtoull((const char *)[v31 UTF8String], 0, 10);

      reserved = self->_reserved;
      left = (char *)reserved->_reservedTriggerData.__tree_.__pair1_.__value_.__left_;
      p_pair1 = &reserved->_reservedTriggerData.__tree_.__pair1_;
      v35 = left;
      if (left)
      {
        unsigned int reservedCurrentRegion = self->_reserved->_reservedCurrentRegion;
        v38 = p_pair1;
        do
        {
          unsigned int v39 = *((_DWORD *)v35 + 8);
          BOOL v40 = v39 >= reservedCurrentRegion;
          if (v39 >= reservedCurrentRegion) {
            v41 = (void **)v35;
          }
          else {
            v41 = (void **)(v35 + 8);
          }
          if (v40) {
            v38 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, _GEOAltitudeTriggerData>, void *>>> *)v35;
          }
          v35 = (char *)*v41;
        }
        while (*v41);
        if (v38 != p_pair1 && reservedCurrentRegion >= LODWORD(v38[4].__value_.__left_))
        {
          unint64_t v42 = (unint64_t)v38[10].__value_.__left_;
          v43 = (unint64_t *)v38[9].__value_.__left_;
          if ((unint64_t)v43 >= v42)
          {
            v64 = (unint64_t *)v38[8].__value_.__left_;
            uint64_t v65 = v43 - v64;
            if ((unint64_t)(v65 + 1) >> 61) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v66 = v42 - (void)v64;
            unint64_t v67 = (uint64_t)(v42 - (void)v64) >> 2;
            if (v67 <= v65 + 1) {
              unint64_t v67 = v65 + 1;
            }
            if (v66 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v68 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v68 = v67;
            }
            if (v68)
            {
              v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v38[10], v68);
              v64 = (unint64_t *)v38[8].__value_.__left_;
              v43 = (unint64_t *)v38[9].__value_.__left_;
            }
            else
            {
              v69 = 0;
            }
            v99 = (unint64_t *)&v69[8 * v65];
            v100 = &v69[8 * v68];
            unint64_t *v99 = v32;
            v44 = v99 + 1;
            while (v43 != v64)
            {
              unint64_t v101 = *--v43;
              *--v99 = v101;
            }
            v38[8].__value_.__left_ = v99;
            v38[9].__value_.__left_ = v44;
            v38[10].__value_.__left_ = v100;
            if (v64) {
              operator delete(v64);
            }
          }
          else
          {
            unint64_t *v43 = v32;
            v44 = v43 + 1;
          }
          unint64_t v102 = (unint64_t)v38[13].__value_.__left_;
          v38[9].__value_.__left_ = v44;
          v103 = (char *)v38[12].__value_.__left_;
          if ((unint64_t)v103 >= v102)
          {
            v105 = (char *)v38[11].__value_.__left_;
            uint64_t v106 = (v103 - v105) >> 2;
            if ((unint64_t)(v106 + 1) >> 62) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v107 = v102 - (void)v105;
            unint64_t v108 = (uint64_t)(v102 - (void)v105) >> 1;
            if (v108 <= v106 + 1) {
              unint64_t v108 = v106 + 1;
            }
            if (v107 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v109 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v109 = v108;
            }
            if (v109)
            {
              v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v38[13], v109);
              v105 = (char *)v38[11].__value_.__left_;
              v103 = (char *)v38[12].__value_.__left_;
            }
            else
            {
              v110 = 0;
            }
            v111 = &v110[4 * v106];
            v112 = &v110[4 * v109];
            *(_DWORD *)v111 = v32;
            v104 = v111 + 4;
            while (v103 != v105)
            {
              int v113 = *((_DWORD *)v103 - 1);
              v103 -= 4;
              *((_DWORD *)v111 - 1) = v113;
              v111 -= 4;
            }
            v38[11].__value_.__left_ = v111;
            v38[12].__value_.__left_ = v104;
            v38[13].__value_.__left_ = v112;
            if (v105) {
              operator delete(v105);
            }
          }
          else
          {
            *(_DWORD *)v103 = v32;
            v104 = v103 + 4;
          }
          v38[12].__value_.__left_ = v104;
        }
      }
    }
  }
  else if ([v12 isEqualToString:@"tour"])
  {
    if ([v15 count])
    {
      v45 = [v15 objectForKey:@"region"];
      if (v45)
      {
        v46 = [v15 objectForKey:@"trip_nr"];

        if (v46)
        {
          v47 = [v15 valueForKey:@"region"];
          uint64_t v48 = [v47 intValue];

          v49 = [v15 valueForKey:@"trip_nr"];
          unsigned int v50 = [v49 intValue];

          id v51 = [v15 valueForKey:@"muid"];
          unint64_t v52 = strtoull((const char *)[v51 UTF8String], 0, 10);

          v53 = (uint64_t **)&self->_reserved->_reservedTriggerData;
          int v115 = v48;
          v116[0] = 0;
          *(void *)((char *)v116 + 5) = 0;
          *(_OWORD *)v117 = 0u;
          long long v118 = 0u;
          uint64_t v120 = 0;
          uint64_t v121 = 0;
          __p = 0;
          v54 = std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,_GEOAltitudeTriggerData>>(v53, v48, (uint64_t)&v115);
          if (__p) {
            operator delete(__p);
          }
          if (v117[1]) {
            operator delete(v117[1]);
          }

          unint64_t v55 = *((void *)v54 + 13);
          v56 = (char *)*((void *)v54 + 12);
          if ((unint64_t)v56 >= v55)
          {
            v58 = (char *)*((void *)v54 + 11);
            uint64_t v59 = (v56 - v58) >> 2;
            if ((unint64_t)(v59 + 1) >> 62) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v60 = v55 - (void)v58;
            unint64_t v61 = (uint64_t)(v55 - (void)v58) >> 1;
            if (v61 <= v59 + 1) {
              unint64_t v61 = v59 + 1;
            }
            if (v60 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v62 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v62 = v61;
            }
            if (v62)
            {
              v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(v54 + 104), v62);
              v58 = (char *)*((void *)v54 + 11);
              v56 = (char *)*((void *)v54 + 12);
            }
            else
            {
              v63 = 0;
            }
            v70 = &v63[4 * v59];
            v71 = &v63[4 * v62];
            *(_DWORD *)v70 = v50;
            v57 = v70 + 4;
            while (v56 != v58)
            {
              int v72 = *((_DWORD *)v56 - 1);
              v56 -= 4;
              *((_DWORD *)v70 - 1) = v72;
              v70 -= 4;
            }
            *((void *)v54 + 11) = v70;
            *((void *)v54 + 12) = v57;
            *((void *)v54 + 13) = v71;
            if (v58) {
              operator delete(v58);
            }
          }
          else
          {
            *(_DWORD *)v56 = v50;
            v57 = v56 + 4;
          }
          *((void *)v54 + 12) = v57;
          v73 = (void **)(v54 + 64);
          if (self->_reserved->_reservedTourServerType == 1)
          {
            unint64_t v74 = *((void *)v54 + 10);
            v75 = (unint64_t *)*((void *)v54 + 9);
            if ((unint64_t)v75 >= v74)
            {
              v81 = (unint64_t *)*v73;
              uint64_t v82 = ((char *)v75 - (unsigned char *)*v73) >> 3;
              if ((unint64_t)(v82 + 1) >> 61) {
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v83 = v74 - (void)v81;
              unint64_t v84 = (uint64_t)(v74 - (void)v81) >> 2;
              if (v84 <= v82 + 1) {
                unint64_t v84 = v82 + 1;
              }
              if (v83 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v85 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v85 = v84;
              }
              if (v85)
              {
                v86 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)(v54 + 80), v85);
                v81 = (unint64_t *)*((void *)v54 + 8);
                v75 = (unint64_t *)*((void *)v54 + 9);
              }
              else
              {
                v86 = 0;
              }
              v93 = (unint64_t *)&v86[8 * v82];
              v94 = &v86[8 * v85];
              unint64_t *v93 = v52;
              v76 = v93 + 1;
              while (v75 != v81)
              {
                unint64_t v95 = *--v75;
                *--v93 = v95;
              }
              *((void *)v54 + 8) = v93;
              *((void *)v54 + 9) = v76;
              *((void *)v54 + 10) = v94;
              if (v81) {
                operator delete(v81);
              }
            }
            else
            {
              unint64_t *v75 = v52;
              v76 = v75 + 1;
            }
            *((void *)v54 + 9) = v76;
          }
          else
          {
            unint64_t v77 = v50 | (unint64_t)(v48 << 32);
            unint64_t v78 = *((void *)v54 + 10);
            v79 = (char *)*((void *)v54 + 9);
            if ((unint64_t)v79 >= v78)
            {
              v87 = (char *)*v73;
              uint64_t v88 = (v79 - (unsigned char *)*v73) >> 3;
              if ((unint64_t)(v88 + 1) >> 61) {
                std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v89 = v78 - (void)v87;
              unint64_t v90 = (uint64_t)(v78 - (void)v87) >> 2;
              if (v90 <= v88 + 1) {
                unint64_t v90 = v88 + 1;
              }
              if (v89 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v91 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v91 = v90;
              }
              if (v91)
              {
                v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)(v54 + 80), v91);
                v87 = (char *)*((void *)v54 + 8);
                v79 = (char *)*((void *)v54 + 9);
              }
              else
              {
                v92 = 0;
              }
              v96 = (unint64_t *)&v92[8 * v88];
              v97 = &v92[8 * v91];
              unint64_t *v96 = v77;
              v80 = v96 + 1;
              while (v79 != v87)
              {
                unint64_t v98 = *((void *)v79 - 1);
                v79 -= 8;
                *--v96 = v98;
              }
              *((void *)v54 + 8) = v96;
              *((void *)v54 + 9) = v80;
              *((void *)v54 + 10) = v97;
              if (v87) {
                operator delete(v87);
              }
            }
            else
            {
              *(void *)v79 = v77;
              v80 = v79 + 8;
            }
            *((void *)v54 + 9) = v80;
          }
        }
      }
    }
  }
}

void *__63__GEOAltitudeManifest_Internal__getvalidFlyOverAnimationIDPool__block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 8);
  if (*(unsigned char *)(v1 + 36) == 1)
  {
    v2 = *(void **)(v1 + 8);
    v3 = (void *)(v1 + 16);
    if (v2 != (void *)(v1 + 16))
    {
      v4 = result;
      do
      {
        v5 = (unint64_t *)v2[8];
        v6 = (unint64_t *)v2[9];
        while (v5 != v6)
        {
          result = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(*(void *)(v4[5] + 8) + 48, v5, v5);
          ++v5;
        }
        v7 = (void *)v2[1];
        if (v7)
        {
          do
          {
            v8 = v7;
            v7 = (void *)*v7;
          }
          while (v7);
        }
        else
        {
          do
          {
            v8 = (void *)v2[2];
            BOOL v9 = *v8 == (void)v2;
            v2 = v8;
          }
          while (!v9);
        }
        v2 = v8;
      }
      while (v8 != v3);
    }
  }
  return result;
}

void __37__GEOAltitudeManifest_parseManifest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 8);
  if (v3 != (void *)(v2 + 16))
  {
    do
    {
      id v10 = (id)v3[7];
      id v12 = 0;
      uint64_t v13 = 0;
      v11 = 0;
      std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v11, (const void *)v3[8], v3[9], (uint64_t)(v3[9] - v3[8]) >> 3);
      __p = 0;
      id v15 = 0;
      uint64_t v16 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, (const void *)v3[11], v3[12], (uint64_t)(v3[12] - v3[11]) >> 2);
      if (__p)
      {
        id v15 = __p;
        operator delete(__p);
      }
      if (v11)
      {
        id v12 = v11;
        operator delete(v11);
      }

      v4 = (void *)v3[1];
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = (void *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (void *)v3[2];
          BOOL v6 = *v5 == (void)v3;
          v3 = v5;
        }
        while (!v6);
      }
      v3 = v5;
    }
    while (v5 != (void *)(v2 + 16));
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  v8 = *(void **)(v2 + 16);
  v7 = (void *)(v2 + 16);
  std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::destroy(v8);
  *(v7 - 1) = v7;
  void *v7 = 0;
  v7[1] = 0;
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:*(void *)(a1 + 40)];
  [v9 setDelegate:*(void *)(a1 + 32)];
  [v9 parse];
}

- (void)_reloadManifest
{
  v3 = +[GEOResourceManager sharedManager];
  v4 = objc_msgSend(MEMORY[0x1E4F28B50], "__geoBundle");
  id v5 = [v3 dataForResourceWithName:@"altitude.xml" fallbackBundle:v4];

  [(GEOAltitudeManifest *)self parseManifest:v5];
}

- (void)parseManifest:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __36__GEOAltitudeManifest_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(GEOAltitudeManifest);
  uint64_t v1 = (void *)_MergedGlobals_274;
  _MergedGlobals_274 = (uint64_t)v0;
}

- (GEOAltitudeManifest)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAltitudeManifest;
  uint64_t v2 = [(GEOAltitudeManifest *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    [(GEOAltitudeManifest *)v2 commonInit];
    id v4 = +[GEOResourceManifestManager modernManager];
    [v4 addTileGroupObserver:v3 queue:MEMORY[0x1E4F14428]];

    [(GEOAltitudeManifest *)v3 _reloadManifest];
    id v5 = v3;
  }

  return v3;
}

- (void)commonInit
{
  id v3 = objc_alloc_init(GEOAltitudeManifestReserved);
  reserved = self->_reserved;
  self->_reserved = v3;

  uint64_t v5 = geo_isolater_create();
  BOOL v6 = self->_reserved;
  reservedIsolater = v6->_reservedIsolater;
  v6->_reservedIsolater = (geo_isolater *)v5;
}

- (double)getvalidFlyOverAnimationIDPool
{
  if (a1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = &v4;
    uint64_t v6 = 0x5812000000;
    objc_super v7 = __Block_byref_object_copy__174;
    v8 = __Block_byref_object_dispose__175;
    memset(v9, 0, sizeof(v9));
    uint64_t v10 = 0;
    int v11 = 1065353216;
    geo_isolate_sync_data();
    std::unordered_set<unsigned long long>::unordered_set(a2, (uint64_t)(v5 + 6));
    _Block_object_dispose(&v4, 8);
    std::__hash_table<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,zilch::HuffmanCode::KeyInfo>>>::~__hash_table((uint64_t)v9 + 8);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

+ (id)sharedManager
{
  if (qword_1EB29FF78 != -1) {
    dispatch_once(&qword_1EB29FF78, &__block_literal_global_131);
  }
  uint64_t v2 = (void *)_MergedGlobals_274;

  return v2;
}

- (GEOAltitudeManifest)initWithoutObserver
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAltitudeManifest;
  uint64_t v2 = [(GEOAltitudeManifest *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    [(GEOAltitudeManifest *)v2 commonInit];
    [(GEOAltitudeManifest *)v3 _reloadManifest];
    uint64_t v4 = v3;
  }

  return v3;
}

- (BOOL)parseXml:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];
  if (v4) {
    [(GEOAltitudeManifest *)self parseManifest:v4];
  }

  return v4 != 0;
}

- (BOOL)isValidTourId:(unint64_t)a3
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  geo_isolate_sync_data();
  char v3 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void *__37__GEOAltitudeManifest_isValidTourId___block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 8);
  if (*(unsigned char *)(v1 + 36) == 1)
  {
    uint64_t v2 = *(void **)(v1 + 8);
    if (v2 != (void *)(v1 + 16))
    {
      do
      {
        char v3 = (void *)v2[8];
        uint64_t v4 = (void *)v2[9];
        if (v3 != v4)
        {
          uint64_t v5 = result[6];
          do
          {
            if (*v3 == v5) {
              *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
            }
            ++v3;
          }
          while (v3 != v4);
        }
        objc_super v6 = (void *)v2[1];
        if (v6)
        {
          do
          {
            uint64_t v7 = v6;
            objc_super v6 = (void *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            uint64_t v7 = (void *)v2[2];
            BOOL v8 = *v7 == (void)v2;
            uint64_t v2 = v7;
          }
          while (!v8);
        }
        uint64_t v2 = v7;
      }
      while (v7 != (void *)(v1 + 16));
    }
  }
  else
  {
    uint64_t v11 = *(void *)(v1 + 16);
    uint64_t v9 = v1 + 16;
    uint64_t v10 = v11;
    if (v11)
    {
      uint64_t v12 = result[6];
      uint64_t v13 = v9;
      do
      {
        unsigned int v14 = *(_DWORD *)(v10 + 32);
        BOOL v15 = v14 >= HIDWORD(v12);
        if (v14 >= HIDWORD(v12)) {
          uint64_t v16 = (uint64_t *)v10;
        }
        else {
          uint64_t v16 = (uint64_t *)(v10 + 8);
        }
        if (v15) {
          uint64_t v13 = v10;
        }
        uint64_t v10 = *v16;
      }
      while (*v16);
      if (v13 != v9 && *(_DWORD *)(v13 + 32) <= HIDWORD(v12))
      {
        v17 = *(void **)(v13 + 64);
        for (i = *(void **)(v13 + 72); v17 != i; ++v17)
        {
          if (*v17 == v12) {
            *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
          }
        }
      }
    }
  }
  return result;
}

- (void)dealloc
{
  char v3 = +[GEOResourceManifestManager modernManager];
  [v3 removeTileGroupObserver:self];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)GEOAltitudeManifest;
  [(GEOAltitudeManifest *)&v5 dealloc];
}

- (unsigned)versionForRegion:(unsigned int)a3
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  geo_isolate_sync_data();
  unsigned int v3 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __40__GEOAltitudeManifest_versionForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v2 = v1 + 16;
  uint64_t v3 = v4;
  if (v4)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    uint64_t v6 = v2;
    do
    {
      unsigned int v7 = *(_DWORD *)(v3 + 32);
      BOOL v8 = v7 >= v5;
      if (v7 >= v5) {
        uint64_t v9 = (uint64_t *)v3;
      }
      else {
        uint64_t v9 = (uint64_t *)(v3 + 8);
      }
      if (v8) {
        uint64_t v6 = v3;
      }
      uint64_t v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && v5 >= *(_DWORD *)(v6 + 32))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(v6 + 44);
      return;
    }
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
  }
  NSLog(&cfstr_Geoaltitudeman.isa, v5);
}

- (BOOL)hasDataVersionForRegion:(unsigned int)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  geo_isolate_sync_data();
  char v3 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __47__GEOAltitudeManifest_hasDataVersionForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v2 = v1 + 16;
  uint64_t v3 = v4;
  if (v4)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    uint64_t v6 = v2;
    do
    {
      unsigned int v7 = *(_DWORD *)(v3 + 32);
      BOOL v8 = v7 >= v5;
      if (v7 >= v5) {
        uint64_t v9 = (uint64_t *)v3;
      }
      else {
        uint64_t v9 = (uint64_t *)(v3 + 8);
      }
      if (v8) {
        uint64_t v6 = v3;
      }
      uint64_t v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && v5 >= *(_DWORD *)(v6 + 32))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v6 + 52);
      return;
    }
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
  }
  NSLog(&cfstr_Geoaltitudeman.isa, v5);
}

- (unsigned)dataVersionForRegion:(unsigned int)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  geo_isolate_sync_data();
  unsigned int v3 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __44__GEOAltitudeManifest_dataVersionForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v2 = v1 + 16;
  uint64_t v3 = v4;
  if (v4)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    uint64_t v6 = v2;
    do
    {
      unsigned int v7 = *(_DWORD *)(v3 + 32);
      BOOL v8 = v7 >= v5;
      if (v7 >= v5) {
        uint64_t v9 = (uint64_t *)v3;
      }
      else {
        uint64_t v9 = (uint64_t *)(v3 + 8);
      }
      if (v8) {
        uint64_t v6 = v3;
      }
      uint64_t v3 = *v9;
    }
    while (*v9);
    if (v6 != v2 && v5 >= *(_DWORD *)(v6 + 32))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(v6 + 48);
      return;
    }
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
  }
  NSLog(&cfstr_Geoaltitudeman.isa, v5);
}

- (id)nameForRegion:(unsigned int)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__68;
  uint64_t v9 = __Block_byref_object_dispose__68;
  id v10 = 0;
  geo_isolate_sync_data();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __37__GEOAltitudeManifest_nameForRegion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v2 = v1 + 16;
  uint64_t v3 = v4;
  if (!v4)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 48);
LABEL_16:
    NSLog(&cfstr_Geoaltitudeman.isa, v5);
    return;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  uint64_t v6 = v2;
  do
  {
    unsigned int v7 = *(_DWORD *)(v3 + 32);
    BOOL v8 = v7 >= v5;
    if (v7 >= v5) {
      uint64_t v9 = (uint64_t *)v3;
    }
    else {
      uint64_t v9 = (uint64_t *)(v3 + 8);
    }
    if (v8) {
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v9;
  }
  while (*v9);
  if (v6 == v2 || v5 < *(_DWORD *)(v6 + 32)) {
    goto LABEL_16;
  }
  id v10 = *(void **)(v6 + 56);
  uint64_t v11 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v11, v10);
}

- (id)tourIdsForRegion:(unsigned int)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  BOOL v8 = __Block_byref_object_copy__68;
  uint64_t v9 = __Block_byref_object_dispose__68;
  id v10 = 0;
  geo_isolate_sync_data();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __40__GEOAltitudeManifest_tourIdsForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v3 = v2 + 16;
  uint64_t v4 = v5;
  if (!v5)
  {
    uint64_t v6 = *(unsigned int *)(a1 + 48);
LABEL_16:
    NSLog(&cfstr_Geoaltitudeman.isa, v6);
    return;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  uint64_t v7 = v3;
  do
  {
    unsigned int v8 = *(_DWORD *)(v4 + 32);
    BOOL v9 = v8 >= v6;
    if (v8 >= v6) {
      id v10 = (uint64_t *)v4;
    }
    else {
      id v10 = (uint64_t *)(v4 + 8);
    }
    if (v9) {
      uint64_t v7 = v4;
    }
    uint64_t v4 = *v10;
  }
  while (*v10);
  if (v7 == v3 || v6 < *(_DWORD *)(v7 + 32)) {
    goto LABEL_16;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(*(void *)(v7 + 72) - *(void *)(v7 + 64)) >> 3];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  unsigned int v14 = *(void **)(v7 + 64);
  for (i = *(void **)(v7 + 72); v14 != i; ++v14)
  {
    uint64_t v16 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:*v14];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v16];
  }
}

- (id)tripIdsForRegion:(unsigned int)a3
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  unsigned int v8 = __Block_byref_object_copy__68;
  BOOL v9 = __Block_byref_object_dispose__68;
  id v10 = 0;
  geo_isolate_sync_data();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __40__GEOAltitudeManifest_tripIdsForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v3 = v2 + 16;
  uint64_t v4 = v5;
  if (!v5)
  {
    uint64_t v6 = *(unsigned int *)(a1 + 48);
LABEL_16:
    NSLog(&cfstr_Geoaltitudeman.isa, v6);
    return;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  uint64_t v7 = v3;
  do
  {
    unsigned int v8 = *(_DWORD *)(v4 + 32);
    BOOL v9 = v8 >= v6;
    if (v8 >= v6) {
      id v10 = (uint64_t *)v4;
    }
    else {
      id v10 = (uint64_t *)(v4 + 8);
    }
    if (v9) {
      uint64_t v7 = v4;
    }
    uint64_t v4 = *v10;
  }
  while (*v10);
  if (v7 == v3 || v6 < *(_DWORD *)(v7 + 32)) {
    goto LABEL_16;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(*(void *)(v7 + 96) - *(void *)(v7 + 88)) >> 2];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  unsigned int v14 = *(unsigned int **)(v7 + 88);
  for (i = *(unsigned int **)(v7 + 96); v14 != i; ++v14)
  {
    uint64_t v16 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*v14];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v16];
  }
}

- (id)availableRegions
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__68;
  unsigned int v8 = __Block_byref_object_dispose__68;
  id v9 = 0;
  geo_isolate_sync_data();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __39__GEOAltitudeManifest_availableRegions__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 8);
  if (v6 != (void *)(v5 + 16))
  {
    do
    {
      uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:*((unsigned int *)v6 + 8)];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];

      unsigned int v8 = (void *)v6[1];
      if (v8)
      {
        do
        {
          id v9 = v8;
          unsigned int v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          id v9 = (void *)v6[2];
          BOOL v10 = *v9 == (void)v6;
          uint64_t v6 = v9;
        }
        while (!v10);
      }
      uint64_t v6 = v9;
    }
    while (v9 != (void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16));
  }
}

- (void).cxx_destruct
{
}

@end