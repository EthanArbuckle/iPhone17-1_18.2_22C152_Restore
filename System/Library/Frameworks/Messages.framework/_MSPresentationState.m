@interface _MSPresentationState
+ (BOOL)isRunningInCameraContext;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_MSPresentationState)init;
- (_MSPresentationState)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)presentationContext;
- (unint64_t)presentationStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setPresentationStyle:(unint64_t)a3;
@end

@implementation _MSPresentationState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isRunningInCameraContext
{
  if (isRunningInCameraContext_onceToken != -1) {
    dispatch_once(&isRunningInCameraContext_onceToken, &__block_literal_global_1);
  }
  return isRunningInCameraContext_isRunningInCameraContext;
}

- (_MSPresentationState)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MSPresentationState;
  v2 = [(_MSPresentationState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_presentationStyle = 0;
    if ([(id)objc_opt_class() isRunningInCameraContext])
    {
      uint64_t v4 = 1;
    }
    else
    {
      if (!IMIsRunningIniMessageAppsViewService())
      {
        v3->_presentationContext = 0;
        return v3;
      }
      uint64_t v4 = 2;
    }
    v3->_presentationContext = v4;
  }
  return v3;
}

- (_MSPresentationState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_MSPresentationState;
  v5 = [(_MSPresentationState *)&v7 init];
  if (v5)
  {
    v5->_presentationStyle = [v4 decodeIntegerForKey:@"presentationStyle"];
    v5->_presentationContext = [v4 decodeIntegerForKey:@"pContext"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t presentationStyle = self->_presentationStyle;
  id v5 = a3;
  [v5 encodeInteger:presentationStyle forKey:@"presentationStyle"];
  [v5 encodeInteger:self->_presentationContext forKey:@"pContext"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_MSPresentationState *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_MSPresentationState;
    if ([(_MSPresentationState *)&v10 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = v4;
      unint64_t presentationStyle = self->_presentationStyle;
      if (presentationStyle == [(_MSPresentationState *)v5 presentationStyle])
      {
        unint64_t presentationContext = self->_presentationContext;
        BOOL v8 = presentationContext == [(_MSPresentationState *)v5 presentationContext];
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
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_presentationContext + self->_presentationStyle;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_unint64_t presentationStyle = a3;
}

- (unint64_t)presentationContext
{
  return self->_presentationContext;
}

@end