@interface IKJSPlaylist
- (IKAppPlaylistBridge)bridge;
- (IKJSPlaylist)init;
- (id)item:(int64_t)a3;
- (id)pop;
- (id)splice:(int64_t)a3 :(int64_t)a4 :(id)a5;
- (int64_t)endAction;
- (int64_t)repeatMode;
- (unint64_t)length;
- (void)dealloc;
- (void)push:(id)a3;
- (void)setEndAction:(int64_t)a3;
- (void)setRepeatMode:(int64_t)a3;
@end

@implementation IKJSPlaylist

- (IKJSPlaylist)init
{
  v3 = +[IKAppContext currentAppContext];
  v10.receiver = self;
  v10.super_class = (Class)IKJSPlaylist;
  v4 = [(IKJSObject *)&v10 initWithAppContext:v3];

  if (v4)
  {
    v5 = [IKAppPlaylistBridge alloc];
    v6 = [(IKJSObject *)v4 appContext];
    uint64_t v7 = [(IKAppPlaylistBridge *)v5 initWithAppContext:v6 jsPlaylist:v4];
    bridge = v4->_bridge;
    v4->_bridge = (IKAppPlaylistBridge *)v7;
  }
  return v4;
}

- (void)dealloc
{
  [(IKAppPlaylistBridge *)self->_bridge cleanup];
  v3.receiver = self;
  v3.super_class = (Class)IKJSPlaylist;
  [(IKJSPlaylist *)&v3 dealloc];
}

- (id)splice:(int64_t)a3 :(int64_t)a4 :(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  [MEMORY[0x1E4F1CA48] array];
  v33 = v32 = v8;
  if ([v8 isObject])
  {
    obuint64_t j = (id)a3;
    v9 = [v8 toArray];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v15 = [(IKJSObject *)self appContext];
          v16 = [v15 jsContext];
          v17 = [v16 virtualMachine];
          [v17 addManagedReference:v14 withOwner:self];

          v18 = [v14 bridge];
          [v33 addObject:v18];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v11);
    }

    a3 = (int64_t)obj;
  }
  v19 = [(IKAppPlaylistBridge *)self->_bridge replaceItemsAt:a3 & ~(a3 >> 63) count:a4 & ~(a4 >> 63) with:v33];
  v20 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = v19;
  uint64_t v21 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(obja);
        }
        v25 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        v26 = [(IKJSObject *)self appContext];
        v27 = [v26 jsContext];
        v28 = [v27 virtualMachine];
        v29 = [v25 jsMediaItem];
        [v28 removeManagedReference:v29 withOwner:self];

        v30 = [v25 jsMediaItem];
        [v20 addObject:v30];
      }
      uint64_t v22 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v22);
  }

  return v20;
}

- (void)push:(id)a3
{
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  unint64_t v4 = [(IKJSPlaylist *)self length];
  v5 = (void *)MEMORY[0x1E4F30938];
  v6 = [(IKJSObject *)self appContext];
  uint64_t v7 = [v6 jsContext];
  id v8 = [v5 valueWithObject:v10 inContext:v7];

  id v9 = [(IKJSPlaylist *)self splice:v4 :0 :v8];
}

- (id)pop
{
  unint64_t v3 = [(IKJSPlaylist *)self length];
  if (v3)
  {
    unint64_t v4 = [(IKAppPlaylistBridge *)self->_bridge replaceItemsAt:v3 - 1 count:1 with:0];
    v5 = [(IKJSObject *)self appContext];
    v6 = [v5 jsContext];
    uint64_t v7 = [v6 virtualMachine];
    id v8 = [v4 objectAtIndex:0];
    [v7 removeManagedReference:v8 withOwner:self];

    id v9 = [v4 objectAtIndex:0];
    id v10 = [v9 jsMediaItem];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)item:(int64_t)a3
{
  unint64_t v3 = [(IKAppPlaylistBridge *)self->_bridge item:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v5 = [v3 jsMediaItem];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)length
{
  return [(IKAppPlaylistBridge *)self->_bridge length];
}

- (void)setEndAction:(int64_t)a3
{
}

- (int64_t)endAction
{
  return [(IKAppPlaylistBridge *)self->_bridge endAction];
}

- (void)setRepeatMode:(int64_t)a3
{
}

- (int64_t)repeatMode
{
  return [(IKAppPlaylistBridge *)self->_bridge repeatMode];
}

- (IKAppPlaylistBridge)bridge
{
  return self->_bridge;
}

- (void).cxx_destruct
{
}

@end