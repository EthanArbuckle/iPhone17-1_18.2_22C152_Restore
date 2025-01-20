@interface _GCDevicePhysicalInputElementsCollection
- (BOOL)allowsWeakReference;
- (_GCDevicePhysicalInputElementsCollection)retain;
- (id)elementAtIndex:(unint64_t)a3;
- (id)elementForAlias:(id)a3;
- (uint64_t)implementation;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation _GCDevicePhysicalInputElementsCollection

- (uint64_t)implementation
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (_GCDevicePhysicalInputElementsCollection)retain
{
  if (self) {
    implementation = self->_implementation;
  }
  else {
    implementation = 0;
  }
  v4 = implementation;
  return self;
}

- (void)release
{
  if (self) {
    self = (_GCDevicePhysicalInputElementsCollection *)self->_implementation;
  }
}

- (unint64_t)retainCount
{
  if (self) {
    self = (_GCDevicePhysicalInputElementsCollection *)self->_implementation;
  }
  return [(_GCDevicePhysicalInputElementsCollection *)self retainCount];
}

- (BOOL)allowsWeakReference
{
  return 0;
}

- (unint64_t)count
{
  if (self)
  {
    uint64_t v2 = *(void *)(self + 8);
    if (v2) {
      return *(void *)(v2 + 24);
    }
    else {
      return 0;
    }
  }
  return self;
}

- (id)elementAtIndex:(unint64_t)a3
{
  if (self) {
    self = (_GCDevicePhysicalInputElementsCollection *)self->_implementation;
  }
  return (id)-[_GCDevicePhysicalInputBase _elementAtIndex:]((uint64_t)self, a3);
}

- (id)elementForAlias:(id)a3
{
  if (self) {
    self = (_GCDevicePhysicalInputElementsCollection *)self->_implementation;
  }
  return (id)-[_GCDevicePhysicalInputBase _elementForAlias:]((uint64_t)self, (uint64_t)a3);
}

@end