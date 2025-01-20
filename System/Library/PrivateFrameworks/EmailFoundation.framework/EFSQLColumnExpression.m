@interface EFSQLColumnExpression
+ (id)allColumns;
+ (id)column:(id)a3;
+ (id)table:(id)a3 column:(id)a4;
- (BOOL)isEqual:(id)a3;
- (EFSQLColumnExpression)initWithName:(id)a3;
- (EFSQLColumnExpression)initWithName:(id)a3 table:(id)a4;
- (EFSQLDisqualifiedColumnExpression)disqualified;
- (NSString)ef_SQLExpression;
- (NSString)name;
- (NSString)tableName;
- (id)beginsWith:(id)a3 caseSensitive:(BOOL)a4;
- (id)between:(id)a3;
- (id)cachedSelf;
- (id)concatenate:(id)a3;
- (id)contains:(id)a3 caseSensitive:(BOOL)a4;
- (id)doesNotContain:(id)a3 caseSensitive:(BOOL)a4;
- (id)doesNotMatchMask:(id)a3;
- (id)endsWith:(id)a3 caseSensitive:(BOOL)a4;
- (id)equalTo:(id)a3;
- (id)expressionForPredicateOperatorType:(unint64_t)a3 constantValue:(id)a4;
- (id)glob:(id)a3;
- (id)greaterThan:(id)a3;
- (id)greaterThanEqualTo:(id)a3;
- (id)in:(id)a3;
- (id)is:(id)a3;
- (id)isNot:(id)a3;
- (id)isNotNull;
- (id)isNull;
- (id)lessThan:(id)a3;
- (id)lessThanEqualTo:(id)a3;
- (id)like:(id)a3;
- (id)like:(id)a3 patternType:(unint64_t)a4;
- (id)matchesMask:(id)a3;
- (id)minus:(id)a3;
- (id)notBetween:(id)a3;
- (id)notEqualTo:(id)a3;
- (id)notGlob:(id)a3;
- (id)notIn:(id)a3;
- (id)notLike:(id)a3;
- (id)notLike:(id)a3 patternType:(unint64_t)a4;
- (id)plus:(id)a3;
- (unint64_t)hash;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation EFSQLColumnExpression

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)equalTo:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA98] null];

  v6 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  if (v5 == v4) {
    v7 = {;
  }
    uint64_t v8 = [(EFSQLBinaryExpression *)v6 initWithLeft:self operator:12 right:v7];
  }
  else {
    v7 = {;
  }
    uint64_t v8 = [(EFSQLBinaryExpression *)v6 initWithLeft:self operator:0 right:v7];
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)table:(id)a3 column:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 table:v6];

  return v8;
}

- (EFSQLColumnExpression)initWithName:(id)a3 table:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLColumnExpression;
  v9 = [(EFSQLColumnExpression *)&v14 init];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_tableName, a4);
  }
  v12 = [(EFSQLColumnExpression *)v11 cachedSelf];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EFSQLColumnExpression *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if ([(EFSQLColumnExpression *)v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    id v6 = [(EFSQLColumnExpression *)self name];
    id v7 = [(EFSQLColumnExpression *)v5 name];
    if ([v6 isEqualToString:v7])
    {
      id v8 = [(EFSQLColumnExpression *)self tableName];
      v9 = [(EFSQLColumnExpression *)v5 tableName];
      char v10 = EFObjectsAreEqual(v8, v9);
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v3 = [(EFSQLColumnExpression *)self name];
  uint64_t v4 = [v3 hash];

  id v5 = [(EFSQLColumnExpression *)self tableName];
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken != -1) {
    dispatch_once(&cachedSelf_onceToken, &__block_literal_global_29);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock);
  return v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  if (self->_tableName) {
    [v4 appendFormat:@"%@.", self->_tableName];
  }
  [v4 appendString:self->_name];
}

- (id)isNotNull
{
  v3 = [MEMORY[0x1E4F1CA98] null];
  id v4 = [(EFSQLColumnExpression *)self isNot:v3];

  return v4;
}

- (id)isNot:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  unint64_t v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:13 right:v6];

  return v7;
}

- (id)lessThan:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  unint64_t v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:4 right:v6];

  return v7;
}

- (id)expressionForPredicateOperatorType:(unint64_t)a3 constantValue:(id)a4
{
  id v8 = a4;
  switch(a3)
  {
    case 0uLL:
      uint64_t v9 = [(EFSQLColumnExpression *)self lessThan:v8];
      goto LABEL_30;
    case 1uLL:
      uint64_t v9 = [(EFSQLColumnExpression *)self lessThanEqualTo:v8];
      goto LABEL_30;
    case 2uLL:
      uint64_t v9 = [(EFSQLColumnExpression *)self greaterThan:v8];
      goto LABEL_30;
    case 3uLL:
      uint64_t v9 = [(EFSQLColumnExpression *)self greaterThanEqualTo:v8];
      goto LABEL_30;
    case 4uLL:
      uint64_t v9 = [(EFSQLColumnExpression *)self equalTo:v8];
      goto LABEL_30;
    case 5uLL:
      uint64_t v9 = [(EFSQLColumnExpression *)self notEqualTo:v8];
      goto LABEL_30;
    case 6uLL:
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"EFSQLObjectPropertyMapper.m" lineNumber:175 description:@"NSMatchesPredicateOperatorType currently has no EFSQLExpressable counterpart"];
      goto LABEL_24;
    case 7uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"EFSQLObjectPropertyMapper.m" lineNumber:178 description:@"constantValue must be of class NSString"];
      }
      uint64_t v9 = [(EFSQLColumnExpression *)self like:v8];
      goto LABEL_30;
    case 8uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:self file:@"EFSQLObjectPropertyMapper.m" lineNumber:181 description:@"constantValue must be of class NSString"];
      }
      uint64_t v9 = [(EFSQLColumnExpression *)self beginsWith:v8 caseSensitive:0];
      goto LABEL_30;
    case 9uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:a2 object:self file:@"EFSQLObjectPropertyMapper.m" lineNumber:184 description:@"constantValue must be of class NSString"];
      }
      uint64_t v9 = [(EFSQLColumnExpression *)self endsWith:v8 caseSensitive:0];
      goto LABEL_30;
    case 0xAuLL:
      uint64_t v9 = [(EFSQLColumnExpression *)self in:v8];
      goto LABEL_30;
    case 0xBuLL:
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"EFSQLObjectPropertyMapper.m" lineNumber:189 description:@"NSCustomSelectorPredicateOperatorType currently has no EFSQLExpressable counterpart"];
LABEL_24:
      id v4 = 0;
      goto LABEL_25;
    default:
      if (a3 == 99)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"EFSQLObjectPropertyMapper.m" lineNumber:192 description:@"constantValue must be of class NSString"];
        }
        uint64_t v9 = [(EFSQLColumnExpression *)self contains:v8 caseSensitive:0];
LABEL_30:
        id v4 = (void *)v9;
      }
      else if (a3 == 100)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2 object:self file:@"EFSQLObjectPropertyMapper.m" lineNumber:195 description:@"constantValue must be of class NSArray"];
        }
        char v10 = [v8 objectAtIndexedSubscript:0];
        v11 = [v8 objectAtIndexedSubscript:1];
        v12 = +[EFPair pairWithFirst:v10 second:v11];
        id v4 = [(EFSQLColumnExpression *)self between:v12];

LABEL_25:
      }

      return v4;
  }
}

- (id)greaterThan:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  unint64_t v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:2 right:v6];

  return v7;
}

- (id)notEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA98] null];

  unint64_t v6 = [EFSQLBinaryExpression alloc];
  objc_msgSend(v4, "ef_SQLIsolatedExpression");
  if (v5 == v4) {
    id v7 = {;
  }
    uint64_t v8 = [(EFSQLBinaryExpression *)v6 initWithLeft:self operator:13 right:v7];
  }
  else {
    id v7 = {;
  }
    uint64_t v8 = [(EFSQLBinaryExpression *)v6 initWithLeft:self operator:1 right:v7];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

+ (id)column:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithName:v4];

  return v5;
}

- (EFSQLColumnExpression)initWithName:(id)a3
{
  return [(EFSQLColumnExpression *)self initWithName:a3 table:0];
}

- (id)in:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  unint64_t v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:10 right:v6];

  return v7;
}

void __48__EFSQLColumnExpression_EFCacheable__cachedSelf__block_invoke()
{
  cachedSelf_sTableLock = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs;
  cachedSelf_sUniqueObjectIDs = v0;
}

+ (id)allColumns
{
  return (id)[a1 column:@"*"];
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLColumnExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (EFSQLDisqualifiedColumnExpression)disqualified
{
  v3 = [EFSQLDisqualifiedColumnExpression alloc];
  id v4 = [(EFSQLColumnExpression *)self name];
  id v5 = [(EFSQLColumnExpression *)self tableName];
  unint64_t v6 = [(EFSQLColumnExpression *)v3 initWithName:v4 table:v5];

  return v6;
}

- (id)greaterThanEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  unint64_t v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:3 right:v6];

  return v7;
}

- (id)lessThanEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  unint64_t v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:5 right:v6];

  return v7;
}

- (id)like:(id)a3
{
  id v4 = a3;
  id v5 = [[EFSQLLikeEscapedExpression alloc] initWithValue:v4];
  unint64_t v6 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:6 right:v5];

  return v6;
}

- (id)like:(id)a3 patternType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[EFSQLLikeEscapedExpression alloc] initWithValue:v6 pattern:a4];
  uint64_t v8 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:6 right:v7];

  return v8;
}

- (id)notLike:(id)a3
{
  id v4 = a3;
  id v5 = [[EFSQLLikeEscapedExpression alloc] initWithValue:v4];
  id v6 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:7 right:v5];

  return v6;
}

- (id)notLike:(id)a3 patternType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[EFSQLLikeEscapedExpression alloc] initWithValue:v6 pattern:a4];
  uint64_t v8 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:7 right:v7];

  return v8;
}

- (id)glob:(id)a3
{
  id v4 = a3;
  id v5 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:8 right:v4];

  return v5;
}

- (id)notGlob:(id)a3
{
  id v4 = a3;
  id v5 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:9 right:v4];

  return v5;
}

- (id)beginsWith:(id)a3 caseSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [NSString stringWithFormat:@"%@*", v6];
    uint64_t v8 = [(EFSQLColumnExpression *)self glob:v7];
  }
  else
  {
    uint64_t v8 = [(EFSQLColumnExpression *)self like:v6 patternType:0];
  }

  return v8;
}

- (id)contains:(id)a3 caseSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [NSString stringWithFormat:@"*%@*", v6];
    uint64_t v8 = [(EFSQLColumnExpression *)self glob:v7];
  }
  else
  {
    uint64_t v8 = [(EFSQLColumnExpression *)self like:v6 patternType:1];
  }

  return v8;
}

- (id)doesNotContain:(id)a3 caseSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [NSString stringWithFormat:@"*%@*", v6];
    uint64_t v8 = [(EFSQLColumnExpression *)self notGlob:v7];
  }
  else
  {
    uint64_t v8 = [(EFSQLColumnExpression *)self notLike:v6 patternType:1];
  }

  return v8;
}

- (id)endsWith:(id)a3 caseSensitive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [NSString stringWithFormat:@"*%@", v6];
    uint64_t v8 = [(EFSQLColumnExpression *)self glob:v7];
  }
  else
  {
    uint64_t v8 = [(EFSQLColumnExpression *)self like:v6 patternType:2];
  }

  return v8;
}

- (id)notIn:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  id v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:11 right:v6];

  return v7;
}

- (id)between:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBetweenExpression alloc];
  id v6 = [v4 first];
  id v7 = objc_msgSend(v6, "ef_SQLIsolatedExpression");
  uint64_t v8 = [v4 second];
  uint64_t v9 = objc_msgSend(v8, "ef_SQLIsolatedExpression");
  char v10 = [(EFSQLBetweenExpression *)v5 initWithLeft:self firstValue:v7 secondValue:v9 between:1];

  return v10;
}

- (id)notBetween:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBetweenExpression alloc];
  id v6 = [v4 first];
  id v7 = objc_msgSend(v6, "ef_SQLIsolatedExpression");
  uint64_t v8 = [v4 second];
  uint64_t v9 = objc_msgSend(v8, "ef_SQLIsolatedExpression");
  char v10 = [(EFSQLBetweenExpression *)v5 initWithLeft:self firstValue:v7 secondValue:v9 between:0];

  return v10;
}

- (id)is:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  id v6 = objc_msgSend(v4, "ef_SQLIsolatedExpression");
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:self operator:12 right:v6];

  return v7;
}

- (id)isNull
{
  v3 = [MEMORY[0x1E4F1CA98] null];
  id v4 = [(EFSQLColumnExpression *)self is:v3];

  return v4;
}

- (id)plus:(id)a3
{
  id v4 = a3;
  id v5 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:14 right:v4];

  return v5;
}

- (id)minus:(id)a3
{
  id v4 = a3;
  id v5 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:15 right:v4];

  return v5;
}

- (id)concatenate:(id)a3
{
  id v4 = a3;
  id v5 = [[EFSQLBinaryExpression alloc] initWithLeft:self operator:16 right:v4];

  return v5;
}

- (id)matchesMask:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  id v6 = +[EFSQLBitExpression and:self with:v4];
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:v6 operator:0 right:v4];

  return v7;
}

- (id)doesNotMatchMask:(id)a3
{
  id v4 = a3;
  id v5 = [EFSQLBinaryExpression alloc];
  id v6 = +[EFSQLBitExpression and:self with:v4];
  id v7 = [(EFSQLBinaryExpression *)v5 initWithLeft:v6 operator:0 right:&unk_1F0EC00E8];

  return v7;
}

@end