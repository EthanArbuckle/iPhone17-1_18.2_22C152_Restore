@interface fp_task_tracker
- (void)dealloc;
@end

@implementation fp_task_tracker

- (void)dealloc
{
  free(self->label);
  v3.receiver = self;
  v3.super_class = (Class)fp_task_tracker;
  [(fp_task_tracker *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end