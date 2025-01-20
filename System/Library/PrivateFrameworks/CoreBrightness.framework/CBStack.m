@interface CBStack
- (CBStack)init;
- (CBStack)initWithLength:(unint64_t)a3;
- (NSMutableArray)stack;
- (id)objectToPop;
- (id)popObj;
- (unint64_t)length;
- (void)clear;
- (void)dealloc;
- (void)printStack;
- (void)pushObj:(id)a3;
- (void)setLength:(unint64_t)a3;
@end

@implementation CBStack

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)pushObj:(id)a3
{
}

- (id)popObj
{
  id v4 = (id)-[NSMutableArray objectAtIndex:](self->_stack, "objectAtIndex:");
  id v2 = v4;
  [(NSMutableArray *)self->_stack removeObjectAtIndex:0];
  --self->_length;
  return v4;
}

- (CBStack)init
{
  return 0;
}

- (CBStack)initWithLength:(unint64_t)a3
{
  v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CBStack;
  v10 = [(CBStack *)&v7 init];
  if (v10)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBStack", "default");
    v10->_logHandle = (OS_os_log *)v3;
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [v4 initWithCapacity:v8];
    v10->_stack = (NSMutableArray *)v5;
    v10->_length = v8;
  }
  return v10;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  if (self->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBStack;
  [(CBStack *)&v2 dealloc];
}

- (void)clear
{
}

- (void)printStack
{
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (id)objectToPop
{
  return self->_objectToPop;
}

@end