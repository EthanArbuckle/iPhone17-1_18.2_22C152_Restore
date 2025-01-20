@interface NSArray
@end

@implementation NSArray

uint64_t __58__NSArray_GKCollectionUtils___gkMapConcurrentlyWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(a1 + 40) + 8 * a3) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__NSArray_GKCollectionUtils___gkMapWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __49__NSArray_GKCollectionUtils___gkFilterWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

void __57__NSArray_GKCollectionUtils___gkSubarraysByKeyWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    if (!v4)
    {
      v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
    }
    [v4 addObject:v5];
  }
}

void __60__NSArray_GKCollectionUtils___gkFoldWithInitialValue_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, id))(v6 + 16);
  id v11 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = v7(v6, a2, a3, v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __58__NSArray_GKCollectionUtils___gkIndexOfObjectPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = result;
  return result;
}

id __56__NSArray_ScopedIDs___gkUpdateInternalPlayersScopedIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 scopedIDs];
  if (v3) {
    v4 = 0;
  }
  else {
    v4 = v2;
  }
  id v5 = v4;

  return v5;
}

void __56__NSArray_ScopedIDs___gkUpdateInternalPlayersScopedIDs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "playerID", (void)v12);
        id v11 = [v3 objectForKeyedSubscript:v10];
        [v9 setScopedIDs:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __70__NSArray_GKPlayerCanonicalization___gkIncompletePlayersFromPlayerIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = NSString;
    id v4 = [NSString stringWithFormat:@"expected legacy playerID, got %@", v2];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v6 = [v5 lastPathComponent];
    uint64_t v7 = [v3 stringWithFormat:@"%@ ([playerID isKindOfClass:[NSString class]])\n[%s (%s:%d)]", v4, "-[NSArray(GKPlayerCanonicalization) _gkIncompletePlayersFromPlayerIDs]_block_invoke", objc_msgSend(v6, "UTF8String"), 1026];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  }
  uint64_t v8 = +[GKPlayer playerFromPlayerID:v2];

  return v8;
}

id __61__NSArray_GKPlayerCanonicalization___gkPlayersIDsFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = NSString;
    id v4 = [NSString stringWithFormat:@"expected GKPlayer, got %@", v2];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v6 = [v5 lastPathComponent];
    uint64_t v7 = [v3 stringWithFormat:@"%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]", v4, "-[NSArray(GKPlayerCanonicalization) _gkPlayersIDsFromPlayers]_block_invoke", objc_msgSend(v6, "UTF8String"), 1034];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  }
  uint64_t v8 = [v2 internal];
  uint64_t v9 = [v8 playerID];

  return v9;
}

id __63__NSArray_GKPlayerCanonicalization___gkPlayersIDsFromInternals__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = NSString;
    id v4 = [NSString stringWithFormat:@"expected GKPlayerInternal, got %@", v2];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v6 = [v5 lastPathComponent];
    uint64_t v7 = [v3 stringWithFormat:@"%@ ([internal isKindOfClass:[GKPlayerInternal class]])\n[%s (%s:%d)]", v4, "-[NSArray(GKPlayerCanonicalization) _gkPlayersIDsFromInternals]_block_invoke", objc_msgSend(v6, "UTF8String"), 1042];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  }
  uint64_t v8 = [v2 playerID];

  return v8;
}

id __60__NSArray_GKPlayerCanonicalization___gkPlayersFromInternals__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = NSString;
    id v4 = [NSString stringWithFormat:@"expected GKPlayerInternal, got %@", v2];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v6 = [v5 lastPathComponent];
    uint64_t v7 = [v3 stringWithFormat:@"%@ ([internal isKindOfClass:[GKPlayerInternal class]])\n[%s (%s:%d)]", v4, "-[NSArray(GKPlayerCanonicalization) _gkPlayersFromInternals]_block_invoke", objc_msgSend(v6, "UTF8String"), 1050];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  }
  uint64_t v8 = +[GKPlayer canonicalizedPlayerForInternal:v2];

  return v8;
}

id __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = NSString;
    id v4 = [NSString stringWithFormat:@"expected GKPlayer, got %@", v2];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v6 = [v5 lastPathComponent];
    uint64_t v7 = [v3 stringWithFormat:@"%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]", v4, "-[NSArray(GKPlayerCanonicalization) _gkInternalsFromPlayers]_block_invoke", objc_msgSend(v6, "UTF8String"), 1060];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  }
  uint64_t v8 = [v2 internal];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v10 = GKOSLoggers();
      uint64_t v9 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_1(v9);
    }
  }
  else
  {
    id v11 = [v8 playerID];

    if (v11)
    {
      id v12 = v8;
      goto LABEL_15;
    }
    long long v13 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v14 = GKOSLoggers();
      long long v13 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_2();
    }
  }
  id v12 = 0;
LABEL_15:

  return v12;
}

uint64_t __69__NSArray_GKPlayerCanonicalization___gkInternalsFromUncheckedPlayers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 internal];
}

void __71__NSArray_GKPlayerCanonicalization___gkValidatePlayersForReturnFromAPI__block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v2 = NSString;
    id v3 = [NSString stringWithFormat:@"Assertion failed"];
    id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v5 = [v4 lastPathComponent];
    id v6 = [v2 stringWithFormat:@"%@ ([player isKindOfClass:[GKPlayer class]])\n[%s (%s:%d)]", v3, "-[NSArray(GKPlayerCanonicalization) _gkValidatePlayersForReturnFromAPI]_block_invoke", objc_msgSend(v5, "UTF8String"), 1087];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v6 format];
  }
  uint64_t v7 = [v20 alias];

  if (!v7)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = [NSString stringWithFormat:@"Assertion failed"];
    id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = [v8 stringWithFormat:@"%@ (player.alias != ((void *)0))\n[%s (%s:%d)]", v9, "-[NSArray(GKPlayerCanonicalization) _gkValidatePlayersForReturnFromAPI]_block_invoke", objc_msgSend(v11, "UTF8String"), 1088];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
  }
  long long v13 = [v20 internal];
  id v14 = [v13 playerID];

  if (!v14)
  {
    long long v15 = NSString;
    v16 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m"];
    id v18 = [v17 lastPathComponent];
    v19 = [v15 stringWithFormat:@"%@ (player.internal.playerID != ((void *)0))\n[%s (%s:%d)]", v16, "-[NSArray(GKPlayerCanonicalization) _gkValidatePlayersForReturnFromAPI]_block_invoke", objc_msgSend(v18, "UTF8String"), 1089];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v19 format];
  }
}

id __62__NSArray_GKGuestPlayerFilters___gkNonGuestPlayersFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isGuestPlayer] & 1) != 0 || (objc_msgSend(v2, "isLocalPlayer")) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

id __59__NSArray_GKGuestPlayerFilters___gkGuestPlayersFromPlayers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isGuestPlayer]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "filtering unauthenticated local player internal", v1, 2u);
}

void __60__NSArray_GKPlayerCanonicalization___gkInternalsFromPlayers__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "filtering player internal with nil playerID %@", v1, 0xCu);
}

@end