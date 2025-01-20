@interface CSAttendingHintInfo
- (CSAttendingHintInfo)initWithOrigin:(unint64_t)a3;
- (NSString)originString;
- (id)_originString;
- (id)description;
- (unint64_t)origin;
@end

@implementation CSAttendingHintInfo

- (void).cxx_destruct
{
}

- (NSString)originString
{
  return self->_originString;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (id)description
{
  v3 = +[NSMutableString string];
  v4 = [(CSAttendingHintInfo *)self _originString];
  [v3 appendFormat:@"[origin: %@]", v4];

  return v3;
}

- (id)_originString
{
  unint64_t origin = self->_origin;
  CFStringRef v3 = @"Unknown";
  if (origin == 2) {
    CFStringRef v3 = @"StatesProvidingProxy";
  }
  if (origin == 1) {
    return @"IntuitiveConvRequestHandler";
  }
  else {
    return (id)v3;
  }
}

- (CSAttendingHintInfo)initWithOrigin:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSAttendingHintInfo;
  result = [(CSAttendingHintInfo *)&v5 init];
  if (result) {
    result->_unint64_t origin = a3;
  }
  return result;
}

@end