@interface _LTSELFLoggingInvocationOptions
+ (BOOL)supportsSecureCoding;
- (_LTSELFLoggingInvocationOptions)initWithCoder:(id)a3;
- (_LTSELFLoggingInvocationOptions)initWithTask:(int64_t)a3 inputMode:(int64_t)a4 invocationType:(int64_t)a5 translateAppContext:(id)a6;
- (_LTSELFLoggingTranslateAppContext)translateAppContext;
- (int64_t)inputMode;
- (int64_t)invocationType;
- (int64_t)task;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTSELFLoggingInvocationOptions

- (_LTSELFLoggingInvocationOptions)initWithTask:(int64_t)a3 inputMode:(int64_t)a4 invocationType:(int64_t)a5 translateAppContext:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_LTSELFLoggingInvocationOptions;
  v12 = [(_LTSELFLoggingInvocationOptions *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->_task = a3;
    v12->_inputMode = a4;
    v12->_invocationType = a5;
    objc_storeStrong((id *)&v12->_translateAppContext, a6);
    v14 = v13;
  }

  return v13;
}

- (_LTSELFLoggingInvocationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTSELFLoggingInvocationOptions;
  v5 = [(_LTSELFLoggingInvocationOptions *)&v10 init];
  if (v5)
  {
    v5->_task = [v4 decodeIntegerForKey:@"task"];
    v5->_inputMode = [v4 decodeIntegerForKey:@"inputMode"];
    v5->_invocationType = [v4 decodeIntegerForKey:@"invocationType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"translateAppContext"];
    translateAppContext = v5->_translateAppContext;
    v5->_translateAppContext = (_LTSELFLoggingTranslateAppContext *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t task = self->_task;
  id v5 = a3;
  [v5 encodeInteger:task forKey:@"task"];
  [v5 encodeInteger:self->_inputMode forKey:@"inputMode"];
  [v5 encodeInteger:self->_invocationType forKey:@"invocationType"];
  [v5 encodeObject:self->_translateAppContext forKey:@"translateAppContext"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)task
{
  return self->_task;
}

- (int64_t)inputMode
{
  return self->_inputMode;
}

- (int64_t)invocationType
{
  return self->_invocationType;
}

- (_LTSELFLoggingTranslateAppContext)translateAppContext
{
  return self->_translateAppContext;
}

- (void).cxx_destruct
{
}

@end