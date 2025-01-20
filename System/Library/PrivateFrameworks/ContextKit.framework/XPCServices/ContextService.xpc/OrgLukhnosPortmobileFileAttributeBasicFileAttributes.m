@interface OrgLukhnosPortmobileFileAttributeBasicFileAttributes
- (OrgLukhnosPortmobileFileAttributeBasicFileAttributes)init;
- (OrgLukhnosPortmobileFileAttributeBasicFileAttributes)initWithJavaIoFile:(id)a3;
- (id)creationTime;
- (void)dealloc;
@end

@implementation OrgLukhnosPortmobileFileAttributeBasicFileAttributes

- (OrgLukhnosPortmobileFileAttributeBasicFileAttributes)initWithJavaIoFile:(id)a3
{
  return self;
}

- (OrgLukhnosPortmobileFileAttributeBasicFileAttributes)init
{
  return self;
}

- (id)creationTime
{
  file = self->file_;
  if (file) {
    file = [(JavaIoFile *)file lastModified];
  }
  v3 = new_OrgLukhnosPortmobileFileAttributeFileTime_initWithLong_((int64_t)file);
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgLukhnosPortmobileFileAttributeBasicFileAttributes;
  [(OrgLukhnosPortmobileFileAttributeBasicFileAttributes *)&v3 dealloc];
}

@end