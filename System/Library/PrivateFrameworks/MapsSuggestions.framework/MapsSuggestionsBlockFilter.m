@interface MapsSuggestionsBlockFilter
+ (BOOL)isEnabled;
+ (id)filterWithBlock:(id)a3;
- (BOOL)shouldKeepEntry:(id)a3;
- (MapsSuggestionsBlockFilter)initWithBlock:(id)a3;
- (MapsSuggestionsBlockFilter)initWithBlock:(id)a3 name:(id)a4;
- (NSString)uniqueName;
@end

@implementation MapsSuggestionsBlockFilter

- (MapsSuggestionsBlockFilter)initWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() description];
  v6 = [(MapsSuggestionsBlockFilter *)self initWithBlock:v4 name:v5];

  return v6;
}

- (MapsSuggestionsBlockFilter)initWithBlock:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MapsSuggestionsBlockFilter;
  v8 = [(MapsSuggestionsBlockFilter *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v6 copy];
    id block = v8->_block;
    v8->_id block = (id)v11;
  }
  return v8;
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id block = self->_block;
  if (block)
  {
    id v4 = (uint64_t (*)(void))*((void *)block + 2);
    return v4();
  }
  else
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBlockFilter.m";
      __int16 v9 = 1024;
      int v10 = 49;
      __int16 v11 = 2082;
      v12 = "-[MapsSuggestionsBlockFilter shouldKeepEntry:]";
      __int16 v13 = 2082;
      objc_super v14 = "nil == (_block)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a block.", (uint8_t *)&v7, 0x26u);
    }

    return 1;
  }
}

+ (id)filterWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[MapsSuggestionsBlockFilter alloc] initWithBlock:v3];

  return v4;
}

- (NSString)uniqueName
{
  return self->_name;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end