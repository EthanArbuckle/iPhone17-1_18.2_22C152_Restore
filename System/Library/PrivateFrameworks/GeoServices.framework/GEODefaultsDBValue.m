@interface GEODefaultsDBValue
+ (id)dbValue:(id)a3 type:(id)a4 value:(id)a5;
- (GEODefaultsDBCollection)parent;
- (GEODefaultsDBValue)initWithParent:(id)a3 type:(id)a4 value:(id)a5;
- (NSString)type;
- (id)value;
- (int64_t)dbId;
- (void)setDbId:(int64_t)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation GEODefaultsDBValue

- (id)value
{
  return self->_value;
}

- (int64_t)dbId
{
  return self->_dbId;
}

- (NSString)type
{
  return self->_type;
}

- (void)setValue:(id)a3
{
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_destroyWeak((id *)&self->_parent);
}

- (GEODefaultsDBValue)initWithParent:(id)a3 type:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEODefaultsDBValue;
  v11 = [(GEODefaultsDBValue *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_parent, v8);
    objc_storeStrong((id *)&v12->_type, a4);
    objc_storeStrong(&v12->_value, a5);
  }

  return v12;
}

+ (id)dbValue:(id)a3 type:(id)a4 value:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[GEODefaultsDBValue alloc] initWithParent:v9 type:v8 value:v7];

  return v10;
}

- (void)setDbId:(int64_t)a3
{
  self->_dbId = a3;
}

- (GEODefaultsDBCollection)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (GEODefaultsDBCollection *)WeakRetained;
}

@end