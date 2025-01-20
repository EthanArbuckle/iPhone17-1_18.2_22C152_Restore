@interface HFStateDumpEntry
- (HFStateDumpBuilderContext)context;
- (NSString)name;
- (id)object;
- (unint64_t)options;
- (void)setContext:(id)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation HFStateDumpEntry

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (HFStateDumpBuilderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end