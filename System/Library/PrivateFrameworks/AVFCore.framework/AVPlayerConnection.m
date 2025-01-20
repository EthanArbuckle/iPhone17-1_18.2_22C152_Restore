@interface AVPlayerConnection
- (AVPlayerConnection)initWithWeakReferenceToPlayer:(id)a3 weakReferenceToPlayerItem:(id)a4;
- (BOOL)addItemToPlayQueueAfterPlaybackItemOfItem:(id)a3;
- (id)description;
- (id)error;
- (id)player;
- (id)playerItem;
- (int64_t)status;
- (void)dealloc;
- (void)removeItemFromPlayQueue;
@end

@implementation AVPlayerConnection

- (AVPlayerConnection)initWithWeakReferenceToPlayer:(id)a3 weakReferenceToPlayerItem:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)AVPlayerConnection;
  v7 = [(AVPlayerConnection *)&v21 init];
  v8 = v7;
  if (!a3)
  {
    v10 = v7;
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "playerReference != nil";
    goto LABEL_8;
  }
  if (!a4)
  {
    v19 = v7;
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "playerItemReference != nil";
LABEL_8:
    v20 = (void *)[v16 exceptionWithName:v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v11, v12, v13, v14, v15, (uint64_t)v18), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  if (v7)
  {
    v7->_playerReference = (AVWeakReference *)a3;
    v8->_playerItemReference = (AVWeakReference *)a4;
    v8->_status = 0;
  }
  return v8;
}

- (BOOL)addItemToPlayQueueAfterPlaybackItemOfItem:(id)a3
{
  id v6 = [(AVPlayerConnection *)self playerItem];
  id v7 = [(AVPlayerConnection *)self player];
  int64_t v8 = [(AVPlayerConnection *)self status];
  switch(v8)
  {
    case 3:
      int64_t v16 = 0;
      return v16 == 1;
    case 1:
      v22 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v23 = *MEMORY[0x1E4F1C3B8];
      v24 = @"Cannot connect a player connection that is already connected";
      goto LABEL_27;
    case 2:
      v22 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v23 = *MEMORY[0x1E4F1C3B8];
      v24 = @"Player connections are one-shot objects.  Cannot connect a player connection that was already disconnected.  To re-connect an AVPlayerItem to an AVPlayer, create a new player AVPlayerConnection object";
LABEL_27:
      v25 = objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v24, v9, v10, v11, v12, v13, v26), 0);
      objc_exception_throw(v25);
  }
  uint64_t v14 = (const void *)[v6 _copyFigPlaybackItem];
  if (a3) {
    a3 = (id)[a3 _copyFigPlaybackItem];
  }
  if ([v6 status] == 2)
  {
    signed int v15 = -12780;
    goto LABEL_18;
  }
  objc_msgSend(v6, "_setPlaybackCoordinator:", objc_msgSend(v7, "_playbackCoordinatorWithoutTriggeringFullSetup"));
  uint64_t v17 = (const void *)[v7 _copyFigPlayer];
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = *(uint64_t (**)(const void *, const void *, id))(v19 + 16);
  if (!v20)
  {
    signed int v15 = -12782;
    if (!v17) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  signed int v15 = v20(v17, v14, a3);
  if (v17) {
LABEL_16:
  }
    CFRelease(v17);
LABEL_17:
  if (!v15)
  {
    int64_t v16 = 1;
    goto LABEL_19;
  }
LABEL_18:
  [(AVPlayerConnection *)self willChangeValueForKey:@"error"];
  self->_error = (NSError *)objc_msgSend((id)AVLocalizedErrorWithUnderlyingOSStatus(v15, 0), "copy");
  [(AVPlayerConnection *)self didChangeValueForKey:@"error"];
  int64_t v16 = 3;
LABEL_19:
  [(AVPlayerConnection *)self willChangeValueForKey:@"status"];
  self->_status = v16;
  [(AVPlayerConnection *)self didChangeValueForKey:@"status"];
  if (v14) {
    CFRelease(v14);
  }
  if (a3) {
    CFRelease(a3);
  }
  return v16 == 1;
}

- (int64_t)status
{
  return self->_status;
}

- (id)player
{
  return [(AVWeakReference *)self->_playerReference referencedObject];
}

- (id)playerItem
{
  return [(AVWeakReference *)self->_playerItemReference referencedObject];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerConnection;
  [(AVPlayerConnection *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, player = %@, playerItem = %@>", NSStringFromClass(v4), self, -[AVPlayerConnection player](self, "player"), -[AVPlayerConnection playerItem](self, "playerItem")];
}

- (void)removeItemFromPlayQueue
{
  int64_t v4 = [(AVPlayerConnection *)self status];
  switch(v4)
  {
    case 1:
      uint64_t v12 = objc_msgSend(-[AVPlayerConnection player](self, "player"), "_copyFigPlayer");
      if (!v12) {
        return;
      }
      uint64_t v10 = (const void *)v12;
      uint64_t v13 = objc_msgSend(-[AVPlayerConnection playerItem](self, "playerItem"), "_copyFigPlaybackItem");
      if (!v13) {
        goto LABEL_16;
      }
      uint64_t v11 = (const void *)v13;
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      int64_t v16 = *(void (**)(const void *, const void *))(v15 + 24);
      if (v16) {
        v16(v10, v11);
      }
      objc_msgSend(-[AVPlayerConnection playerItem](self, "playerItem"), "_setPlaybackCoordinator:", 0);
      break;
    case 3:
      return;
    case 2:
      uint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot disconnect a player connection that was already disconnected", v5, v6, v7, v8, v9, v18), 0 reason userInfo];
      objc_exception_throw(v17);
    default:
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      break;
  }
  [(AVPlayerConnection *)self willChangeValueForKey:@"status"];
  self->_status = 2;
  [(AVPlayerConnection *)self didChangeValueForKey:@"status"];
  if (v11) {
    CFRelease(v11);
  }
  if (v10)
  {
LABEL_16:
    CFRelease(v10);
  }
}

- (id)error
{
  return self->_error;
}

@end