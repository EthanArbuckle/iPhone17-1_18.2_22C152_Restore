@interface MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue
- (MPMusicPlayerControllerMutableQueue)_underlyingMutableQueue;
- (id)_initWithUnderlyingMutableQueue:(id)a3;
- (void)insertQueueDescriptor:(id)a3 afterItemWithIdentifier:(id)a4;
- (void)removeItemWithIdentifier:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue

- (id)_initWithUnderlyingMutableQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue;
  v6 = [(MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingMutableQueue, a3);
  }

  return v7;
}

- (MPMusicPlayerControllerMutableQueue)_underlyingMutableQueue
{
  return self->_underlyingMutableQueue;
}

- (void)insertQueueDescriptor:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 _underlyingQueueDescriptor];
  [(MPMusicPlayerControllerMutableQueue *)self->_underlyingMutableQueue _insertQueueDescriptor:v7 afterItemWithIdentifier:v6];
}

- (void)removeItemWithIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end