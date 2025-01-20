@interface AccessoryPresenceInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (NSArray)modelNumbers;
- (NSString)identifier;
- (unint64_t)timeout;
- (void)setIdentifier:(id)a3;
- (void)setModelNumbers:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation AccessoryPresenceInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  char v8 = 0;
  id v4 = a3;
  v5 = +[NSSet setWithObjects:@"USB", @"MiniJack", 0];
  v6 = [v4 dk_stringFromRequiredKey:@"identifier" inSet:v5 failed:&v8];

  [(AccessoryPresenceInputs *)self setIdentifier:v6];
  return v8 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v9 = 0;
  id v4 = a3;
  v5 = +[NSSet setWithObject:objc_opt_class()];
  v6 = [v4 dk_arrayFromKey:@"accessoryModelNumbers" types:v5 maxLength:100 defaultValue:&__NSArray0__struct failed:&v9];
  [(AccessoryPresenceInputs *)self setModelNumbers:v6];

  v7 = [v4 dk_numberFromKey:@"timeOut" lowerBound:&off_100004258 upperBound:&off_100004270 defaultValue:&off_100004258 failed:&v9];

  -[AccessoryPresenceInputs setTimeout:](self, "setTimeout:", [v7 integerValue]);
  return v9 == 0;
}

- (NSArray)modelNumbers
{
  return self->_modelNumbers;
}

- (void)setModelNumbers:(id)a3
{
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_modelNumbers, 0);
}

@end