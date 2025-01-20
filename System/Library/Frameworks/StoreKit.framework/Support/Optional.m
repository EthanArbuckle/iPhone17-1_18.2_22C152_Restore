@interface Optional
+ (id)optionalWithNone;
+ (id)optionalWithSome:(id)a3;
- (BOOL)hasValue;
- (id)value;
- (id)valueOr:(id)value;
@end

@implementation Optional

+ (id)optionalWithNone
{
  if (qword_1003A0040 != -1) {
    dispatch_once(&qword_1003A0040, &stru_100359AE0);
  }
  v2 = (void *)qword_1003A0048;

  return v2;
}

+ (id)optionalWithSome:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  *(unsigned char *)(v4 + 8) = 1;
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  return (id)v4;
}

- (id)valueOr:(id)value
{
  if (self->_hasValue) {
    value = self->_value;
  }
  return value;
}

- (BOOL)hasValue
{
  return self->_hasValue;
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end