@interface GKPlayer(GKPlayerTUConversationParticipant)
- (id)tuParticipant;
- (void)initWithParticipant:()GKPlayerTUConversationParticipant forBundleID:;
- (void)setTuParticipant:()GKPlayerTUConversationParticipant;
- (void)setTuParticipant:()GKPlayerTUConversationParticipant forBundleID:;
@end

@implementation GKPlayer(GKPlayerTUConversationParticipant)

- (void)initWithParticipant:()GKPlayerTUConversationParticipant forBundleID:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F636E0] internalRepresentation];
  v9 = (void *)[a1 initWithInternalRepresentation:v8];
  v10 = v9;
  if (v9) {
    [v9 setTuParticipant:v6 forBundleID:v7];
  }

  return v10;
}

- (id)tuParticipant
{
  return objc_getAssociatedObject(a1, @"_gkTUParticipant");
}

- (void)setTuParticipant:()GKPlayerTUConversationParticipant
{
}

- (void)setTuParticipant:()GKPlayerTUConversationParticipant forBundleID:
{
  id value = a3;
  id v6 = a4;
  objc_setAssociatedObject(a1, @"_gkTUParticipant", value, (void *)0x301);
  if (value)
  {
    [value identifier];
    id v7 = [v6 dataUsingEncoding:4];
    uint64_t v8 = IDSIDAliasHashUInt64();

    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v8);
    v10 = [a1 internal];
    [v10 setPlayerID:v9];

    v11 = [a1 internal];
    v12 = [v11 playerID];

    if (!v12)
    {
      v13 = [MEMORY[0x1E4F29128] UUID];
      v14 = [v13 UUIDString];
      v15 = [a1 internal];
      [v15 setPlayerID:v14];
    }
    [a1 setTuParticipant:value];
    v16 = [a1 internal];
    [v16 setAlias:0];

    v17 = objc_opt_new();
    v18 = [value handle];
    v19 = [v18 value];
    v20 = +[GKMessageUtilities contactFromEmailOrPhoneNumber:v19 fromContactStore:v17];

    if (v20)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1B910]);
      v22 = [v21 stringFromContact:v20];

      v23 = [a1 internal];
      [v23 setAlias:v22];

      v24 = [a1 internal];
      [v24 setContact:v20];
    }
    v25 = [value handle];
    v26 = [v25 value];
    v27 = [a1 internal];
    [v27 setCompositeName:v26];

    v28 = [a1 internal];
    [v28 setAvatarType:&unk_1F08124C8];

    v29 = [value handle];
    v30 = [v29 value];
    v31 = [a1 internal];
    [v31 setMessagesID:v30];
  }
}

@end