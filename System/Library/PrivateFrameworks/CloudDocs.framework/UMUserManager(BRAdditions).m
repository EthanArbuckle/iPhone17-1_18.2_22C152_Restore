@interface UMUserManager(BRAdditions)
+ (uint64_t)br_isInSyncBubble;
- (__CFString)br_currentPersonaID;
@end

@implementation UMUserManager(BRAdditions)

- (__CFString)br_currentPersonaID
{
  v1 = [a1 currentPersona];
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "br_personaID");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = @"__defaultPersonaID__";
  }

  return v3;
}

+ (uint64_t)br_isInSyncBubble
{
  if (br_isInSyncBubble_onceToken != -1) {
    dispatch_once(&br_isInSyncBubble_onceToken, &__block_literal_global_26);
  }
  return br_isInSyncBubble_res;
}

@end