@interface HFActionNaturalLanguageExecutionTuple
+ (id)tuple:(id)a3 second:(id)a4;
+ (id)tuple:(id)a3 second:(id)a4 third:(id)a5;
- (HFActionNaturalLanguageExecutionTuple)initWithFirst:(id)a3 second:(id)a4;
- (HFActionNaturalLanguageExecutionTuple)initWithFirst:(id)a3 second:(id)a4 third:(id)a5;
- (id)first;
- (id)second;
- (id)third;
- (void)setFirst:(id)a3;
- (void)setSecond:(id)a3;
- (void)setThird:(id)a3;
@end

@implementation HFActionNaturalLanguageExecutionTuple

- (HFActionNaturalLanguageExecutionTuple)initWithFirst:(id)a3 second:(id)a4 third:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFActionNaturalLanguageExecutionTuple;
  v12 = [(HFActionNaturalLanguageExecutionTuple *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_first, a3);
    objc_storeStrong(&v13->_second, a4);
    objc_storeStrong(&v13->_third, a5);
  }

  return v13;
}

+ (id)tuple:(id)a3 second:(id)a4 third:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFirst:v9 second:v8 third:v7];

  return v10;
}

- (HFActionNaturalLanguageExecutionTuple)initWithFirst:(id)a3 second:(id)a4
{
  return [(HFActionNaturalLanguageExecutionTuple *)self initWithFirst:a3 second:a4 third:0];
}

+ (id)tuple:(id)a3 second:(id)a4
{
  return (id)[a1 tuple:a3 second:a4 third:0];
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
}

- (id)third
{
  return self->_third;
}

- (void)setThird:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_third, 0);
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end