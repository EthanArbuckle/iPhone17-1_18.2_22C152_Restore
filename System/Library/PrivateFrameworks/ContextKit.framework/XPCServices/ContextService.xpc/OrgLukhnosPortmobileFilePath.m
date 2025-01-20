@interface OrgLukhnosPortmobileFilePath
- (BOOL)isAbsolute;
- (OrgLukhnosPortmobileFilePath)initWithJavaIoFile:(id)a3;
- (OrgLukhnosPortmobileFilePath)initWithNSString:(id)a3;
- (id)description;
- (id)getFileName;
- (id)getParent;
- (id)resolveWithNSString:(id)a3;
- (id)toAbsolutePath;
- (id)toFile;
- (void)dealloc;
@end

@implementation OrgLukhnosPortmobileFilePath

- (OrgLukhnosPortmobileFilePath)initWithNSString:(id)a3
{
  p_file = &self->file_;
  v5 = new_JavaIoFile_initWithNSString_(a3);
  JreStrongAssignAndConsume((id *)p_file, v5);
  return self;
}

- (OrgLukhnosPortmobileFilePath)initWithJavaIoFile:(id)a3
{
  return self;
}

- (id)toFile
{
  return self->file_;
}

- (id)getFileName
{
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  v3 = new_OrgLukhnosPortmobileFilePath_initWithNSString_([(JavaIoFile *)file getName]);
  return v3;
}

- (id)description
{
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  return [(JavaIoFile *)file description];
}

- (id)resolveWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ([a3 isEmpty]) {
    return self;
  }
  v6 = new_JavaIoFile_initWithNSString_(a3);
  if (![(JavaIoFile *)v6 isAbsolute]) {
    v6 = new_JavaIoFile_initWithJavaIoFile_withNSString_(self->file_, a3);
  }
  v7 = [OrgLukhnosPortmobileFilePath alloc];
  JreStrongAssign((id *)&v7->file_, v6);
  return v7;
}

- (BOOL)isAbsolute
{
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  return [(JavaIoFile *)file isAbsolute];
}

- (id)toAbsolutePath
{
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaIoFile *)file getAbsoluteFile];
  v4 = [OrgLukhnosPortmobileFilePath alloc];
  JreStrongAssign((id *)&v4->file_, v3);
  return v4;
}

- (id)getParent
{
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  id v3 = new_OrgLukhnosPortmobileFilePath_initWithNSString_([(JavaIoFile *)file getParent]);
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgLukhnosPortmobileFilePath;
  [(OrgLukhnosPortmobileFilePath *)&v3 dealloc];
}

@end