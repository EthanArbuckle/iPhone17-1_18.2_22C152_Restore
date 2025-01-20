@interface CCSetChangePublisher
+ (id)publisherForSet:(id)a3;
+ (id)publisherForSet:(id)a3 useCase:(id)a4;
- (BOOL)completed;
- (BOOL)isBookmarkUpToDate:(id)a3;
- (CCSetChangePublisher)init;
- (CCSetChangePublisher)initWithEnumerator:(id)a3;
- (CCSetChangePublisher)initWithSet:(id)a3 readAccess:(id)a4;
- (id)bookmark;
- (id)nextEvent;
- (id)startWithSubscriber:(id)a3;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (unint64_t)localItemInstanceCount;
- (unint64_t)sharedItemCount;
- (void)applyBookmark:(id)a3;
- (void)localItemInstanceCount;
- (void)reset;
- (void)sharedItemCount;
@end

@implementation CCSetChangePublisher

+ (id)publisherForSet:(id)a3
{
  return (id)[a1 publisherForSet:a3 useCase:*MEMORY[0x263F29E28]];
}

+ (id)publisherForSet:(id)a3 useCase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = +[CCDataResourceReadAccess defaultInstanceWithUseCase:v5];

  v9 = (void *)[v7 initWithSet:v6 readAccess:v8];

  return v9;
}

- (CCSetChangePublisher)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSetChangePublisher)initWithSet:(id)a3 readAccess:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[CCDatabaseSetChangeEnumerator alloc] initWithSet:v7 readAccess:v6];

  v9 = [(CCSetChangePublisher *)self initWithEnumerator:v8];
  return v9;
}

- (CCSetChangePublisher)initWithEnumerator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCSetChangePublisher;
  id v6 = [(CCSetChangePublisher *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_enumerator, a3);
  }

  return v7;
}

- (unint64_t)sharedItemCount
{
  enumerator = self->_enumerator;
  id v8 = 0;
  v3 = [(CCSetChangeEnumerator *)enumerator sharedItemCount:&v8];
  id v4 = v8;
  if (v3)
  {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CCSetChangePublisher sharedItemCount]();
    }

    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)localItemInstanceCount
{
  enumerator = self->_enumerator;
  id v8 = 0;
  v3 = [(CCSetChangeEnumerator *)enumerator itemInstanceCount:&v8];
  id v4 = v8;
  if (v3)
  {
    unint64_t v5 = [v3 unsignedIntegerValue];
  }
  else
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CCSetChangePublisher localItemInstanceCount]();
    }

    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isBookmarkUpToDate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 value];

    id v4 = (id)v5;
  }
  char v6 = [(CCSetChangeEnumerator *)self->_enumerator isBookmarkUpToDate:v4];

  return v6;
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)startWithSubscriber:(id)a3
{
  enumerator = self->_enumerator;
  enumeratorBookmark = self->_enumeratorBookmark;
  id v10 = 0;
  char v5 = [(CCSetChangeEnumerator *)enumerator beginWithBookmark:enumeratorBookmark error:&v10];
  id v6 = v10;
  id v7 = 0;
  if ((v5 & 1) == 0)
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CCSetChangePublisher startWithSubscriber:]();
    }

    id v7 = v6;
  }

  return v7;
}

- (id)nextEvent
{
  id result = (id)[(CCSetChangeEnumerator *)self->_enumerator next];
  if (!result) {
    self->_finished = 1;
  }
  return result;
}

- (BOOL)completed
{
  return self->_finished;
}

- (void)reset
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to reset: %@", v2, v3, v4, v5, v6);
}

- (id)validateBookmark:(id)a3
{
  return 0;
}

- (void)applyBookmark:(id)a3
{
}

- (id)bookmark
{
  return (id)[(CCSetChangeEnumerator *)self->_enumerator nextBookmark];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratorBookmark, 0);

  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (void)sharedItemCount
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to get sharedItemCount: %@", v2, v3, v4, v5, v6);
}

- (void)localItemInstanceCount
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to get localItemInstanceCount: %@", v2, v3, v4, v5, v6);
}

- (void)startWithSubscriber:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to begin enumeration: %@", v2, v3, v4, v5, v6);
}

@end