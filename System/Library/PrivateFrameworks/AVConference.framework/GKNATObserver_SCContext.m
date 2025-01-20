@interface GKNATObserver_SCContext
- (GKNATObserverInternal)observer;
- (void)setObserver:(id)a3;
@end

@implementation GKNATObserver_SCContext

- (GKNATObserverInternal)observer
{
  return self->observer_;
}

- (void)setObserver:(id)a3
{
  self->observer_ = (GKNATObserverInternal *)a3;
}

@end