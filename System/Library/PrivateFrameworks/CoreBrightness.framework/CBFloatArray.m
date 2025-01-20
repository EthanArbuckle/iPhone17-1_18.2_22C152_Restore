@interface CBFloatArray
- (CBFloatArray)initWithCount:(unint64_t)a3;
- (CBFloatArray)initWithValues:(float *)a3 andCount:(unint64_t)a4;
- (const)at:(unint64_t)a3;
- (const)data;
- (float)dataCopy;
- (float)get:(unint64_t)a3;
- (float)mutableData;
- (id)copyNSArray;
- (id)description;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation CBFloatArray

- (float)get:(unint64_t)a3
{
  if (a3 >= self->_count) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], 0));
  }
  return self->_data[a3];
}

- (CBFloatArray)initWithValues:(float *)a3 andCount:(unint64_t)a4
{
  v6 = -[CBFloatArray initWithCount:](self, "initWithCount:", a4, a4);
  if (v6) {
    memcpy(v6->_data, a3, v6->_size);
  }
  return v6;
}

- (CBFloatArray)initWithCount:(unint64_t)a3
{
  v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CBFloatArray;
  v8 = [(CBFloatArray *)&v5 init];
  if (v8)
  {
    v8->_size = 4 * v6;
    v8->_count = v6;
    v3 = (float *)malloc_type_malloc(v8->_size, 0x220116FCuLL);
    v8->_data = v3;
    if (!v8->_data) {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A0], 0));
    }
  }
  return v8;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  if (self->_data)
  {
    free(v4->_data);
    v4->_data = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBFloatArray;
  [(CBFloatArray *)&v2 dealloc];
}

- (const)data
{
  return -[CBFloatArray at:](self, "at:", 0, a2, self);
}

- (float)dataCopy
{
  __dst = malloc_type_malloc(self->_size, 0xEAC70105uLL);
  if (__dst) {
    memcpy(__dst, self->_data, self->_size);
  }
  return (float *)__dst;
}

- (const)at:(unint64_t)a3
{
  if (a3 >= self->_count) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], 0));
  }
  return &self->_data[a3];
}

- (float)mutableData
{
  if (!self->_data) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], 0));
  }
  return self->_data;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)description
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v4 = objc_msgSend(-[CBFloatArray copyNSArray](self, "copyNSArray"), "description");
  return v4;
}

- (id)copyNSArray
{
  unint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_count];
  for (unint64_t i = 0; i < self->_count - 1; ++i)
  {
    id v3 = objc_alloc(NSNumber);
    [(CBFloatArray *)self get:i];
    id v4 = (id)objc_msgSend(v3, "initWithFloat:");
    [v6 setObject:v4 atIndexedSubscript:i];
  }
  return v6;
}

@end