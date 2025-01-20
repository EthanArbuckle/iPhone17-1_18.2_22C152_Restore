@interface ASCPair
- (ASCPair)initWithFirst:(id)a3 second:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)first;
- (id)second;
- (unint64_t)hash;
@end

@implementation ASCPair

- (ASCPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASCPair;
  v9 = [(ASCPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(ASCPair *)self first];
  id v7 = [v6 copyWithZone:a3];
  id v8 = [(ASCPair *)self second];
  id v9 = [v8 copyWithZone:a3];
  id v10 = [v5 initWithFirst:v7 second:v9];

  return v10;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(ASCHasher);
  v4 = [(ASCPair *)self first];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCPair *)self second];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(ASCPair *)self first];
    uint64_t v9 = [v7 first];
    id v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      v11 = [(ASCPair *)self second];
      uint64_t v12 = [v7 second];
      v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v14 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    unsigned __int8 v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  v3 = [(ASCPair *)self first];
  id v4 = [(ASCPair *)self second];
  id v5 = +[NSString stringWithFormat:@"(%@, %@)", v3, v4];

  return v5;
}

- (id)first
{
  return self->_first;
}

- (id)second
{
  return self->_second;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);

  objc_storeStrong(&self->_first, 0);
}

@end