@interface OrgLukhnosPortmobileFileDirectoryStream_SimpleDirectoryStream
- (OrgLukhnosPortmobileFileDirectoryStream_SimpleDirectoryStream)initWithJavaUtilList:(id)a3;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgLukhnosPortmobileFileDirectoryStream_SimpleDirectoryStream

- (OrgLukhnosPortmobileFileDirectoryStream_SimpleDirectoryStream)initWithJavaUtilList:(id)a3
{
  return self;
}

- (id)iterator
{
  paths = self->paths_;
  if (!paths) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)paths iterator];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgLukhnosPortmobileFileDirectoryStream_SimpleDirectoryStream;
  [(OrgLukhnosPortmobileFileDirectoryStream_SimpleDirectoryStream *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end