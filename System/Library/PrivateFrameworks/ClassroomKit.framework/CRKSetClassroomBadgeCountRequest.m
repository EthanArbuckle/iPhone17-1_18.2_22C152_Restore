@interface CRKSetClassroomBadgeCountRequest
+ (BOOL)supportsSecureCoding;
- (CRKSetClassroomBadgeCountRequest)initWithCoder:(id)a3;
- (int64_t)badgeCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBadgeCount:(int64_t)a3;
@end

@implementation CRKSetClassroomBadgeCountRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetClassroomBadgeCountRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKSetClassroomBadgeCountRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"badgeCount"];
    v5->_badgeCount = [v6 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKSetClassroomBadgeCountRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKSetClassroomBadgeCountRequest badgeCount](self, "badgeCount", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"badgeCount"];
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

@end