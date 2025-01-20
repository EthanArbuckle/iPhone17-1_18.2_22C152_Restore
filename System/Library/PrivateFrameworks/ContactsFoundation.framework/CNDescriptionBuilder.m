@interface CNDescriptionBuilder
+ (id)descriptionBuilderWithObject:(id)a3;
+ (id)descriptionForBool:(BOOL)a3;
+ (id)descriptionForObject:(id)a3 withNamesAndObjects:(id)a4;
- (CNDescriptionBuilder)init;
- (CNDescriptionBuilder)initWithObject:(id)a3;
- (NSString)separator;
- (id)appendKey:(id)a3;
- (id)appendKeys:(id)a3;
- (id)appendName:(id)a3 BOOLValue:(BOOL)a4;
- (id)appendName:(id)a3 doubleValue:(double)a4;
- (id)appendName:(id)a3 intValue:(int)a4;
- (id)appendName:(id)a3 integerValue:(int64_t)a4;
- (id)appendName:(id)a3 object:(id)a4;
- (id)appendName:(id)a3 pointerValue:(void *)a4;
- (id)appendName:(id)a3 range:(_NSRange)a4;
- (id)appendName:(id)a3 selector:(SEL)a4;
- (id)appendName:(id)a3 timeInterval:(double)a4;
- (id)appendName:(id)a3 u_int64_t:(unint64_t)a4;
- (id)appendName:(id)a3 unsignedInteger:(unint64_t)a4;
- (id)appendNamesAndObjects:(id)a3;
- (id)appendNamesAndObjects:(id)a3 args:(char *)a4;
- (id)appendObject:(id)a3 withName:(id)a4;
- (id)appendableDescriptionOfValue:(id)a3;
- (id)build;
- (void)setSeparator:(id)a3;
- (void)tryAppendKey:(id)a3;
@end

@implementation CNDescriptionBuilder

- (id)build
{
  [(NSMutableString *)self->_description appendString:@">"];
  v3 = (void *)[(NSMutableString *)self->_description copy];

  return v3;
}

- (id)appendName:(id)a3 object:(id)a4
{
  description = self->_description;
  id v7 = a4;
  id v8 = a3;
  v9 = [(CNDescriptionBuilder *)self separator];
  [(NSMutableString *)description appendString:v9];

  [(NSMutableString *)self->_description appendString:@" "];
  [(NSMutableString *)self->_description appendString:v8];

  [(NSMutableString *)self->_description appendString:@"="];
  v10 = self->_description;
  v11 = [(CNDescriptionBuilder *)self appendableDescriptionOfValue:v7];

  [(NSMutableString *)v10 appendString:v11];
  [(CNDescriptionBuilder *)self setSeparator:@","];
  return self;
}

- (void)setSeparator:(id)a3
{
}

- (NSString)separator
{
  return self->_separator;
}

- (id)appendableDescriptionOfValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(v3, "_cn_shortDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = [v3 description];

    if (!v4) {
      v4 = @"(nil)";
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_description, 0);

  objc_destroyWeak((id *)&self->_object);
}

+ (id)descriptionBuilderWithObject:(id)a3
{
  id v3 = a3;
  v4 = [[CNDescriptionBuilder alloc] initWithObject:v3];

  return v4;
}

- (CNDescriptionBuilder)initWithObject:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNDescriptionBuilder;
  v5 = [(CNDescriptionBuilder *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_object, v4);
    id v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    description = v6->_description;
    v6->_description = v7;

    v9 = v6->_description;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_object);
    uint64_t v11 = objc_opt_class();
    id v12 = objc_loadWeakRetained((id *)&v6->_object);
    [(NSMutableString *)v9 appendFormat:@"<%@: %p", v11, v12];

    separator = v6->_separator;
    v6->_separator = (NSString *)@":";

    v14 = v6;
  }

  return v6;
}

+ (id)descriptionForObject:(id)a3 withNamesAndObjects:(id)a4
{
  id v5 = a4;
  v6 = +[CNDescriptionBuilder descriptionBuilderWithObject:a3];
  id v7 = (id)[v6 appendNamesAndObjects:v5 args:&v11];
  id v8 = [v6 build];

  return v8;
}

- (CNDescriptionBuilder)init
{
  CNInitializerUnavailableException(self, a2, sel_initWithObject_);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return [(CNDescriptionBuilder *)self appendName:a4 object:a3];
}

- (id)appendName:(id)a3 BOOLValue:(BOOL)a4
{
  if (a4) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  id v6 = [(CNDescriptionBuilder *)self appendName:a3 object:v5];
  return self;
}

- (id)appendName:(id)a3 integerValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a4);
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 unsignedInteger:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 u_int64_t:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4);
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 intValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 doubleValue:(double)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a4);
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 timeInterval:(double)a4
{
  id v6 = a3;
  id v7 = +[CNTimeIntervalFormatter stringForTimeInterval:a4];
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = (*((void (**)(uint64_t, uint64_t, uint64_t))CNRangeShortDescription + 2))((uint64_t)CNRangeShortDescription, location, length);
  id v9 = [(CNDescriptionBuilder *)self appendName:v7 object:v8];

  return self;
}

- (id)appendName:(id)a3 pointerValue:(void *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a4);
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v7 = NSStringFromSelector(a4);
  id v8 = [(CNDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendNamesAndObjects:(id)a3
{
  id v4 = [(CNDescriptionBuilder *)self appendNamesAndObjects:a3 args:&v6];
  return self;
}

- (id)appendNamesAndObjects:(id)a3 args:(char *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
    do
    {
      id v8 = *(id *)a4;
      id v9 = [(CNDescriptionBuilder *)self appendName:v7 object:v8];
      v10 = (id *)(a4 + 8);
      a4 += 16;
      id v11 = *v10;

      id v7 = v11;
    }
    while (v11);
  }

  return self;
}

- (id)appendKey:(id)a3
{
  id v4 = a3;
  [(CNDescriptionBuilder *)self tryAppendKey:v4];

  return self;
}

- (id)appendKeys:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        -[CNDescriptionBuilder tryAppendKey:](self, "tryAppendKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return self;
}

- (void)tryAppendKey:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  uint64_t v5 = [WeakRetained valueForKey:v7];

  id v6 = [(CNDescriptionBuilder *)self appendObject:v5 withName:v7];
}

+ (id)descriptionForBool:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

- (void)appendKey:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v2 = 138543362;
    id v3 = v1;
    _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exception: %{public}@", (uint8_t *)&v2, 0xCu);
  }
  objc_end_catch();
}

- (void)appendKeys:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exception: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end