@interface OrgLukhnosPortmobileFileAttributeFileTime
+ (id)fromMillisWithLong:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (OrgLukhnosPortmobileFileAttributeFileTime)initWithLong:(int64_t)a3;
- (int)compareToWithId:(id)a3;
@end

@implementation OrgLukhnosPortmobileFileAttributeFileTime

- (OrgLukhnosPortmobileFileAttributeFileTime)initWithLong:(int64_t)a3
{
  self->time_ = a3;
  return self;
}

+ (id)fromMillisWithLong:(int64_t)a3
{
  v4 = [OrgLukhnosPortmobileFileAttributeFileTime alloc];
  v4->time_ = a3;
  return v4;
}

- (NSString)description
{
  return (NSString *)JavaLangLong_toStringWithLong_(self->time_);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  return [(OrgLukhnosPortmobileFileAttributeFileTime *)self compareToWithId:a3] == 0;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int64_t v5 = *((void *)a3 + 1);
  int64_t time = self->time_;
  BOOL v7 = v5 < time;
  BOOL v8 = v5 != time;
  if (v7) {
    return -1;
  }
  else {
    return v8;
  }
}

@end