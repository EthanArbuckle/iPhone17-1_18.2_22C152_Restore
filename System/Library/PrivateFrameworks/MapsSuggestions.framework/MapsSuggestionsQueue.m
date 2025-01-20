@interface MapsSuggestionsQueue
+ (id)serialQueueWithName:(id)a3;
- (BOOL)syncBOOLReturningBlock:(id)a3;
- (NSString)uniqueName;
- (OS_dispatch_queue)innerQueue;
- (id).cxx_construct;
- (id)initSerialQueueWithName:(id)a3;
- (id)syncReturningBlock:(id)a3;
- (void)asyncBlock:(id)a3;
- (void)syncBlock:(id)a3;
@end

@implementation MapsSuggestionsQueue

- (void)asyncBlock:(id)a3
{
}

- (OS_dispatch_queue)innerQueue
{
  return self->_cppQueue.__ptr_.__value_->_innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (BOOL)syncBOOLReturningBlock:(id)a3
{
  value = self->_cppQueue.__ptr_.__value_;
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  innerQueue = value->_innerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v14 = ___ZNK3MSg5Queue15syncIfDifferentIbEET_U13block_pointerFS2_vE_block_invoke;
  v15 = &unk_1E5CB7EC8;
  v17 = &v18;
  id v6 = v4;
  id v16 = v6;
  label = dispatch_queue_get_label(innerQueue);
  v8 = dispatch_queue_get_label(0);
  if (label == v8)
  {
    v10 = (void *)MEMORY[0x1AD0C8E80](v8, v9);
    v14((uint64_t)v13);
  }
  else
  {
    dispatch_sync(innerQueue, v13);
  }
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)syncBlock:(id)a3
{
}

- (id)initSerialQueueWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)MapsSuggestionsQueue;
    uint64_t v5 = [(MapsSuggestionsQueue *)&v9 self];

    if (v5)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      objc_claimAutoreleasedReturnValue();
      operator new();
    }
    self = (MapsSuggestionsQueue *)0;
    id v6 = self;
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      char v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.mm";
      __int16 v12 = 1024;
      int v13 = 28;
      __int16 v14 = 2082;
      v15 = "-[MapsSuggestionsQueue initSerialQueueWithName:]";
      __int16 v16 = 2082;
      v17 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)serialQueueWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initSerialQueueWithName:v4];

  return v5;
}

- (NSString)uniqueName
{
  return self->_cppQueue.__ptr_.__value_->_name;
}

- (id)syncReturningBlock:(id)a3
{
  value = self->_cppQueue.__ptr_.__value_;
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  id v23 = 0;
  innerQueue = value->_innerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  __int16 v14 = ___ZNK3MSg5Queue15syncIfDifferentIU8__strongP11objc_objectEET_U13block_pointerFS5_vE_block_invoke;
  v15 = &unk_1E5CB7EC8;
  v17 = &v18;
  id v6 = v4;
  id v16 = v6;
  label = dispatch_queue_get_label(innerQueue);
  v8 = dispatch_queue_get_label(0);
  if (label == v8)
  {
    v10 = (void *)MEMORY[0x1AD0C8E80](v8, v9);
    v14((uint64_t)v13);
  }
  else
  {
    dispatch_sync(innerQueue, v13);
  }
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void).cxx_destruct
{
  value = self->_cppQueue.__ptr_.__value_;
  self->_cppQueue.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<MSg::Queue>::operator()[abi:ne180100]((id *)&value->_innerQueue);
  }
}

@end