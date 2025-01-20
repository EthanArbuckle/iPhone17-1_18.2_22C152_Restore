@interface FedStatsCategoricalTypeDenyList
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (BOOL)isInDenyList:(id)a3;
- (BOOL)partialMatch;
- (FedStatsCategoricalTypeDenyList)initWithDenyListDB:(id)a3 partialMatch:(BOOL)a4;
- (FedStatsSQLiteDenyListDatabase)denyListDB;
- (id)filter:(id)a3;
@end

@implementation FedStatsCategoricalTypeDenyList

- (FedStatsCategoricalTypeDenyList)initWithDenyListDB:(id)a3 partialMatch:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FedStatsCategoricalTypeDenyList;
  v8 = [(FedStatsCategoricalTypeDenyList *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_denyListDB, a3);
    v9->_partialMatch = a4;
  }

  return v9;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKey:@"fileName"];
  v8 = [v6 objectForKey:@"tableName"];
  v9 = [v6 objectForKey:@"columnName"];
  id v16 = 0;
  v10 = +[FedStatsSQLiteDenyListDatabase databaseWithFileURL:v7 tableName:v8 columnName:v9 error:&v16];
  id v11 = v16;
  if (v10)
  {
    v12 = [v6 objectForKey:@"partialMatch"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v13 = [NSNumber numberWithBool:0];

      v12 = (void *)v13;
    }
    v14 = objc_msgSend(objc_alloc((Class)a1), "initWithDenyListDB:partialMatch:", v10, objc_msgSend(v12, "BOOLValue"));
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:101 underlyingError:v11 description:@"The URL cannot be loaded as a database"];
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isInDenyList:(id)a3
{
  id v4 = a3;
  v5 = [(FedStatsCategoricalTypeDenyList *)self denyListDB];
  LOBYTE(self) = objc_msgSend(v5, "isInDenyList:partialMatch:", v4, -[FedStatsCategoricalTypeDenyList partialMatch](self, "partialMatch"));

  return (char)self;
}

- (id)filter:(id)a3
{
  if (a3)
  {
    id v4 = NSString;
    id v5 = a3;
    id v6 = [v4 stringWithFormat:@"%@", v5];
    if ([(FedStatsCategoricalTypeDenyList *)self isInDenyList:v6]) {
      id v7 = 0;
    }
    else {
      id v7 = v5;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return +[FedStatsCategoricalTypeAssetSpecifier mutateParameters:a3 forKey:@"fileName" usingFieldValues:a4 assetURLs:a5 requiredFields:a6 assetNames:a7 error:a8];
}

- (FedStatsSQLiteDenyListDatabase)denyListDB
{
  return self->_denyListDB;
}

- (BOOL)partialMatch
{
  return self->_partialMatch;
}

- (void).cxx_destruct
{
}

@end