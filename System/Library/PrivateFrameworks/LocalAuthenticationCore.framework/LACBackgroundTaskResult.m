@interface LACBackgroundTaskResult
- (BOOL)isEqual:(id)a3;
- (LACBackgroundTaskResult)initWithError:(id)a3;
- (LACBackgroundTaskResult)initWithValue:(id)a3;
- (LACBackgroundTaskResult)initWithValue:(id)a3 error:(id)a4;
- (NSError)error;
- (id)description;
- (id)value;
@end

@implementation LACBackgroundTaskResult

- (NSError)error
{
  return self->_error;
}

- (id)value
{
  return self->_value;
}

- (id)description
{
  v15[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSString;
  v6 = [(LACBackgroundTaskResult *)self value];
  v7 = [v5 stringWithFormat:@"value: %@", v6];
  v15[0] = v7;
  v8 = NSString;
  v9 = [(LACBackgroundTaskResult *)self error];
  v10 = [v8 stringWithFormat:@"error: %@", v9];
  v15[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v12 = [v11 componentsJoinedByString:@"; "];
  v13 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v12];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

- (LACBackgroundTaskResult)initWithValue:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACBackgroundTaskResult;
  v9 = [(LACBackgroundTaskResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (LACBackgroundTaskResult)initWithValue:(id)a3
{
  return [(LACBackgroundTaskResult *)self initWithValue:a3 error:0];
}

- (LACBackgroundTaskResult)initWithError:(id)a3
{
  return [(LACBackgroundTaskResult *)self initWithValue:0 error:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 value];
    uint64_t v7 = [(LACBackgroundTaskResult *)self value];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      v9 = [v5 value];
      v10 = [(LACBackgroundTaskResult *)self value];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [v5 error];
    uint64_t v14 = [(LACBackgroundTaskResult *)self error];
    if (v13 == (void *)v14)
    {
      char v12 = 1;
      v15 = v13;
    }
    else
    {
      v15 = (void *)v14;
      v16 = [v5 error];
      v17 = [(LACBackgroundTaskResult *)self error];
      char v12 = [v16 isEqual:v17];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

@end