@interface MTRPluginPairType
- (BOOL)isEqual:(id)a3;
- (MTRPluginPairType)initWithFirst:(id)a3 second:(id)a4;
- (id)first;
- (id)second;
- (unint64_t)hash;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation MTRPluginPairType

- (MTRPluginPairType)initWithFirst:(id)a3 second:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTRPluginPairType;
  v8 = [(MTRPluginPairType *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(MTRPluginPairType *)v8 setFirst:v6];
    [(MTRPluginPairType *)v9 setSecond:v7];
    v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MTRPluginPairType *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if ([(MTRPluginPairType *)v6 isMemberOfClass:objc_opt_class()])
    {
      id v7 = [(MTRPluginPairType *)self first];
      v8 = [(MTRPluginPairType *)v6 first];
      if (MTRPluginEqualObjects(v7, v8))
      {
        v9 = [(MTRPluginPairType *)self second];
        v10 = [(MTRPluginPairType *)v6 second];
        char v11 = MTRPluginEqualObjects(v9, v10);
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (unint64_t)hash
{
  v3 = [(MTRPluginPairType *)self first];
  uint64_t v4 = [v3 hash];
  v5 = [(MTRPluginPairType *)self second];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)first
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFirst:(id)a3
{
}

- (id)second
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setSecond:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end