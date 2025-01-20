@interface NSKeyValueAccessor
- (NSKeyValueAccessor)initWithContainerClassID:(id)a3 key:(id)a4 implementation:(void *)a5 selector:(SEL)a6 extraArguments:(void *)a7[3] count:(unint64_t)a8;
- (SEL)selector;
- (id)containerClassID;
- (id)key;
- (unint64_t)extraArgumentCount;
- (void)dealloc;
- (void)extraArgument1;
- (void)extraArgument2;
@end

@implementation NSKeyValueAccessor

- (id)key
{
  return self->_key;
}

- (NSKeyValueAccessor)initWithContainerClassID:(id)a3 key:(id)a4 implementation:(void *)a5 selector:(SEL)a6 extraArguments:(void *)a7[3] count:(unint64_t)a8
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)NSKeyValueAccessor;
  v14 = [(NSKeyValueAccessor *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_containerClassID = a3;
    CFHashCode v16 = [a4 copy];
    v15->_key = (NSString *)v16;
    v15->_implementation = a5;
    if (a6) {
      SEL v17 = a6;
    }
    else {
      SEL v17 = 0;
    }
    v15->_selector = v17;
    if (v16) {
      CFHashCode v16 = CFHash((CFTypeRef)v16);
    }
    v15->_hash = v16 ^ (unint64_t)a3;
    v15->_extraArgumentCount = a8;
    key = *a7;
    if (*a7 == a4) {
      key = v15->_key;
    }
    v15->_extraArgument1 = key;
    v19 = (NSString *)a7[1];
    if (v19 == a4) {
      v19 = v15->_key;
    }
    v15->_extraArgument2 = v19;
    v15->_extraArgument3 = a7[2];
  }
  return v15;
}

- (void)extraArgument2
{
  return self->_extraArgument2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueAccessor;
  [(NSKeyValueAccessor *)&v3 dealloc];
}

- (id)containerClassID
{
  return self->_containerClassID;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (unint64_t)extraArgumentCount
{
  return self->_extraArgumentCount;
}

- (void)extraArgument1
{
  return self->_extraArgument1;
}

@end