@interface ComponentMotionCoprocessor
- (BOOL)isPresent;
- (id)motionCoprocessorServiceName;
@end

@implementation ComponentMotionCoprocessor

- (BOOL)isPresent
{
  v3 = [(ComponentMotionCoprocessor *)self motionCoprocessorServiceName];
  if ([v3 isEqualToString:@"aop"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    v5 = [(ComponentMotionCoprocessor *)self motionCoprocessorServiceName];
    unsigned __int8 v4 = [v5 isEqualToString:@"SPUApp"];
  }
  return v4;
}

- (id)motionCoprocessorServiceName
{
  if (!qword_1000BE118)
  {
    CFStringRef v2 = @"aop";
    if (findDeviceWithName((unsigned __int8 *)[@"aop" UTF8String])
      || (CFStringRef v2 = @"SPUApp", findDeviceWithName((unsigned __int8 *)[@"SPUApp" UTF8String])))
    {
      v3 = (void *)qword_1000BE118;
      qword_1000BE118 = (uint64_t)v2;
    }
  }
  unsigned __int8 v4 = (void *)qword_1000BE118;

  return v4;
}

@end