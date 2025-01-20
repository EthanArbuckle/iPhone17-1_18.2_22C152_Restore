@interface MapsSuggestionsSignalPack
+ (BOOL)supportsSecureCoding;
+ (id)extractFromDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4;
+ (id)extractFromDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4;
+ (id)signalPackFromData:(id)a3;
- (BOOL)hasType:(int64_t)a3;
- (BOOL)isEmpty;
- (BOOL)mergeIntoSignalPack:(id)a3;
- (MapsSuggestionsSignalPack)initWithCoder:(id)a3;
- (MapsSuggestionsSignalPack)initWithSignalPack:(id)a3;
- (float)valueForSignalType:(int64_t)a3;
- (id).cxx_construct;
- (id)copy;
- (id)description;
- (id)encodedFeatureDictionary;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MapsSuggestionsSignalPack

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

- (MapsSuggestionsSignalPack)initWithSignalPack:(id)a3
{
  v4 = (MapsSuggestionsSignalPack *)a3;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsSignalPack;
  v5 = [(MapsSuggestionsSignalPack *)&v20 init];
  v6 = v5;
  if (v5) {
    BOOL v7 = v5 == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v5->_innerSignalPack.dict_.__table_.__p3_.__value_ = v4->_innerSignalPack.dict_.__table_.__p3_.__value_;
    next = (uint64_t *)v4->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_;
    unint64_t value = v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      v11 = (id *)v5->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_;
      v5->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_ = 0;
      v5->_innerSignalPack.dict_.__table_.__p2_.__value_ = 0;
      if (v11) {
        BOOL v12 = next == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        v13 = v11;
      }
      else
      {
        do
        {
          v11[2] = (id)next[2];
          *((_DWORD *)v11 + 6) = *((_DWORD *)next + 6);
          objc_storeStrong(v11 + 4, (id)next[4]);
          objc_storeStrong(v11 + 5, (id)next[5]);
          v13 = (id *)*v11;
          unint64_t v14 = *((unsigned int *)v11 + 4);
          v11[1] = (id)v14;
          inserted = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_prepare((uint64_t)&v6->_innerSignalPack, v14, v11 + 2);
          std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_perform(&v6->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, v11, inserted);
          next = (uint64_t *)*next;
          if (!v13) {
            break;
          }
          v11 = v13;
        }
        while (next);
      }
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__deallocate_node(v13);
    }
    for (; next; next = (uint64_t *)*next)
    {
      v16 = operator new(0x30uLL);
      void *v16 = 0;
      uint64_t v17 = next[2];
      v16[2] = v17;
      *((_DWORD *)v16 + 6) = *((_DWORD *)next + 6);
      v16[4] = (id)next[4];
      v16[5] = (id)next[5];
      v16[1] = v17;
      v18 = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_prepare((uint64_t)&v6->_innerSignalPack, v17, v16 + 2);
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__node_insert_multi_perform(&v6->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, v16, v18);
    }
  }

  return v6;
}

+ (id)extractFromDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = objc_alloc_init(MapsSuggestionsMutableSignalPack);
    id v8 = v6;
    v9 = MapsSuggestionsCurrentBestLocation();
    if (v9)
    {
      [v8 coordinate];
      float v12 = NAN;
      if (v11 >= -180.0 && v11 <= 180.0 && v10 >= -90.0 && v10 <= 90.0)
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [v8 coordinate];
        double v15 = v14;
        [v8 coordinate];
        v16 = objc_msgSend(v13, "initWithLatitude:longitude:", v15);
        [v16 distanceFromLocation:v9];
        float v12 = v17;
      }
    }
    else
    {
      float v12 = NAN;
    }

    objc_super v20 = v7;
    v22 = v20;
    if (v20)
    {
      *(float *)&double v21 = v12;
      [(MapsSuggestionsMutableSignalPack *)v20 writeSignalValue:13 forType:v21];
    }
    else
    {
      v23 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v48 = 136446978;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
        __int16 v50 = 1024;
        int v51 = 27;
        __int16 v52 = 2082;
        v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
        __int16 v54 = 2082;
        v55 = "nil == (pack)";
        _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
      }
    }
    v18 = (id)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
    if (v18)
    {
      v24 = MapsSuggestionsCurrentBestLocation();
      if (v24 && ([v18 coordinate], CLLocationCoordinate2DIsValid(v58)))
      {
        [v18 distanceFromLocation:v24];
        float v26 = v25;
      }
      else
      {
        float v26 = NAN;
      }

      v27 = v22;
      if (v22)
      {
        *(float *)&double v28 = v26;
        [(MapsSuggestionsMutableSignalPack *)v27 writeSignalValue:14 forType:v28];
        goto LABEL_30;
      }
    }
    else
    {
      v29 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        int v48 = 136446978;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
        __int16 v50 = 1024;
        int v51 = 90;
        __int16 v52 = 2082;
        v53 = "MapsSuggestionsSignalValue _distanceFromHereToLocation(CLLocation *__strong)";
        __int16 v54 = 2082;
        v55 = "nil == (there)";
        _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", (uint8_t *)&v48, 0x26u);
      }

      v30 = v22;
      if (v22)
      {
LABEL_30:

        v32 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
        id v33 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        [v8 coordinate];
        double v35 = v34;
        [v8 coordinate];
        v36 = objc_msgSend(v33, "initWithLatitude:longitude:", v35);
        id v37 = v32;
        id v38 = v36;
        v39 = v38;
        if (v37)
        {
          if (v38)
          {
            [v37 coordinate];
            if (CLLocationCoordinate2DIsValid(v59))
            {
              [v39 coordinate];
              if (CLLocationCoordinate2DIsValid(v60))
              {
                [v37 distanceFromLocation:v39];
                float v41 = v40;
LABEL_42:

                v44 = v22;
                v19 = v44;
                if (v22)
                {
                  *(float *)&double v45 = v41;
                  [(MapsSuggestionsMutableSignalPack *)v44 writeSignalValue:15 forType:v45];
                }
                else
                {
                  v46 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    int v48 = 136446978;
                    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
                    __int16 v50 = 1024;
                    int v51 = 27;
                    __int16 v52 = 2082;
                    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSu"
                          "ggestionsSignalValue)";
                    __int16 v54 = 2082;
                    v55 = "nil == (pack)";
                    _os_log_impl(&dword_1A70DF000, v46, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
                  }
                }
                goto LABEL_48;
              }
            }
LABEL_41:
            float v41 = NAN;
            goto LABEL_42;
          }
          v42 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            int v48 = 136446978;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
            __int16 v50 = 1024;
            int v51 = 112;
            __int16 v52 = 2082;
            v53 = "MapsSuggestionsSignalValue _distanceFromOriginToDestination(CLLocation *__strong, CLLocation *__strong)";
            __int16 v54 = 2082;
            v55 = "nil == (destination)";
            v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination";
            goto LABEL_39;
          }
        }
        else
        {
          v42 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            int v48 = 136446978;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
            __int16 v50 = 1024;
            int v51 = 111;
            __int16 v52 = 2082;
            v53 = "MapsSuggestionsSignalValue _distanceFromOriginToDestination(CLLocation *__strong, CLLocation *__strong)";
            __int16 v54 = 2082;
            v55 = "nil == (origin)";
            v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an origin";
LABEL_39:
            _os_log_impl(&dword_1A70DF000, v42, OS_LOG_TYPE_ERROR, v43, (uint8_t *)&v48, 0x26u);
          }
        }

        goto LABEL_41;
      }
    }
    v31 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v48 = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      __int16 v50 = 1024;
      int v51 = 27;
      __int16 v52 = 2082;
      v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
      __int16 v54 = 2082;
      v55 = "nil == (pack)";
      _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
    }

    goto LABEL_30;
  }
  v18 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    __int16 v50 = 1024;
    int v51 = 166;
    __int16 v52 = 2082;
    v53 = "+[MapsSuggestionsSignalPack(MapsSuggestionsEntry) extractFromDestinationMapItem:originCoordinate:]";
    __int16 v54 = 2082;
    v55 = "nil == (mapItem)";
    _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a map item", (uint8_t *)&v48, 0x26u);
  }
  v19 = 0;
LABEL_48:

  return v19;
}

- (MapsSuggestionsSignalPack)initWithCoder:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v4 = [v32 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsSignalPackInnerDataKey"];
  if ([v4 length])
  {
    v5 = objc_alloc_init(MapsSuggestionsSignalPack);

    uint64_t v36 = 0;
    id v6 = v4;
    if (MSg::fromData<unsigned char>(v6, &v36) == 1)
    {
      unsigned int v7 = MSg::fromData<unsigned char>(v6, &v36);
      uint64_t v8 = v7;
      *(_OWORD *)buf = 0u;
      long long v34 = 0u;
      LODWORD(v35) = 1065353216;
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)buf, v7);
      if (v7)
      {
        do
        {
          int v9 = MSg::fromData<unsigned int>(v6, &v36);
          uint64_t v10 = v9;
          *(void *)id v37 = v9;
          id v11 = v6;
          unint64_t v12 = [v11 length];
          if (v12 >= v36 + 4) {
            int v13 = MSg::fromData<unsigned int>(v11, &v36);
          }
          else {
            int v13 = 0;
          }

          double v14 = MSg::fromData<NSDate * {__strong}>(v11, &v36);
          double v15 = MSg::fromData<NSDate * {__strong}>(v11, &v36);

          v16 = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__emplace_unique_key_args<MapsSuggestionsSignalType,std::piecewise_construct_t const&,std::tuple<MapsSuggestionsSignalType const&>,std::tuple<>>((uint64_t)buf, v10, v37);
          *((_DWORD *)v16 + 6) = v13;
          double v17 = (void *)v16[4];
          v16[4] = v14;
          id v18 = v14;

          v19 = (void *)v16[5];
          v16[5] = v15;
          id v20 = v15;

          --v8;
        }
        while (v8);
      }
    }
    else
    {
      v23 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v37 = 136446978;
        *(void *)&v37[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack.hpp";
        __int16 v38 = 1024;
        int v39 = 181;
        __int16 v40 = 2082;
        float v41 = "static SignalPack MSg::SignalPack::deserialize(NSData *__strong, std::ptrdiff_t &)";
        __int16 v42 = 2082;
        v43 = "version != VERSION";
        _os_log_impl(&dword_1A70DF000, v23, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires the same version of SignalPack!", v37, 0x26u);
      }

      *(_OWORD *)buf = 0u;
      long long v34 = 0u;
      uint64_t v35 = 1065353216;
    }

    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::clear((uint64_t)&v5->_innerSignalPack);
    v24 = *(void ***)buf;
    *(void *)buf = 0;
    unint64_t value = v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_;
    v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_ = v24;
    if (value) {
      operator delete(value);
    }
    unint64_t v27 = *(void *)&buf[8];
    uint64_t v26 = v34;
    v5->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_ = (void *)v34;
    v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = v27;
    *(void *)&buf[8] = 0;
    uint64_t v28 = *((void *)&v34 + 1);
    v5->_innerSignalPack.dict_.__table_.__p2_.__value_ = *((void *)&v34 + 1);
    LODWORD(v5->_innerSignalPack.dict_.__table_.__p3_.__value_) = v35;
    if (v28)
    {
      unint64_t v29 = *(void *)(v26 + 8);
      if ((v27 & (v27 - 1)) != 0)
      {
        if (v29 >= v27) {
          v29 %= v27;
        }
      }
      else
      {
        v29 &= v27 - 1;
      }
      uint64_t v26 = 0;
      v5->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_[v29] = &v5->_innerSignalPack.dict_.__table_.__p1_;
      long long v34 = 0uLL;
    }
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__deallocate_node((id *)v26);
    v30 = *(void **)buf;
    *(void *)buf = 0;
    if (v30) {
      operator delete(v30);
    }
    self = v5;
    v22 = self;
  }
  else
  {
    double v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v21, OS_LOG_TYPE_ERROR, "Decoded empty data for MapsSuggestionsSignalPack?", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:3800];
  char v17 = 1;
  id v5 = MSg::toData<unsigned char>(v4, (uint64_t)&v17);
  char value = self->_innerSignalPack.dict_.__table_.__p2_.__value_;
  id v6 = MSg::toData<unsigned char>(v4, (uint64_t)&value);
  for (uint64_t i = self->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_; i; uint64_t i = *(void **)i)
  {
    id v8 = v4;
    uint64_t v9 = *((void *)i + 2);
    id v10 = v8;
    unsigned int v18 = v9;
    MSg::toData<unsigned int>(v10, &v18);
    objc_claimAutoreleasedReturnValue();

    id v11 = v10;
    MSg::toData<unsigned int>(v11, (unsigned int *)i + 6);
    objc_claimAutoreleasedReturnValue();

    id v12 = MSg::toData<NSDate * {__strong}>(v11, (id *)i + 4);
    id v13 = MSg::toData<NSDate * {__strong}>(v11, (id *)i + 5);
  }
  double v14 = (void *)[v4 copy];
  [v15 encodeObject:v14 forKey:@"MapsSuggestionsSignalPackInnerDataKey"];
}

- (BOOL)mergeIntoSignalPack:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = (char *)a3;
  id v6 = v5;
  if (v5)
  {
    next = self->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_;
    if (next)
    {
      id v8 = (uint64_t *)(v5 + 8);
      uint64_t v9 = v5 + 24;
      do
      {
        uint64_t v10 = *((void *)next + 2);
        unint64_t v11 = *((void *)v6 + 2);
        if (v11)
        {
          uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
          v12.i16[0] = vaddlv_u8(v12);
          if (v12.u32[0] > 1uLL)
          {
            unint64_t v3 = *((void *)next + 2);
            if (v10 >= v11) {
              unint64_t v3 = v10 % v11;
            }
          }
          else
          {
            unint64_t v3 = (v11 - 1) & v10;
          }
          id v13 = *(uint64_t ***)(*v8 + 8 * v3);
          if (v13)
          {
            for (uint64_t i = *v13; i; uint64_t i = (uint64_t *)*i)
            {
              unint64_t v15 = i[1];
              if (v15 == v10)
              {
                if (i[2] == v10)
                {
                  *((_DWORD *)i + 6) = *((_DWORD *)next + 6);
                  objc_storeStrong((id *)i + 4, *((id *)next + 4));
                  objc_storeStrong((id *)i + 5, *((id *)next + 5));
                  goto LABEL_42;
                }
              }
              else
              {
                if (v12.u32[0] > 1uLL)
                {
                  if (v15 >= v11) {
                    v15 %= v11;
                  }
                }
                else
                {
                  v15 &= v11 - 1;
                }
                if (v15 != v3) {
                  break;
                }
              }
            }
          }
        }
        v16 = operator new(0x30uLL);
        void *v16 = 0;
        v16[1] = v10;
        v16[2] = v10;
        *((_DWORD *)v16 + 6) = *((_DWORD *)next + 6);
        v16[4] = *((id *)next + 4);
        v16[5] = *((id *)next + 5);
        float v17 = (float)(unint64_t)(*((void *)v6 + 4) + 1);
        float v18 = *((float *)v6 + 10);
        if (!v11 || (float)(v18 * (float)v11) < v17)
        {
          BOOL v19 = (v11 & (v11 - 1)) != 0;
          if (v11 < 3) {
            BOOL v19 = 1;
          }
          unint64_t v20 = v19 | (2 * v11);
          unint64_t v21 = vcvtps_u32_f32(v17 / v18);
          if (v20 <= v21) {
            size_t v22 = v21;
          }
          else {
            size_t v22 = v20;
          }
          std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)v6 + 8, v22);
          unint64_t v11 = *((void *)v6 + 2);
          if ((v11 & (v11 - 1)) != 0)
          {
            if (v10 >= v11) {
              unint64_t v3 = v10 % v11;
            }
            else {
              unint64_t v3 = v10;
            }
          }
          else
          {
            unint64_t v3 = (v11 - 1) & v10;
          }
        }
        uint64_t v23 = *v8;
        v24 = *(void **)(*v8 + 8 * v3);
        if (v24)
        {
          void *v16 = *v24;
        }
        else
        {
          void *v16 = *v9;
          void *v9 = v16;
          *(void *)(v23 + 8 * v3) = v9;
          if (!*v16) {
            goto LABEL_41;
          }
          unint64_t v25 = *(void *)(*v16 + 8);
          if ((v11 & (v11 - 1)) != 0)
          {
            if (v25 >= v11) {
              v25 %= v11;
            }
          }
          else
          {
            v25 &= v11 - 1;
          }
          v24 = (void *)(*v8 + 8 * v25);
        }
        void *v24 = v16;
LABEL_41:
        ++*((void *)v6 + 4);
LABEL_42:
        next = *(void **)next;
      }
      while (next);
    }
  }
  else
  {
    uint64_t v26 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136446978;
      unint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack.mm";
      __int16 v30 = 1024;
      int v31 = 72;
      __int16 v32 = 2082;
      id v33 = "-[MapsSuggestionsSignalPack mergeIntoSignalPack:]";
      __int16 v34 = 2082;
      uint64_t v35 = "nil == (signalPack)";
      _os_log_impl(&dword_1A70DF000, v26, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires another signal pack", (uint8_t *)&v28, 0x26u);
    }
  }
  return v6 != 0;
}

+ (id)extractFromDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!v7)
  {
    p_super = GEOFindOrCreateLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      int v48 = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      __int16 v50 = 1024;
      int v51 = 128;
      __int16 v52 = 2082;
      v53 = "+[MapsSuggestionsSignalPack(MapsSuggestionsEntry) extractFromDestinationEntry:originCoordinate:]";
      __int16 v54 = 2082;
      v55 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, p_super, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v48, 0x26u);
    }
    goto LABEL_36;
  }
  uint64_t v9 = [v7 geoMapItem];

  if (!v9
    || ([v8 geoMapItem],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "extractFromDestinationMapItem:originCoordinate:", v10, latitude, longitude),
        unint64_t v11 = (MapsSuggestionsMutableSignalPack *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    unint64_t v11 = objc_alloc_init(MapsSuggestionsMutableSignalPack);
  }
  *(float *)&double v12 = (float)[v8 type];
  [(MapsSuggestionsMutableSignalPack *)v11 writeSignalValue:1 forType:v12];
  id v13 = v8;
  if ([v13 containsKey:@"MapsSuggestionsScheduledTimeKey"])
  {
    double v14 = [v13 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
    unint64_t v15 = MapsSuggestionsNow();
    [v14 timeIntervalSinceDate:v15];
    double v17 = v16;

    float v18 = v11;
    if (v18)
    {
      *(float *)&double v19 = v17;
      [(MapsSuggestionsMutableSignalPack *)v18 writeSignalValue:2 forType:v19];
LABEL_11:
      int v21 = 0;
      goto LABEL_15;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_11;
    }
  }
  size_t v22 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    int v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    __int16 v50 = 1024;
    int v51 = 27;
    __int16 v52 = 2082;
    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
    __int16 v54 = 2082;
    v55 = "nil == (pack)";
    _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
  }

  int v21 = 1;
LABEL_15:

  id v23 = v13;
  if ([v23 containsKey:@"MapsSuggestionsScheduledTimeKey"])
  {
    v24 = [v23 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
    double v25 = MapsSuggestionsTimeSinceMidnightOfDate(v24);

    uint64_t v26 = v11;
    if ((v21 & 1) == 0)
    {
      *(float *)&double v27 = v25;
      [(MapsSuggestionsMutableSignalPack *)v26 writeSignalValue:4 forType:v27];
      goto LABEL_22;
    }
  }
  else
  {

    int v28 = v11;
    if (!v21) {
      goto LABEL_22;
    }
  }
  unint64_t v29 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    int v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    __int16 v50 = 1024;
    int v51 = 27;
    __int16 v52 = 2082;
    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
    __int16 v54 = 2082;
    v55 = "nil == (pack)";
    _os_log_impl(&dword_1A70DF000, v29, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
  }

LABEL_22:
  id v30 = v23;
  if ([v30 containsKey:@"MapsSuggestionsScheduledEndTimeKey"])
  {
    int v31 = [v30 dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
    __int16 v32 = MapsSuggestionsNow();
    [v31 timeIntervalSinceDate:v32];
    double v34 = v33;

    uint64_t v35 = v11;
    if ((v21 & 1) == 0)
    {
      *(float *)&double v36 = v34;
      [(MapsSuggestionsMutableSignalPack *)v35 writeSignalValue:3 forType:v36];
      goto LABEL_29;
    }
  }
  else
  {

    id v37 = v11;
    if (!v21) {
      goto LABEL_29;
    }
  }
  __int16 v38 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    int v48 = 136446978;
    v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
    __int16 v50 = 1024;
    int v51 = 27;
    __int16 v52 = 2082;
    v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
    __int16 v54 = 2082;
    v55 = "nil == (pack)";
    _os_log_impl(&dword_1A70DF000, v38, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
  }

LABEL_29:
  id v39 = v30;
  if (![v39 containsKey:@"MapsSuggestionsScheduledEndTimeKey"])
  {

    uint64_t v44 = v11;
    if (!v21)
    {
      p_super = &v44->super.super;
      goto LABEL_38;
    }
    goto LABEL_33;
  }
  __int16 v40 = [v39 dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
  double v41 = MapsSuggestionsTimeSinceMidnightOfDate(v40);

  __int16 v42 = v11;
  if (v21)
  {
LABEL_33:
    double v45 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      int v48 = 136446978;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      __int16 v50 = 1024;
      int v51 = 27;
      __int16 v52 = 2082;
      v53 = "BOOL _addIfValid(MapsSuggestionsMutableSignalPack *__strong, MapsSuggestionsSignalType, MapsSuggestionsSignalValue)";
      __int16 v54 = 2082;
      v55 = "nil == (pack)";
      _os_log_impl(&dword_1A70DF000, v45, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack", (uint8_t *)&v48, 0x26u);
    }

    p_super = 0;
LABEL_36:
    v46 = 0;
    goto LABEL_39;
  }
  p_super = &v42->super.super;
  *(float *)&double v43 = v41;
  [(MapsSuggestionsMutableSignalPack *)v42 writeSignalValue:5 forType:v43];
LABEL_38:
  v46 = p_super;
LABEL_39:

  return v46;
}

- (id)mutableCopy
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsSignalPack;
  return [(MapsSuggestionsSignalPack *)&v3 mutableCopy];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[MapsSuggestionsMutableSignalPack allocWithZone:a3];
  return [(MapsSuggestionsSignalPack *)v4 initWithSignalPack:self];
}

+ (id)signalPackFromData:(id)a3
{
  objc_super v3 = MapsSuggestionsSignalPackFromData(a3);
  return v3;
}

- (id)copy
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsSignalPack;
  return [(MapsSuggestionsSignalPack *)&v3 copy];
}

- (BOOL)hasType:(int64_t)a3
{
  return std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::find<MapsSuggestionsSignalType>(&self->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, a3) != 0;
}

- (float)valueForSignalType:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (float *)std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::find<MapsSuggestionsSignalType>(&self->_innerSignalPack.dict_.__table_.__bucket_list_.__ptr_.__value_, a3);
  if (v3) {
    return v3[6];
  }
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136446978;
    id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack.hpp";
    __int16 v8 = 1024;
    int v9 = 135;
    __int16 v10 = 2082;
    unint64_t v11 = "SignalValue MSg::SignalPack::get(SignalType) const";
    __int16 v12 = 2082;
    id v13 = "iter == dict_.cend()";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. The type key needs to exist, have you checked .has(type)?", (uint8_t *)&v6, 0x26u);
  }

  return NAN;
}

- (BOOL)isEmpty
{
  return self->_innerSignalPack.dict_.__table_.__p2_.__value_ == 0;
}

- (unint64_t)count
{
  return self->_innerSignalPack.dict_.__table_.__p2_.__value_;
}

- (id)encodedFeatureDictionary
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD0C8E80](self, a2);
  *(_OWORD *)__p = 0u;
  *(_OWORD *)__int16 v54 = 0u;
  float v55 = 1.0;
  std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)__p, (unint64_t)(float)self->_innerSignalPack.dict_.__table_.__p2_.__value_);
  next = (float *)self->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_;
  if (!next) {
    goto LABEL_122;
  }
  do
  {
    float v5 = next[6];
    switch(*((void *)next + 2))
    {
      case 1:
        int v6 = operator new(0x44uLL);
        __int16 v10 = (char *)(v6 + 17);
        v6[16] = 0;
        *((_OWORD *)v6 + 2) = 0u;
        *((_OWORD *)v6 + 3) = 0u;
        *(_OWORD *)int v6 = 0u;
        *((_OWORD *)v6 + 1) = 0u;
        if (fabsf(v5) >= 0.001)
        {
          int v13 = 0;
          uint64_t v14 = 0;
          do
          {
            if (v13)
            {
              if (vabds_f32(v5, (float)v13) < 0.001) {
                goto LABEL_60;
              }
              ++v14;
            }
            ++v13;
          }
          while (v13 != 18);
        }
        goto LABEL_76;
      case 2:
      case 3:
      case 0x17:
      case 0x20:
        int v6 = operator new(4uLL);
        float v9 = v5 / 86400.0;
        goto LABEL_9;
      case 4:
      case 5:
      case 0xALL:
        if (v5 >= 0.0)
        {
          if (v5 <= 86400.0)
          {
            int v6 = operator new(4uLL);
            float v9 = (float)(v5 / 86401.0) + 0.000011574;
            goto LABEL_9;
          }
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 41;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<0, 86400>::encode(SignalValue) const [Min = 0, Max = 86400]";
            __int16 v62 = 2082;
            v63 = "decodedValue > MAX";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 40;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<0, 86400>::encode(SignalValue) const [Min = 0, Max = 86400]";
            __int16 v62 = 2082;
            v63 = "decodedValue < MIN";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
        goto LABEL_73;
      case 6:
        if (v5 >= 174.0)
        {
          if (v5 <= 373.0)
          {
            int v6 = operator new(4uLL);
            float v33 = (float)(v5 + -174.0) / 200.0;
            float v34 = 0.005;
            goto LABEL_121;
          }
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 41;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<174, 373>::encode(SignalValue) const [Min = 174, Max = 373]";
            __int16 v62 = 2082;
            v63 = "decodedValue > MAX";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 40;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<174, 373>::encode(SignalValue) const [Min = 174, Max = 373]";
            __int16 v62 = 2082;
            v63 = "decodedValue < MIN";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
        goto LABEL_73;
      case 7:
      case 8:
      case 9:
        int v6 = operator new(4uLL);
        *(float *)int v6 = v5;
        __int16 v10 = (char *)(v6 + 1);
        goto LABEL_76;
      case 0xBLL:
        if (v5 >= 1.0)
        {
          if (v5 <= 7.0)
          {
            int v6 = operator new(4uLL);
            float v33 = (float)(v5 + -1.0) / 7.0;
            float v34 = 0.14286;
            goto LABEL_121;
          }
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 41;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<1, 7>::encode(SignalValue) const [Min = 1, Max = 7]";
            __int16 v62 = 2082;
            v63 = "decodedValue > MAX";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 40;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<1, 7>::encode(SignalValue) const [Min = 1, Max = 7]";
            __int16 v62 = 2082;
            v63 = "decodedValue < MIN";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
        goto LABEL_73;
      case 0xCLL:
      case 0x14:
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1ALL:
      case 0x1CLL:
      case 0x1DLL:
      case 0x1ELL:
      case 0x1FLL:
      case 0x21:
      case 0x22:
      case 0x23:
      case 0x24:
      case 0x25:
      case 0x27:
        if (fabs(v5) < 0.01)
        {
          int v6 = operator new(4uLL);
          id v7 = v6;
          int v8 = -1082130432;
          goto LABEL_75;
        }
        if (fabs(v5 + -1.0) < 0.01)
        {
          int v6 = operator new(4uLL);
          id v7 = v6;
          int v8 = 1065353216;
          goto LABEL_75;
        }
        unint64_t v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBooleanSignalEncoder.hpp";
          __int16 v58 = 1024;
          int v59 = 32;
          __int16 v60 = 2082;
          v61 = "const SignalValues MSg::BooleanSignalEncoder::encode(SignalValue) const";
          __int16 v62 = 2082;
          v63 = "YES";
          _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Only 1.0 or 0.0 are allowed as input", buf, 0x26u);
        }
        goto LABEL_73;
      case 0xDLL:
      case 0xELL:
      case 0xFLL:
      case 0x10:
      case 0x11:
      case 0x12:
        int v6 = operator new(4uLL);
        float v9 = v5 / 1000.0;
        goto LABEL_9;
      case 0x13:
        int v6 = operator new(0x10uLL);
        uint64_t v14 = 0;
        __int16 v10 = (char *)(v6 + 4);
        *(void *)int v6 = 0;
        *((void *)v6 + 1) = 0;
        while (vabds_f32(v5, (float)(int)v14) >= 0.001)
        {
          if (++v14 == 4) {
            goto LABEL_76;
          }
        }
        goto LABEL_60;
      case 0x15:
        int v6 = operator new(0x10uLL);
        __int16 v10 = (char *)(v6 + 4);
        *(void *)int v6 = 0;
        *((void *)v6 + 1) = 0;
        if (fabsf(v5) < 0.001) {
          goto LABEL_76;
        }
        int v15 = 0;
        uint64_t v14 = 0;
        do
        {
          if (v15)
          {
            if (vabds_f32(v5, (float)v15) < 0.001) {
              goto LABEL_60;
            }
            ++v14;
          }
          ++v15;
        }
        while (v15 != 5);
        goto LABEL_76;
      case 0x1BLL:
        int v6 = operator new(0xB4uLL);
        __int16 v10 = (char *)(v6 + 45);
        v6[44] = 0;
        *((_OWORD *)v6 + 9) = 0u;
        *((_OWORD *)v6 + 10) = 0u;
        *((_OWORD *)v6 + 7) = 0u;
        *((_OWORD *)v6 + 8) = 0u;
        *((_OWORD *)v6 + 5) = 0u;
        *((_OWORD *)v6 + 6) = 0u;
        *((_OWORD *)v6 + 3) = 0u;
        *((_OWORD *)v6 + 4) = 0u;
        *((_OWORD *)v6 + 1) = 0u;
        *((_OWORD *)v6 + 2) = 0u;
        *(_OWORD *)int v6 = 0u;
        if (fabsf(v5) < 0.001) {
          goto LABEL_76;
        }
        int v16 = 0;
        uint64_t v14 = 0;
        break;
      case 0x26:
        if (v5 >= 0.0)
        {
          if (v5 <= 500.0)
          {
            int v6 = operator new(4uLL);
            float v34 = 0.001996;
            float v33 = v5 / 501.0;
LABEL_121:
            float v9 = v33 + v34;
LABEL_9:
            *(float *)int v6 = v9;
            __int16 v10 = (char *)(v6 + 1);
            goto LABEL_76;
          }
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 41;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<0, 500>::encode(SignalValue) const [Min = 0, Max = 500]";
            __int16 v62 = 2082;
            v63 = "decodedValue > MAX";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value over range", buf, 0x26u);
          }
        }
        else
        {
          unint64_t v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRangeSignalEncoder.hpp";
            __int16 v58 = 1024;
            int v59 = 40;
            __int16 v60 = 2082;
            v61 = "const SignalValues MSg::RangeSignalEncoder<0, 500>::encode(SignalValue) const [Min = 0, Max = 500]";
            __int16 v62 = 2082;
            v63 = "decodedValue < MIN";
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Value under range", buf, 0x26u);
          }
        }
LABEL_73:

        __int16 v12 = operator new(4uLL);
LABEL_74:
        int v6 = v12;
        id v7 = v12;
        int v8 = 2143289344;
LABEL_75:
        *id v7 = v8;
        __int16 v10 = (char *)(v7 + 1);
        goto LABEL_76;
      default:
        __int16 v12 = operator new(4uLL);
        goto LABEL_74;
    }
    while (!v16)
    {
LABEL_58:
      if (++v16 == 46) {
        goto LABEL_76;
      }
    }
    if (vabds_f32(v5, (float)v16) >= 0.001)
    {
      ++v14;
      goto LABEL_58;
    }
LABEL_60:
    v6[v14] = 1065353216;
LABEL_76:
    unint64_t v17 = *((void *)next + 2);
    unint64_t v18 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v19.i16[0] = vaddlv_u8(v19);
      if (v19.u32[0] > 1uLL)
      {
        unint64_t v2 = *((void *)next + 2);
        if ((void *)v17 >= __p[1]) {
          unint64_t v2 = v17 % (unint64_t)__p[1];
        }
      }
      else
      {
        unint64_t v2 = (LODWORD(__p[1]) - 1) & v17;
      }
      unint64_t v20 = (void **)*((void *)__p[0] + v2);
      if (v20)
      {
        for (uint64_t i = *v20; i; uint64_t i = (void *)*i)
        {
          unint64_t v22 = i[1];
          if (v22 == v17)
          {
            if (i[2] == *((void *)next + 2)) {
              goto LABEL_114;
            }
          }
          else
          {
            if (v19.u32[0] > 1uLL)
            {
              if ((void *)v22 >= __p[1]) {
                v22 %= (unint64_t)__p[1];
              }
            }
            else
            {
              v22 &= (unint64_t)__p[1] - 1;
            }
            if (v22 != v2) {
              break;
            }
          }
        }
      }
    }
    uint64_t i = operator new(0x30uLL);
    *uint64_t i = 0;
    i[1] = v17;
    uint64_t v23 = *((void *)next + 2);
    i[4] = 0;
    i[5] = 0;
    i[2] = v23;
    i[3] = 0;
    float v24 = (float)((unint64_t)v54[1] + 1);
    if (!v18 || (float)(v55 * (float)v18) < v24)
    {
      BOOL v25 = (v18 & (v18 - 1)) != 0;
      if (v18 < 3) {
        BOOL v25 = 1;
      }
      unint64_t v26 = v25 | (2 * v18);
      unint64_t v27 = vcvtps_u32_f32(v24 / v55);
      if (v26 <= v27) {
        size_t v28 = v27;
      }
      else {
        size_t v28 = v26;
      }
      std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)__p, v28);
      unint64_t v18 = (unint64_t)__p[1];
      if (((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0)
      {
        if ((void *)v17 >= __p[1]) {
          unint64_t v2 = v17 % (unint64_t)__p[1];
        }
        else {
          unint64_t v2 = v17;
        }
      }
      else
      {
        unint64_t v2 = (LODWORD(__p[1]) - 1) & v17;
      }
    }
    unint64_t v29 = __p[0];
    id v30 = (void *)*((void *)__p[0] + v2);
    if (v30)
    {
      *uint64_t i = *v30;
      goto LABEL_112;
    }
    *uint64_t i = v54[0];
    v54[0] = i;
    v29[v2] = v54;
    if (*i)
    {
      unint64_t v31 = *(void *)(*i + 8);
      if ((v18 & (v18 - 1)) != 0)
      {
        if (v31 >= v18) {
          v31 %= v18;
        }
      }
      else
      {
        v31 &= v18 - 1;
      }
      id v30 = (char *)__p[0] + 8 * v31;
LABEL_112:
      void *v30 = i;
    }
    ++v54[1];
LABEL_114:
    __int16 v32 = (void *)i[3];
    if (v32)
    {
      i[4] = v32;
      operator delete(v32);
      i[3] = 0;
      i[4] = 0;
      i[5] = 0;
    }
    i[3] = v6;
    i[4] = v10;
    i[5] = v10;
    next = *(float **)next;
  }
  while (next);
LABEL_122:
  id v35 = objc_alloc(MEMORY[0x1E4F1CA60]);
  double v36 = (void *)[v35 initWithCapacity:v54[1]];
  id v37 = v54[0];
  if (v54[0])
  {
    do
    {
      __int16 v38 = NSStringFromMapsSuggestionsSignalType(v37[2]);
      __int16 v40 = (char *)v37[3];
      double v41 = (char *)v37[4];
      uint64_t v42 = v41 - v40;
      if (v41 - v40 == 4)
      {
        LODWORD(v39) = *(_DWORD *)v40;
        double v43 = [NSNumber numberWithFloat:v39];
        [v36 setObject:v43 forKeyedSubscript:v38];
      }
      else if (v41 != v40)
      {
        uint64_t v44 = 0;
        if ((unint64_t)(v42 >> 2) <= 1) {
          uint64_t v45 = 1;
        }
        else {
          uint64_t v45 = v42 >> 2;
        }
        do
        {
          v46 = (void *)[[NSString alloc] initWithFormat:@"%@:%u", v38, v44];
          LODWORD(v47) = *(_DWORD *)(v37[3] + 4 * v44);
          int v48 = [NSNumber numberWithFloat:v47];
          [v36 setObject:v48 forKeyedSubscript:v46];

          ++v44;
        }
        while (v45 != v44);
      }

      id v37 = (void *)*v37;
    }
    while (v37);
  }
  v49 = (void *)[v36 copy];

  std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,std::vector<float>>>>::__deallocate_node((void *)v54[0]);
  __int16 v50 = __p[0];
  __p[0] = 0;
  if (v50) {
    operator delete(v50);
  }
  return v49;
}

- (id)description
{
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"MSg::SignalPack size=%u {", self->_innerSignalPack.dict_.__table_.__p2_.__value_);
  for (uint64_t i = (float *)self->_innerSignalPack.dict_.__table_.__p1_.__value_.__next_; i; uint64_t i = *(float **)i)
  {
    float v5 = NSStringFromMapsSuggestionsSignalType(*((void *)i + 2));
    [v3 appendFormat:@"\n . %@=%.2lf (%@ exp %@)", v5, i[6], *((void *)i + 4), *((void *)i + 5)];
  }
  [v3 appendString:@"}"];
  int v6 = (void *)[v3 copy];

  return v6;
}

@end