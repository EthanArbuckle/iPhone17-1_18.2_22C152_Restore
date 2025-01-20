@interface _CFPrefsPendingKVONotification
- (id)oldValues;
- (id)source;
- (id)values;
- (void)dealloc;
- (void)setOldValues:(void *)a1;
- (void)setSource:(void *)a1;
- (void)setValues:(void *)a1;
@end

@implementation _CFPrefsPendingKVONotification

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)_CFPrefsPendingKVONotification;
  [(_CFPrefsPendingKVONotification *)&v3 dealloc];
}

- (void)setValues:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 24);
  }
}

- (void)setSource:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 8);
  }
}

- (void)setOldValues:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 16);
  }
}

- (id)source
{
  if (result) {
    return objc_getProperty(result, a2, 8, 1);
  }
  return result;
}

- (id)oldValues
{
  if (result) {
    return objc_getProperty(result, a2, 16, 1);
  }
  return result;
}

- (id)values
{
  if (result) {
    return objc_getProperty(result, a2, 24, 1);
  }
  return result;
}

@end