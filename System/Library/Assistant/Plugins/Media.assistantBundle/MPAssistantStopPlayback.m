@interface MPAssistantStopPlayback
- (void)performWithCompletion:(id)a3;
@end

@implementation MPAssistantStopPlayback

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPAssistantPausePlayback);
  v6 = [(MPAssistantStopPlayback *)self hashedRouteUIDs];
  [(MPAssistantPausePlayback *)v5 setHashedRouteUIDs:v6];

  v7 = [(MPAssistantStopPlayback *)self refId];
  [(MPAssistantPausePlayback *)v5 setRefId:v7];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D4253E48;
  v9[3] = &unk_1E69E3A10;
  id v10 = v4;
  id v8 = v4;
  [(MPAssistantPausePlayback *)v5 performWithCompletion:v9];
}

@end