@interface CSAttendingStopHintInfo
- (CSAttendingStopHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4;
- (id)_reasonString;
- (id)description;
- (unint64_t)reason;
@end

@implementation CSAttendingStopHintInfo

- (unint64_t)reason
{
  return self->_reason;
}

- (id)description
{
  v3 = +[NSMutableString string];
  v7.receiver = self;
  v7.super_class = (Class)CSAttendingStopHintInfo;
  v4 = [(CSAttendingHintInfo *)&v7 description];
  [v3 appendFormat:@"%@", v4];
  v5 = [(CSAttendingStopHintInfo *)self _reasonString];
  [v3 appendFormat:@"[reason: %@]", v5];

  return v3;
}

- (id)_reasonString
{
  unint64_t v2 = self->_reason - 1;
  if (v2 > 5) {
    return @"Unknown";
  }
  else {
    return *(&off_1002520A8 + v2);
  }
}

- (CSAttendingStopHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttendingStopHintInfo;
  result = [(CSAttendingHintInfo *)&v6 initWithOrigin:a3];
  if (result) {
    result->_reason = a4;
  }
  return result;
}

@end