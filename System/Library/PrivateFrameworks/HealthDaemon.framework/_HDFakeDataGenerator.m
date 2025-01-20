@interface _HDFakeDataGenerator
- (id)initWithType:(void *)a3 interval:(double)a4 startTime:(double)a5 generator:;
@end

@implementation _HDFakeDataGenerator

- (id)initWithType:(void *)a3 interval:(double)a4 startTime:(double)a5 generator:
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)_HDFakeDataGenerator;
    a1 = objc_msgSendSuper2(&v16, sel_init);
    if (a1)
    {
      uint64_t v11 = [v9 copy];
      v12 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v11;

      *((double *)a1 + 1) = a5;
      *((double *)a1 + 3) = a4;
      *((double *)a1 + 4) = a4 + a5;
      uint64_t v13 = [v10 copy];
      v14 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v13;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueGenerator, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end