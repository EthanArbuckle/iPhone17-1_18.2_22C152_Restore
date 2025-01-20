@interface _DASLogCondition
+ (id)withCondition:(id)a3;
- (BOOL)isIdeal;
- (NSObject)condition;
- (id)description;
- (void)setCondition:(id)a3;
- (void)setIsIdeal:(BOOL)a3;
@end

@implementation _DASLogCondition

+ (id)withCondition:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setCondition:v3];

  return v4;
}

- (id)description
{
  return (id)[self->_condition description];
}

- (NSObject)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (BOOL)isIdeal
{
  return self->_isIdeal;
}

- (void)setIsIdeal:(BOOL)a3
{
  self->_isIdeal = a3;
}

- (void).cxx_destruct
{
}

@end