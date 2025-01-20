@interface IMPair
+ (id)pairWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (IMPair)initWithFirst:(id)a3 second:(id)a4;
- (id)description;
- (id)first;
- (id)second;
- (unint64_t)hash;
- (void)dealloc;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation IMPair

- (id)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

- (void)dealloc
{
  id first = self->_first;
  self->_id first = 0;

  id second = self->_second;
  self->_id second = 0;

  v5.receiver = self;
  v5.super_class = (Class)IMPair;
  [(IMPair *)&v5 dealloc];
}

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id second = objc_msgSend_initWithFirst_second_(v8, v9, (uint64_t)v7, (uint64_t)v6);

  return second;
}

- (IMPair)initWithFirst:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMPair;
  id v8 = [(IMPair *)&v15 init];
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setFirst_(v8, v9, (uint64_t)v6, v10);
    objc_msgSend_setSecond_(v11, v12, (uint64_t)v7, v13);
  }

  return v11;
}

- (void)setSecond:(id)a3
{
}

- (void)setFirst:(id)a3
{
}

- (unint64_t)hash
{
  objc_super v5 = objc_msgSend_first(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_second(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v10 = objc_msgSend_first(self, v6, v7, v8);
    v14 = objc_msgSend_first(v4, v11, v12, v13);
    if (objc_msgSend_isEqual_(v10, v15, (uint64_t)v14, v16))
    {
      v20 = objc_msgSend_second(self, v17, v18, v19);
      v24 = objc_msgSend_second(v4, v21, v22, v23);
      char isEqual = objc_msgSend_isEqual_(v20, v25, (uint64_t)v24, v26);
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_first(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_second(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p first: %@, second: %@>", v14, v4, self, v8, v12);

  return v15;
}

@end