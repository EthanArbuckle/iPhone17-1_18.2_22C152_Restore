@interface _MPMusicPlayerQueueItemsProxy
- (MPMusicPlayerApplicationController)controller;
- (_MPMusicPlayerQueueItemsProxy)initWithController:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation _MPMusicPlayerQueueItemsProxy

- (void).cxx_destruct
{
}

- (MPMusicPlayerApplicationController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (MPMusicPlayerApplicationController *)WeakRetained;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v5 = [WeakRetained nowPlayingAtIndex:a3];

  v6 = [v5 item];

  if (v6)
  {
    v7 = [_MPMusicPlayerMediaItemProxy alloc];
    v8 = [v5 itemIdentifier];
    v9 = [v5 item];
    v6 = [(_MPMusicPlayerMediaItemProxy *)v7 initWithItemIdentifier:v8 item:v9];
  }

  return v6;
}

- (unint64_t)count
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  unint64_t v3 = [WeakRetained numberOfItems];

  return v3;
}

- (_MPMusicPlayerQueueItemsProxy)initWithController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MPMusicPlayerQueueItemsProxy;
  v5 = [(_MPMusicPlayerQueueItemsProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_controller, v4);
  }

  return v6;
}

@end