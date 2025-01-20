@interface _HDDataCollectionObserverWrapper
- (id)description;
@end

@implementation _HDDataCollectionObserverWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_destroyWeak(&self->_observer);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(&self->_observer);
  double collectionInterval = self->_collectionInterval;
  if ([(HDDataCollectionObserverState *)self->_state isInForeground]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(HDDataCollectionObserverState *)self->_state hasRunningWorkout]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(HDDataCollectionObserverState *)self->_state hasBackgroundObserver]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = [v3 stringWithFormat:@"<%@:%p> %@ (%lfs, inForeground=%@, hasRunningWorkout=%@, hasBackgroundObserver=%@)", v4, self, WeakRetained, *(void *)&collectionInterval, v7, v8, v9];

  return v10;
}

@end