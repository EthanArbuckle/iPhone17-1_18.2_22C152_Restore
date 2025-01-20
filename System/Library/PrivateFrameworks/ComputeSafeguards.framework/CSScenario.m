@interface CSScenario
- (BOOL)isEqual:(id)a3;
- (CSScenario)initWithIdentifier:(id)a3 andCriteria:(id)a4;
- (NSDictionary)scenarioCriteria;
- (NSString)identifier;
- (id)description;
@end

@implementation CSScenario

- (CSScenario)initWithIdentifier:(id)a3 andCriteria:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSScenario;
  v9 = [(CSScenario *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_scenarioCriteria, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CSScenario *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if ([(CSScenario *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    identifier = self->_identifier;
    id v7 = [(CSScenario *)v5 identifier];
    if ([(NSString *)identifier isEqualToString:v7])
    {
      scenarioCriteria = self->_scenarioCriteria;
      v9 = [(CSScenario *)v5 scenarioCriteria];
      char v10 = [(NSDictionary *)scenarioCriteria isEqualToDictionary:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CSScenario: %@, %@", self->_identifier, self->_scenarioCriteria];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)scenarioCriteria
{
  return self->_scenarioCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenarioCriteria, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end