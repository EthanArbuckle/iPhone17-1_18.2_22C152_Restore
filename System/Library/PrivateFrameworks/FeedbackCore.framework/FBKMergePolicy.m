@interface FBKMergePolicy
- (BOOL)resolveConflicts:(id)a3 error:(id *)a4;
- (FBKMergePolicy)initWithType:(unint64_t)a3;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation FBKMergePolicy

- (FBKMergePolicy)initWithType:(unint64_t)a3
{
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)FBKMergePolicy;
  result = [(NSMergePolicy *)&v6 initWithMergeType:v4];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[FBKLog model];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[FBKMergePolicy resolveConflicts:error:]((uint64_t)v6, v7);
  }

  v8 = +[FBKLog model];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[FBKMergePolicy resolveConflicts:error:](self, v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)FBKMergePolicy;
  BOOL v9 = [(NSMergePolicy *)&v11 resolveConflicts:v6 error:a4];

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)resolveConflicts:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 type];
  uint64_t v4 = @"Foreground: ObjectTrumpMergePolicy";
  if (!v3) {
    uint64_t v4 = @"Background: StoreTrumpMergePolicy";
  }
  v5 = v4;
  int v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Will resolve with [%@]", (uint8_t *)&v6, 0xCu);
}

- (void)resolveConflicts:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Resolving merge conflicts [%@]", (uint8_t *)&v2, 0xCu);
}

@end