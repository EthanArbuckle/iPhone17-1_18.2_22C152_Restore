@interface IEVariable
- (BOOL)persistent;
- (IEVariable)initWithName:(id)a3 withType:(id)a4;
- (IEVariable)initWithName:(id)a3 withType:(id)a4 withValue:(id)a5;
- (NSString)name;
- (NSString)type;
- (id)value;
- (void)setName:(id)a3;
- (void)setPersistent:(BOOL)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation IEVariable

- (IEVariable)initWithName:(id)a3 withType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IEVariable;
  v9 = [(IEVariable *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_type, a4);
    id value = v10->_value;
    v10->_id value = 0;

    v10->_persistent = 0;
  }

  return v10;
}

- (IEVariable)initWithName:(id)a3 withType:(id)a4 withValue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IEVariable;
  v12 = [(IEVariable *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_type, a4);
    objc_storeStrong(&v13->_value, a5);
    v13->_persistent = 0;
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)persistent
{
  return self->_persistent;
}

- (void)setPersistent:(BOOL)a3
{
  self->_persistent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end