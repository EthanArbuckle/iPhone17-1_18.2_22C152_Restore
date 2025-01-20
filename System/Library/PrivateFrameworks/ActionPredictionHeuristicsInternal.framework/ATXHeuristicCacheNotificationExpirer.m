@interface ATXHeuristicCacheNotificationExpirer
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicCacheNotificationExpirer)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initDarwin:(id)a3;
- (id)initLocal:(id)a3;
- (unint64_t)hash;
- (void)_start;
- (void)_stop;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicCacheNotificationExpirer

- (unint64_t)hash
{
  BOOL isLocal = self->_isLocal;
  return [(NSString *)self->_notificationName hash] - isLocal + 32 * isLocal;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXHeuristicCacheNotificationExpirer *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      notificationName = self->_notificationName;
      v7 = v5->_notificationName;
      if (notificationName == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = notificationName;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0)
        {
          BOOL v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      BOOL v11 = self->_isLocal == v5->_isLocal;
      goto LABEL_10;
    }
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

- (id)initDarwin:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ATXHeuristicResultCache.m", 178, @"Invalid parameter not satisfying: %@", @"notificationName" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicCacheNotificationExpirer;
  v7 = [(ATXHeuristicCacheExpirer *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_notificationName, a3);
    v8->_BOOL isLocal = 0;
  }

  return v8;
}

- (id)initLocal:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ATXHeuristicResultCache.m", 168, @"Invalid parameter not satisfying: %@", @"notificationName" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicCacheNotificationExpirer;
  v7 = [(ATXHeuristicCacheExpirer *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_notificationName, a3);
    v8->_BOOL isLocal = 1;
  }

  return v8;
}

- (void)_stop
{
  id token = self->_token;
  if (token)
  {
    if (self->_isLocal)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:self->_token];
    }
    else
    {
      int v4 = [token intValue];
      notify_cancel(v4);
    }
  }
}

- (void)_start
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "Starting ATXHeuristicCacheNotificationExpirer for %@. We will now expire heuristics for this notification.", (uint8_t *)&v3, 0xCu);
}

void __46__ATXHeuristicCacheNotificationExpirer__start__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[10];
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1D0F43000, v2, OS_LOG_TYPE_DEFAULT, "Received local notification: %@. Expiring heuristics.", (uint8_t *)&v4, 0xCu);
    }

    [WeakRetained expire];
  }
}

void __46__ATXHeuristicCacheNotificationExpirer__start__block_invoke_76(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[10];
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1D0F43000, v2, OS_LOG_TYPE_DEFAULT, "Received Darwin notification: %@. Expiring heuristics.", (uint8_t *)&v4, 0xCu);
    }

    [WeakRetained expire];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  notificationName = self->_notificationName;
  id v5 = a3;
  [v5 encodeObject:notificationName forKey:@"notificationName"];
  [v5 encodeBool:self->_isLocal forKey:@"isLocal"];
}

- (ATXHeuristicCacheNotificationExpirer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeuristicCacheNotificationExpirer;
  id v5 = [(ATXHeuristicCacheExpirer *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationName"];
    notificationName = v5->_notificationName;
    v5->_notificationName = (NSString *)v6;

    v5->_BOOL isLocal = [v4 decodeBoolForKey:@"isLocal"];
  }

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self->_isLocal) {
    id v4 = "local";
  }
  else {
    id v4 = "darwin";
  }
  id v5 = (void *)[v3 initWithFormat:@"<expire after %s notification %@ (watching: %i)>", v4, self->_notificationName, self->_token != 0];

  return v5;
}

@end