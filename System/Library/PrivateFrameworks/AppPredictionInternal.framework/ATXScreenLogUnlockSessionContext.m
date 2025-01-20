@interface ATXScreenLogUnlockSessionContext
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenLogUnlockSessionManager)unlockSessionManager;
- (ATXScreenLogUnlockSessionContext)init;
- (ATXScreenLogUnlockSessionContext)initWithCoder:(id)a3;
- (ATXScreenLogUnlockSessionContext)initWithUnlockSessionManager:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXScreenLogUnlockSessionContext:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUnlockSessionManager:(id)a3;
- (void)updateWithUIEvent:(id)a3;
@end

@implementation ATXScreenLogUnlockSessionContext

- (ATXScreenLogUnlockSessionContext)init
{
  v3 = objc_opt_new();
  v4 = [(ATXScreenLogUnlockSessionContext *)self initWithUnlockSessionManager:v3];

  return v4;
}

- (ATXScreenLogUnlockSessionContext)initWithUnlockSessionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScreenLogUnlockSessionContext;
  v6 = [(ATXScreenLogUnlockSessionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_unlockSessionManager, a3);
  }

  return v7;
}

- (void)updateWithUIEvent:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXScreenLogUnlockSessionContext)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_metrics();
  v8 = [v4 robustDecodeObjectOfClass:v6 forKey:@"sessionManager" withCoder:v5 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXScreenLogUnlockSessionContext" errorCode:-1 logHandle:v7];

  if (v8)
  {
    self = [(ATXScreenLogUnlockSessionContext *)self initWithUnlockSessionManager:v8];
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)self->_unlockSessionManager;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXScreenLogUnlockSessionContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXScreenLogUnlockSessionContext *)self isEqualToATXScreenLogUnlockSessionContext:v5];

  return v6;
}

- (BOOL)isEqualToATXScreenLogUnlockSessionContext:(id)a3
{
  v4 = self->_unlockSessionManager;
  id v5 = v4;
  if (v4 == *((ATXHomeScreenLogUnlockSessionManager **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[ATXHomeScreenLogUnlockSessionManager isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (ATXHomeScreenLogUnlockSessionManager)unlockSessionManager
{
  return self->_unlockSessionManager;
}

- (void)setUnlockSessionManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end