@interface VNFgBgE5MLInputElement
- (NSString)name;
- (VNFgBgE5MLInputElement)initWithValueRef:(__IOSurface *)a3 name:(id)a4;
- (__IOSurface)valueRef;
- (void)dealloc;
@end

@implementation VNFgBgE5MLInputElement

- (void).cxx_destruct
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (__IOSurface)valueRef
{
  return self->_valueRef;
}

- (void)dealloc
{
  valueRef = self->_valueRef;
  if (valueRef)
  {
    CFRelease(valueRef);
    self->_valueRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNFgBgE5MLInputElement;
  [(VNFgBgE5MLInputElement *)&v4 dealloc];
}

- (VNFgBgE5MLInputElement)initWithValueRef:(__IOSurface *)a3 name:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNFgBgE5MLInputElement;
  v7 = [(VNFgBgE5MLInputElement *)&v11 init];
  if (v7)
  {
    v7->_valueRef = (__IOSurface *)CFRetain(a3);
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;
  }
  return v7;
}

@end