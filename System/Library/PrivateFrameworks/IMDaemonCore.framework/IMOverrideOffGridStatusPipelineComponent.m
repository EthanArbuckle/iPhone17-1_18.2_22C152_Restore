@interface IMOverrideOffGridStatusPipelineComponent
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IMOverrideOffGridStatusPipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v4 = [v3 senderRegistrationProperties];
  int v5 = [v4 containsObject:*MEMORY[0x1E4F6B2C0]];

  v6 = [v3 chat];
  v7 = v6;
  if (v5 && [v6 style] == 45)
  {
    v8 = [v7 participants];
    v9 = [v8 firstObject];

    if ([v9 cachedOffGridMode])
    {
      v10 = (void *)MEMORY[0x1E4F1C9C8];
      v11 = [v3 timestamp];
      v12 = objc_msgSend(v10, "__im_iMessageDateFromTimeStamp:", v11);

      v13 = [MEMORY[0x1E4F6E7B0] sharedInstance];
      v14 = [v9 ID];
      [v13 overrideStatusForHandleWithID:v14 publishedBeforeDate:v12];

      v15 = +[IMDBroadcastController sharedProvider];
      v16 = [v15 broadcasterForChatListeners];
      v17 = [v7 accountID];
      v18 = [v9 ID];
      [v16 account:v17 handleID:v18 updatedLastReceivedOnGridMessageDate:v12];
    }
  }
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v3];

  return v19;
}

@end