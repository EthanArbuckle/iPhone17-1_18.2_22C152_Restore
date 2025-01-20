@interface LibcoreIoDeleteOnExit
+ (const)__metadata;
- (LibcoreIoDeleteOnExit)init;
- (void)addFileWithNSString:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation LibcoreIoDeleteOnExit

- (LibcoreIoDeleteOnExit)init
{
  JavaLangThread_init((uint64_t)self);
  v3 = new_JavaUtilArrayList_init();
  JreStrongAssignAndConsume((id *)&self->files_, v3);
  return self;
}

- (void)addFileWithNSString:(id)a3
{
  files = self->files_;
  objc_sync_enter(files);
  v6 = self->files_;
  if (!v6) {
    JreThrowNullPointerException();
  }
  if (![(JavaUtilArrayList *)v6 containsWithId:a3]) {
    [(JavaUtilArrayList *)self->files_ addWithId:a3];
  }
  objc_sync_exit(files);
}

- (void)run
{
  JavaUtilCollections_sortWithJavaUtilList_(self->files_);
  files = self->files_;
  if (!files) {
    JreThrowNullPointerException();
  }
  unsigned int v4 = [(JavaUtilArrayList *)files size];
  uint64_t v5 = v4 - 1;
  if ((int)(v4 - 1) >= 0)
  {
    do
    {
      [new_JavaIoFile_initWithNSString_([(JavaUtilArrayList *)self->files_ getWithInt:v5]) delete];
      uint64_t v5 = (v5 - 1);
    }
    while (v5 != -1);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreIoDeleteOnExit;
  [(JavaLangThread *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100458598;
}

@end