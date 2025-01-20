@interface MissingPermissionABCIssue
+ (void)reportPermission:(int)a3 client:(id)a4 forReporter:(id)a5;
- (MissingPermissionABCIssue)initWithPermission:(int)a3 client:(id)a4 forReporter:(id)a5;
- (id)context;
- (id)tag;
- (int)permission;
- (unint64_t)abcReason;
- (void)setPermission:(int)a3;
@end

@implementation MissingPermissionABCIssue

- (MissingPermissionABCIssue)initWithPermission:(int)a3 client:(id)a4 forReporter:(id)a5
{
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)MissingPermissionABCIssue;
  v6 = [(EntitlementABCIssue *)&v9 initWithClient:a4 forReporter:a5];
  v7 = v6;
  if (v6) {
    [(MissingPermissionABCIssue *)v6 setPermission:v5];
  }
  return v7;
}

+ (void)reportPermission:(int)a3 client:(id)a4 forReporter:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v11 = a4;
  id v7 = a5;
  v8 = [NSString stringWithFormat:@"MissingPermissionABCIssue/%@/%d", v11, v6];
  objc_super v9 = [v7 issueForTag:v8];

  if (!v9)
  {
    v10 = [[MissingPermissionABCIssue alloc] initWithPermission:v6 client:v11 forReporter:v7];
    [v7 addIssue:v10];
    [(EntitlementABCIssue *)v10 report];
    [v7 rescheduleTimer];
  }
}

- (id)tag
{
  v3 = NSString;
  v4 = [(EntitlementABCIssue *)self clientName];
  uint64_t v5 = [v3 stringWithFormat:@"MissingPermissionABCIssue/%@/%d", v4, -[MissingPermissionABCIssue permission](self, "permission")];

  return v5;
}

- (unint64_t)abcReason
{
  return 4101;
}

- (id)context
{
  v3 = NSString;
  v4 = [(EntitlementABCIssue *)self clientName];
  uint64_t v5 = [v3 stringWithFormat:@"clientName=%@,permission=%d", v4, -[MissingPermissionABCIssue permission](self, "permission")];

  return v5;
}

- (int)permission
{
  return self->_permission;
}

- (void)setPermission:(int)a3
{
  self->_permission = a3;
}

@end