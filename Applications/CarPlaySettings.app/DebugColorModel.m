@interface DebugColorModel
+ (id)modelWithColor:(id)a3 name:(id)a4;
- (NSString)name;
- (UIColor)color;
- (void)setColor:(id)a3;
- (void)setName:(id)a3;
@end

@implementation DebugColorModel

+ (id)modelWithColor:(id)a3 name:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(DebugColorModel);
  [(DebugColorModel *)v7 setColor:v6];

  [(DebugColorModel *)v7 setName:v5];

  return v7;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end