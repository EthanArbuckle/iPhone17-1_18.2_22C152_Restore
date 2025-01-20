@interface NSMetadataQueryAttributeValueTuple
- (NSString)attribute;
- (NSUInteger)count;
- (id)_init:(id)a3 attribute:(id)a4 value:(id)a5 count:(unint64_t)a6;
- (id)value;
- (void)dealloc;
@end

@implementation NSMetadataQueryAttributeValueTuple

- (id)_init:(id)a3 attribute:(id)a4 value:(id)a5 count:(unint64_t)a6
{
  self->_attr = a4;
  self->_value = a5;
  self->_count = a6;
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMetadataQueryAttributeValueTuple;
  [(NSMetadataQueryAttributeValueTuple *)&v3 dealloc];
}

- (NSString)attribute
{
  id v2 = self->_attr;

  return (NSString *)v2;
}

- (id)value
{
  id v2 = self->_value;

  return v2;
}

- (NSUInteger)count
{
  return self->_count;
}

@end