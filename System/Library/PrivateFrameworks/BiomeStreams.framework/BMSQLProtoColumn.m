@interface BMSQLProtoColumn
+ (id)extractValueFromProtoData:(id)a3 fieldNumber:(int64_t)a4 type:(int64_t)a5 error:(id *)a6;
+ (id)extractValueFromProtoData:(id)a3 fieldPath:(id)a4 type:(int64_t)a5 error:(id *)a6;
+ (id)extractValuesFromProtoData:(id)a3 fieldNumber:(int64_t)a4 type:(int64_t)a5 error:(id *)a6;
- (BMSQLProtoColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 fieldNumber:(int64_t)a6 protoDataType:(int64_t)a7 convertedType:(int64_t)a8;
- (BMSQLProtoColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 fieldPath:(id)a6 protoDataType:(int64_t)a7 convertedType:(int64_t)a8;
- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5;
- (NSArray)fieldPath;
- (id)description;
- (int64_t)convertedType;
- (int64_t)protoDataType;
@end

@implementation BMSQLProtoColumn

- (void).cxx_destruct
{
}

id __92__BMSQLProtoColumn_initWithName_dataType_requestOnly_fieldPath_protoDataType_convertedType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 count];
  v8 = [v6 eventBodyData];

  if (v7 == 1)
  {
    v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    v10 = +[BMSQLProtoColumn extractValueFromProtoData:fieldNumber:type:error:](BMSQLProtoColumn, "extractValueFromProtoData:fieldNumber:type:error:", v8, (int)[v9 intValue], *(void *)(a1 + 40), a3);
  }
  else
  {
    v10 = +[BMSQLProtoColumn extractValueFromProtoData:v8 fieldPath:*(void *)(a1 + 32) type:*(void *)(a1 + 40) error:a3];
  }

  v11 = +[BMEventBase convertValue:v10 toType:*(void *)(a1 + 48)];

  return v11;
}

+ (id)extractValueFromProtoData:(id)a3 fieldNumber:(int64_t)a4 type:(int64_t)a5 error:(id *)a6
{
  return +[BMPoirotSchematizerShim searchValueIn:a3 withFieldNumber:a4 typeRawValue:a5 error:a6];
}

- (BMSQLProtoColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 fieldNumber:(int64_t)a6 protoDataType:(int64_t)a7 convertedType:(int64_t)a8
{
  BOOL v11 = a5;
  v20[1] = *MEMORY[0x1E4F143B8];
  v14 = NSNumber;
  id v15 = a3;
  v16 = [v14 numberWithInteger:a6];
  v20[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18 = [(BMSQLProtoColumn *)self initWithName:v15 dataType:a4 requestOnly:v11 fieldPath:v17 protoDataType:a7 convertedType:a8];

  return v18;
}

- (BMSQLProtoColumn)initWithName:(id)a3 dataType:(int64_t)a4 requestOnly:(BOOL)a5 fieldPath:(id)a6 protoDataType:(int64_t)a7 convertedType:(int64_t)a8
{
  BOOL v11 = a5;
  id v15 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__BMSQLProtoColumn_initWithName_dataType_requestOnly_fieldPath_protoDataType_convertedType___block_invoke;
  v21[3] = &unk_1E55D73C0;
  id v16 = v15;
  id v22 = v16;
  int64_t v23 = a7;
  int64_t v24 = a8;
  v20.receiver = self;
  v20.super_class = (Class)BMSQLProtoColumn;
  v17 = [(BMSQLColumn *)&v20 initWithName:a3 dataType:a4 requestOnly:v11 extractBlock:v21];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fieldPath, a6);
    v18->_protoDataType = a7;
    v18->_convertedType = a8;
  }

  return v18;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(BMSQLColumn *)self name];
  id v6 = BMSQLDataTypeToString([(BMSQLColumn *)self dataType]);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSQLColumn requestOnly](self, "requestOnly"));
  fieldPath = self->_fieldPath;
  v9 = [NSNumber numberWithInteger:self->_protoDataType];
  v10 = [NSNumber numberWithInteger:self->_convertedType];
  BOOL v11 = (void *)[v3 initWithFormat:@"<%@ %p> name: %@, datatype: %@, request only: %@, fieldPath: %@, protoDataType: %@, convertedType: %@", v4, self, v5, v6, v7, fieldPath, v9, v10];

  return v11;
}

+ (id)extractValueFromProtoData:(id)a3 fieldPath:(id)a4 type:(int64_t)a5 error:(id *)a6
{
  return +[BMPoirotSchematizerShim searchValueIn:a3 withFieldPath:a4 typeRawValue:a5 error:a6];
}

+ (id)extractValuesFromProtoData:(id)a3 fieldNumber:(int64_t)a4 type:(int64_t)a5 error:(id *)a6
{
  return +[BMPoirotSchematizerShim searchValuesIn:a3 withFieldNumber:a4 typeRawValue:a5 error:a6];
}

- (BOOL)setSQLiteValueFromRow:(id)a3 sqliteContext:(sqlite3_context *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(BMSQLProtoColumn *)self fieldPath];
  uint64_t v10 = [v9 count];

  BOOL v11 = [v8 eventBodyData];

  v12 = [(BMSQLProtoColumn *)self fieldPath];
  v13 = v12;
  if (v10 == 1)
  {
    v14 = [v12 objectAtIndexedSubscript:0];
    +[BMPoirotSchematizerShim setSQLiteValueIn:withFieldNumber:typeRawValue:convertedTypeRawValue:sqliteContext:error:](_TtC12BiomeStreams23BMPoirotSchematizerShim, "setSQLiteValueIn:withFieldNumber:typeRawValue:convertedTypeRawValue:sqliteContext:error:", v11, (int)[v14 intValue], -[BMSQLProtoColumn protoDataType](self, "protoDataType"), -[BMSQLProtoColumn convertedType](self, "convertedType"), a4, a5);
  }
  else
  {
    +[BMPoirotSchematizerShim setSQLiteValueIn:v11 withFieldPath:v12 typeRawValue:[(BMSQLProtoColumn *)self protoDataType] convertedTypeRawValue:[(BMSQLProtoColumn *)self convertedType] sqliteContext:a4 error:a5];
  }

  return *a5 == 0;
}

- (NSArray)fieldPath
{
  return self->_fieldPath;
}

- (int64_t)protoDataType
{
  return self->_protoDataType;
}

- (int64_t)convertedType
{
  return self->_convertedType;
}

@end