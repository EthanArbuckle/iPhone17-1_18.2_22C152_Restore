@interface XRStringPair
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)first;
- (NSString)second;
- (XRStringPair)initWithCoder:(id)a3;
- (XRStringPair)initWithFirst:(id)a3 second:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hashValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XRStringPair

- (XRStringPair)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XRStringPair;
  v9 = [(XRStringPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_first, a3);
    objc_storeStrong((id *)&v10->_second, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XRStringPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)XRStringPair;
  v5 = [(XRStringPair *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = [v4 _first];
    first = v5->_first;
    v5->_first = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = [v4 _second];
    second = v5->_second;
    v5->_second = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  first = self->_first;
  id v9 = a3;
  [v9 setObject:first forKey:@"_first"];
  [v9 setObject:self->_second forKey:@"_second"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v10 = [self v6:v7 v8:v8 v9:v9];
    v15 = [v5 v11:v12 v13:v14];
    if ([v10 isEqualToString:v16 length:(uint64_t)v15 encoding:v17 range:v18])
    {
      v23 = [self v19:v20 v21:v21 v22:v22];
      v28 = [v5 v24:v25 v26:v26 v27:v27];
      char isEqualToString = [v23 isEqualToString:v29];
    }
    else
    {
      char isEqualToString = 0;
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [XRStringPair alloc];
  uint64_t v9 = [self v5:v6 v7:v8];
  uint64_t v14 = [self v10:v11 v12:v12 v13:v13];
  second = [v4 initWithFirst:v15 second:(uint64_t)v9 third:(uint64_t)v14 fourth:v16];

  return second;
}

- (unint64_t)hashValue
{
  uint64_t v6 = [self a2:v2 v3:v3 v4:v4];
  uint64_t v11 = [v6 hash:v7, v8, v9, v10];
  uint64_t v16 = [self v12:v13 v14:v14 v15:v15];
  unint64_t v21 = [v16 hash:v17, v18, v19, v20] ^ v11;

  return v21;
}

- (NSString)first
{
  return self->_first;
}

- (NSString)second
{
  return self->_second;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);

  objc_storeStrong((id *)&self->_first, 0);
}

@end