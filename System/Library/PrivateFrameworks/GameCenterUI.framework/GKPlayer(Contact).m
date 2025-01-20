@interface GKPlayer(Contact)
- (id)contact;
- (void)initWithContact:()Contact;
- (void)setContact:()Contact;
@end

@implementation GKPlayer(Contact)

- (void)initWithContact:()Contact
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F636E0] internalRepresentation];
  v6 = (void *)[a1 initWithInternalRepresentation:v5];
  v7 = v6;
  if (v6) {
    [v6 setContact:v4];
  }

  return v7;
}

- (id)contact
{
  return objc_getAssociatedObject(a1, @"_gkCNContact");
}

- (void)setContact:()Contact
{
  id v22 = a3;
  objc_setAssociatedObject(a1, @"_gkCNContact", v22, (void *)0x301);
  id v4 = v22;
  if (v22)
  {
    v5 = [v22 identifier];
    v6 = [a1 internal];
    [v6 setPlayerID:v5];

    v7 = [a1 internal];
    v8 = [v7 playerID];

    if (!v8)
    {
      v9 = [MEMORY[0x1E4F29128] UUID];
      v10 = [v9 UUIDString];
      v11 = [a1 internal];
      [v11 setPlayerID:v10];
    }
    v12 = [v22 givenName];
    v13 = [a1 internal];
    [v13 setFirstName:v12];

    v14 = [v22 familyName];
    v15 = [a1 internal];
    [v15 setLastName:v14];

    v16 = [MEMORY[0x1E4F1B910] stringFromContact:v22 style:0];
    v17 = [a1 internal];
    [v17 setCompositeName:v16];

    v18 = [a1 internal];
    [v18 setAlias:0];

    v19 = [a1 internal];
    [v19 setAvatarType:&unk_1F0812540];

    v20 = +[GKMessageUtilities messagesRecipientHandleForContact:v22];
    if (v20)
    {
      v21 = [a1 internal];
      [v21 setMessagesID:v20];
    }
    id v4 = v22;
  }
}

@end