@interface AVKeyValueChange
- (AVKeyValueChange)initWithValue:(id)a3 oldValue:(id)a4 keyPath:(id)a5 observationToken:(id)a6;
- (NSString)keyPath;
- (id)observationToken;
- (id)oldValue;
- (id)value;
@end

@implementation AVKeyValueChange

- (AVKeyValueChange)initWithValue:(id)a3 oldValue:(id)a4 keyPath:(id)a5 observationToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)AVKeyValueChange;
  v14 = [(AVKeyValueChange *)&v24 init];
  if (v14)
  {
    id v15 = [MEMORY[0x1E4F1CA98] null];
    if (v15 == v10) {
      v16 = 0;
    }
    else {
      v16 = v10;
    }
    objc_storeStrong(&v14->_value, v16);

    id v17 = [MEMORY[0x1E4F1CA98] null];
    if (v17 == v11) {
      v18 = 0;
    }
    else {
      v18 = v11;
    }
    objc_storeStrong(&v14->_oldValue, v18);

    uint64_t v19 = [v12 copy];
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    id observationToken = v14->_observationToken;
    v14->_id observationToken = (id)v21;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_oldValue, 0);

  objc_storeStrong(&self->_value, 0);
}

- (id)observationToken
{
  return self->_observationToken;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)oldValue
{
  return self->_oldValue;
}

- (id)value
{
  return self->_value;
}

@end