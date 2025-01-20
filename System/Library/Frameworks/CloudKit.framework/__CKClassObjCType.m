@interface __CKClassObjCType
- (__CKClassObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 class:(Class)a5;
- (id)className;
- (id)name;
@end

@implementation __CKClassObjCType

- (__CKClassObjCType)initWithCode:(int64_t)a3 encoding:(id)a4 class:(Class)a5
{
  v7.receiver = self;
  v7.super_class = (Class)__CKClassObjCType;
  result = [(__CKDynamicObjCType *)&v7 initWithCode:a3 encoding:a4];
  if (result) {
    result->_class = a5;
  }
  return result;
}

- (id)className
{
  return NSStringFromClass(self->_class);
}

- (id)name
{
  v4 = objc_msgSend_className(self, a2, v2, v3);
  objc_super v7 = objc_msgSend_stringByAppendingString_(v4, v5, @"*", v6);

  return v7;
}

@end