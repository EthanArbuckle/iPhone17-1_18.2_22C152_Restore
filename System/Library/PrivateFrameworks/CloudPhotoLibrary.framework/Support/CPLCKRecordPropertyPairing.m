@interface CPLCKRecordPropertyPairing
- (BOOL)hasCKKey:(id)a3;
- (BOOL)hasProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CPLCKRecordPropertyPairing)initWithProperties:(id)a3;
- (CPLCKRecordPropertyPairing)initWithProperty:(id)a3 andKeys:(id)a4;
- (NSArray)ckKeys;
- (NSArray)properties;
- (id)description;
- (unint64_t)hash;
- (void)addCKKeys:(id)a3;
@end

@implementation CPLCKRecordPropertyPairing

- (CPLCKRecordPropertyPairing)initWithProperties:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLCKRecordPropertyPairing;
  v5 = [(CPLCKRecordPropertyPairing *)&v11 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    properties = v5->_properties;
    v5->_properties = v6;

    v8 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    ckKeys = v5->_ckKeys;
    v5->_ckKeys = v8;
  }
  return v5;
}

- (CPLCKRecordPropertyPairing)initWithProperty:(id)a3 andKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v11 = v6;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];
  v9 = [(CPLCKRecordPropertyPairing *)self initWithProperties:v8];

  if (v9) {
    [(NSMutableArray *)v9->_ckKeys addObjectsFromArray:v7];
  }

  return v9;
}

- (void)addCKKeys:(id)a3
{
}

- (BOOL)hasProperty:(id)a3
{
  return [(NSArray *)self->_properties containsObject:a3];
}

- (BOOL)hasCKKey:(id)a3
{
  return [(NSMutableArray *)self->_ckKeys containsObject:a3];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NSArray *)self->_properties componentsJoinedByString:@", "];
  v5 = [(NSMutableArray *)self->_ckKeys componentsJoinedByString:@", "];
  id v6 = [v3 initWithFormat:@"(%@) -> (%@)", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSArray *)self->_properties hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CPLCKRecordPropertyPairing *)a3;
  if (v4 == self) {
    goto LABEL_12;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    BOOL v6 = 0;
    goto LABEL_13;
  }
  unint64_t v7 = self->_properties;
  v8 = (void *)v7;
  properties = v4->_properties;
  if (v7 && properties)
  {
    unsigned __int8 v10 = objc_msgSend((id)v7, "isEqual:");

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
LABEL_12:
    BOOL v6 = 1;
    goto LABEL_13;
  }
  unint64_t v14 = v7 | (unint64_t)properties;

  if (!v14) {
    goto LABEL_12;
  }
LABEL_7:
  unint64_t v11 = self->_ckKeys;
  v12 = v4->_ckKeys;
  unint64_t v13 = (unint64_t)v12;
  BOOL v6 = v11 && v12 && ([(id)v11 isEqual:v12] & 1) != 0 || (v11 | v13) == 0;

LABEL_13:
  return v6;
}

- (NSArray)properties
{
  return self->_properties;
}

- (NSArray)ckKeys
{
  return &self->_ckKeys->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_ckKeys, 0);
}

@end