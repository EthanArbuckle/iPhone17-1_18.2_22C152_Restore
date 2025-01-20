@interface MPMediaAPIParserLayer
+ (id)layerWithFirstObjectOfType:(unint64_t)a3;
+ (id)layerWithKey:(id)a3 ofType:(unint64_t)a4;
- (NSString)key;
- (unint64_t)type;
- (void)setKey:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MPMediaAPIParserLayer

+ (id)layerWithFirstObjectOfType:(unint64_t)a3
{
  v4 = objc_opt_new();
  v5 = v4;
  if (v4) {
    [v4 setType:a3];
  }

  return v5;
}

+ (id)layerWithKey:(id)a3 ofType:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = v6;
  if (v6)
  {
    [v6 setKey:v5];
    [v7 setType:a4];
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end