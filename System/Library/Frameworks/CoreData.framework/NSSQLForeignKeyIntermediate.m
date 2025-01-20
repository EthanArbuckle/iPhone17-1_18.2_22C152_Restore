@interface NSSQLForeignKeyIntermediate
- (NSSQLForeignKeyIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
@end

@implementation NSSQLForeignKeyIntermediate

- (NSSQLForeignKeyIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLForeignKeyIntermediate;
  return [(NSSQLConstantValueIntermediate *)&v5 initWithConstantValue:a3 inScope:a4 context:0];
}

- (id)generateSQLStringInContext:(id)a3
{
  id constantValue = self->super._constantValue;
  if ((id)[MEMORY[0x1E4F1CA98] null] == constantValue) {
    v6 = 0;
  }
  else {
    v6 = constantValue;
  }
  if (!v6) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id constantValue = (id)[v6 objectID];
    if (constantValue) {
      goto LABEL_7;
    }
LABEL_11:
    unsigned int v8 = -[NSSQLiteAdapter sqlTypeForExpressionConstantValue:](objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"persistentStore"), "adapter"), v6);
    if (v8 == 1) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8;
    }
    if ([(NSSQLIntermediate *)self isTargetColumnsScoped]) {
      v10 = @"selectBindVars";
    }
    else {
      v10 = @"bindVars";
    }
    v11 = (void *)[a3 objectForKey:v10];
    v12 = [[NSSQLBindVariable alloc] initWithValue:v6 sqlType:v9 propertyDescription:0];
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  if (([constantValue isTemporaryID] & 1) != 0
    || (uint64_t v7 = [constantValue persistentStore],
        v7 != [a3 objectForKey:@"persistentStore"]))
  {
    -[NSSQLConstantValueIntermediate _addBindVarForConstId:ofType:inContext:](self, (void *)[NSNumber numberWithLongLong:0], 2, a3);
    goto LABEL_19;
  }
  if ([(NSSQLIntermediate *)self isTargetColumnsScoped]) {
    v15 = @"selectBindVars";
  }
  else {
    v15 = @"bindVars";
  }
  v11 = (void *)[a3 objectForKey:v15];
  v12 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", [constantValue _referenceData64], 2);
LABEL_18:
  v13 = v12;
  [v11 addObject:v12];

LABEL_19:

  return (id)[@"?" mutableCopy];
}

@end