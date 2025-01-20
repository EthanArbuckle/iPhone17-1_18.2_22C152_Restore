@interface BMBiomeTableStore
- (BMBiomeTableStore)initWithIdentifier:(id)a3 tableName:(id)a4;
- (BMBiomeTableStore)initWithURL:(id)a3 tableName:(id)a4 identifier:(id)a5;
- (BMTableStore)tableStore;
- (NSString)identifier;
- (NSString)tableName;
- (id)select:(id)a3;
- (id)selectTableNamed:(id)a3;
- (void)setTableStore:(id)a3;
@end

@implementation BMBiomeTableStore

- (BMBiomeTableStore)initWithURL:(id)a3 tableName:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BMBiomeTableStore;
  v12 = [(BMBiomeTableStore *)&v22 init];
  if (v12)
  {
    if (v10)
    {
      if (v9)
      {
LABEL_4:
        uint64_t v13 = [v11 copy];
        identifier = v12->_identifier;
        v12->_identifier = (NSString *)v13;

        uint64_t v15 = [v10 copy];
        tableName = v12->_tableName;
        v12->_tableName = (NSString *)v15;

        uint64_t v17 = [objc_alloc(MEMORY[0x1E4F4FAA8]) initWithURL:v9];
        tableStore = v12->_tableStore;
        v12->_tableStore = (BMTableStore *)v17;

        goto LABEL_5;
      }
    }
    else
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v12, @"BMBiomeTableStore.m", 25, @"Invalid parameter not satisfying: %@", @"tableName" object file lineNumber description];

      if (v9) {
        goto LABEL_4;
      }
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, v12, @"BMBiomeTableStore.m", 26, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (BMBiomeTableStore)initWithIdentifier:(id)a3 tableName:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F4FAB8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 directoryForPrivateTable];
  id v10 = [MEMORY[0x1E4F4FAB8] privateDBPathWithIdentifier:v8 directory:v9 create:1];
  id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  v12 = [(BMBiomeTableStore *)self initWithURL:v11 tableName:v7 identifier:v8];

  return v12;
}

- (id)select:(id)a3
{
  id v4 = a3;
  v5 = [(BMBiomeTableStore *)self tableName];
  v6 = [(BMBiomeTableStore *)self selectTableNamed:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F4FA90]);
  id v8 = (void *)[v7 initWithChildren:MEMORY[0x1E4F1CBF0] columnNames:v4];

  id v9 = [v8 queryTable:v6];

  return v9;
}

- (id)selectTableNamed:(id)a3
{
  id v4 = a3;
  v5 = [(BMBiomeTableStore *)self tableStore];
  v6 = [v5 selectTableNamed:v4 error:0];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BMTableStore)tableStore
{
  return self->_tableStore;
}

- (void)setTableStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableStore, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end