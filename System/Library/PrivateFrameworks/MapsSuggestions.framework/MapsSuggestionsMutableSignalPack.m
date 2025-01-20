@interface MapsSuggestionsMutableSignalPack
- (BOOL)addFromEntry:(id)a3;
- (BOOL)addFromMapItem:(id)a3;
- (BOOL)removeSignalType:(int64_t)a3;
- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4;
- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4 gathered:(id)a5;
- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4 gathered:(id)a5 expires:(id)a6;
- (MapsSuggestionsMutableSignalPack)initWithCapacity:(unint64_t)a3;
- (id)copy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)removeAll;
@end

@implementation MapsSuggestionsMutableSignalPack

- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4
{
  v7 = MapsSuggestionsNow();
  *(float *)&double v8 = a3;
  LOBYTE(a4) = [(MapsSuggestionsMutableSignalPack *)self writeSignalValue:a4 forType:v7 gathered:v8];

  return a4;
}

- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4 gathered:(id)a5
{
  id v8 = a5;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v8 sinceDate:3600.0];
  *(float *)&double v10 = a3;
  LOBYTE(a4) = [(MapsSuggestionsMutableSignalPack *)self writeSignalValue:a4 forType:v8 gathered:v9 expires:v10];

  return a4;
}

- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4 gathered:(id)a5 expires:(id)a6
{
  if (self) {
    p_innerSignalPack = &self->super._innerSignalPack;
  }
  else {
    p_innerSignalPack = 0;
  }
  int64_t v15 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__emplace_unique_key_args<MapsSuggestionsSignalType,std::piecewise_construct_t const&,std::tuple<MapsSuggestionsSignalType const&>,std::tuple<>>((uint64_t)p_innerSignalPack, a4, &v15);
  *((float *)v13 + 6) = a3;
  objc_storeStrong((id *)v13 + 4, a5);
  objc_storeStrong((id *)v13 + 5, a6);

  return 1;
}

- (id)copy
{
  v3 = [MapsSuggestionsSignalPack alloc];
  return [(MapsSuggestionsSignalPack *)v3 initWithSignalPack:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[MapsSuggestionsMutableSignalPack allocWithZone:a3];
  return [(MapsSuggestionsSignalPack *)v4 initWithSignalPack:self];
}

- (BOOL)addFromEntry:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class();
    v6 = MapsSuggestionsCurrentBestLocation();
    [v6 coordinate];
    v7 = objc_msgSend(v5, "extractFromDestinationEntry:originCoordinate:", v4);

    [v7 mergeIntoSignalPack:self];
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      __int16 v12 = 1024;
      int v13 = 200;
      __int16 v14 = 2082;
      int64_t v15 = "-[MapsSuggestionsMutableSignalPack(MapsSuggestionsEntry) addFromEntry:]";
      __int16 v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v10, 0x26u);
    }
  }
  return v4 != 0;
}

- (BOOL)addFromMapItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class();
    v6 = MapsSuggestionsCurrentBestLocation();
    [v6 coordinate];
    v7 = objc_msgSend(v5, "extractFromDestinationMapItem:originCoordinate:", v4);

    [v7 mergeIntoSignalPack:self];
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      __int16 v12 = 1024;
      int v13 = 209;
      __int16 v14 = 2082;
      int64_t v15 = "-[MapsSuggestionsMutableSignalPack(MapsSuggestionsEntry) addFromMapItem:]";
      __int16 v16 = 2082;
      v17 = "nil == (mapItem)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a map item", (uint8_t *)&v10, 0x26u);
    }
  }
  return v4 != 0;
}

- (MapsSuggestionsMutableSignalPack)initWithCapacity:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsMutableSignalPack;
  id v4 = [(MapsSuggestionsMutableSignalPack *)&v7 init];
  v5 = v4;
  if (v4) {
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)&v4->super._innerSignalPack, vcvtps_u32_f32((float)a3 / v4->super._innerSignalPack.dict_.__table_.__p3_.__value_));
  }
  return v5;
}

- (BOOL)removeSignalType:(int64_t)a3
{
  if (self) {
    p_innerSignalPack = &self->super._innerSignalPack;
  }
  else {
    p_innerSignalPack = 0;
  }
  return std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__erase_unique<MapsSuggestionsSignalType>(p_innerSignalPack, (id)a3) != 0;
}

- (void)removeAll
{
  if (self) {
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::clear((uint64_t)&self->super._innerSignalPack);
  }
  else {
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::clear(0);
  }
}

@end