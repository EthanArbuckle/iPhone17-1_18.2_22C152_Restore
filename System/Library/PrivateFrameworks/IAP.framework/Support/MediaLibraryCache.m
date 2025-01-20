@interface MediaLibraryCache
- (MediaLibraryCache)init;
- (id)collectionsForProperty:(id)a3;
- (id)collectionsForPropertyNoQ:(id)a3;
- (id)description;
- (id)globalItemCountForProperty:(id)a3;
- (id)globalItemCountForPropertyNoQ:(id)a3;
- (id)itemCountForProperty:(id)a3;
- (id)itemCountForPropertyNoQ:(id)a3;
- (id)itemNamesForRange:(_NSRange)a3 forProperty:(id)a4;
- (id)itemNamesForRangeNoQ:(_NSRange)a3 forProperty:(id)a4;
- (void)dealloc;
- (void)invalidateMediaItem:(id)a3;
- (void)performOnQueue:(id)a3;
- (void)reset;
- (void)setCollections:(id)a3 forProperty:(id)a4;
- (void)setCollectionsNoQ:(id)a3 forProperty:(id)a4;
- (void)setGlobalItemCount:(unsigned int)a3 ForProperty:(id)a4;
- (void)setGlobalItemCountNoQ:(unsigned int)a3 ForProperty:(id)a4;
- (void)setItemCount:(unsigned int)a3 forProperty:(id)a4;
- (void)setItemCountNoQ:(unsigned int)a3 forProperty:(id)a4;
- (void)setItemNames:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5;
- (void)setItemNamesNoQ:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5;
@end

@implementation MediaLibraryCache

- (MediaLibraryCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)MediaLibraryCache;
  result = [(MediaLibraryCache *)&v4 init];
  v3 = result;
  if (!result) {
    return v3;
  }
  if ((((_BYTE)result + 8) & 7) == 0)
  {
    result->_itemCaches = 0;
    result = (MediaLibraryCache *)dispatch_queue_create("com.apple.iapd.mediaLibraryCacheQ", 0);
    if (((unint64_t)&v3->_mediaLibraryCacheQ & 7) == 0)
    {
      v3->_mediaLibraryCacheQ = (OS_dispatch_queue *)result;
      return v3;
    }
  }
  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  if ((((_BYTE)self + 8) & 7) != 0
    || (self->_itemCaches,
        self->_itemCaches = 0,
        p_mediaLibraryCacheQ = &self->_mediaLibraryCacheQ,
        ((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0))
  {
    __break(0x5516u);
  }
  else if (*p_mediaLibraryCacheQ)
  {
    dispatch_release((dispatch_object_t)*p_mediaLibraryCacheQ);
    v4.receiver = self;
    v4.super_class = (Class)MediaLibraryCache;
    [(MediaLibraryCache *)&v4 dealloc];
    return;
  }
  __break(0x5510u);
}

- (id)description
{
  if ((((_BYTE)self + 8) & 7) == 0) {
    return +[NSString stringWithFormat:@"<MediaLibraryCache %hhx> _itemCaches=%@", self, *((void *)self + 1), v2, v3];
  }
  __break(0x5516u);
  return self;
}

- (void)reset
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    mediaLibraryCacheQ = self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D2A8;
      block[3] = &unk_100121CA0;
      block[4] = self;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)setGlobalItemCount:(unsigned int)a3 ForProperty:(id)a4
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    mediaLibraryCacheQ = self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D464;
      block[3] = &unk_1001244A0;
      unsigned int v6 = a3;
      block[4] = self;
      void block[5] = a4;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }
  __break(0x5510u);
}

- (id)globalItemCountForProperty:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_10003D568;
  v10 = sub_10003D578;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v3 = *((void *)self + 2);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D584;
      block[3] = &unk_1001244C8;
      void block[5] = a3;
      void block[6] = &v6;
      block[4] = self;
      dispatch_sync(v3, block);
      objc_super v4 = (void *)v7[5];
      _Block_object_dispose(&v6, 8);
      return v4;
    }
  }
  __break(0x5510u);
  return self;
}

- (void)setGlobalItemCountNoQ:(unsigned int)a3 ForProperty:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = sub_10003D614(a4, (id *)&self->_itemCaches);
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:v4];
  [v5 setGlobalCount:v6];
}

- (id)globalItemCountForPropertyNoQ:(id)a3
{
  id v3 = sub_10003D614(a3, (id *)&self->_itemCaches);
  return [v3 globalCount];
}

- (void)setItemCount:(unsigned int)a3 forProperty:(id)a4
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    mediaLibraryCacheQ = self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D768;
      block[3] = &unk_1001244A0;
      unsigned int v6 = a3;
      block[4] = self;
      void block[5] = a4;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)setItemNames:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5
{
  p_mediaLibraryCacheQ = &self->_mediaLibraryCacheQ;
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    v7 = *p_mediaLibraryCacheQ;
    if (*p_mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D80C;
      block[3] = &unk_1001244F0;
      block[4] = self;
      void block[5] = a3;
      _NSRange v9 = a4;
      void block[6] = a5;
      dispatch_sync(v7, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)setItemCountNoQ:(unsigned int)a3 forProperty:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = sub_10003D614(a4, (id *)&self->_itemCaches);
  unsigned int v6 = +[NSNumber numberWithUnsignedInt:v4];
  [v5 setItemCount:v6];
}

- (void)setItemNamesNoQ:(id)a3 forRange:(_NSRange)a4 forProperty:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = sub_10003D614(a5, (id *)&self->_itemCaches);
  objc_msgSend(v8, "setItemNames:forRange:", a3, location, length);
}

- (id)itemCountForProperty:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  _NSRange v9 = sub_10003D568;
  v10 = sub_10003D578;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v3 = *((void *)self + 2);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D9C4;
      block[3] = &unk_1001244C8;
      void block[5] = a3;
      void block[6] = &v6;
      block[4] = self;
      dispatch_sync(v3, block);
      uint64_t v4 = (void *)v7[5];
      _Block_object_dispose(&v6, 8);
      return v4;
    }
  }
  __break(0x5510u);
  return self;
}

- (id)itemNamesForRange:(_NSRange)a3 forProperty:(id)a4
{
  uint64_t v8 = 0;
  _NSRange v9 = &v8;
  uint64_t v10 = 0x3052000000;
  unint64_t v11 = sub_10003D568;
  v12 = sub_10003D578;
  uint64_t v13 = 0;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v4 = *((void *)self + 2);
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003DAF0;
      block[3] = &unk_100124518;
      void block[6] = &v8;
      _NSRange v7 = a3;
      block[4] = self;
      void block[5] = a4;
      dispatch_sync(v4, block);
      id v5 = (void *)v9[5];
      _Block_object_dispose(&v8, 8);
      return v5;
    }
  }
  __break(0x5510u);
  return self;
}

- (id)itemCountForPropertyNoQ:(id)a3
{
  if (((unint64_t)&self->_itemCaches & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    self = (MediaLibraryCache *)-[NSMutableDictionary objectForKey:](self->_itemCaches, "objectForKey:", a3, v3);
  }
  return [(MediaLibraryCache *)self itemCount];
}

- (id)itemNamesForRangeNoQ:(_NSRange)a3 forProperty:(id)a4
{
  if (((unint64_t)&self->_itemCaches & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    self = (MediaLibraryCache *)[(NSMutableDictionary *)self->_itemCaches objectForKey:a4];
    a3.NSUInteger location = location;
    a3.NSUInteger length = length;
  }
  return -[MediaLibraryCache itemNamesForRange:](self, "itemNamesForRange:", a3.location, a3.length);
}

- (void)setCollections:(id)a3 forProperty:(id)a4
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    mediaLibraryCacheQ = self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003DC50;
      block[3] = &unk_100124540;
      block[4] = self;
      void block[5] = a3;
      void block[6] = a4;
      dispatch_sync(mediaLibraryCacheQ, block);
      return;
    }
  }
  __break(0x5510u);
}

- (void)setCollectionsNoQ:(id)a3 forProperty:(id)a4
{
  id v5 = sub_10003D614(a4, (id *)&self->_itemCaches);
  [v5 setCollections:a3];
}

- (id)collectionsForProperty:(id)a3
{
  uint64_t v6 = 0;
  _NSRange v7 = &v6;
  uint64_t v8 = 0x3052000000;
  _NSRange v9 = sub_10003D568;
  uint64_t v10 = sub_10003D578;
  uint64_t v11 = 0;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v3 = *((void *)self + 2);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003DD90;
      block[3] = &unk_1001244C8;
      void block[5] = a3;
      void block[6] = &v6;
      block[4] = self;
      dispatch_sync(v3, block);
      uint64_t v4 = (void *)v7[5];
      _Block_object_dispose(&v6, 8);
      return v4;
    }
  }
  __break(0x5510u);
  return self;
}

- (id)collectionsForPropertyNoQ:(id)a3
{
  if ((((unint64_t)self + 8) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v5 = objc_msgSend(*((id *)self + 1), "objectForKey:", a3, v3);
    return [v5 collections];
  }
  return self;
}

- (void)invalidateMediaItem:(id)a3
{
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    mediaLibraryCacheQ = self->_mediaLibraryCacheQ;
    if (mediaLibraryCacheQ)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_10003DE90;
      v4[3] = &unk_100124568;
      v4[4] = a3;
      v4[5] = self;
      dispatch_sync(mediaLibraryCacheQ, v4);
      return;
    }
  }
  __break(0x5510u);
}

- (void)performOnQueue:(id)a3
{
  p_mediaLibraryCacheQ = &self->_mediaLibraryCacheQ;
  if (((unint64_t)&self->_mediaLibraryCacheQ & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v4 = *p_mediaLibraryCacheQ;
    if (*p_mediaLibraryCacheQ)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003E078;
      block[3] = &unk_1001238D8;
      block[4] = a3;
      dispatch_sync(v4, block);
      return;
    }
  }
  __break(0x5510u);
}

@end