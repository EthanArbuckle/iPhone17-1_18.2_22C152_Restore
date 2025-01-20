@interface BPSTuple
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BPSTuple)initWithCoder:(id)a3;
- (BPSTuple)initWithFirst:(id)a3 second:(id)a4;
- (id)description;
- (id)first;
- (id)second;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BPSTuple

- (BPSTuple)initWithFirst:(id)a3 second:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSTuple;
  v9 = [(BPSTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_first, a3);
    objc_storeStrong(&v10->_second, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v10 = 0;
    goto LABEL_20;
  }
  id v7 = v6;
  id v8 = [(BPSTuple *)self first];
  if (v8 || ([v7 first], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(BPSTuple *)self first];
    v4 = [v7 first];
    if (![v3 isEqual:v4])
    {
      char v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    int v9 = 1;
  }
  else
  {
    v17 = 0;
    int v9 = 0;
  }
  v11 = [(BPSTuple *)self second];
  if (v11 || ([v7 second], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v12 = [(BPSTuple *)self second];
    v13 = [v7 second];
    char v10 = [v12 isEqual:v13];

    if (v11) {
      goto LABEL_15;
    }
  }
  else
  {
    v16 = 0;
    char v10 = 1;
  }

LABEL_15:
  if (v9) {
    goto LABEL_16;
  }
LABEL_17:
  if (!v8) {

  }
LABEL_20:
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"First: %@, Secound: %@", self->_first, self->_second];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BPSTuple *)self first];
  [v4 encodeObject:v5 forKey:@"first"];

  id v6 = [(BPSTuple *)self second];
  [v4 encodeObject:v6 forKey:@"second"];
}

- (BPSTuple)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28B90];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  id v7 = [v5 decodeObjectOfClasses:v6 forKey:@"first"];

  id v8 = objc_msgSend(MEMORY[0x1E4F28B90], "bm_allowedClassesForSecureCodingBMBookmark");
  int v9 = [v5 decodeObjectOfClasses:v8 forKey:@"second"];

  char v10 = [(BPSTuple *)self initWithFirst:v7 second:v9];
  return v10;
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