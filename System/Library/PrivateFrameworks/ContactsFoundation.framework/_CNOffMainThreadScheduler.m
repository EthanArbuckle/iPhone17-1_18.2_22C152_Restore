@interface _CNOffMainThreadScheduler
+ (id)os_log;
- (CNScheduler)alreadyOffMainThreadScheduler;
- (CNScheduler)needToGetOffMainThreadScheduler;
- (NSString)description;
- (_CNOffMainThreadScheduler)init;
- (_CNOffMainThreadScheduler)initWithBackgroundScheduler:(id)a3;
- (double)timestamp;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5;
- (id)performCancelableBlock:(id)a3;
- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4;
@end

@implementation _CNOffMainThreadScheduler

- (void)performBlock:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v6 = 8;
  if (v5) {
    uint64_t v6 = 16;
  }
  v7 = *(Class *)((char *)&self->super.isa + v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42___CNOffMainThreadScheduler_performBlock___block_invoke;
  v9[3] = &unk_1E569FA00;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1_1, &__block_literal_global_18);
  }
  v2 = (void *)os_log_cn_once_object_1_1;

  return v2;
}

- (_CNOffMainThreadScheduler)init
{
  v3 = +[CNScheduler globalAsyncScheduler];
  id v4 = [(_CNOffMainThreadScheduler *)self initWithBackgroundScheduler:v3];

  return v4;
}

- (_CNOffMainThreadScheduler)initWithBackgroundScheduler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_90);
    }
    uint64_t v6 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT)) {
      -[_CNOffMainThreadScheduler initWithBackgroundScheduler:](v6);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)_CNOffMainThreadScheduler;
  v7 = [(_CNOffMainThreadScheduler *)&v12 init];
  if (v7)
  {
    uint64_t v8 = +[CNScheduler inlineScheduler];
    alreadyOffMainThreadScheduler = v7->_alreadyOffMainThreadScheduler;
    v7->_alreadyOffMainThreadScheduler = (CNScheduler *)v8;

    objc_storeStrong((id *)&v7->_needToGetOffMainThreadScheduler, a3);
    id v10 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"backgroundScheduler" object:self->_needToGetOffMainThreadScheduler];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v8 = 8;
  if (v7) {
    uint64_t v8 = 16;
  }
  v9 = *(Class *)((char *)&self->super.isa + v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59___CNOffMainThreadScheduler_performBlock_qualityOfService___block_invoke;
  v11[3] = &unk_1E569FA00;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 performBlock:v11 qualityOfService:a4];
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v6 = 8;
  if (v5) {
    uint64_t v6 = 16;
  }
  int v7 = *(Class *)((char *)&self->super.isa + v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52___CNOffMainThreadScheduler_performCancelableBlock___block_invoke;
  v11[3] = &unk_1E569FE70;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  v9 = [v7 performCancelableBlock:v11];

  return v9;
}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v8 = 8;
  if (v7) {
    uint64_t v8 = 16;
  }
  v9 = *(Class *)((char *)&self->super.isa + v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69___CNOffMainThreadScheduler_performCancelableBlock_qualityOfService___block_invoke;
  v13[3] = &unk_1E569FE70;
  v13[4] = self;
  id v14 = v6;
  id v10 = v6;
  v11 = [v9 performCancelableBlock:v13 qualityOfService:a4];

  return v11;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v8 = 8;
  if (v7) {
    uint64_t v8 = 16;
  }
  v9 = *(Class *)((char *)&self->super.isa + v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53___CNOffMainThreadScheduler_afterDelay_performBlock___block_invoke;
  v13[3] = &unk_1E569FA00;
  v13[4] = self;
  id v14 = v6;
  id v10 = v6;
  v11 = [v9 afterDelay:v13 performBlock:a3];

  return v11;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8 = a4;
  int v9 = [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = 8;
  if (v9) {
    uint64_t v10 = 16;
  }
  v11 = *(Class *)((char *)&self->super.isa + v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70___CNOffMainThreadScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v15[3] = &unk_1E569FA00;
  v15[4] = self;
  id v16 = v8;
  id v12 = v8;
  v13 = [v11 afterDelay:v15 performBlock:a5 qualityOfService:a3];

  return v13;
}

- (double)timestamp
{
  [(CNScheduler *)self->_needToGetOffMainThreadScheduler timestamp];
  return result;
}

- (CNScheduler)alreadyOffMainThreadScheduler
{
  return self->_alreadyOffMainThreadScheduler;
}

- (CNScheduler)needToGetOffMainThreadScheduler
{
  return self->_needToGetOffMainThreadScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needToGetOffMainThreadScheduler, 0);

  objc_storeStrong((id *)&self->_alreadyOffMainThreadScheduler, 0);
}

- (void)initWithBackgroundScheduler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "parameter ‘backgroundScheduler’ must be nonnull", v1, 2u);
}

@end