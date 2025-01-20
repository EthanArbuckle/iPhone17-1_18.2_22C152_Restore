@interface _DPWordRecorder
- (BOOL)record:(id)a3;
- (_DPDataRecorder)recorder;
- (_DPWordRecorder)init;
- (_DPWordRecorder)initWithKey:(id)a3;
- (_DPWordRecorder)initWithKey:(id)a3 databaseDirectoryPath:(id)a4 readOnly:(BOOL)a5;
- (id)description;
- (unint64_t)wordFragmentWidth;
@end

@implementation _DPWordRecorder

- (_DPWordRecorder)init
{
  return 0;
}

- (_DPWordRecorder)initWithKey:(id)a3
{
  return [(_DPWordRecorder *)self initWithKey:a3 databaseDirectoryPath:0 readOnly:0];
}

- (BOOL)record:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E019F810]();
  [(_DPDataRecorder *)self->_recorder recordWords:v4];

  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: { recorder=%@ }", v5, self->_recorder];

  return v6;
}

- (_DPWordRecorder)initWithKey:(id)a3 databaseDirectoryPath:(id)a4 readOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_DPWordRecorder;
  v10 = [(_DPWordRecorder *)&v16 init];
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

    v10->_wordFragmentWidth = [(_DPDataRecorder *)v10->_recorder fragmentWidth];
  }

  return v10;
}

- (unint64_t)wordFragmentWidth
{
  return self->_wordFragmentWidth;
}

- (_DPDataRecorder)recorder
{
  return self->_recorder;
}

- (void).cxx_destruct
{
}

@end