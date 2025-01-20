@interface _MPMusicPlayerMediaItemProxy
- (BOOL)isEqual:(id)a3;
- (MPMediaItem)item;
- (NSString)itemIdentifier;
- (_MPMusicPlayerMediaItemProxy)initWithItemIdentifier:(id)a3 item:(id)a4;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _MPMusicPlayerMediaItemProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (MPMediaItem)item
{
  return self->_item;
}

- (id)description
{
  return (id)[(MPMediaItem *)self->_item description];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = -[MPMediaItem methodSignatureForSelector:](self->_item, "methodSignatureForSelector:");
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)_MPMusicPlayerMediaItemProxy;
    v5 = [(_MPMusicPlayerMediaItemProxy *)&v7 methodSignatureForSelector:a3];
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[MPMediaItem isEqual:](self->_item, "isEqual:");
}

- (_MPMusicPlayerMediaItemProxy)initWithItemIdentifier:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)&self->_item, a4);
    objc_storeStrong((id *)&self->_itemIdentifier, a3);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end