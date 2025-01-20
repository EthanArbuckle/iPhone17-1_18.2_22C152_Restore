@interface CAValueFunction
+ (BOOL)supportsSecureCoding;
+ (CAValueFunction)functionWithName:(CAValueFunctionName)name;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)apply:(const double *)a3 result:(double *)a4;
- (BOOL)apply:(const double *)a3 result:(double *)a4 parameterFunction:(void *)a5 context:(void *)a6;
- (CAValueFunction)initWithCoder:(id)a3;
- (CAValueFunctionName)name;
- (Object)CA_copyRenderValue;
- (id)_initWithName:(int)a3;
- (unint64_t)inputCount;
- (unint64_t)outputCount;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAValueFunction

- (void)encodeWithCAMLWriter:(id)a3
{
  v4 = [(CAValueFunction *)self name];
  if (v4)
  {
    [a3 setElementAttribute:v4 forKey:@"name"];
  }
}

- (CAValueFunction)initWithCoder:(id)a3
{
  int v5 = [a3 containsValueForKey:@"CAValueFunctionName"];

  if (!v5) {
    return 0;
  }
  v6 = +[CAValueFunction functionWithName:](CAValueFunction, "functionWithName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"CAValueFunctionName"]);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  if (!self->_string)
  {
    v4 = [(CAValueFunction *)self name];
    [a3 encodeObject:v4 forKey:@"CAValueFunctionName"];
  }
}

- (Object)CA_copyRenderValue
{
  result = (Object *)self->_impl;
  if (result)
  {
    p_var1 = &result->var1;
    if (!atomic_fetch_add(&result->var1.var0.var0, 1u))
    {
      result = 0;
      atomic_fetch_add(&p_var1->var0.var0, 0xFFFFFFFF);
    }
  }
  return result;
}

- (BOOL)apply:(const double *)a3 result:(double *)a4 parameterFunction:(void *)a5 context:(void *)a6
{
  v9[2] = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    v9[0] = a5;
    v9[1] = a6;
    if (a5) {
      v7 = param_fun;
    }
    else {
      v7 = 0;
    }
    LOBYTE(impl) = (*(uint64_t (**)(void *, uint64_t, const double *, void, double *, void, double (*)(uint64_t, unsigned int *, uint64_t, void *), void *))(*(void *)impl + 128))(impl, 1, a3, 0, a4, 0, v7, v9);
  }
  return (char)impl;
}

- (BOOL)apply:(const double *)a3 result:(double *)a4
{
  impl = self->_impl;
  if (impl) {
    LOBYTE(impl) = (*(uint64_t (**)(void *, uint64_t, const double *, void, double *, void, void, void))(*(void *)impl + 128))(impl, 1, a3, 0, a4, 0, 0, 0);
  }
  return (char)impl;
}

- (unint64_t)outputCount
{
  unint64_t result = (unint64_t)self->_impl;
  if (result) {
    return (*(unsigned int (**)(unint64_t, SEL))(*(void *)result + 112))(result, a2);
  }
  return result;
}

- (unint64_t)inputCount
{
  unint64_t result = (unint64_t)self->_impl;
  if (result) {
    return (*(unsigned int (**)(unint64_t, SEL))(*(void *)result + 104))(result, a2);
  }
  return result;
}

- (CAValueFunctionName)name
{
  if (self->_string) {
    return 0;
  }
  unsigned int v2 = (*(uint64_t (**)(void *, SEL))(*(void *)self->_impl + 120))(self->_impl, a2);
  if (v2 > 0xC) {
    return 0;
  }
  else {
    return (CAValueFunctionName)*((void *)&off_1E5273020 + v2);
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  impl = (atomic_uint *)self->_impl;
  if (impl && atomic_fetch_add(impl + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *, SEL))(*(void *)impl + 16))(impl, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)CAValueFunction;
  [(CAValueFunction *)&v4 dealloc];
}

- (id)_initWithName:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CAValueFunction;
  objc_super v4 = [(CAValueFunction *)&v7 init];
  if (v4)
  {
    atomic_ullong v5 = CA::Render::NamedFunction::new_function(a3);
    v4->_impl = (void *)v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v5 = [a3 attributeForKey:@"name" remove:1];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a1 functionWithName:v5];
    if (v7)
    {
      [a3 setElementValue:v7];
    }
    else
    {
      [a3 parserError:@"Unknown function: %@", v6];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CAValueFunction)functionWithName:(CAValueFunctionName)name
{
  keys[13] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  CFDictionaryRef v4 = (const __CFDictionary *)+[CAValueFunction functionWithName:]::dict;
  if (!+[CAValueFunction functionWithName:]::dict)
  {
    keys[0] = @"rotateX";
    keys[1] = @"rotateY";
    values[0] = 0;
    values[1] = (void *)1;
    keys[2] = @"rotateZ";
    keys[3] = @"scale";
    values[2] = (void *)2;
    values[3] = (void *)3;
    keys[4] = @"scaleX";
    keys[5] = @"scaleY";
    values[4] = (void *)4;
    values[5] = (void *)5;
    keys[6] = @"scaleZ";
    keys[7] = @"scaleXY";
    values[6] = (void *)6;
    values[7] = (void *)7;
    keys[8] = @"scaleXYZ";
    keys[9] = @"translate";
    values[8] = (void *)8;
    values[9] = (void *)9;
    keys[10] = @"translateX";
    keys[11] = @"translateY";
    values[10] = (void *)10;
    values[11] = (void *)11;
    keys[12] = @"translateZ";
    values[12] = (void *)12;
    CFDictionaryRef v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 13, MEMORY[0x1E4F1D530], 0);
    +[CAValueFunction functionWithName:]::dict = (uint64_t)v4;
  }
  if (!CFDictionaryGetValueIfPresent(v4, name, &v7)) {
    return 0;
  }
  int v5 = (int)v7;
  unint64_t result = (CAValueFunction *)function_objects[(int)v7];
  if (!result)
  {
    unint64_t result = [[CAValueFunction alloc] _initWithName:v7];
    function_objects[v5] = result;
  }
  return result;
}

@end