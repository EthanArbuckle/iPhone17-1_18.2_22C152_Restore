@interface Row
- (NSString)subText;
- (NSString)text;
- (Row)initWithType:(int64_t)a3;
- (id)object;
- (int64_t)type;
- (void)setObject:(id)a3;
- (void)setSubText:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation Row

- (Row)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)Row;
  v4 = [(Row *)&v7 init];
  v5 = v4;
  if (v4) {
    [(Row *)v4 setType:a3];
  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)subText
{
  return self->_subText;
}

- (void)setSubText:(id)a3
{
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_subText, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end