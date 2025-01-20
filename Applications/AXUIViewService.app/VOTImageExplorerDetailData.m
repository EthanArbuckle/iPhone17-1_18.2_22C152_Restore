@interface VOTImageExplorerDetailData
+ (BOOL)supportsSecureCoding;
- (NSArray)values;
- (NSString)key;
- (VOTImageExplorerDetailData)initWithCoder:(id)a3;
- (VOTImageExplorerDetailData)initWithKey:(id)a3 values:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation VOTImageExplorerDetailData

- (VOTImageExplorerDetailData)initWithKey:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOTImageExplorerDetailData;
  v8 = [(VOTImageExplorerDetailData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(VOTImageExplorerDetailData *)v8 setKey:v6];
    [(VOTImageExplorerDetailData *)v9 setValues:v7];
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VOTImageExplorerDetailData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  [(VOTImageExplorerDetailData *)self setKey:v5];

  uint64_t v6 = objc_opt_class();
  id v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"values"];

  [(VOTImageExplorerDetailData *)self setValues:v8];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VOTImageExplorerDetailData *)self key];
  [v4 encodeObject:v5 forKey:@"key"];

  id v6 = [(VOTImageExplorerDetailData *)self values];
  [v4 encodeObject:v6 forKey:@"values"];
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end