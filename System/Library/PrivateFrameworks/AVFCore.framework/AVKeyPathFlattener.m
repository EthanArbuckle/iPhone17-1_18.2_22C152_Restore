@interface AVKeyPathFlattener
- (AVKeyPathFlattener)init;
- (id)dependentProperty;
- (id)initForObservingValueAtKeyPath:(id)a3 onObject:(id)a4;
- (id)observedObject;
- (id)topLevelDependencyProperty;
- (void)addCallbackToCancelDuringDeallocation:(id)a3;
- (void)dealloc;
- (void)declareKeyPathDependenciesWithRegistry:(id)a3;
@end

@implementation AVKeyPathFlattener

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  v5 = [(AVTwoPartKeyPath *)self->_dependencyKeyPath topLevelPropertyKey];
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", @"dependentProperty", -[AVTwoPartKeyPath initWithTopLevelPropertyKey:secondLevelPropertyKey:]([AVTwoPartKeyPath alloc], "initWithTopLevelPropertyKey:secondLevelPropertyKey:", @"topLevelDependencyProperty", -[AVTwoPartKeyPath secondLevelPropertyKey](self->_dependencyKeyPath, "secondLevelPropertyKey")));
  v6 = [[AVTwoPartKeyPath alloc] initWithTopLevelPropertyKey:@"observedObject" secondLevelPropertyKey:v5];
  [a3 valueForKey:@"topLevelDependencyProperty" dependsOnValueAtKeyPath:v6];
}

- (AVKeyPathFlattener)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3A8];
  v6 = NSStringFromSelector(sel_initForObservingValueAtKeyPath_onObject_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (id)initForObservingValueAtKeyPath:(id)a3 onObject:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVKeyPathFlattener;
  v6 = [(AVKeyPathFlattener *)&v8 init];
  if (v6)
  {
    v6->_dependencyManager = [[AVKeyPathDependencyManager alloc] initWithDependencyHost:v6];
    v6->_dependencyKeyPath = (AVTwoPartKeyPath *)[a3 copy];
    v6->_observedObject = a4;
    [(AVKeyPathDependencyManager *)v6->_dependencyManager dependencyHostIsFullyInitialized];
  }
  return v6;
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
}

- (void)dealloc
{
  [(AVKeyPathDependencyManager *)self->_dependencyManager cancelAllCallbacks];

  v3.receiver = self;
  v3.super_class = (Class)AVKeyPathFlattener;
  [(AVKeyPathFlattener *)&v3 dealloc];
}

- (id)observedObject
{
  return self->_observedObject;
}

- (id)topLevelDependencyProperty
{
  objc_super v3 = [(AVTwoPartKeyPath *)self->_dependencyKeyPath topLevelPropertyKey];
  char v4 = objc_opt_respondsToSelector();
  observedObject = self->_observedObject;
  if (v4)
  {
    return (id)[observedObject valueForKeyForKVO:v3];
  }
  else
  {
    return [observedObject valueForKey:v3];
  }
}

- (id)dependentProperty
{
  objc_super v3 = [(AVTwoPartKeyPath *)self->_dependencyKeyPath secondLevelPropertyKey];
  id v4 = [(AVKeyPathFlattener *)self topLevelDependencyProperty];
  if (objc_opt_respondsToSelector())
  {
    return (id)[v4 valueForKeyForKVO:v3];
  }
  else
  {
    return (id)[v4 valueForKey:v3];
  }
}

@end