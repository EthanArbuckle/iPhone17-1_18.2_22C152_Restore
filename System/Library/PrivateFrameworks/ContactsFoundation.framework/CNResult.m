@interface CNResult
+ (id)failureWithError:(id)a3;
+ (id)isFailure;
+ (id)isSuccess;
+ (id)resultWithBlock:(id)a3;
+ (id)resultWithFuture:(id)a3;
+ (id)resultWithFuture:(id)a3 timeout:(double)a4;
+ (id)resultWithValue:(id)a3 orError:(id)a4;
+ (id)successWithValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFailure;
- (BOOL)isSuccess;
- (CNEither)either;
- (CNResult)initWithError:(id)a3;
- (CNResult)initWithValue:(id)a3;
- (CNResult)initWithValue:(id)a3 error:(id)a4;
- (NSError)error;
- (id)description;
- (id)flatMap:(id)a3;
- (id)map:(id)a3;
- (id)recover:(id)a3;
- (id)value;
- (id)valueWithError:(id *)a3;
- (unint64_t)hash;
@end

@implementation CNResult

- (void).cxx_destruct
{
}

- (BOOL)isFailure
{
  return [(CNEither *)self->_either isRight];
}

- (id)value
{
  return [(CNEither *)self->_either left];
}

- (BOOL)isSuccess
{
  return [(CNEither *)self->_either isLeft];
}

- (NSError)error
{
  return (NSError *)[(CNEither *)self->_either right];
}

+ (id)resultWithValue:(id)a3 orError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithValue:v7 error:v6];

  return v8;
}

+ (id)successWithValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 error:0];

  return v5;
}

- (CNResult)initWithValue:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNResult;
  v8 = [(CNResult *)&v13 init];
  if (v8)
  {
    uint64_t v9 = +[CNEither eitherWithLeft:v6 right:v7];
    either = v8->_either;
    v8->_either = (CNEither *)v9;

    v11 = v8;
  }

  return v8;
}

+ (id)resultWithBlock:(id)a3
{
  id v8 = 0;
  id v4 = (*((void (**)(id, id *))a3 + 2))(a3, &v8);
  id v5 = v8;
  id v6 = [a1 resultWithValue:v4 orError:v5];

  return v6;
}

+ (id)resultWithFuture:(id)a3
{
  return (id)[a1 resultWithFuture:a3 timeout:30.0];
}

+ (id)resultWithFuture:(id)a3 timeout:(double)a4
{
  id v9 = 0;
  id v5 = [a3 resultWithTimeout:&v9 error:a4];
  id v6 = v9;
  id v7 = [a1 resultWithValue:v5 orError:v6];

  return v7;
}

+ (id)failureWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithValue:0 error:v4];

  return v5;
}

- (CNResult)initWithValue:(id)a3
{
  return [(CNResult *)self initWithValue:a3 error:0];
}

- (CNResult)initWithError:(id)a3
{
  return [(CNResult *)self initWithValue:0 error:a3];
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  if ([(CNResult *)self isSuccess])
  {
    id v4 = [(CNResult *)self value];
    id v5 = @"value";
  }
  else
  {
    id v4 = [(CNResult *)self error];
    id v5 = @"error";
  }
  id v6 = (id)[v3 appendName:v5 object:v4];

  id v7 = [v3 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNResult *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (either = self->_either, (unint64_t)either | (unint64_t)v4->_either)
      && !-[CNEither isEqual:](either, "isEqual:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(CNEither *)self->_either hash];
}

- (id)valueWithError:(id *)a3
{
  id v5 = [(CNResult *)self value];
  BOOL v6 = [(CNResult *)self error];
  id v7 = v5;
  id v8 = v7;
  if (a3 && !v7) {
    *a3 = v6;
  }

  return v8;
}

- (id)map:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(CNResult *)self isSuccess])
  {
    id v5 = [(CNResult *)self value];
    BOOL v6 = v4[2](v4, v5);
    id v7 = +[CNResult successWithValue:v6];
  }
  else
  {
    id v7 = self;
  }

  return v7;
}

- (id)flatMap:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(CNResult *)self isSuccess])
  {
    id v5 = [(CNResult *)self value];
    v4[2](v4, v5);
    BOOL v6 = (CNResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v6 = self;
  }

  return v6;
}

- (id)recover:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(CNResult *)self isFailure])
  {
    id v5 = [(CNResult *)self error];
    v4[2](v4, v5);
    BOOL v6 = (CNResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v6 = self;
  }

  return v6;
}

+ (id)isSuccess
{
  return &__block_literal_global;
}

+ (id)isFailure
{
  return &__block_literal_global_8;
}

- (CNEither)either
{
  return (CNEither *)objc_getProperty(self, a2, 8, 1);
}

@end