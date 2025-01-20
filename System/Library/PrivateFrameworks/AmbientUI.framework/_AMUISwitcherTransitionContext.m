@interface _AMUISwitcherTransitionContext
+ (id)contextWithFromRecord:(void *)a3 toRecord:(uint64_t)a4 direction:(uint64_t)a5 interactive:;
- (AMUISwitcherItem)fromItem;
- (AMUISwitcherItem)toItem;
- (BOOL)isInteractive;
- (_AMUISwitcherTransitionContext)initWithFromRecord:(id)a3 toRecord:(id)a4 direction:(int64_t)a5 interactive:(BOOL)a6;
- (double)progress;
- (id)userInfoObjectForKey:(id)a3;
- (int64_t)direction;
- (uint64_t)hasSameItemsAsFromRecord:(void *)a3 toRecord:;
- (void)removeUserInfoObjectForKey:(id)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
@end

@implementation _AMUISwitcherTransitionContext

- (uint64_t)hasSameItemsAsFromRecord:(void *)a3 toRecord:
{
  v22[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    uint64_t v19 = 0;
    goto LABEL_15;
  }
  v7 = (void *)MEMORY[0x263EFFA08];
  v8 = *(void **)(a1 + 8);
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x263EFF9D0] null];
  }
  v22[0] = v9;
  v10 = *(void **)(a1 + 16);
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x263EFF9D0] null];
  }
  v22[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v13 = [v7 setWithArray:v12];

  if (v10)
  {
    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {

    if (v8) {
      goto LABEL_8;
    }
  }

LABEL_8:
  v14 = (void *)MEMORY[0x263EFFA08];
  v15 = v5;
  if (!v5)
  {
    v15 = [MEMORY[0x263EFF9D0] null];
  }
  v21[0] = v15;
  v16 = v6;
  if (!v6)
  {
    v16 = [MEMORY[0x263EFF9D0] null];
  }
  v21[1] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  v18 = [v14 setWithArray:v17];

  if (!v6)
  {

    if (v5) {
      goto LABEL_14;
    }
LABEL_19:

    goto LABEL_14;
  }
  if (!v5) {
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v19 = [v13 isEqualToSet:v18];

LABEL_15:
  return v19;
}

+ (id)contextWithFromRecord:(void *)a3 toRecord:(uint64_t)a4 direction:(uint64_t)a5 interactive:
{
  id v8 = a3;
  id v9 = a2;
  v10 = (void *)[objc_alloc((Class)self) initWithFromRecord:v9 toRecord:v8 direction:a4 interactive:a5];

  return v10;
}

- (double)progress
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1) {
    return *(double *)(v1 + 24);
  }
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3) {
    double v4 = *(double *)(v3 + 24);
  }
  else {
    double v4 = 0.0;
  }
  return 1.0 - v4;
}

- (_AMUISwitcherTransitionContext)initWithFromRecord:(id)a3 toRecord:(id)a4 direction:(int64_t)a5 interactive:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_AMUISwitcherTransitionContext;
  v13 = [(_AMUISwitcherTransitionContext *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromRecord, a3);
    objc_storeStrong((id *)&v14->_toRecord, a4);
    v14->_direction = a5;
    v14->_interactive = a6;
  }

  return v14;
}

- (AMUISwitcherItem)fromItem
{
  fromRecord = self->_fromRecord;
  if (fromRecord) {
    id WeakRetained = objc_loadWeakRetained((id *)&fromRecord->_item);
  }
  else {
    id WeakRetained = 0;
  }

  return (AMUISwitcherItem *)WeakRetained;
}

- (AMUISwitcherItem)toItem
{
  toRecord = self->_toRecord;
  if (toRecord) {
    id WeakRetained = objc_loadWeakRetained((id *)&toRecord->_item);
  }
  else {
    id WeakRetained = 0;
  }

  return (AMUISwitcherItem *)WeakRetained;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v9 = self->_userInfo;
    self->_userInfo = v8;

    userInfo = self->_userInfo;
  }
  [(NSMutableDictionary *)userInfo setObject:v10 forKey:v6];
}

- (id)userInfoObjectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_userInfo objectForKey:a3];
}

- (void)removeUserInfoObjectForKey:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_toRecord, 0);

  objc_storeStrong((id *)&self->_fromRecord, 0);
}

@end