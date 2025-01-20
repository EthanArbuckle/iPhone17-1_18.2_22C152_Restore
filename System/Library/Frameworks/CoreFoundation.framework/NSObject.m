@interface NSObject
- (BOOL)isNSArray__;
- (BOOL)isNSCFConstantString__;
- (BOOL)isNSData__;
- (BOOL)isNSDate__;
- (BOOL)isNSDictionary__;
- (BOOL)isNSNumber__;
- (BOOL)isNSObject__;
- (BOOL)isNSOrderedSet__;
- (BOOL)isNSSet__;
- (BOOL)isNSString__;
- (BOOL)isNSTimeZone__;
- (BOOL)isNSURL__;
- (BOOL)isNSValue__;
@end

@implementation NSObject

- (BOOL)isNSObject__
{
  return 1;
}

- (BOOL)isNSOrderedSet__
{
  return 0;
}

- (BOOL)isNSNumber__
{
  return 0;
}

- (BOOL)isNSDictionary__
{
  return 0;
}

- (BOOL)isNSArray__
{
  return 0;
}

- (BOOL)isNSSet__
{
  return 0;
}

- (BOOL)isNSDate__
{
  return 0;
}

- (BOOL)isNSURL__
{
  return 0;
}

- (BOOL)isNSCFConstantString__
{
  return 0;
}

- (BOOL)isNSString__
{
  return 0;
}

- (BOOL)isNSData__
{
  return 0;
}

- (BOOL)isNSValue__
{
  return 0;
}

- (BOOL)isNSTimeZone__
{
  return 0;
}

@end