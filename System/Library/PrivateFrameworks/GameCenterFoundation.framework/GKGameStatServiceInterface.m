@interface GKGameStatServiceInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKGameStatServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EAEB50;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_getRecentMatchesForGameDescriptor_leaderboardIdentifier_handler_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_getRecentMatchesForGameDescriptor_leaderboardIdentifier_handler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_getRecentMatchesForGameDescriptor_achievementIdentifier_handler_ argumentIndex:0 ofReply:0];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel_getRecentMatchesForGameDescriptor_achievementIdentifier_handler_ argumentIndex:0 ofReply:1];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel_getRecentMatchesForGameDescriptor_includeCompatibleMultiplayerGames_handler_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v4 setClasses:v21 forSelector:sel_getRecentMatchesForGameDescriptor_includeCompatibleMultiplayerGames_handler_ argumentIndex:0 ofReply:1];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v4 setClasses:v24 forSelector:sel_getRecentMatchesForGameDescriptor_otherPlayer_handler_ argumentIndex:0 ofReply:0];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  [v4 setClasses:v27 forSelector:sel_getRecentMatchesForGameDescriptor_otherPlayer_handler_ argumentIndex:0 ofReply:1];

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  [v4 setClasses:v30 forSelector:sel_getRecentPlayersWithHandler_ argumentIndex:0 ofReply:1];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  [v4 setClasses:v33 forSelector:sel_getAchievementDescriptionsForGameDescriptor_handler_ argumentIndex:0 ofReply:0];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  [v4 setClasses:v36 forSelector:sel_getAchievementDescriptionsForGameDescriptor_handler_ argumentIndex:0 ofReply:1];

  v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  v41 = objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
  [v4 setClasses:v41 forSelector:sel_getAchievementsForGameDescriptor_players_handler_ argumentIndex:0 ofReply:1];

  v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  [v4 setClasses:v44 forSelector:sel_getAchievementsForGameDescriptor_players_handler_ argumentIndex:0 ofReply:0];

  v45 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v46 = objc_opt_class();
  v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
  [v4 setClasses:v47 forSelector:sel_getAchievementsForGameDescriptor_players_handler_ argumentIndex:1 ofReply:0];

  v48 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  [v4 setClasses:v50 forSelector:sel_submitAchievements_whileScreeningChallenges_withEligibleChallenges_handler_ argumentIndex:0 ofReply:0];

  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = objc_opt_class();
  v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  [v4 setClasses:v53 forSelector:sel_submitAchievements_whileScreeningChallenges_withEligibleChallenges_handler_ argumentIndex:2 ofReply:0];

  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  v56 = objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
  [v4 setClasses:v56 forSelector:sel_submitScores_whileScreeningChallenges_withEligibleChallenges_handler_ argumentIndex:0 ofReply:0];

  v57 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v58 = objc_opt_class();
  v59 = objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  [v4 setClasses:v59 forSelector:sel_submitScores_whileScreeningChallenges_withEligibleChallenges_handler_ argumentIndex:2 ofReply:0];

  v60 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v61 = objc_opt_class();
  v62 = objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
  [v4 setClasses:v62 forSelector:sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_ argumentIndex:0 ofReply:0];

  v63 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v64 = objc_opt_class();
  v65 = objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0);
  [v4 setClasses:v65 forSelector:sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_ argumentIndex:1 ofReply:0];

  v66 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v67 = objc_opt_class();
  v68 = objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
  [v4 setClasses:v68 forSelector:sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_ argumentIndex:2 ofReply:0];

  v69 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v70 = objc_opt_class();
  v71 = objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
  [v4 setClasses:v71 forSelector:sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_ argumentIndex:3 ofReply:0];

  v72 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v73 = objc_opt_class();
  v74 = objc_msgSend(v72, "setWithObjects:", v73, objc_opt_class(), 0);
  [v4 setClasses:v74 forSelector:sel_getLeaderboardSummaryForGameDescriptor_localPlayer_baseLeaderboardID_leaderboardID_timeScope_handler_ argumentIndex:0 ofReply:1];

  v75 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v76 = objc_opt_class();
  v77 = objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
  [v4 setClasses:v77 forSelector:sel_getLeaderboardsForGameDescriptor_player_setIdentifier_handler_ argumentIndex:0 ofReply:0];

  v78 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v79 = objc_opt_class();
  v80 = objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
  [v4 setClasses:v80 forSelector:sel_getLeaderboardsForGameDescriptor_player_setIdentifier_handler_ argumentIndex:1 ofReply:0];

  v81 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v82 = objc_opt_class();
  v83 = objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
  [v4 setClasses:v83 forSelector:sel_getLeaderboardsForGameDescriptor_player_setIdentifier_handler_ argumentIndex:0 ofReply:1];

  v84 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v85 = objc_opt_class();
  v86 = objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
  [v4 setClasses:v86 forSelector:sel_getLeaderboardSetsForGameDescriptor_handler_ argumentIndex:0 ofReply:0];

  v87 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v88 = objc_opt_class();
  v89 = objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
  [v4 setClasses:v89 forSelector:sel_getLeaderboardSetsForGameDescriptor_handler_ argumentIndex:0 ofReply:1];

  v90 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v91 = objc_opt_class();
  v92 = objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
  [v4 setClasses:v92 forSelector:sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_ argumentIndex:0 ofReply:0];

  v93 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v94 = objc_opt_class();
  v95 = objc_msgSend(v93, "setWithObjects:", v94, objc_opt_class(), 0);
  [v4 setClasses:v95 forSelector:sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_ argumentIndex:1 ofReply:0];

  v96 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v97 = objc_opt_class();
  v98 = objc_msgSend(v96, "setWithObjects:", v97, objc_opt_class(), 0);
  [v4 setClasses:v98 forSelector:sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_ argumentIndex:2 ofReply:0];

  v99 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v100 = objc_opt_class();
  v101 = objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
  [v4 setClasses:v101 forSelector:sel_getLeaderboardsForGameDescriptor_player_leaderboardIDs_setIdentifier_handler_ argumentIndex:0 ofReply:1];

  v102 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v103 = objc_opt_class();
  v104 = objc_msgSend(v102, "setWithObjects:", v103, objc_opt_class(), 0);
  [v4 setClasses:v104 forSelector:sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_ argumentIndex:0 ofReply:0];

  v105 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v106 = objc_opt_class();
  v107 = objc_msgSend(v105, "setWithObjects:", v106, objc_opt_class(), 0);
  [v4 setClasses:v107 forSelector:sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_ argumentIndex:1 ofReply:0];

  v108 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v109 = objc_opt_class();
  v110 = objc_msgSend(v108, "setWithObjects:", v109, objc_opt_class(), 0);
  [v4 setClasses:v110 forSelector:sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_ argumentIndex:2 ofReply:0];

  v111 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v112 = objc_opt_class();
  v113 = objc_msgSend(v111, "setWithObjects:", v112, objc_opt_class(), 0);
  [v4 setClasses:v113 forSelector:sel_getPreviousInstanceForLeaderboard_gameDescriptor_player_handler_ argumentIndex:0 ofReply:1];

  v114 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v115 = objc_opt_class();
  v116 = objc_msgSend(v114, "setWithObjects:", v115, objc_opt_class(), 0);
  [v4 setClasses:v116 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:0 ofReply:0];

  v117 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v118 = objc_opt_class();
  v119 = objc_msgSend(v117, "setWithObjects:", v118, objc_opt_class(), 0);
  [v4 setClasses:v119 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:1 ofReply:0];

  v120 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v121 = objc_opt_class();
  v122 = objc_msgSend(v120, "setWithObjects:", v121, objc_opt_class(), 0);
  [v4 setClasses:v122 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:2 ofReply:0];

  v123 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v124 = objc_opt_class();
  v125 = objc_msgSend(v123, "setWithObjects:", v124, objc_opt_class(), 0);
  [v4 setClasses:v125 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:6 ofReply:0];

  v126 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v127 = objc_opt_class();
  v128 = objc_msgSend(v126, "setWithObjects:", v127, objc_opt_class(), 0);
  [v4 setClasses:v128 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:0 ofReply:1];

  v129 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v130 = objc_opt_class();
  v131 = objc_msgSend(v129, "setWithObjects:", v130, objc_opt_class(), 0);
  [v4 setClasses:v131 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:1 ofReply:1];

  v132 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v133 = objc_opt_class();
  v134 = objc_msgSend(v132, "setWithObjects:", v133, objc_opt_class(), 0);
  [v4 setClasses:v134 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_ argumentIndex:0 ofReply:0];

  v135 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v136 = objc_opt_class();
  v137 = objc_msgSend(v135, "setWithObjects:", v136, objc_opt_class(), 0);
  [v4 setClasses:v137 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_ argumentIndex:1 ofReply:0];

  v138 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v139 = objc_opt_class();
  v140 = objc_msgSend(v138, "setWithObjects:", v139, objc_opt_class(), 0);
  [v4 setClasses:v140 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_ argumentIndex:2 ofReply:0];

  v141 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v142 = objc_opt_class();
  v143 = objc_msgSend(v141, "setWithObjects:", v142, objc_opt_class(), 0);
  [v4 setClasses:v143 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_ argumentIndex:6 ofReply:0];

  v144 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v145 = objc_opt_class();
  v146 = objc_msgSend(v144, "setWithObjects:", v145, objc_opt_class(), 0);
  [v4 setClasses:v146 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_ argumentIndex:0 ofReply:1];

  v147 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v148 = objc_opt_class();
  v149 = objc_msgSend(v147, "setWithObjects:", v148, objc_opt_class(), 0);
  [v4 setClasses:v149 forSelector:sel_getEntriesForLeaderboard_gameDescriptor_localPlayer_playerScope_timeScope_range_players_locale_handler_ argumentIndex:1 ofReply:1];

  v150 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v151 = objc_opt_class();
  v152 = objc_msgSend(v150, "setWithObjects:", v151, objc_opt_class(), 0);
  [v4 setClasses:v152 forSelector:sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_ argumentIndex:2 ofReply:0];

  v153 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v154 = objc_opt_class();
  v155 = objc_msgSend(v153, "setWithObjects:", v154, objc_opt_class(), 0);
  [v4 setClasses:v155 forSelector:sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_ argumentIndex:3 ofReply:0];

  v156 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v157 = objc_opt_class();
  v158 = objc_msgSend(v156, "setWithObjects:", v157, objc_opt_class(), 0);
  [v4 setClasses:v158 forSelector:sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_ argumentIndex:5 ofReply:0];

  v159 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v160 = objc_opt_class();
  v161 = objc_msgSend(v159, "setWithObjects:", v160, objc_opt_class(), 0);
  [v4 setClasses:v161 forSelector:sel_submitScore_context_leaderboardIDs_forPlayer_whileScreeningChallenges_withEligibleChallenges_gameDescriptor_handler_ argumentIndex:6 ofReply:0];

  v162 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v163 = objc_opt_class();
  v164 = objc_msgSend(v162, "setWithObjects:", v163, objc_opt_class(), 0);
  [v4 setClasses:v164 forSelector:sel_submitInstanceScore_context_leaderboard_forPlayer_whileScreeningChallenges_withEligibleChallenges_handler_ argumentIndex:2 ofReply:0];

  v165 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v166 = objc_opt_class();
  objc_msgSend(v165, "setWithObjects:", v166, objc_opt_class(), 0);
  id v167 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v167 forSelector:sel_submitInstanceScore_context_leaderboard_forPlayer_whileScreeningChallenges_withEligibleChallenges_handler_ argumentIndex:3 ofReply:0];
}

@end