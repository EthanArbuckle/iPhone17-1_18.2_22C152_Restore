@interface ASSyncChangeInfo
- (BOOL)isDelete;
- (NSString)postAnchor;
- (SADomainObject)object;
- (id)description;
- (void)setIsDelete:(BOOL)a3;
- (void)setObject:(id)a3;
- (void)setPostAnchor:(id)a3;
@end

@implementation ASSyncChangeInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->postAnchor, 0);
  objc_storeStrong((id *)&self->object, 0);
}

- (void)setIsDelete:(BOOL)a3
{
  self->isDelete = a3;
}

- (BOOL)isDelete
{
  return self->isDelete;
}

- (void)setPostAnchor:(id)a3
{
}

- (NSString)postAnchor
{
  return self->postAnchor;
}

- (void)setObject:(id)a3
{
}

- (SADomainObject)object
{
  return self->object;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)ASSyncChangeInfo;
  v3 = [(ASSyncChangeInfo *)&v9 description];
  if ([(ASSyncChangeInfo *)self isDelete]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  v5 = [(ASSyncChangeInfo *)self postAnchor];
  v6 = [(ASSyncChangeInfo *)self object];
  v7 = [v3 stringByAppendingFormat:@" isDelete: %@, postAnchor: %@, change: %@", v4, v5, objc_opt_class()];

  return v7;
}

@end