@interface CPLPushChangeTasks
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForTaskType:(int64_t)a3;
- (BOOL)hasTasks;
- (CPLPushChangeTasks)initWithCoder:(id)a3;
- (id)_descriptionFromTasksByType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initEmpty;
- (id)invalidRecordIdentifiers;
- (id)invalidRecordScopedIdentifiers;
- (void)_commitTasks;
- (void)addTask:(int64_t)a3 forRecordWithScopedIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateScopedTasksWithBlock:(id)a3;
- (void)enumerateTasksWithBlock:(id)a3;
@end

@implementation CPLPushChangeTasks

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTasksByType, 0);
  objc_storeStrong((id *)&self->_tasksByType, 0);
}

- (id)invalidRecordIdentifiers
{
  v2 = [(CPLPushChangeTasks *)self invalidRecordScopedIdentifiers];
  v3 = +[CPLScopedIdentifier unscopedIdentifiersFromSetOfScopedIdentifiers:v2];

  return v3;
}

- (id)invalidRecordScopedIdentifiers
{
  v3 = [(NSDictionary *)self->_tasksByType objectForKeyedSubscript:&unk_1F0D91448];
  v4 = [(NSMutableDictionary *)self->_mutableTasksByType objectForKeyedSubscript:&unk_1F0D91448];
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      id v6 = [v3 setByAddingObjectsFromSet:v4];
    }
    else
    {
      id v6 = v3;
    }
  }
  else if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  v7 = v6;

  return v7;
}

- (id)description
{
  p_tasksByType = &self->_tasksByType;
  NSUInteger v4 = [(NSDictionary *)self->_tasksByType count];
  uint64_t v5 = [(NSMutableDictionary *)self->_mutableTasksByType count];
  if (v4)
  {
    if (v5) {
      [(CPLPushChangeTasks *)self _commitTasks];
    }
    goto LABEL_5;
  }
  p_tasksByType = &self->_mutableTasksByType;
  if (v5)
  {
LABEL_5:
    id v6 = [(CPLPushChangeTasks *)self _descriptionFromTasksByType:*p_tasksByType];
    goto LABEL_6;
  }
  id v6 = @"<No Tasks>";
LABEL_6:
  return v6;
}

- (id)_descriptionFromTasksByType:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  uint64_t v5 = [v3 stringWithString:@"<"];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __50__CPLPushChangeTasks__descriptionFromTasksByType___block_invoke;
  v11 = &unk_1E60AA440;
  char v13 = 1;
  id v6 = v5;
  id v12 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  objc_msgSend(v6, "appendString:", @">", v8, v9, v10, v11);
  return v6;
}

void __50__CPLPushChangeTasks__descriptionFromTasksByType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  +[CPLPushChangeTasks descriptionForTaskType:](CPLPushChangeTasks, "descriptionForTaskType:", [a2 integerValue]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [v6 allObjects];

  uint64_t v8 = [v7 componentsJoinedByString:@", "];
  uint64_t v9 = (void *)v8;
  if (v4) {
    v10 = @"%@: (%@)";
  }
  else {
    v10 = @",%@: (%@)";
  }
  objc_msgSend(v5, "appendFormat:", v10, v11, v8);
}

- (BOOL)hasTasks
{
  return [(NSDictionary *)self->_tasksByType count]
      || [(NSMutableDictionary *)self->_mutableTasksByType count] != 0;
}

- (void)addTask:(int64_t)a3 forRecordWithScopedIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    mutableTasksByType = self->_mutableTasksByType;
    if (!mutableTasksByType)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v9 = self->_mutableTasksByType;
      self->_mutableTasksByType = v8;

      mutableTasksByType = self->_mutableTasksByType;
    }
    v10 = [NSNumber numberWithInteger:a3];
    id v11 = [(NSMutableDictionary *)mutableTasksByType objectForKeyedSubscript:v10];

    if (v11)
    {
      [v11 addObject:v6];
    }
    else
    {
      id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v6, 0);
      v14 = self->_mutableTasksByType;
      v15 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v14 setObject:v11 forKeyedSubscript:v15];
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v12 = __CPLSessionOSLogDomain_17407();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = +[CPLPushChangeTasks descriptionForTaskType:a3];
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Attempting to add a push change task %{public}@ for nil identifier", buf, 0xCu);
    }
  }
}

- (void)enumerateTasksWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CPLPushChangeTasks_enumerateTasksWithBlock___block_invoke;
  v6[3] = &unk_1E60AA418;
  id v7 = v4;
  id v5 = v4;
  [(CPLPushChangeTasks *)self enumerateScopedTasksWithBlock:v6];
}

void __46__CPLPushChangeTasks_enumerateTasksWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [a3 identifier];
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, a2, v7, a4);
}

- (void)enumerateScopedTasksWithBlock:(id)a3
{
  id v4 = a3;
  [(CPLPushChangeTasks *)self _commitTasks];
  tasksByType = self->_tasksByType;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke;
  v7[3] = &unk_1E60AA3F0;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)tasksByType enumerateKeysAndObjectsUsingBlock:v7];
}

void __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 integerValue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke_2;
  v9[3] = &unk_1E60AA3C8;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  [v7 enumerateObjectsUsingBlock:v9];
}

uint64_t __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*a3) {
    **(unsigned char **)(a1 + 48) = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(CPLPushChangeTasks *)self _commitTasks];
  id v5 = [[CPLPushChangeTasks alloc] initEmpty];
  uint64_t v6 = [(NSDictionary *)self->_tasksByType copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(CPLPushChangeTasks *)self _commitTasks];
  [v4 encodeObject:self->_tasksByType forKey:@"tasks"];
}

- (CPLPushChangeTasks)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPushChangeTasks;
  id v5 = [(CPLPushChangeTasks *)&v9 init];
  if (v5)
  {
    if (initWithCoder__onceToken_17426 != -1) {
      dispatch_once(&initWithCoder__onceToken_17426, &__block_literal_global_17427);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__classes forKey:@"tasks"];
    tasksByType = v5->_tasksByType;
    v5->_tasksByType = (NSDictionary *)v6;
  }
  return v5;
}

uint64_t __36__CPLPushChangeTasks_initWithCoder___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  uint64_t v6 = initWithCoder__classes;
  initWithCoder__classes = v5;
  return MEMORY[0x1F41817F8](v5, v6);
}

- (id)initEmpty
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPushChangeTasks;
  return [(CPLPushChangeTasks *)&v3 init];
}

- (void)_commitTasks
{
  if (self->_mutableTasksByType)
  {
    p_tasksByType = &self->_tasksByType;
    tasksByType = self->_tasksByType;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__CPLPushChangeTasks__commitTasks__block_invoke;
    v6[3] = &unk_1E60AA3A0;
    void v6[4] = self;
    [(NSDictionary *)tasksByType enumerateKeysAndObjectsUsingBlock:v6];
    objc_storeStrong((id *)p_tasksByType, self->_mutableTasksByType);
    mutableTasksByType = self->_mutableTasksByType;
    self->_mutableTasksByType = 0;
  }
}

void __34__CPLPushChangeTasks__commitTasks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:v10];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 unionSet:v6];
  }
  else
  {
    uint64_t v9 = [v6 mutableCopy];

    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v9 forKeyedSubscript:v10];
    id v6 = (id)v9;
  }
}

+ (id)descriptionForTaskType:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"??(%ld)", a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E60AA4B0[a3];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end