@interface SFModelTaskSet
+ (id)modelInfoVersionWithAssetPath:(id)a3 taskHint:(int64_t)a4;
+ (id)modelInfoWithAssetPath:(id)a3 taskHint:(int64_t)a4;
+ (id)set;
+ (id)taskSetWithAssetPath:(id)a3;
- (BOOL)containsTask:(unint64_t)a3;
- (BOOL)supportsAssistant;
- (SFModelTaskSet)init;
- (SFModelTaskSet)initWithTasks:(id)a3;
- (id)tasks;
- (unint64_t)count;
@end

@implementation SFModelTaskSet

- (void).cxx_destruct
{
}

- (BOOL)supportsAssistant
{
  return [(SFModelTaskSet *)self containsTask:5];
}

- (BOOL)containsTask:(unint64_t)a3
{
  tasks = self->_tasks;
  if (a3 > 0xA) {
    v4 = @"Invalid Task";
  }
  else {
    v4 = off_1E6154AF8[a3];
  }
  return [(NSSet *)tasks containsObject:v4];
}

- (unint64_t)count
{
  return [(NSSet *)self->_tasks count];
}

- (id)tasks
{
  return self->_tasks;
}

- (SFModelTaskSet)initWithTasks:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFModelTaskSet;
  v5 = [(SFModelTaskSet *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (NSSet *)v4;
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CAD0] set];
    }
    tasks = v5->_tasks;
    v5->_tasks = v6;
  }
  return v5;
}

- (SFModelTaskSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFModelTaskSet;
  v2 = [(SFModelTaskSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    tasks = v2->_tasks;
    v2->_tasks = (NSSet *)v3;
  }
  return v2;
}

+ (id)modelInfoVersionWithAssetPath:(id)a3 taskHint:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = +[SFModelTaskSet modelInfoWithAssetPath:v5 taskHint:a4];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 version];
  }
  else
  {
    objc_super v9 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "+[SFModelTaskSet modelInfoVersionWithAssetPath:taskHint:]";
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl(&dword_1B709D000, v9, OS_LOG_TYPE_ERROR, "%s Unable evaluate model at path: %@", (uint8_t *)&v11, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)modelInfoWithAssetPath:(id)a3 taskHint:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = +[SFEntitledAssetManager jsonFilenameForAssetType:SFEntitledAssetTypeForTaskHint(a4)];
  v7 = [v5 stringByAppendingPathComponent:v6];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F61000]) initWithConfig:v7];
    objc_super v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v12 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315394;
        uint64_t v15 = "+[SFModelTaskSet modelInfoWithAssetPath:taskHint:]";
        __int16 v16 = 2112;
        v17 = v7;
        _os_log_error_impl(&dword_1B709D000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read file at path: %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    int v11 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      uint64_t v15 = "+[SFModelTaskSet modelInfoWithAssetPath:taskHint:]";
      _os_log_error_impl(&dword_1B709D000, v11, OS_LOG_TYPE_ERROR, "%s Path cannot be nil.", (uint8_t *)&v14, 0xCu);
    }
    objc_super v9 = 0;
  }

  return v9;
}

+ (id)taskSetWithAssetPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[SFModelTaskSet modelInfoWithAssetPath:v3 taskHint:1001];
  if (v4)
  {
    id v5 = [SFModelTaskSet alloc];
    objc_super v6 = [v4 tasks];
    v7 = [(SFModelTaskSet *)v5 initWithTasks:v6];
  }
  else
  {
    v8 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      int v11 = "+[SFModelTaskSet taskSetWithAssetPath:]";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1B709D000, v8, OS_LOG_TYPE_ERROR, "%s Unable evaluate model at path: %@", (uint8_t *)&v10, 0x16u);
    }
    v7 = +[SFModelTaskSet set];
  }

  return v7;
}

+ (id)set
{
  v2 = objc_alloc_init(SFModelTaskSet);

  return v2;
}

@end