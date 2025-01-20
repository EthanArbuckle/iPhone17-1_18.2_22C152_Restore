@interface EMTMeaningDescription
- (BOOL)isEqual:(id)a3;
- (EMTMeaningDescription)initWithDefinition:(id)a3;
- (NSString)definition;
@end

@implementation EMTMeaningDescription

- (EMTMeaningDescription)initWithDefinition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMTMeaningDescription;
  v6 = [(EMTMeaningDescription *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_definition, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    definition = self->_definition;
    v6 = [v4 definition];
    char v7 = [(NSString *)definition isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
}

@end