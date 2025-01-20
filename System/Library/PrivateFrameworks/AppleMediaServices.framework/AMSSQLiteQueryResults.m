@interface AMSSQLiteQueryResults
- (AMSSQLiteQueryResults)initWithStatement:(id)a3;
- (BOOL)hasRows;
- (NSNumber)firstNumberValue;
- (int)clearBindings;
- (int64_t)firstInt64Value;
- (void)bindArray:(id)a3 atPosition:(int)a4;
- (void)bindData:(id)a3 atPosition:(int)a4;
- (void)bindDataCopy:(id)a3 atPosition:(int)a4;
- (void)bindDate:(id)a3 atPosition:(int)a4;
- (void)bindDictionary:(id)a3 atPosition:(int)a4;
- (void)bindDouble:(double)a3 atPosition:(int)a4;
- (void)bindFloat:(float)a3 atPosition:(int)a4;
- (void)bindInt64:(int64_t)a3 atPosition:(int)a4;
- (void)bindInt:(int)a3 atPosition:(int)a4;
- (void)bindNullAtPosition:(int)a3;
- (void)bindNullableString:(id)a3 atPosition:(int)a4;
- (void)bindNumber:(id)a3 atPosition:(int)a4;
- (void)bindString:(id)a3 atPosition:(int)a4;
- (void)bindStringCopy:(id)a3 atPosition:(int)a4;
- (void)bindURL:(id)a3 atPosition:(int)a4;
- (void)enumerateRowsUsingBlock:(id)a3;
@end

@implementation AMSSQLiteQueryResults

- (void).cxx_destruct
{
}

uint64_t __49__AMSSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = sqlite3_step(*(sqlite3_stmt **)(a1 + 48));
  if (v2 == 100) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return v2;
}

- (AMSSQLiteQueryResults)initWithStatement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteQueryResults;
  v6 = [(AMSSQLiteQueryResults *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statement, a3);
  }

  return v7;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [[AMSSQLiteCursor alloc] initWithStatement:self->_statement];
  v6 = [(AMSSQLiteStatement *)self->_statement sqlite3_stmt];
  v7 = [(AMSSQLiteStatement *)self->_statement connection];
  id v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__AMSSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke;
  v13[3] = &unk_1E55A6A38;
  v16 = v6;
  id v8 = v4;
  id v15 = v8;
  objc_super v9 = v5;
  v14 = v9;
  int v10 = [v7 executeWithError:&v17 usingBlock:v13];
  id v11 = v17;

  if (v10)
  {
    [(AMSSQLiteStatement *)self->_statement reset];
  }
  else
  {
    char v12 = 0;
    (*((void (**)(id, void, id, char *))v8 + 2))(v8, 0, v11, &v12);
  }
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
}

uint64_t __40__AMSSQLiteQueryResults_firstInt64Value__block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v5 = result;
    result = [a2 int64ForColumnIndex:0];
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = result;
  }
  *a4 = 1;
  return result;
}

- (int64_t)firstInt64Value
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__AMSSQLiteQueryResults_firstInt64Value__block_invoke;
  v4[3] = &unk_1E55A69E8;
  v4[4] = &v5;
  [(AMSSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__AMSSQLiteQueryResults_hasRows__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  *a4 = 1;
  return result;
}

- (BOOL)hasRows
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__AMSSQLiteQueryResults_hasRows__block_invoke;
  v4[3] = &unk_1E55A69E8;
  v4[4] = &v5;
  [(AMSSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSNumber)firstNumberValue
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__64;
  objc_super v9 = __Block_byref_object_dispose__64;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AMSSQLiteQueryResults_firstNumberValue__block_invoke;
  v4[3] = &unk_1E55A69E8;
  v4[4] = &v5;
  [(AMSSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __41__AMSSQLiteQueryResults_firstNumberValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v6 = [a2 numberForColumnIndex:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  *a4 = 1;
}

- (void)bindArray:(id)a3 atPosition:(int)a4
{
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindDate:(id)a3 atPosition:(int)a4
{
}

- (void)bindDictionary:(id)a3 atPosition:(int)a4
{
}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
}

- (void)bindNullAtPosition:(int)a3
{
}

- (void)bindNullableString:(id)a3 atPosition:(int)a4
{
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
}

- (int)clearBindings
{
  return [(AMSSQLiteStatement *)self->_statement clearBindings];
}

@end