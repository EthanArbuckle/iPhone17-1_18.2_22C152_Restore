@interface HDSQLiteTrigger
- (Class)entityClass;
- (HDSQLiteTrigger)init;
- (HDSQLiteTrigger)initWithEntity:(Class)a3 name:(id)a4 triggerEvent:(int64_t)a5 predicateString:(id)a6 triggerString:(id)a7;
- (NSString)name;
- (NSString)predicateString;
- (NSString)triggerString;
- (id)creationSQL;
- (id)description;
- (id)disambiguatedName;
- (int64_t)event;
@end

@implementation HDSQLiteTrigger

- (HDSQLiteTrigger)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSQLiteTrigger)initWithEntity:(Class)a3 name:(id)a4 triggerEvent:(int64_t)a5 predicateString:(id)a6 triggerString:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HDSQLiteTrigger;
  v15 = [(HDSQLiteTrigger *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_entityClass, a3);
    uint64_t v17 = [v12 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v16->_event = a5;
    uint64_t v19 = [v13 copy];
    predicateString = v16->_predicateString;
    v16->_predicateString = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    triggerString = v16->_triggerString;
    v16->_triggerString = (NSString *)v21;
  }
  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDSQLiteTrigger *)self creationSQL];
  v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return v6;
}

- (id)creationSQL
{
  predicateString = self->_predicateString;
  if (predicateString)
  {
    uint64_t v4 = [NSString stringWithFormat:@"WHEN %@ ", predicateString];
  }
  else
  {
    uint64_t v4 = &stru_26CC1AE10;
  }
  v5 = NSString;
  v6 = [(HDSQLiteTrigger *)self disambiguatedName];
  if (self->_event)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = [NSString stringWithUTF8String:"NSString * _Nonnull NSStringFromTriggerEvent(HDSQLiteTriggerEvent)"];
    [v7 handleFailureInFunction:v8 file:@"HDSQLiteTrigger.m" lineNumber:73 description:@"Unreachable code has been executed"];

    v9 = &stru_26CC1AE10;
  }
  else
  {
    v9 = @"DELETE";
  }
  v10 = [(objc_class *)self->_entityClass databaseTable];
  objc_msgSend(v5, "stringWithFormat:", @"CREATE TRIGGER IF NOT EXISTS %@ AFTER %@ ON %@ FOR EACH ROW %@BEGIN %@; END",
    v6,
    v9,
    v10,
    v4,
  v11 = self->_triggerString);

  return v11;
}

- (id)disambiguatedName
{
  v3 = [(objc_class *)self->_entityClass databaseName];
  uint64_t v4 = NSString;
  uint64_t v5 = [(objc_class *)self->_entityClass databaseTable];
  v6 = (void *)v5;
  name = self->_name;
  if (v3) {
    [v4 stringWithFormat:@"%@.%@_%@", v3, v5, name];
  }
  else {
  v8 = [v4 stringWithFormat:@"%@_%@", v5, name, v10];
  }

  return v8;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)event
{
  return self->_event;
}

- (NSString)predicateString
{
  return self->_predicateString;
}

- (NSString)triggerString
{
  return self->_triggerString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerString, 0);
  objc_storeStrong((id *)&self->_predicateString, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityClass, 0);
}

@end