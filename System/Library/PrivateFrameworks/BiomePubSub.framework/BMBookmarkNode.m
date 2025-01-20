@interface BMBookmarkNode
+ (BOOL)supportsSecureCoding;
- (BMBookmark)value;
- (BMBookmarkNode)initWithCoder:(id)a3;
- (BMBookmarkNode)initWithValue:(id)a3 upstreams:(id)a4 name:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)upstreams;
- (NSString)description;
- (NSString)name;
- (id)descriptionAtLevel:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setUpstreams:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BMBookmarkNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_upstreams, 0);
}

- (BMBookmarkNode)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B90];
  id v5 = a3;
  v6 = objc_msgSend(v4, "bm_allowedClassesForSecureCodingBMBookmark");
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"value"];
  v8 = [v5 decodeObjectOfClasses:v6 forKey:@"upstreams"];
  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"name"];

  v10 = [(BMBookmarkNode *)self initWithValue:v7 upstreams:v8 name:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BMBookmarkNode *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(BMBookmarkNode *)self name];
      v7 = [(BMBookmarkNode *)v5 name];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(BMBookmarkNode *)self name];
        v9 = [(BMBookmarkNode *)v5 name];
        char v10 = [v8 isEqual:v9];
      }
      v12 = [(BMBookmarkNode *)self value];
      v13 = [(BMBookmarkNode *)v5 value];
      if (v12 == v13)
      {
        char v16 = 1;
      }
      else
      {
        v14 = [(BMBookmarkNode *)self value];
        v15 = [(BMBookmarkNode *)v5 value];
        char v16 = [v14 isEqual:v15];
      }
      v17 = [(BMBookmarkNode *)self upstreams];
      v18 = [(BMBookmarkNode *)v5 upstreams];
      if (v17 == v18)
      {
        char v21 = 1;
      }
      else
      {
        v19 = [(BMBookmarkNode *)self upstreams];
        v20 = [(BMBookmarkNode *)v5 upstreams];
        char v21 = [v19 isEqual:v20];
      }
      char v11 = v10 & v16 & v21;
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (BMBookmarkNode)initWithValue:(id)a3 upstreams:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMBookmarkNode;
  v12 = [(BMBookmarkNode *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a5);
    objc_storeStrong((id *)&v13->_value, a3);
    objc_storeStrong((id *)&v13->_upstreams, a4);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(BMBookmarkNode *)self value];

  if (v4)
  {
    id v5 = [(BMBookmarkNode *)self value];
    [v10 encodeObject:v5 forKey:@"value"];
  }
  v6 = [(BMBookmarkNode *)self upstreams];

  if (v6)
  {
    v7 = [(BMBookmarkNode *)self upstreams];
    [v10 encodeObject:v7 forKey:@"upstreams"];
  }
  v8 = [(BMBookmarkNode *)self name];

  if (v8)
  {
    id v9 = [(BMBookmarkNode *)self name];
    [v10 encodeObject:v9 forKey:@"name"];
  }
}

- (BMBookmark)value
{
  return self->_value;
}

- (NSArray)upstreams
{
  return self->_upstreams;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)description
{
  return (NSString *)[(BMBookmarkNode *)self descriptionAtLevel:1];
}

- (id)descriptionAtLevel:(int64_t)a3
{
  id v5 = (void *)[&stru_1F03F9600 mutableCopy];
  v6 = (void *)[&stru_1F03F9600 mutableCopy];
  if (a3 >= 1)
  {
    int64_t v7 = a3;
    do
    {
      [v6 appendString:@"  "];
      --v7;
    }
    while (v7);
  }
  v8 = [(BMBookmarkNode *)self name];
  [v5 appendFormat:@"%@\n", v8];

  id v9 = [(BMBookmarkNode *)self upstreams];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    int64_t v12 = a3 + 1;
    do
    {
      v13 = [(BMBookmarkNode *)self upstreams];
      v14 = [v13 objectAtIndexedSubscript:v11];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v15 = [v14 descriptionAtLevel:v12];
        [v5 appendFormat:@"%@%@\n", v6, v15];
      }
      else
      {
        [v5 appendFormat:@"%@%@\n", v6, v14];
      }

      ++v11;
      char v16 = [(BMBookmarkNode *)self upstreams];
      unint64_t v17 = [v16 count];
    }
    while (v11 < v17);
  }
  v18 = (void *)[v5 copy];

  return v18;
}

- (void)setUpstreams:(id)a3
{
}

- (void)setValue:(id)a3
{
}

- (void)setName:(id)a3
{
}

@end