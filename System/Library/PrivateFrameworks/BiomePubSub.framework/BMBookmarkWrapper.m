@interface BMBookmarkWrapper
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BMBookmarkWrapper)initWithUpstream:(id)a3 initialState:(id)a4;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)canStorePassThroughValueInBookmark;
- (BPSPublisher)upstream;
- (NSArray)bookmarkableUpstreams;
- (id)initialState;
- (id)withBookmark:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation BMBookmarkWrapper

- (BMBookmarkWrapper)initWithUpstream:(id)a3 initialState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMBookmarkWrapper;
  v9 = [(BMBookmarkWrapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    objc_storeStrong(&v10->_initialState, a4);
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  v5 = [_BPSBookmarkedInner alloc];
  v6 = [(BMBookmarkWrapper *)self upstream];
  id v7 = [(BMBookmarkWrapper *)self initialState];
  v9 = [(_BPSBookmarkedInner *)v5 initWithUpstream:v6 downstream:v4 state:v7];

  id v8 = [(BMBookmarkWrapper *)self upstream];
  [v8 subscribe:v9];
}

- (NSArray)bookmarkableUpstreams
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMBookmarkWrapper *)self upstream];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = [BMBookmarkWrapper alloc];
  v9 = [v7 objectAtIndexedSubscript:0];

  v10 = [(BMBookmarkWrapper *)v8 initWithUpstream:v9 initialState:v6];
  return v10;
}

- (id)withBookmark:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 upstreams];
    id v7 = [v6 objectAtIndexedSubscript:0];

    id v8 = [(BMBookmarkWrapper *)self upstream];
    int v9 = [v8 conformsToProtocol:&unk_1F0410F80];

    if (v9)
    {
      v10 = [(BMBookmarkWrapper *)self upstream];
      v11 = [BMBookmarkWrapper alloc];
      objc_super v12 = [v10 withBookmark:v7];
      v13 = [v5 value];
      v14 = [(BMBookmarkWrapper *)v11 initWithUpstream:v12 initialState:v13];
    }
    else
    {
      v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1AD01F000, v16, OS_LOG_TYPE_DEFAULT, "Can't update upstreams with bookmark", v18, 2u);
      }

      v14 = self;
    }
  }
  else
  {
    v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BMBookmarkWrapper withBookmark:](v15);
    }

    v14 = self;
  }

  return v14;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)initialState
{
  return self->_initialState;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialState, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)withBookmark:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AD01F000, log, OS_LOG_TYPE_ERROR, "Can't unwrap bookmark", v1, 2u);
}

@end