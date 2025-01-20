@interface GKTurnBasedMatch(TurnBased)
- (id)matchTitle;
- (id)showcasePlayer;
- (uint64_t)isAllAutomatchedPlayer;
@end

@implementation GKTurnBasedMatch(TurnBased)

- (uint64_t)isAllAutomatchedPlayer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [a1 participants];
  uint64_t v1 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v6 = [v5 internal];
        v7 = [v6 playerID];
        v8 = [MEMORY[0x1E4F63760] local];
        v9 = [v8 playerID];
        char v10 = [v7 isEqualToString:v9];

        if ((v10 & 1) == 0)
        {
          v11 = [v5 internal];
          int v12 = [v11 isAutomatchParticipant];

          if (!v12)
          {
            uint64_t v13 = 0;
            goto LABEL_12;
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 1;
LABEL_12:

  return v13;
}

- (id)matchTitle
{
  if ([a1 isAllAutomatchedPlayer]) {
    goto LABEL_2;
  }
  uint64_t v4 = [a1 playingWithParticipantOrFirstKnownPlayer];
  if (!v4) {
    goto LABEL_7;
  }
  v5 = (void *)v4;
  v6 = [a1 playingWithParticipantOrFirstKnownPlayer];
  v7 = [v6 internal];
  v8 = [v7 invitedBy];

  if (v8)
  {
    v9 = [a1 playingWithParticipantOrFirstKnownPlayer];
    char v10 = [v9 internal];
    v11 = [v10 invitedBy];
    int v12 = [v11 isLocalPlayer];

    if (v12)
    {
LABEL_2:
      uint64_t v2 = GKGameCenterUIFrameworkBundle();
      uint64_t v3 = GKGetLocalizedStringFromTableInBundle();
      goto LABEL_10;
    }
    long long v18 = NSString;
    uint64_t v2 = GKGameCenterUIFrameworkBundle();
    v14 = GKGetLocalizedStringFromTableInBundle();
    v15 = [a1 playingWithParticipantOrFirstKnownPlayer];
    long long v16 = [v15 internal];
    long long v17 = [v16 invitedBy];
    long long v19 = [v17 displayNameWithOptions:1];
    uint64_t v3 = objc_msgSend(v18, "stringWithFormat:", v14, v19);
  }
  else
  {
LABEL_7:
    uint64_t v13 = NSString;
    uint64_t v2 = GKGameCenterUIFrameworkBundle();
    v14 = GKGetLocalizedStringFromTableInBundle();
    v15 = [a1 playingWithParticipantOrFirstKnownPlayer];
    long long v16 = [v15 player];
    long long v17 = [v16 displayNameWithOptions:1];
    uint64_t v3 = objc_msgSend(v13, "stringWithFormat:", v14, v17);
  }

LABEL_10:

  return v3;
}

- (id)showcasePlayer
{
  if ([a1 isAllAutomatchedPlayer]) {
    goto LABEL_5;
  }
  uint64_t v2 = [a1 playingWithParticipantOrFirstKnownPlayer];
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = [a1 playingWithParticipantOrFirstKnownPlayer];
  v5 = [v4 internal];
  v6 = [v5 invitedBy];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F63788]);
    v8 = [a1 playingWithParticipantOrFirstKnownPlayer];
    v9 = [v8 internal];
    char v10 = [v9 invitedBy];
    v11 = (void *)[v7 initWithInternalRepresentation:v10];
  }
  else
  {
LABEL_5:
    v8 = [a1 localPlayerParticipant];
    v11 = [v8 player];
  }

  return v11;
}

@end