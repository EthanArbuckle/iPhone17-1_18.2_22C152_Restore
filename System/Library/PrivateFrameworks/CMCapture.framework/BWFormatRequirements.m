@interface BWFormatRequirements
- (BOOL)isEmpty;
- (BWFormatRequirements)init;
- (Class)formatClass;
- (unsigned)mediaType;
@end

@implementation BWFormatRequirements

- (BOOL)isEmpty
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  return [(BWFormatRequirements *)self isEqual:v3];
}

- (BWFormatRequirements)init
{
  if ([(BWFormatRequirements *)self isMemberOfClass:objc_opt_class()])
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"BWFormatRequirements is an abstract base class, you can't instantiate it directly", 0 reason userInfo]);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWFormatRequirements;
  return [(BWFormatRequirements *)&v4 init];
}

- (unsigned)mediaType
{
  return 0;
}

- (Class)formatClass
{
  if (![(BWFormatRequirements *)self isMemberOfClass:objc_opt_class()]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], @"BWFormatRequirements is an abstract base class, subclasses must implement formatClass", 0 reason userInfo]);
  }
  return (Class)objc_opt_class();
}

@end