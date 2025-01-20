@interface AVKeyPathDependency
+ (void)initialize;
- (AVKeyPathDependency)initWithObject:(id)a3 thatHasPropertyWithKey:(id)a4 whoseValueDependsOnValueAtKeyPath:(id)a5;
- (id)description;
- (void)_reactToSecondLevelPropertyChange:(id)a3;
- (void)_reactToTopLevelPropertyChange:(id)a3;
- (void)_startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:(id)a3;
- (void)dealloc;
- (void)initializationIsCompleteForObject:(id)a3;
@end

@implementation AVKeyPathDependency

- (AVKeyPathDependency)initWithObject:(id)a3 thatHasPropertyWithKey:(id)a4 whoseValueDependsOnValueAtKeyPath:(id)a5
{
  if (!a3)
  {
    v12 = (objc_class *)self;
    v13 = self;
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = "object != nil";
    goto LABEL_10;
  }
  if (!a4)
  {
    v12 = (objc_class *)self;
    v22 = self;
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = "dependentPropertyKey != nil";
    goto LABEL_10;
  }
  if (!a5)
  {
    v12 = (objc_class *)self;
    v23 = self;
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = "dependencyKeyPath != nil";
LABEL_10:
    v24 = (void *)[v19 exceptionWithName:v20, AVMethodExceptionReasonWithObjectAndSelector(v12, a2, @"invalid parameter not satisfying: %s", v14, v15, v16, v17, v18, (uint64_t)v21), 0 reason userInfo];
    objc_exception_throw(v24);
  }
  v25.receiver = self;
  v25.super_class = (Class)AVKeyPathDependency;
  v9 = [(AVKeyPathDependency *)&v25 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_subObjectRegistrationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.keypathdependency.registration", v10);
    v9->_KVODispatcher = (AVKVODispatcher *)+[AVKVODispatcher sharedKVODispatcher];
    v9->_weakReferenceToObject = [[AVWeakReference alloc] initWithReferencedObject:a3];
    v9->_dependentKey = (NSString *)[a4 copy];
    v9->_dependencyKeyPath = (AVTwoPartKeyPath *)[a5 copy];
  }
  return v9;
}

uint64_t __104__AVKeyPathDependency__startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reactToSecondLevelPropertyChange:");
}

- (void)_reactToSecondLevelPropertyChange:(id)a3
{
  id v5 = [(AVWeakReference *)self->_weakReferenceToObject referencedObject];
  if (v5)
  {
    v6 = v5;
    if (a3
      && (v7 = (void *)[a3 objectForKey:*MEMORY[0x1E4F284D8]]) != 0
      && [v7 BOOLValue])
    {
      dependentKey = self->_dependentKey;
      [v6 willChangeValueForKey:dependentKey];
    }
    else
    {
      v9 = self->_dependentKey;
      [v6 didChangeValueForKey:v9];
    }
  }
}

uint64_t __57__AVKeyPathDependency_initializationIsCompleteForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 _reactToTopLevelPropertyChange:a4];
}

- (void)_reactToTopLevelPropertyChange:(id)a3
{
  id v5 = [(AVWeakReference *)self->_weakReferenceToObject referencedObject];
  if (v5)
  {
    v6 = v5;
    if (a3
      && (v7 = (void *)[a3 objectForKey:*MEMORY[0x1E4F284D8]]) != 0
      && [v7 BOOLValue])
    {
      dependentKey = self->_dependentKey;
      [v6 willChangeValueForKey:dependentKey];
    }
    else
    {
      subObjectRegistrationQueue = self->_subObjectRegistrationQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__AVKeyPathDependency__reactToTopLevelPropertyChange___block_invoke;
      v10[3] = &unk_1E57B2098;
      v10[4] = v6;
      v10[5] = self;
      dispatch_sync(subObjectRegistrationQueue, v10);
      [v6 didChangeValueForKey:self->_dependentKey];
    }
  }
}

uint64_t __54__AVKeyPathDependency__reactToTopLevelPropertyChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "topLevelPropertyKey"));
  v3 = *(id **)(a1 + 40);
  if (v3[6])
  {
    [v3[6] cancelCallbacks];

    *(void *)(*(void *)(a1 + 40) + 48) = 0;
    v3 = *(id **)(a1 + 40);
  }
  return [v3 _startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:v2];
}

- (void)_startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:(id)a3
{
  if (a3) {
    self->_leafPropertyChangeNotifier = (AVCallbackCancellation *)[(AVKVODispatcher *)self->_KVODispatcher startObservingValueAtKeyPath:[(AVTwoPartKeyPath *)self->_dependencyKeyPath secondLevelPropertyKey] ofObject:a3 options:8 usingBlock:+[AVObservationBlockFactory observationBlockForWeakObserver:self passedToBlock:&__block_literal_global_197]];
  }
}

- (void)initializationIsCompleteForObject:(id)a3
{
  if ([(AVWeakReference *)self->_weakReferenceToObject referencedObject] != a3)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Must invoke with object passed to initializer", v6, v7, v8, v9, v10, v13), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  [(AVKVODispatcher *)self->_KVODispatcher startObservingValueAtKeyPath:[(AVTwoPartKeyPath *)self->_dependencyKeyPath topLevelPropertyKey] withoutKeepingAliveObservedObject:a3 options:8 usingBlock:+[AVWeakObservationBlockFactory weakObservationBlockForWeakObserver:self passedToBlock:&__block_literal_global_194]];
  uint64_t v11 = objc_msgSend(a3, "valueForKey:", -[AVTwoPartKeyPath topLevelPropertyKey](self->_dependencyKeyPath, "topLevelPropertyKey"));
  [(AVKeyPathDependency *)self _startObservingSecondLevelPropertyOnNewCurrentValueForTopLevelDependencyProperty:v11];
}

+ (void)initialize
{
}

- (void)dealloc
{
  subObjectRegistrationQueue = self->_subObjectRegistrationQueue;
  if (subObjectRegistrationQueue) {
    dispatch_release(subObjectRegistrationQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVKeyPathDependency;
  [(AVKeyPathDependency *)&v4 dealloc];
}

- (id)description
{
  v3 = [(AVWeakReference *)self->_weakReferenceToObject referencedObject];
  objc_super v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  if (!v3) {
    v3 = @"<deallocated>";
  }
  return (id)[v4 stringWithFormat:@"<%@: %p, target=%@, dependentKey=\"%@\", dependencyKeyPath=\"%@\">", v6, self, v3, self->_dependentKey, -[AVTwoPartKeyPath keyPathString](self->_dependencyKeyPath, "keyPathString")];
}

@end