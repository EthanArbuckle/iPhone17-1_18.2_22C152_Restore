@interface _GCDevicePhysicalInputChangedElementsEnumerator
- (_GCDevicePhysicalInputChangedElementsEnumerator)retain;
- (id)nextObject;
- (uint64_t)implementation;
- (void)release;
@end

@implementation _GCDevicePhysicalInputChangedElementsEnumerator

- (uint64_t)implementation
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (_GCDevicePhysicalInputChangedElementsEnumerator)retain
{
  if (self) {
    implementation = self->_implementation;
  }
  else {
    implementation = 0;
  }
  v4 = implementation;
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputChangedElementsEnumerator;
  return [(_GCDevicePhysicalInputChangedElementsEnumerator *)&v6 retain];
}

- (void)release
{
  if (self) {
    implementation = self->_implementation;
  }
  else {
    implementation = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputChangedElementsEnumerator;
  [(_GCDevicePhysicalInputChangedElementsEnumerator *)&v4 release];
}

- (id)nextObject
{
  do
  {
    unint64_t currentIndex = self->_currentIndex;
    if (currentIndex >= [(id)-[_GCDevicePhysicalInputBase elements]((uint64_t)self->_implementation) count])return 0; {
    unint64_t v4 = self->_currentIndex;
    }
    self->_unint64_t currentIndex = v4 + 1;
  }
  while (!-[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](self->_implementation, v4, 0, 1));
  v5 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)self->_implementation);

  return (id)[v5 objectAtIndexedSubscript:v4];
}

@end