@interface SGEKEventConversions
+ (id)urlForEKEventFromMailMessageWithId:(id)a3 sentAt:(id)a4 opaqueKey:(id)a5;
+ (id)urlForEKEventFromTextMessageWithUniqueIdentifier:(id)a3;
+ (id)urlForMailMessageWithId:(id)a3;
@end

@implementation SGEKEventConversions

+ (id)urlForEKEventFromTextMessageWithUniqueIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"SGEKEventConversions.m", 42, @"Invalid parameter not satisfying: %@", @"messageId" object file lineNumber description];
  }
  v6 = objc_opt_new();
  [v6 setScheme:@"sms"];
  [v6 setHost:@"open"];
  v7 = [MEMORY[0x1E4F290C8] queryItemWithName:@"message-guid" value:v5];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v6 setQueryItems:v8];

  v9 = [v6 URL];

  return v9;
}

+ (id)urlForMailMessageWithId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"SGEKEventConversions.m", 33, @"Invalid parameter not satisfying: %@", @"messageId" object file lineNumber description];
  }
  v6 = objc_opt_new();
  [v6 setScheme:@"message"];
  [v6 setPath:v5];
  v7 = [v6 URL];

  return v7;
}

+ (id)urlForEKEventFromMailMessageWithId:(id)a3 sentAt:(id)a4 opaqueKey:(id)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"SGEKEventConversions.m", 21, @"Invalid parameter not satisfying: %@", @"sentAt" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"SGEKEventConversions.m", 20, @"Invalid parameter not satisfying: %@", @"messageId" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"SGEKEventConversions.m", 22, @"Invalid parameter not satisfying: %@", @"opaqueKey" object file lineNumber description];

LABEL_4:
  v12 = objc_opt_new();
  [v12 setScheme:@"message"];
  [v12 setPath:v9];
  v13 = (void *)MEMORY[0x1E4F290C8];
  id v14 = [NSString alloc];
  [v10 timeIntervalSince1970];
  v16 = objc_msgSend(v14, "initWithFormat:", @"%lu", (uint64_t)v15);
  v17 = [v13 queryItemWithName:@"c" value:v16];
  v25[0] = v17;
  v18 = [MEMORY[0x1E4F290C8] queryItemWithName:@"k" value:v11];
  v25[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [v12 setQueryItems:v19];

  v20 = [v12 URL];

  return v20;
}

@end