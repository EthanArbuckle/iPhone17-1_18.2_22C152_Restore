@interface ESUserDataContactWord
- (BOOL)isEqual:(id)a3;
- (ESUserDataContactWord)initWithComponents:(id)a3 frequency:(int)a4;
- (NSDictionary)components;
- (int)frequency;
- (unint64_t)hash;
@end

@implementation ESUserDataContactWord

- (void).cxx_destruct
{
}

- (int)frequency
{
  return self->_frequency;
}

- (NSDictionary)components
{
  return self->_components;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ESUserDataContactWord *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unsigned int v6 = [(ESUserDataContactWord *)self frequency];
      if (v6 == [(ESUserDataContactWord *)v5 frequency])
      {
        v7 = [(ESUserDataContactWord *)self components];
        v8 = [(ESUserDataContactWord *)v5 components];
        unsigned __int8 v9 = [v7 isEqual:v8];
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(ESUserDataContactWord *)self components];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = v4 ^ [(ESUserDataContactWord *)self frequency];

  return v5;
}

- (ESUserDataContactWord)initWithComponents:(id)a3 frequency:(int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ESUserDataContactWord;
  id v5 = a3;
  unsigned int v6 = [(ESUserDataContactWord *)&v10 init];
  v7 = (NSDictionary *)objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  components = v6->_components;
  v6->_components = v7;

  v6->_frequency = a4;
  return v6;
}

@end