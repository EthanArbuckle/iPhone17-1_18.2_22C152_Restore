@interface MPCSharedListeningQueueEvent
+ (MPCSharedListeningQueueEvent)queueEventWithAddedContent:(id)a3;
+ (MPCSharedListeningQueueEvent)queueEventWithContentUpdatedMessage:(id)a3;
+ (MPCSharedListeningQueueEvent)queueEventWithPlaybackModeChanged:(id)a3;
+ (MPCSharedListeningQueueEvent)queueEventWithPlayedNowContent:(id)a3;
+ (MPCSharedListeningQueueEvent)queueEventWithRemovedContent:(id)a3;
+ (MPCSharedListeningQueueEvent)queueEventWithReorderedContent:(id)a3;
+ (MPCSharedListeningQueueEvent)queueEventWithReplacedContent:(id)a3;
- (MPCSharedListeningQueueEventContentAdded)addedContent;
- (MPCSharedListeningQueueEventContentPlayedNow)playedNowContent;
- (MPCSharedListeningQueueEventContentRemoved)removedContent;
- (MPCSharedListeningQueueEventContentReordered)reorderedContent;
- (MPCSharedListeningQueueEventContentReplaced)replacedContent;
- (MPCSharedListeningQueueEventContentUpdatedMessage)contentUpdatedMessage;
- (MPCSharedListeningQueueEventPlaybackModeChanged)playbackMode;
- (id)description;
- (int64_t)kind;
@end

@implementation MPCSharedListeningQueueEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackMode, 0);
  objc_storeStrong((id *)&self->_contentUpdatedMessage, 0);
  objc_storeStrong((id *)&self->_playedNowContent, 0);
  objc_storeStrong((id *)&self->_replacedContent, 0);
  objc_storeStrong((id *)&self->_reorderedContent, 0);
  objc_storeStrong((id *)&self->_removedContent, 0);

  objc_storeStrong((id *)&self->_addedContent, 0);
}

- (MPCSharedListeningQueueEventPlaybackModeChanged)playbackMode
{
  return self->_playbackMode;
}

- (MPCSharedListeningQueueEventContentUpdatedMessage)contentUpdatedMessage
{
  return self->_contentUpdatedMessage;
}

- (MPCSharedListeningQueueEventContentPlayedNow)playedNowContent
{
  return self->_playedNowContent;
}

- (MPCSharedListeningQueueEventContentReplaced)replacedContent
{
  return self->_replacedContent;
}

- (MPCSharedListeningQueueEventContentReordered)reorderedContent
{
  return self->_reorderedContent;
}

- (MPCSharedListeningQueueEventContentRemoved)removedContent
{
  return self->_removedContent;
}

- (MPCSharedListeningQueueEventContentAdded)addedContent
{
  return self->_addedContent;
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)description
{
  int64_t kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(NSString, "stringWithFormat:", @"<MPCSharedListeningQueueEvent: %p unknown/invalid>", self, v5);
      break;
    case 1:
      [NSString stringWithFormat:@"<MPCSharedListeningQueueEvent: %p addedContent=%@>", self, self->_addedContent];
      break;
    case 2:
      [NSString stringWithFormat:@"<MPCSharedListeningQueueEvent: %p removedContent=%@>", self, self->_removedContent];
      break;
    case 3:
      [NSString stringWithFormat:@"<MPCSharedListeningQueueEvent: %p reorderedContent=%@>", self, self->_reorderedContent];
      break;
    case 4:
      [NSString stringWithFormat:@"<MPCSharedListeningQueueEvent: %p playbackMode=%@>", self, self->_playbackMode];
      break;
    case 5:
      [NSString stringWithFormat:@"<MPCSharedListeningQueueEvent: %p replacedContent=%@>", self, self->_replacedContent];
      break;
    case 6:
      [NSString stringWithFormat:@"<MPCSharedListeningQueueEvent: %p playedNowContent=%@>", self, self->_playedNowContent];
      break;
    case 7:
      [NSString stringWithFormat:@"<MPCSharedListeningQueueEvent: %p contentUpdatedMessage=%@>", self, self->_contentUpdatedMessage];
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"<MPCSharedListeningQueueEvent: %p unknown/kind=%ld>", self, kind);
      break;
  v3 = };

  return v3;
}

+ (MPCSharedListeningQueueEvent)queueEventWithPlaybackModeChanged:(id)a3
{
  v3 = (MPCSharedListeningQueueEventPlaybackModeChanged *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_int64_t kind = 4;
  playbackMode = v4->_playbackMode;
  v4->_playbackMode = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithContentUpdatedMessage:(id)a3
{
  v3 = (MPCSharedListeningQueueEventContentUpdatedMessage *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_int64_t kind = 7;
  contentUpdatedMessage = v4->_contentUpdatedMessage;
  v4->_contentUpdatedMessage = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithReplacedContent:(id)a3
{
  v3 = (MPCSharedListeningQueueEventContentReplaced *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_int64_t kind = 5;
  replacedContent = v4->_replacedContent;
  v4->_replacedContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithReorderedContent:(id)a3
{
  v3 = (MPCSharedListeningQueueEventContentReordered *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_int64_t kind = 3;
  reorderedContent = v4->_reorderedContent;
  v4->_reorderedContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithRemovedContent:(id)a3
{
  v3 = (MPCSharedListeningQueueEventContentRemoved *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_int64_t kind = 2;
  removedContent = v4->_removedContent;
  v4->_removedContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithPlayedNowContent:(id)a3
{
  v3 = (MPCSharedListeningQueueEventContentPlayedNow *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_int64_t kind = 6;
  playedNowContent = v4->_playedNowContent;
  v4->_playedNowContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithAddedContent:(id)a3
{
  v3 = (MPCSharedListeningQueueEventContentAdded *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  addedContent = v4->_addedContent;
  v4->_int64_t kind = 1;
  v4->_addedContent = v3;

  return v4;
}

@end