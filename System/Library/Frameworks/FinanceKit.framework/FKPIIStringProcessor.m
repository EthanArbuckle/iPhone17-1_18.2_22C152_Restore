@interface FKPIIStringProcessor
- (FKPIIStringProcessor)init;
- (id)redactFromString:(id)a3;
- (id)redactFromString:(id)a3 forCountryCodes:(id)a4;
@end

@implementation FKPIIStringProcessor

- (FKPIIStringProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKPIIStringProcessor;
  v2 = [(FKPIIStringProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[PIIStringProcessorWrapper makeProcessor];
    wrappedProcessor = v2->_wrappedProcessor;
    v2->_wrappedProcessor = (_TtC10FinanceKit25PIIStringProcessorWrapper *)v3;
  }
  return v2;
}

- (id)redactFromString:(id)a3
{
  return [(PIIStringProcessorWrapper *)self->_wrappedProcessor redactFromString:a3];
}

- (id)redactFromString:(id)a3 forCountryCodes:(id)a4
{
  return [(PIIStringProcessorWrapper *)self->_wrappedProcessor redactFromString:a3 forCountryCodes:a4];
}

- (void).cxx_destruct
{
}

@end