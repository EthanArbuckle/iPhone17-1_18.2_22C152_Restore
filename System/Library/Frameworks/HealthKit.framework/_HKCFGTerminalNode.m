@interface _HKCFGTerminalNode
+ (id)nodeWithValue:(id)a3 rangeOfString:(_NSRange)a4;
- (id)evaluate;
@end

@implementation _HKCFGTerminalNode

+ (id)nodeWithValue:(id)a3 rangeOfString:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithRangeOfString:", location, length);
  v9 = (void *)v8[3];
  v8[3] = v7;

  return v8;
}

- (void).cxx_destruct
{
}

- (id)evaluate
{
  return self->_value;
}

@end