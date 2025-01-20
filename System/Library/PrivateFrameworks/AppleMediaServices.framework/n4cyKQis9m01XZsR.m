@interface n4cyKQis9m01XZsR
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (id)toDictionary;
- (n4cyKQis9m01XZsR)initWithDictionary:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setLastName:(id)a3;
@end

@implementation n4cyKQis9m01XZsR

- (n4cyKQis9m01XZsR)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"_classType"];
  unsigned int v6 = [v5 isEqualToString:@"name"];

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)n4cyKQis9m01XZsR;
    v7 = [(n4cyKQis9m01XZsR *)&v13 init];
    if (v7)
    {
      v8 = [v4 objectForKey:@"firstName"];
      [(n4cyKQis9m01XZsR *)v7 setFirstName:v8];

      v9 = [v4 objectForKey:@"lastName"];
      [(n4cyKQis9m01XZsR *)v7 setLastName:v9];

      v10 = [v4 objectForKey:@"fullName"];
      [(n4cyKQis9m01XZsR *)v7 setFullName:v10];
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)toDictionary
{
  v3 = objc_opt_new();
  [v3 setObject:@"name" forKeyedSubscript:@"_classType"];
  firstName = self->_firstName;
  if (firstName) {
    [v3 setObject:firstName forKeyedSubscript:@"firstName"];
  }
  lastName = self->_lastName;
  if (lastName) {
    [v3 setObject:lastName forKeyedSubscript:@"lastName"];
  }
  fullName = self->_fullName;
  if (fullName) {
    [v3 setObject:fullName forKeyedSubscript:@"fullName"];
  }
  return v3;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end