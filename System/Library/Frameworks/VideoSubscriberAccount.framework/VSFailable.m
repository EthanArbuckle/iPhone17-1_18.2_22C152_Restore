@interface VSFailable
+ (BOOL)supportsSecureCoding;
+ (id)decodableClasses;
+ (id)failableWithError:(id)a3;
+ (id)failableWithObject:(id)a3;
- (NSError)error;
- (VSFailable)init;
- (VSFailable)initWithCoder:(id)a3;
- (VSFailable)initWithError:(id)a3;
- (VSFailable)initWithObject:(id)a3;
- (id)description;
- (id)object;
- (id)unwrappedWithError:(id *)a3;
- (int64_t)kind;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setKind:(int64_t)a3;
- (void)setObject:(id)a3;
- (void)unwrapObject:(id)a3 error:(id)a4;
@end

@implementation VSFailable

+ (id)decodableClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
}

+ (id)failableWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return v5;
}

+ (id)failableWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithError:v4];

  return v5;
}

- (VSFailable)initWithObject:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The object parameter must not be nil."];
  }
  v9.receiver = self;
  v9.super_class = (Class)VSFailable;
  uint64_t v6 = [(VSFailable *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_kind = 0;
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (VSFailable)initWithError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The error parameter must not be nil."];
  }
  v10.receiver = self;
  v10.super_class = (Class)VSFailable;
  id v5 = [(VSFailable *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_kind = 1;
    uint64_t v7 = [v4 copy];
    error = v6->_error;
    v6->_error = (NSError *)v7;
  }
  return v6;
}

- (VSFailable)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (void)unwrapObject:(id)a3 error:(id)a4
{
  objc_super v10 = a3;
  uint64_t v6 = a4;
  if (v10)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The objectHandler parameter must not be nil."];
    if (v6) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorHandler parameter must not be nil."];
LABEL_3:
  int64_t v7 = [(VSFailable *)self kind];
  if (v7 == 1)
  {
    uint64_t v8 = [(VSFailable *)self error];
    objc_super v9 = (void (*)(void))v6[2];
  }
  else
  {
    if (v7) {
      goto LABEL_10;
    }
    uint64_t v8 = [(VSFailable *)self object];
    objc_super v9 = (void (*)(void))v10[2];
  }
  v9();

LABEL_10:
}

- (id)unwrappedWithError:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__VSFailable_unwrappedWithError___block_invoke;
  v6[3] = &unk_1E6BD2F38;
  v6[4] = &v7;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__VSFailable_unwrappedWithError___block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v5[4] = a3;
  [(VSFailable *)self unwrapObject:v6 error:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __33__VSFailable_unwrappedWithError___block_invoke(uint64_t a1, void *a2)
{
}

id __33__VSFailable_unwrappedWithError___block_invoke_2(uint64_t a1, id a2)
{
  id result = a2;
  **(void **)(a1 + 32) = result;
  return result;
}

- (VSFailable)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  v13.receiver = self;
  v13.super_class = (Class)VSFailable;
  id v5 = [(VSFailable *)&v13 init];
  if (v5)
  {
    v5->_kind = [v4 decodeIntegerForKey:@"VSFailableKindKey"];
    uint64_t v6 = [(id)objc_opt_class() decodableClasses];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"VSFailableObjectKey"];
    id object = v5->_object;
    v5->_id object = (id)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VSFailableErrorKey"];
    uint64_t v10 = [v9 copy];
    error = v5->_error;
    v5->_error = (NSError *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[VSFailable kind](self, "kind"), @"VSFailableKindKey");
  id v5 = [(VSFailable *)self object];
  [v4 encodeObject:v5 forKey:@"VSFailableObjectKey"];

  id v6 = [(VSFailable *)self error];
  [v4 encodeObject:v6 forKey:@"VSFailableErrorKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v4 = [(VSFailable *)self kind];
  if (v4 == 1) {
    id v5 = @"error";
  }
  else {
    id v5 = 0;
  }
  if (!v4) {
    id v5 = @"object";
  }
  id v6 = [NSString stringWithFormat:@"%@ = %@", @"kind", v5];
  [v3 addObject:v6];

  uint64_t v7 = NSString;
  uint64_t v8 = [(VSFailable *)self object];
  uint64_t v9 = [v7 stringWithFormat:@"%@ = %@", @"object", v8];
  [v3 addObject:v9];

  uint64_t v10 = NSString;
  v11 = [(VSFailable *)self error];
  id v12 = [v10 stringWithFormat:@"%@ = %@", @"error", v11];
  [v3 addObject:v12];

  objc_super v13 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)VSFailable;
  v14 = [(VSFailable *)&v18 description];
  v15 = [v3 componentsJoinedByString:@", "];
  v16 = [v13 stringWithFormat:@"<%@ %@>", v14, v15];

  return v16;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_object, 0);
}

@end