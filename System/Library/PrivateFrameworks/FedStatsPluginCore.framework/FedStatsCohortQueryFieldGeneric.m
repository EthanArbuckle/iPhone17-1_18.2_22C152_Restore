@interface FedStatsCohortQueryFieldGeneric
+ (id)cohortInstance;
+ (id)cohortQueryFieldWithKey:(id)a3;
- (NSString)cohortName;
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
- (id)initQueryFieldWithKey:(id)a3;
@end

@implementation FedStatsCohortQueryFieldGeneric

- (id)initQueryFieldWithKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCohortQueryFieldGeneric;
  v6 = [(FedStatsCohortQueryFieldGeneric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cohortName, a3);
  }

  return v7;
}

+ (id)cohortQueryFieldWithKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)[objc_alloc((Class)a1) initQueryFieldWithKey:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  id v6 = a3;
  v7 = [(FedStatsCohortQueryFieldGeneric *)self cohortName];
  v8 = [v6 objectForKey:v7];

  if (v8)
  {
    objc_super v9 = [NSString stringWithFormat:@"%@", v8];
  }
  else
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x263F3C0E0];
      v11 = NSString;
      v12 = [(FedStatsCohortQueryFieldGeneric *)self cohortName];
      v13 = [v11 stringWithFormat:@"The data should have a value for key \"%@\"", v12];
      *a4 = [v10 errorWithCode:100 description:v13];
    }
    objc_super v9 = &stru_27000F200;
  }

  return v9;
}

+ (id)cohortInstance
{
  return 0;
}

- (NSString)cohortName
{
  return self->_cohortName;
}

- (void).cxx_destruct
{
}

@end