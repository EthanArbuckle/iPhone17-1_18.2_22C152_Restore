@interface _DPNumericDataRecorder
- (BOOL)record:(id)a3;
- (BOOL)record:(id)a3 metadata:(id)a4;
- (BOOL)recordNumbersVectors:(id)a3;
- (BOOL)recordNumbersVectors:(id)a3 metadata:(id)a4;
- (_DPDataRecorder)recorder;
- (_DPNumericDataRecorder)init;
- (_DPNumericDataRecorder)initWithKey:(id)a3;
- (_DPNumericDataRecorder)initWithKey:(id)a3 databaseDirectoryPath:(id)a4 readOnly:(BOOL)a5;
- (id)description;
@end

@implementation _DPNumericDataRecorder

- (_DPNumericDataRecorder)init
{
  return 0;
}

- (_DPNumericDataRecorder)initWithKey:(id)a3
{
  return [(_DPNumericDataRecorder *)self initWithKey:a3 databaseDirectoryPath:0 readOnly:0];
}

- (BOOL)record:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E019F810]();
  [(_DPDataRecorder *)self->_recorder recordNumbers:v4];

  return 1;
}

- (BOOL)record:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E019F810]();
  [(_DPDataRecorder *)self->_recorder recordNumbers:v6 metadata:v7];

  return 1;
}

- (BOOL)recordNumbersVectors:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E019F810]();
  [(_DPDataRecorder *)self->_recorder recordNumbersVectors:v4];

  return 1;
}

- (BOOL)recordNumbersVectors:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E019F810]();
  [(_DPDataRecorder *)self->_recorder recordNumbersVectors:v6 metadata:v7];

  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@: { recorder=%@ }", v5, self->_recorder];

  return v6;
}

- (_DPNumericDataRecorder)initWithKey:(id)a3 databaseDirectoryPath:(id)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_DPNumericDataRecorder;
  v10 = [(_DPNumericDataRecorder *)&v16 init];
  if (v10)
  {
    if (v9)
    {
      v11 = +[_DPStorage storageWithDirectory:v9 readOnly:v5];
      v12 = [[_DPDatabaseRecorder alloc] initWithKey:v8 storage:v11];
      recorder = v10->_recorder;
      v10->_recorder = &v12->super;
    }
    else
    {
      v14 = [[_DPXPCRecorder alloc] initWithKey:v8];
      v11 = v10->_recorder;
      v10->_recorder = &v14->super;
    }
  }
  return v10;
}

- (_DPDataRecorder)recorder
{
  return self->_recorder;
}

- (void).cxx_destruct
{
}

@end