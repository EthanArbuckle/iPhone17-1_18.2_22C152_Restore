@interface CNVirtualReaderWriterScheduler
- (CNSuspendableSchedulerDecorator)scheduler;
- (CNVirtualReaderWriterScheduler)init;
- (CNVirtualReaderWriterScheduler)initWithScheduler:(id)a3;
- (id)performReaderBlock:(id)a3;
- (id)performWriterBlock:(id)a3;
- (void)performSynchronousReaderBlock:(id)a3;
- (void)performSynchronousWriterBlock:(id)a3;
- (void)resume;
- (void)suspend;
@end

@implementation CNVirtualReaderWriterScheduler

- (CNVirtualReaderWriterScheduler)init
{
  v3 = +[CNScheduler immediateScheduler];
  v4 = [(CNVirtualReaderWriterScheduler *)self initWithScheduler:v3];

  return v4;
}

- (CNVirtualReaderWriterScheduler)initWithScheduler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNVirtualReaderWriterScheduler;
  v5 = [(CNVirtualReaderWriterScheduler *)&v10 init];
  if (v5)
  {
    uint64_t v6 = +[CNSuspendableSchedulerDecorator resumedSchedulerWithScheduler:v4];
    scheduler = v5->_scheduler;
    v5->_scheduler = (CNSuspendableSchedulerDecorator *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)performReaderBlock:(id)a3
{
  id v4 = a3;
  v5 = [(CNVirtualReaderWriterScheduler *)self scheduler];
  uint64_t v6 = [v5 performCancelableBlock:v4];

  return v6;
}

- (id)performWriterBlock:(id)a3
{
  id v4 = a3;
  v5 = [(CNVirtualReaderWriterScheduler *)self scheduler];
  uint64_t v6 = [v5 performCancelableBlock:v4];

  return v6;
}

- (void)performSynchronousReaderBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVirtualReaderWriterScheduler *)self scheduler];
  [v5 performBlock:v4];
}

- (void)performSynchronousWriterBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CNVirtualReaderWriterScheduler *)self scheduler];
  [v5 performBlock:v4];
}

- (void)suspend
{
  id v2 = [(CNVirtualReaderWriterScheduler *)self scheduler];
  [v2 suspend];
}

- (void)resume
{
  id v2 = [(CNVirtualReaderWriterScheduler *)self scheduler];
  [v2 resume];
}

- (CNSuspendableSchedulerDecorator)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
}

@end