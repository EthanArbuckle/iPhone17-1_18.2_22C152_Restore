@interface PasscodeViewStyle
+ (id)darkStyleWithBackgroundStyle:(int64_t)a3;
+ (id)lightStyleWithBackgroundStyle:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (PasscodeViewStyle)initWithRawValue:(int64_t)a3 backgroundStyle:(int64_t)a4;
- (int64_t)backgroundStyle;
- (int64_t)rawValue;
@end

@implementation PasscodeViewStyle

- (PasscodeViewStyle)initWithRawValue:(int64_t)a3 backgroundStyle:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PasscodeViewStyle;
  result = [(PasscodeViewStyle *)&v7 init];
  if (result)
  {
    result->_rawValue = a3;
    result->_backgroundStyle = a4;
  }
  return result;
}

+ (id)darkStyleWithBackgroundStyle:(int64_t)a3
{
  v3 = [[PasscodeViewStyle alloc] initWithRawValue:0 backgroundStyle:a3];

  return v3;
}

+ (id)lightStyleWithBackgroundStyle:(int64_t)a3
{
  v3 = [[PasscodeViewStyle alloc] initWithRawValue:1 backgroundStyle:a3];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PasscodeViewStyle *)self rawValue];
    if (v6 == [v5 rawValue])
    {
      id v7 = [(PasscodeViewStyle *)self backgroundStyle];
      BOOL v8 = v7 == [v5 backgroundStyle];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

@end