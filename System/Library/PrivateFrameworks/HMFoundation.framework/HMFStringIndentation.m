@interface HMFStringIndentation
+ (id)indentation;
+ (id)indentationWithWidth:(unint64_t)a3;
- (HMFStringIndentation)init;
- (HMFStringIndentation)initWithWidth:(unint64_t)a3;
- (id)description;
- (id)indentationByLevels:(int64_t)a3;
- (unint64_t)level;
- (unint64_t)width;
@end

@implementation HMFStringIndentation

+ (id)indentation
{
  return (id)[a1 indentationWithWidth:0];
}

+ (id)indentationWithWidth:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithWidth:a3];
  return v3;
}

- (id)indentationByLevels:(int64_t)a3
{
  if ([(HMFStringIndentation *)self level] + a3) {
    unint64_t v5 = [(HMFStringIndentation *)self level] + a3;
  }
  else {
    unint64_t v5 = 0;
  }
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWidth:", -[HMFStringIndentation width](self, "width"));
  v6[2] = v5;
  return v6;
}

- (id)description
{
  unint64_t v3 = [(HMFStringIndentation *)self width];
  unint64_t v4 = v3 + v3 * [(HMFStringIndentation *)self level];
  return (id)[&stru_1EEF0F5E0 stringByPaddingToLength:v4 withString:@" " startingAtIndex:0];
}

- (unint64_t)level
{
  return self->_level;
}

- (unint64_t)width
{
  return self->_width;
}

- (HMFStringIndentation)initWithWidth:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMFStringIndentation;
  result = [(HMFStringIndentation *)&v6 init];
  if (result)
  {
    unint64_t v5 = 4;
    if (a3) {
      unint64_t v5 = a3;
    }
    result->_width = v5;
  }
  return result;
}

- (HMFStringIndentation)init
{
  return [(HMFStringIndentation *)self initWithWidth:0];
}

@end