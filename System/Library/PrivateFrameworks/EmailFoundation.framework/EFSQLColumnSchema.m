@interface EFSQLColumnSchema
+ (id)blobColumnWithName:(id)a3 nullable:(BOOL)a4;
+ (id)integerColumnWithName:(id)a3 nullable:(BOOL)a4;
+ (id)integerColumnWithName:(id)a3 nullable:(BOOL)a4 defaultValue:(id)a5;
+ (id)realColumnWithName:(id)a3 nullable:(BOOL)a4;
+ (id)realColumnWithName:(id)a3 nullable:(BOOL)a4 defaultValue:(id)a5;
+ (id)stringForColumnType:(unint64_t)a3;
+ (id)textColumnWithName:(id)a3 collation:(unint64_t)a4 nullable:(BOOL)a5;
+ (id)textColumnWithName:(id)a3 collation:(unint64_t)a4 nullable:(BOOL)a5 defaultValue:(id)a6;
+ (unint64_t)columnTypeForString:(id)a3;
- (BOOL)isAutoincrementing;
- (BOOL)isPrimaryKey;
- (BOOL)nullable;
- (EFSQLColumnExpression)columnExpression;
- (EFSQLColumnExpression)columnExpressionWithFullName;
- (EFSQLColumnSchema)initWithName:(id)a3 isPrimaryKey:(BOOL)a4 isAutoincrementing:(BOOL)a5 type:(unint64_t)a6 collation:(unint64_t)a7 nullable:(BOOL)a8 defaultValue:(id)a9;
- (EFSQLColumnSchema)initWithName:(id)a3 type:(unint64_t)a4 collation:(unint64_t)a5 nullable:(BOOL)a6 defaultValue:(id)a7;
- (EFSQLTableSchema)associatedTable;
- (EFSQLTableSchema)foreignKeyTarget;
- (EFSQLTableSchema)table;
- (NSString)definition;
- (NSString)foreignKeyTargetString;
- (NSString)name;
- (id)_stringForForeignKeyAction:(unint64_t)a3;
- (id)debugDescription;
- (id)defaultValue;
- (id)description;
- (id)fullNameWithDatabaseName:(id)a3;
- (id)initRowIDWithAlias:(id)a3 isAutoincrementing:(BOOL)a4;
- (unint64_t)collation;
- (unint64_t)foreignKeyDeleteAction;
- (unint64_t)foreignKeyUpdateAction;
- (unint64_t)type;
- (void)associateWithTable:(id)a3;
- (void)setAsForeignKeyForString:(id)a3 onDelete:(unint64_t)a4 onUpdate:(unint64_t)a5;
- (void)setAsForeignKeyForTable:(id)a3 onDelete:(unint64_t)a4 onUpdate:(unint64_t)a5;
- (void)setAssociatedTable:(id)a3;
- (void)setForeignKeyDeleteAction:(unint64_t)a3;
- (void)setForeignKeyTarget:(id)a3;
- (void)setForeignKeyTargetString:(id)a3;
- (void)setForeignKeyUpdateAction:(unint64_t)a3;
- (void)setTable:(id)a3;
@end

@implementation EFSQLColumnSchema

- (EFSQLTableSchema)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  return (EFSQLTableSchema *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (EFSQLColumnExpression)columnExpressionWithFullName
{
  v3 = [EFSQLColumnExpression alloc];
  v4 = [(EFSQLColumnSchema *)self name];
  v5 = [(EFSQLColumnSchema *)self table];
  v6 = [v5 name];
  v7 = [(EFSQLColumnExpression *)v3 initWithName:v4 table:v6];

  return v7;
}

+ (id)stringForColumnType:(unint64_t)a3
{
  if (a3 - 2 > 2) {
    return @"INTEGER";
  }
  else {
    return off_1E61230F0[a3 - 2];
  }
}

+ (unint64_t)columnTypeForString:(id)a3
{
  id v3 = a3;
  if (columnTypeForString__onceToken != -1) {
    dispatch_once(&columnTypeForString__onceToken, &__block_literal_global_30);
  }
  v4 = (void *)columnTypeForString__sColumnTypeMap;
  v5 = [v3 uppercaseString];
  v6 = [v4 objectForKeyedSubscript:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7)
  {
    if ([v3 length]) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = 4;
    }
  }

  return v7;
}

void __41__EFSQLColumnSchema_columnTypeForString___block_invoke()
{
  v0 = (void *)columnTypeForString__sColumnTypeMap;
  columnTypeForString__sColumnTypeMap = (uint64_t)&unk_1F0EC0160;
}

+ (id)integerColumnWithName:(id)a3 nullable:(BOOL)a4
{
  v4 = [a1 integerColumnWithName:a3 nullable:a4 defaultValue:0];
  return v4;
}

+ (id)integerColumnWithName:(id)a3 nullable:(BOOL)a4 defaultValue:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)[objc_alloc((Class)a1) initWithName:v8 type:1 collation:0 nullable:v6 defaultValue:v9];

  return v10;
}

+ (id)realColumnWithName:(id)a3 nullable:(BOOL)a4
{
  v4 = [a1 realColumnWithName:a3 nullable:a4 defaultValue:0];
  return v4;
}

+ (id)realColumnWithName:(id)a3 nullable:(BOOL)a4 defaultValue:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)[objc_alloc((Class)a1) initWithName:v8 type:2 collation:0 nullable:v6 defaultValue:v9];

  return v10;
}

+ (id)textColumnWithName:(id)a3 collation:(unint64_t)a4 nullable:(BOOL)a5
{
  v5 = [a1 textColumnWithName:a3 collation:a4 nullable:a5 defaultValue:0];
  return v5;
}

+ (id)textColumnWithName:(id)a3 collation:(unint64_t)a4 nullable:(BOOL)a5 defaultValue:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)[objc_alloc((Class)a1) initWithName:v10 type:3 collation:a4 nullable:v7 defaultValue:v11];

  return v12;
}

+ (id)blobColumnWithName:(id)a3 nullable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = (void *)[objc_alloc((Class)a1) initWithName:v6 type:4 collation:0 nullable:v4 defaultValue:0];

  return v7;
}

- (EFSQLColumnSchema)initWithName:(id)a3 type:(unint64_t)a4 collation:(unint64_t)a5 nullable:(BOOL)a6 defaultValue:(id)a7
{
  return [(EFSQLColumnSchema *)self initWithName:a3 isPrimaryKey:0 isAutoincrementing:0 type:a4 collation:a5 nullable:a6 defaultValue:a7];
}

- (id)initRowIDWithAlias:(id)a3 isAutoincrementing:(BOOL)a4
{
  return [(EFSQLColumnSchema *)self initWithName:a3 isPrimaryKey:1 isAutoincrementing:a4 type:1 collation:0 nullable:0 defaultValue:0];
}

- (EFSQLColumnSchema)initWithName:(id)a3 isPrimaryKey:(BOOL)a4 isAutoincrementing:(BOOL)a5 type:(unint64_t)a6 collation:(unint64_t)a7 nullable:(BOOL)a8 defaultValue:(id)a9
{
  BOOL v12 = a4;
  id v16 = a3;
  id v17 = a9;
  if (!v16 && !v12)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"EFSQLColumnSchema.m", 109, @"Invalid parameter not satisfying: %@", @"name || isPrimaryKey" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)EFSQLColumnSchema;
  v18 = [(EFSQLColumnSchema *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    if (!v16 && v12) {
      objc_storeStrong((id *)&v19->_name, @"ROWID");
    }
    v19->_isPrimaryKey = v12;
    v19->_isAutoincrementing = a5;
    v19->_type = a6;
    v19->_collation = a7;
    v19->_nullable = a8;
    objc_storeStrong(&v19->_defaultValue, a9);
  }

  return v19;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)EFSQLColumnSchema;
  BOOL v4 = [(EFSQLColumnSchema *)&v8 description];
  v5 = [(EFSQLColumnSchema *)self name];
  id v6 = (void *)[v3 initWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)definition
{
  id v3 = +[EFSQLColumnSchema stringForColumnType:[(EFSQLColumnSchema *)self type]];
  if ([v3 length])
  {
    uint64_t v4 = [@" " stringByAppendingString:v3];

    v34 = (void *)v4;
  }
  else
  {
    v34 = v3;
  }
  v5 = &stru_1F0EAE5A8;
  if ([(EFSQLColumnSchema *)self isPrimaryKey])
  {
    BOOL v6 = [(EFSQLColumnSchema *)self isAutoincrementing];
    BOOL v7 = @" PRIMARY KEY";
    if (v6) {
      BOOL v7 = @" PRIMARY KEY AUTOINCREMENT";
    }
    objc_super v8 = v7;
    id v9 = &stru_1F0EAE5A8;
    id v10 = &stru_1F0EAE5A8;
  }
  else
  {
    EFSQLStringForCollation([(EFSQLColumnSchema *)self collation]);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(__CFString *)v11 length])
    {
      uint64_t v12 = [@" " stringByAppendingString:v11];

      v5 = (__CFString *)v12;
    }
    else
    {
      v5 = v11;
    }
    BOOL v13 = [(EFSQLColumnSchema *)self nullable];
    v14 = @" NOT NULL";
    if (v13) {
      v14 = &stru_1F0EAE5A8;
    }
    id v9 = v14;
    v15 = [(EFSQLColumnSchema *)self defaultValue];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_msgSend(v15, "ef_quotedSQLEscapedString");

        v15 = (void *)v16;
      }
      id v10 = (__CFString *)[[NSString alloc] initWithFormat:@" DEFAULT %@", v15];

      objc_super v8 = &stru_1F0EAE5A8;
    }
    else
    {
      objc_super v8 = &stru_1F0EAE5A8;
      id v10 = &stru_1F0EAE5A8;
    }
  }
  id v17 = [(EFSQLColumnSchema *)self foreignKeyTargetString];
  if (v17) {
    goto LABEL_19;
  }
  v21 = [(EFSQLColumnSchema *)self foreignKeyTarget];
  if (!v21)
  {
    id v17 = 0;
LABEL_29:
    v29 = &stru_1F0EAE5A8;
    goto LABEL_30;
  }
  id v22 = [NSString alloc];
  objc_super v23 = [v21 name];
  v24 = [v21 rowIDColumn];
  v25 = [v24 name];
  id v17 = (void *)[v22 initWithFormat:@"%@(%@)", v23, v25];

  if (!v17) {
    goto LABEL_29;
  }
LABEL_19:
  if ([(EFSQLColumnSchema *)self foreignKeyDeleteAction])
  {
    id v18 = [NSString alloc];
    v19 = [(EFSQLColumnSchema *)self _stringForForeignKeyAction:[(EFSQLColumnSchema *)self foreignKeyDeleteAction]];
    v20 = (__CFString *)[v18 initWithFormat:@" ON DELETE %@", v19];
  }
  else
  {
    v20 = &stru_1F0EAE5A8;
  }
  v26 = &stru_1F0EAE5A8;
  if ([(EFSQLColumnSchema *)self foreignKeyUpdateAction])
  {
    id v27 = [NSString alloc];
    v28 = [(EFSQLColumnSchema *)self _stringForForeignKeyAction:[(EFSQLColumnSchema *)self foreignKeyUpdateAction]];
    v26 = (__CFString *)[v27 initWithFormat:@" ON UPDATE %@", v28];
  }
  v29 = (__CFString *)[[NSString alloc] initWithFormat:@" REFERENCES %@%@%@", v17, v20, v26];

LABEL_30:
  id v30 = [NSString alloc];
  v31 = [(EFSQLColumnSchema *)self name];
  v32 = (void *)[v30 initWithFormat:@"%@%@%@%@%@%@%@", v31, v34, v8, v5, v9, v10, v29];

  return (NSString *)v32;
}

- (id)_stringForForeignKeyAction:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"NO ACTION";
  }
  else {
    return off_1E6123108[a3 - 1];
  }
}

- (void)setTable:(id)a3
{
}

- (id)fullNameWithDatabaseName:(id)a3
{
  id v4 = a3;
  v5 = [(EFSQLColumnSchema *)self table];
  if (v5)
  {
    id v6 = [NSString alloc];
    BOOL v7 = [v5 fullNameWithDatabaseName:v4];
    objc_super v8 = [(EFSQLColumnSchema *)self name];
    id v9 = (void *)[v6 initWithFormat:@"%@.%@", v7, v8];
  }
  else
  {
    id v9 = [(EFSQLColumnSchema *)self name];
  }

  return v9;
}

- (void)setAsForeignKeyForTable:(id)a3 onDelete:(unint64_t)a4 onUpdate:(unint64_t)a5
{
  id v14 = a3;
  id v9 = [v14 rowIDColumn];

  if (!v9)
  {
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EFSQLColumnSchema.m", 211, @"Invalid parameter not satisfying: %@", @"table.rowIDColumn" object file lineNumber description];
  }
  id v10 = [(EFSQLColumnSchema *)self associatedTable];
  if (v10)
  {
  }
  else
  {
    id v11 = [(EFSQLColumnSchema *)self foreignKeyTargetString];

    if (!v11) {
      goto LABEL_6;
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2 object:self file:@"EFSQLColumnSchema.m" lineNumber:212 description:@"Cannot set association for table that already has a foreign key target or associated table"];

LABEL_6:
  [(EFSQLColumnSchema *)self setForeignKeyTarget:v14];
  [(EFSQLColumnSchema *)self setForeignKeyDeleteAction:a4];
  [(EFSQLColumnSchema *)self setForeignKeyUpdateAction:a5];
  [v14 addForeignKeyReference:self];
}

- (void)setAsForeignKeyForString:(id)a3 onDelete:(unint64_t)a4 onUpdate:(unint64_t)a5
{
  id v12 = a3;
  id v9 = [(EFSQLColumnSchema *)self foreignKeyTarget];
  if (v9)
  {
  }
  else
  {
    id v10 = [(EFSQLColumnSchema *)self associatedTable];

    if (!v10) {
      goto LABEL_4;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2 object:self file:@"EFSQLColumnSchema.m" lineNumber:221 description:@"Cannot set association for table that already has a foreign key target or associated table"];

LABEL_4:
  [(EFSQLColumnSchema *)self setForeignKeyTargetString:v12];
  [(EFSQLColumnSchema *)self setForeignKeyDeleteAction:a4];
  [(EFSQLColumnSchema *)self setForeignKeyUpdateAction:a5];
}

- (void)associateWithTable:(id)a3
{
  id v10 = a3;
  v5 = [v10 rowIDColumn];

  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"EFSQLColumnSchema.m", 228, @"Invalid parameter not satisfying: %@", @"table.rowIDColumn" object file lineNumber description];
  }
  id v6 = [(EFSQLColumnSchema *)self foreignKeyTarget];
  if (v6)
  {
  }
  else
  {
    BOOL v7 = [(EFSQLColumnSchema *)self foreignKeyTargetString];

    if (!v7) {
      goto LABEL_6;
    }
  }
  objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2 object:self file:@"EFSQLColumnSchema.m" lineNumber:229 description:@"Cannot set association for table that already has a foreign key target"];

LABEL_6:
  [(EFSQLColumnSchema *)self setAssociatedTable:v10];
  [v10 addAssociatedColumn:self];
}

- (EFSQLColumnExpression)columnExpression
{
  id v3 = [EFSQLColumnExpression alloc];
  id v4 = [(EFSQLColumnSchema *)self name];
  v5 = [(EFSQLColumnExpression *)v3 initWithName:v4];

  return v5;
}

- (id)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EFSQLColumnSchema *)self name];
  id v6 = [v3 stringWithFormat:@"<%@: %p> column name:%@", v4, self, v5];

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)nullable
{
  return self->_nullable;
}

- (EFSQLTableSchema)foreignKeyTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_foreignKeyTarget);
  return (EFSQLTableSchema *)WeakRetained;
}

- (void)setForeignKeyTarget:(id)a3
{
}

- (EFSQLTableSchema)associatedTable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedTable);
  return (EFSQLTableSchema *)WeakRetained;
}

- (void)setAssociatedTable:(id)a3
{
}

- (unint64_t)collation
{
  return self->_collation;
}

- (BOOL)isPrimaryKey
{
  return self->_isPrimaryKey;
}

- (BOOL)isAutoincrementing
{
  return self->_isAutoincrementing;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (NSString)foreignKeyTargetString
{
  return self->_foreignKeyTargetString;
}

- (void)setForeignKeyTargetString:(id)a3
{
}

- (unint64_t)foreignKeyDeleteAction
{
  return self->_foreignKeyDeleteAction;
}

- (void)setForeignKeyDeleteAction:(unint64_t)a3
{
  self->_foreignKeyDeleteAction = a3;
}

- (unint64_t)foreignKeyUpdateAction
{
  return self->_foreignKeyUpdateAction;
}

- (void)setForeignKeyUpdateAction:(unint64_t)a3
{
  self->_foreignKeyUpdateAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKeyTargetString, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_destroyWeak((id *)&self->_associatedTable);
  objc_destroyWeak((id *)&self->_foreignKeyTarget);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_table);
}

@end