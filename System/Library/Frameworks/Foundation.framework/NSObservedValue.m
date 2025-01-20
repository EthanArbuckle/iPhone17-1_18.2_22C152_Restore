@interface NSObservedValue
- (BOOL)_isToManyChangeInformation;
- (BOOL)finished;
- (NSError)error;
- (id)copyToHeap;
- (id)debugDescription;
- (id)value;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation NSObservedValue

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSObservedValue;
  [(NSObservedValue *)&v3 dealloc];
}

- (void)setValue:(id)a3
{
  self->_tag = 1;
  id contents = self->_contents;
  if (contents != a3)
  {

    self->_id contents = a3;
  }
}

- (id)value
{
  if (self->_tag == 1) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setError:(id)a3
{
  self->_tag = 2;
  id contents = self->_contents;
  if (contents != a3)
  {

    self->_id contents = a3;
  }
}

- (NSError)error
{
  if (self->_tag == 2) {
    return (NSError *)self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setFinished:(BOOL)a3
{
  self->_tag = 3;

  self->_id contents = (id)*MEMORY[0x1E4F1CFD0];
}

- (BOOL)finished
{
  return self->_tag == 3;
}

- (BOOL)_isToManyChangeInformation
{
  return [self->_contents _isToManyChangeInformation];
}

- (id)debugDescription
{
  int tag = self->_tag;
  if (tag == 2) {
    return +[NSString stringWithFormat:@"Error %@ in observed value %p", self->_contents, self];
  }
  if (tag != 1) {
    return +[NSString stringWithFormat:@"Invalid observed value: %p", self, v6];
  }
  if ([(NSObservedValue *)self _isToManyChangeInformation]) {
    uint64_t v4 = @"To-many collection changes %@ in observed value %p";
  }
  else {
    uint64_t v4 = @"Value %@ in observed value wrapper %p";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, self->_contents, self);
}

- (id)copyToHeap
{
  if (qword_1EB1ED2E8 != -1) {
    dispatch_once(&qword_1EB1ED2E8, &__block_literal_global_13_0);
  }
  Instance = class_createInstance((Class)qword_1EB1ED2E0, 0);
  Instance[6] = self->_tag;
  *((void *)Instance + 1) = self->_contents;
  return Instance;
}

uint64_t __29__NSObservedValue_copyToHeap__block_invoke()
{
  uint64_t result = objc_opt_class();
  qword_1EB1ED2E0 = result;
  return result;
}

@end