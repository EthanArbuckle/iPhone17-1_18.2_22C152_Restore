@interface BBCommunicationContext(protobuf)
+ (id)communicationContextFromProtobuf:()protobuf;
+ (id)writeContentURLIfPossibleFromProtobuf:()protobuf;
- (id)blt_protobuf;
@end

@implementation BBCommunicationContext(protobuf)

+ (id)communicationContextFromProtobuf:()protobuf
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 identifier];
  [v5 setIdentifier:v6];

  v7 = [v4 displayName];
  [v5 setDisplayName:v7];

  v8 = [a1 writeContentURLIfPossibleFromProtobuf:v4];
  [v5 setContentURL:v8];

  v9 = [v4 recipients];
  v10 = objc_msgSend(v9, "bs_compactMap:", &__block_literal_global_11);
  [v5 setRecipients:v10];

  v11 = [v4 sender];

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F2BC68];
    v13 = [v4 sender];
    v14 = [v12 contactFromProtobuf:v13];
    [v5 setSender:v14];
  }
  if ([v4 hasMentionsCurrentUser]) {
    objc_msgSend(v5, "setMentionsCurrentUser:", objc_msgSend(v4, "mentionsCurrentUser"));
  }
  if ([v4 hasNotifyRecipientAnyway]) {
    objc_msgSend(v5, "setNotifyRecipientAnyway:", objc_msgSend(v4, "notifyRecipientAnyway"));
  }
  if ([v4 hasReplyToCurrentUser]) {
    objc_msgSend(v5, "setReplyToCurrentUser:", objc_msgSend(v4, "replyToCurrentUser"));
  }
  if ([v4 hasRecipientCount]) {
    objc_msgSend(v5, "setRecipientCount:", (int)objc_msgSend(v4, "recipientCount"));
  }
  if ([v4 hasImageName])
  {
    v15 = [v4 imageName];
    [v5 setImageName:v15];
  }
  if ([v4 hasSystemImage]) {
    objc_msgSend(v5, "setSystemImage:", objc_msgSend(v4, "systemImage"));
  }
  if ([v4 hasCapabilities]) {
    objc_msgSend(v5, "setCapabilities:", (int)objc_msgSend(v4, "capabilities"));
  }

  return v5;
}

+ (id)writeContentURLIfPossibleFromProtobuf:()protobuf
{
  id v3 = a3;
  if (![v3 hasContentURLData])
  {
    id v7 = 0;
    goto LABEL_12;
  }
  id v4 = [v3 contentURLLocalFileLocation];
  if (!v4)
  {
    v8 = blt_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BBCommunicationContext(protobuf) writeContentURLIfPossibleFromProtobuf:]((uint64_t)v3, v8);
    }
    goto LABEL_10;
  }
  v5 = [v3 contentURLData];
  BOOL v6 = +[BLTReferenceCountedFile retain:v4 fileData:v5];

  if (!v6)
  {
    v8 = blt_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BBCommunicationContext(protobuf) writeContentURLIfPossibleFromProtobuf:]();
    }
LABEL_10:

    id v7 = 0;
    goto LABEL_11;
  }
  id v7 = v4;
LABEL_11:

LABEL_12:
  return v7;
}

- (id)blt_protobuf
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  id v3 = [a1 identifier];
  [v2 setIdentifier:v3];

  [v2 setBundleIdentifier:&stru_26D5ED048];
  id v4 = [a1 displayName];
  [v2 setDisplayName:v4];

  objc_msgSend(v2, "setMentionsCurrentUser:", objc_msgSend(a1, "mentionsCurrentUser"));
  objc_msgSend(v2, "setNotifyRecipientAnyway:", objc_msgSend(a1, "notifyRecipientAnyway"));
  objc_msgSend(v2, "setReplyToCurrentUser:", objc_msgSend(a1, "isReplyToCurrentUser"));
  objc_msgSend(v2, "setRecipientCount:", objc_msgSend(a1, "recipientCount"));
  objc_msgSend(v2, "setSystemImage:", objc_msgSend(a1, "systemImage"));
  v5 = [a1 imageName];
  [v2 setImageName:v5];

  objc_msgSend(v2, "setCapabilities:", objc_msgSend(a1, "capabilities"));
  BOOL v6 = [a1 sender];

  if (v6)
  {
    id v7 = [a1 sender];
    v8 = objc_msgSend(v7, "blt_protobuf");
    [v2 setSender:v8];
  }
  v9 = [a1 contentURL];

  if (v9)
  {
    v10 = [a1 imageDataForContentURL];
    [v2 setContentURLData:v10];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = objc_msgSend(a1, "recipients", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "blt_protobuf");
        if (v16) {
          [v2 addRecipients:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v2;
}

+ (void)writeContentURLIfPossibleFromProtobuf:()protobuf .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Error generating contentURL fileName for protobuf %@", (uint8_t *)&v2, 0xCu);
}

+ (void)writeContentURLIfPossibleFromProtobuf:()protobuf .cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Error saving contentURLData to: %@ from protobuf %@");
}

@end