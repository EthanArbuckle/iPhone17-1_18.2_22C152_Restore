@interface ASUSQLiteQueryResults
- (BOOL)hasRows;
- (NSNumber)firstNumberValue;
- (id)initWithStatement:(id *)a1;
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
- (void)bindNumber:(id)a3 atPosition:(int)a4;
- (void)bindString:(id)a3 atPosition:(int)a4;
- (void)bindStringCopy:(id)a3 atPosition:(int)a4;
- (void)bindURL:(id)a3 atPosition:(int)a4;
- (void)bindUUID:(id)a3 atPosition:(int)a4;
- (void)enumerateRowsUsingBlock:(id)a3;
@end

@implementation ASUSQLiteQueryResults

- (id)initWithStatement:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)ASUSQLiteQueryResults;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = -[ASUSQLiteCursor initWithStatement:]((sqlite3_stmt **)[ASUSQLiteCursor alloc], self->_statement);
  statement = self->_statement;
  if (statement)
  {
    p_connection = &statement->_connection;
    statement = (ASUSQLiteStatement *)statement->_connection;
    objc_super v7 = p_connection[1];
  }
  else
  {
    objc_super v7 = 0;
  }
  v9 = statement;
  id v19 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__ASUSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke;
  v15[3] = &unk_26522F620;
  v18 = v7;
  id v10 = v4;
  id v17 = v10;
  v11 = v5;
  v16 = v11;
  if (!v9)
  {

    id v13 = 0;
    goto LABEL_8;
  }
  int v12 = -[ASUSQLiteConnection _executeWithError:usingBlock:]((uint64_t)v9, &v19, v15);
  id v13 = v19;

  if (!v12)
  {
LABEL_8:
    char v14 = 0;
    (*((void (**)(id, void, id, char *))v10 + 2))(v10, 0, v13, &v14);
    goto LABEL_9;
  }
  [(ASUSQLiteStatement *)self->_statement reset];
LABEL_9:
}

uint64_t __49__ASUSQLiteQueryResults_enumerateRowsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = sqlite3_step(*(sqlite3_stmt **)(a1 + 48));
  if (v2 == 100) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return v2;
}

- (int64_t)firstInt64Value
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__ASUSQLiteQueryResults_firstInt64Value__block_invoke;
  v4[3] = &unk_26522F648;
  v4[4] = &v5;
  [(ASUSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__ASUSQLiteQueryResults_firstInt64Value__block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
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

- (NSNumber)firstNumberValue
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__ASUSQLiteQueryResults_firstNumberValue__block_invoke;
  v4[3] = &unk_26522F648;
  v4[4] = &v5;
  [(ASUSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSNumber *)v2;
}

void __41__ASUSQLiteQueryResults_firstNumberValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v6 = [a2 numberForColumnIndex:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  *a4 = 1;
}

- (BOOL)hasRows
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__ASUSQLiteQueryResults_hasRows__block_invoke;
  v4[3] = &unk_26522F648;
  v4[4] = &v5;
  [(ASUSQLiteQueryResults *)self enumerateRowsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __32__ASUSQLiteQueryResults_hasRows__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  *a4 = 1;
  return result;
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

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
}

- (void)bindString:(id)a3 atPosition:(int)a4
{
}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
}

- (void)bindUUID:(id)a3 atPosition:(int)a4
{
}

- (void)bindURL:(id)a3 atPosition:(int)a4
{
}

- (int)clearBindings
{
  return [(ASUSQLiteStatement *)self->_statement clearBindings];
}

- (void).cxx_destruct
{
}

@end