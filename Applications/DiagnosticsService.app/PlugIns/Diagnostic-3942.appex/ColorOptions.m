@interface ColorOptions
+ (id)colorOptionsWithStarting:(id)a3 success:(id)a4 failed:(id)a5;
- (ColorOptions)init;
- (ColorOptions)initWithStarting:(id)a3 success:(id)a4 failed:(id)a5;
- (UIColor)failed;
- (UIColor)starting;
- (UIColor)success;
- (void)setFailed:(id)a3;
- (void)setStarting:(id)a3;
- (void)setSuccess:(id)a3;
@end

@implementation ColorOptions

+ (id)colorOptionsWithStarting:(id)a3 success:(id)a4 failed:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithStarting:v10 success:v9 failed:v8];

  return v11;
}

- (ColorOptions)initWithStarting:(id)a3 success:(id)a4 failed:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ColorOptions;
  v12 = [(ColorOptions *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_starting, a3);
    objc_storeStrong((id *)&v13->_success, a4);
    objc_storeStrong((id *)&v13->_failed, a5);
  }

  return v13;
}

- (ColorOptions)init
{
  v3 = +[UIColor colorWithHexValue:@"2094FA" error:0];
  v4 = +[UIColor colorWithHexValue:@"04DE71" error:0];
  v5 = +[UIColor colorWithHexValue:@"FF3B30" error:0];
  v6 = [(ColorOptions *)self initWithStarting:v3 success:v4 failed:v5];

  return v6;
}

- (UIColor)starting
{
  return self->_starting;
}

- (void)setStarting:(id)a3
{
}

- (UIColor)success
{
  return self->_success;
}

- (void)setSuccess:(id)a3
{
}

- (UIColor)failed
{
  return self->_failed;
}

- (void)setFailed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failed, 0);
  objc_storeStrong((id *)&self->_success, 0);

  objc_storeStrong((id *)&self->_starting, 0);
}

@end