@interface IMExpirableMessageChatItem
- (BOOL)isPlayed;
- (BOOL)isSaved;
@end

@implementation IMExpirableMessageChatItem

- (BOOL)isPlayed
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  char isPlayed = objc_msgSend_isPlayed(v4, v5, v6, v7);

  return isPlayed;
}

- (BOOL)isSaved
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_expireState(v4, v5, v6, v7) == 3;

  return v8;
}

@end