@interface _EFSQLInsertStatementFirstValue
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation _EFSQLInsertStatementFirstValue

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  if (self) {
    bindables = self->super._bindables;
  }
  else {
    bindables = 0;
  }
  v6 = bindables;
  v7 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v4];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    if (self) {
      expressables = self->super._expressables;
    }
    else {
      expressables = 0;
    }
    id v9 = [(NSMutableDictionary *)expressables objectForKeyedSubscript:v4];
  }
  v11 = v9;

  return v11;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v16 = a3;
  id v7 = a4;
  int v8 = objc_opt_respondsToSelector();
  int v9 = objc_opt_respondsToSelector();
  char v10 = v9;
  if ((v8 | v9))
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_18:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EFSQLInsertStatement.m", 61, @"Invalid parameter not satisfying: %@", @"columnName != nil" object file lineNumber description];

    if (self) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2 object:self file:@"EFSQLInsertStatement.m" lineNumber:60 description:@"Value must conform to either EFSQLBindable or EFSQLValueExpressable"];

  if (!v7) {
    goto LABEL_18;
  }
LABEL_3:
  if (self)
  {
LABEL_4:
    requiredColumns = self->super._requiredColumns;
    goto LABEL_5;
  }
LABEL_19:
  requiredColumns = 0;
LABEL_5:
  [(NSMutableOrderedSet *)requiredColumns addObject:v7];
  if (v8)
  {
    if (self) {
      bindables = self->super._bindables;
    }
    else {
      bindables = 0;
    }
  }
  else
  {
    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
    if (self) {
      v13 = self->super._bindables;
    }
    else {
      v13 = 0;
    }
    [(NSMutableDictionary *)v13 setObject:0 forKeyedSubscript:v7];
    if (self) {
      bindables = self->super._expressables;
    }
    else {
      bindables = 0;
    }
  }
  [(NSMutableDictionary *)bindables setObject:v16 forKeyedSubscript:v7];
LABEL_14:
}

@end