@interface NSISInlineStorageVariable
- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3;
- (BOOL)shouldBeMinimized;
- (BOOL)valueIsUserObservable;
- (NSISInlineStorageVariable)initWithCoder:(id)a3;
- (NSString)name;
- (id)markedConstraint;
- (int)nsis_orientationHintForVariable:(id)a3;
- (int)valueRestriction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setShouldBeMinimized:(BOOL)a3;
- (void)setValueIsUserObservable:(BOOL)a3;
- (void)setValueRestriction:(int)a3;
@end

@implementation NSISInlineStorageVariable

- (int)valueRestriction
{
  return self->_valueRestriction;
}

- (int)nsis_orientationHintForVariable:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSISInlineStorageVariable;
  [(NSISVariable *)&v3 dealloc];
}

- (id)markedConstraint
{
  return 0;
}

- (void)setValueRestriction:(int)a3
{
  self->_valueRestriction = a3;
}

- (void)setValueIsUserObservable:(BOOL)a3
{
  self->_valueIsUserObservable = a3;
}

- (void)setShouldBeMinimized:(BOOL)a3
{
  self->_shouldBeMinimized = a3;
}

- (void)setName:(id)a3
{
}

- (NSISInlineStorageVariable)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSISInlineStorageVariable;
  v4 = -[NSISVariable initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"NSISVariable_name"), "copy");
    int v5 = [a3 containsValueForKey:@"NSISVariable_valueRestriction"];
    if (v5) {
      int v5 = [a3 decodeIntegerForKey:@"NSISVariable_valueRestriction"];
    }
    v4->_valueRestriction = v5;
    v4->_shouldBeMinimized = [a3 decodeBoolForKey:@"NSISVariable_shouldBeMinimized"];
    v4->_valueIsUserObservable = [a3 decodeBoolForKey:@"NSISVariable_valueIsUserObservable"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSISInlineStorageVariable;
  -[NSISVariable encodeWithCoder:](&v7, sel_encodeWithCoder_);
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"NSISVariable_name"];
  }
  uint64_t valueRestriction = self->_valueRestriction;
  if (valueRestriction) {
    [a3 encodeInteger:valueRestriction forKey:@"NSISVariable_valueRestriction"];
  }
  if (self->_shouldBeMinimized) {
    [a3 encodeBool:1 forKey:@"NSISVariable_shouldBeMinimized"];
  }
  if (self->_valueIsUserObservable) {
    [a3 encodeBool:1 forKey:@"NSISVariable_valueIsUserObservable"];
  }
}

- (BOOL)nsis_valueOfVariableIsUserObservable:(id)a3
{
  return self->_valueIsUserObservable;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)shouldBeMinimized
{
  return self->_shouldBeMinimized;
}

- (BOOL)valueIsUserObservable
{
  return self->_valueIsUserObservable;
}

@end