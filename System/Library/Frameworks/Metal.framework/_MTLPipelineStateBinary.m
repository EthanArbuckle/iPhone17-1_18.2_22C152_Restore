@interface _MTLPipelineStateBinary
- (NSData)binary;
- (_MTLPipelineStateBinary)initWithBinary:(id)a3 uniqueIdentifier:(unint64_t)a4;
- (_MTLPipelineStateBinary)initWithBinary:(id)a3 uniqueIdentifier:(unint64_t)a4 debugIdentifier:(unint64_t)a5;
- (unint64_t)debugIdentifier;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
@end

@implementation _MTLPipelineStateBinary

- (NSData)binary
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (_MTLPipelineStateBinary)initWithBinary:(id)a3 uniqueIdentifier:(unint64_t)a4
{
  self->_binary = (NSData *)a3;
  self->_uniqueIdentifier = a4;
  return self;
}

- (_MTLPipelineStateBinary)initWithBinary:(id)a3 uniqueIdentifier:(unint64_t)a4 debugIdentifier:(unint64_t)a5
{
  self->_binary = (NSData *)a3;
  self->_uniqueIdentifier = a4;
  self->_debugIdentifier = a5;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLPipelineStateBinary;
  [(_MTLPipelineStateBinary *)&v3 dealloc];
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)debugIdentifier
{
  return self->_debugIdentifier;
}

@end