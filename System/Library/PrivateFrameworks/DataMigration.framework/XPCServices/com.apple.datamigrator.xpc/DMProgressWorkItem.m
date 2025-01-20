@interface DMProgressWorkItem
- (DMProgressWorkItem)initWithName:(id)a3 startTimestamp:(unint64_t)a4;
- (NSString)name;
- (unint64_t)startTimestamp;
@end

@implementation DMProgressWorkItem

- (DMProgressWorkItem)initWithName:(id)a3 startTimestamp:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMProgressWorkItem;
  v7 = [(DMProgressWorkItem *)&v11 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    name = v7->_name;
    v7->_name = v8;

    v7->_startTimestamp = a4;
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void).cxx_destruct
{
}

@end