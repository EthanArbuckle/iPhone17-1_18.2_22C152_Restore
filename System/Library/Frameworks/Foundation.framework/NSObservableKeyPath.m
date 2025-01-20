@interface NSObservableKeyPath
- (BOOL)_wantsChanges;
- (NSObservable)changes;
- (NSString)description;
- (id)addObserver:(id)a3;
- (void)removeObservation:(id)a3;
@end

@implementation NSObservableKeyPath

- (BOOL)_wantsChanges
{
  return 0;
}

- (id)addObserver:(id)a3
{
  id v5 = [(NSBoundKeyPath *)self rootObject];

  return (id)[v5 addObserver:a3 forObservableKeyPath:self];
}

- (void)removeObservation:(id)a3
{
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p> @observable(%@)", objc_opt_class(), self, self->super._keyPath];
}

- (NSObservable)changes
{
  id v2 = +[NSBoundKeyPath newKeyPathWithRootObject:[(NSBoundKeyPath *)self rootObject] keyPathString:self->super._keyPath];

  return (NSObservable *)v2;
}

@end