@interface GDFeedbackService
- (BOOL)recordFeedback:(id)a3 error:(id *)a4;
- (BOOL)recordFeedback:(id)a3 forEvent:(int64_t)a4 error:(id *)a5;
- (GDFeedbackService)init;
@end

@implementation GDFeedbackService

- (void).cxx_destruct
{
}

- (BOOL)recordFeedback:(id)a3 forEvent:(int64_t)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self->_inner, sel_objcRecordWithFeedback_for_error_, a3, a4, a5);
}

- (BOOL)recordFeedback:(id)a3 error:(id *)a4
{
  return ((uint64_t (*)(GDFeedbackServiceInner *, char *, id, id *))MEMORY[0x1F4181798])(self->_inner, sel_objcRecordWithFeedback_error_, a3, a4);
}

- (GDFeedbackService)init
{
  v6.receiver = self;
  v6.super_class = (Class)GDFeedbackService;
  v2 = [(GDFeedbackService *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(GDFeedbackServiceInner);
    inner = v2->_inner;
    v2->_inner = v3;
  }
  return v2;
}

@end