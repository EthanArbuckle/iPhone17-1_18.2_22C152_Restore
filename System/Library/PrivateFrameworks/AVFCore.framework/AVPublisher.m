@interface AVPublisher
+ (void)initialize;
- (AVPublisher)init;
- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4;
- (void)dealloc;
@end

@implementation AVPublisher

- (AVPublisher)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVPublisher;
  return [(AVPublisher *)&v3 init];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVPublisher;
  [(AVPublisher *)&v2 dealloc];
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
  return 0;
}

@end