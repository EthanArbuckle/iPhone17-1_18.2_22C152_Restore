@interface XRWaitingRoom
+ (void)initialize;
- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4;
- (XRWaitingRoom)initWithDispatchQueue:(id)a3 funnelTarget:(id)a4;
- (XRWaitingRoom)initWithOwner:(id)a3 dispatchQueue:(id)a4;
- (id)ownerTicketForAgent:(id)a3 leaveWhenEmpty:(BOOL)a4;
- (id)visitorTicketForAgent:(id)a3 team:(id)a4;
- (int)agentStopDiagnosticsTypeCode;
- (void)_escortAgentToExit:(id)a3 withTicket:(id)a4;
- (void)abandon;
- (void)setupMeetingWithOwner:(id)a3 worker:(id)a4 mode:(id)a5;
- (void)setupMeetingWithOwner:(id)a3 worker:(id)a4 team:(id)a5 mode:(id)a6;
- (void)setupOwnerVisit:(id)a3 leaveWhenEmpty:(BOOL)a4 mode:(id)a5;
- (void)setupOwnerVisit:(id)a3 mode:(id)a4;
@end

@implementation XRWaitingRoom

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_2687AA030 = objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

- (XRWaitingRoom)initWithDispatchQueue:(id)a3 funnelTarget:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)XRWaitingRoom;
  v4 = [(XRMobileAgentQueueStop *)&v12 initWithDispatchQueue:a3 funnelTarget:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    unaffiliatedVisitorsWaiting = v4->_unaffiliatedVisitorsWaiting;
    v4->_unaffiliatedVisitorsWaiting = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    teamMembersWaiting = v4->_teamMembersWaiting;
    v4->_teamMembersWaiting = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    activeTeams = v4->_activeTeams;
    v4->_activeTeams = (NSMutableSet *)v9;
  }
  return v4;
}

- (XRWaitingRoom)initWithOwner:(id)a3 dispatchQueue:(id)a4
{
  result = [[XRWaitingRoom alloc] initWithDispatchQueue:a2 timeout:a4];
  if (result) {
    result->_ownerID = a3;
  }
  return result;
}

- (int)agentStopDiagnosticsTypeCode
{
  return 9;
}

- (BOOL)_holdReceivedAgent:(id)a3 ticket:(id)a4
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_ownerID != v6)
  {
    id v8 = v6;
    uint64_t v13 = [v8 v9:v10 v11:v12];
    v17 = (void *)v13;
    if (self->_abandoned)
    {
      [self _welcomeAgent_:v14 withTransitionContext:v15 withCompletion:v16];
    }
    else
    {
      visitingOwner = self->_visitingOwner;
      if (visitingOwner)
      {
        if (v13)
        {
          [self->_teamMembersWaiting addObject:v14 withTimeout:(uint64_t)v8 withTimeoutHandler:v15 withTimeoutHandlerContext:v16];
          [self->_activeTeams addObject:v64];
          v71 = [v17 members:v67, v68, v69, v70];
          int isSubsetOfSet = [v71 isSubsetOfSet:v72 withSet:self->_teamMembersWaiting withOptions:v73 withContext:v74];

          if (isSubsetOfSet)
          {
            v80 = v7;
            teamMembersWaiting = self->_teamMembersWaiting;
            v82 = [v17 members:v76, v77, v78, v79];
            [teamMembersWaiting removeObject:v83];

            [self->_visitingOwner setGreetingTeam:v86 withTransitionContext:v87 completion:v88];
            long long v169 = 0u;
            long long v170 = 0u;
            long long v167 = 0u;
            long long v168 = 0u;
            v93 = [v17 members:v89, v90, v91, v92];
            uint64_t v95 = [v93 countByEnumeratingWithState:v94 objects:&v167 count:16];
            if (v95)
            {
              uint64_t v99 = v95;
              uint64_t v100 = *(void *)v168;
              do
              {
                for (uint64_t i = 0; i != v99; ++i)
                {
                  if (*(void *)v168 != v100) {
                    objc_enumerationMutation(v93);
                  }
                  [*(void **)(*((void *)&v167 + 1) + 8 * i) setRoomOwner:v96 owner:self->_visitingOwner room:v97 roomType:v98];
                }
                uint64_t v99 = [v93 countByEnumeratingWithState:v96 objects:&v167 count:16];
              }
              while (v99);
            }

            v102 = self->_visitingOwner;
            v107 = [v17 members:v103, v104, v105, v106];
            [self _welcomeAgent_followedByAgents_:v108 withTransitionContext:(uint64_t)v102 completion:(uint64_t)v107 completionBlock:v109];

            v110 = self->_visitingOwner;
            self->_visitingOwner = 0;

            [self->_activeTeams removeObject:v111];
            uint64_t v7 = v80;
          }
        }
        else
        {
          [v8 setRoomOwner:v14 owner:visitingOwner];
          [self->_visitingOwner setGreetingVisitor:v159 withGreeting:v8 withGreetingType:v160 withGreetingContext:v161];
          [self _welcomeAgents:v162 visitingOwner:(uint64_t)self->_visitingOwner agentCount:v163 agentType:v164 agentIndex:v8];
          v165 = self->_visitingOwner;
          self->_visitingOwner = 0;
        }
      }
      else if (v13)
      {
        [self->_teamMembersWaiting addObject:v14 withTransitionContext:(uint64_t)v8 withCompletion:v15 withCompletionContext:v16];
        [self->_activeTeams addObject:v114 withKey:(uint64_t)v17 value:v115 andValue:v116];
      }
      else
      {
        [self->_unaffiliatedVisitorsWaiting addObject:v14 withTimeout:(uint64_t)v8 priority:v15 block:v16];
      }
    }

    goto LABEL_5;
  }
  p_visitingOwner = (uint64_t *)&self->_visitingOwner;
  objc_storeStrong((id *)&self->_visitingOwner, a3);
  if (self->_abandoned)
  {
    [self _welcomeAgent_:v20 visitingOwner:*p_visitingOwner visitingOwnerID:v22 visitingOwnerName:v23];
    v24 = (void *)*p_visitingOwner;
    uint64_t *p_visitingOwner = 0;
  }
  if (*p_visitingOwner)
  {
    if ([self->_unaffiliatedVisitorsWaiting count:v20, v21, v22, v23])
    {
      v29 = [self->_unaffiliatedVisitorsWaiting firstObjectWithOptions:v25, v26, v27, v28];
      [self->_unaffiliatedVisitorsWaiting removeObjectAtIndex:0];
      [v29 setRoomOwner:v33 visitingOwner:*p_visitingOwner roomOwner:v34 roomOwner:v35];
      [*p_visitingOwner setGreetingVisitor:v36 withGreeting:v37 withGreeting:v38];
      [self _welcomeAgents:v39 visitingOwner:*p_visitingOwner transitionContext:v40 completion:v41];
      v42 = (void *)*p_visitingOwner;
      uint64_t *p_visitingOwner = 0;
    }
    if (*p_visitingOwner)
    {
      if ([self->_teamMembersWaiting count:v25, v26, v27, v28])
      {
        long long v177 = 0u;
        long long v178 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        v47 = self->_activeTeams;
        uint64_t v49 = [v47 countByEnumeratingWithState:v48 objects:&v175 count:16];
        if (v49)
        {
          uint64_t v54 = v49;
          v166 = v7;
          uint64_t v55 = *(void *)v176;
LABEL_16:
          uint64_t v56 = 0;
          while (1)
          {
            if (*(void *)v176 != v55) {
              objc_enumerationMutation(v47);
            }
            v57 = *(void **)(*((void *)&v175 + 1) + 8 * v56);
            v58 = [v57 members:v50, v51, v52, v53];
            int v62 = [v58 isSubsetOfSet:v59 withSet:self->_teamMembersWaiting withOptions:v60 withContext:v61];

            if (v62) {
              break;
            }
            if (v54 == ++v56)
            {
              uint64_t v54 = [v47 countByEnumeratingWithState:v50 objects:&v175 count:16];
              if (v54) {
                goto LABEL_16;
              }
              uint64_t v7 = v166;
              goto LABEL_45;
            }
          }
          v117 = self->_teamMembersWaiting;
          v118 = [v57 members:v50, v51, v52, v53];
          [v117 -setObject:v119 forKey:(uint64_t)v118 withObject:v120 withObject:v121];

          [*p_visitingOwner setGreetingTeam:v122 withTransitionContext:v57 withTransitionContext:v123 withTransitionContext:v124];
          long long v173 = 0u;
          long long v174 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          v129 = [v57 performSelector:v125 withObject:v126 withObject:v127 withObject:v128];
          uint64_t v131 = [v129 countByEnumeratingWithState:v130 objects:v171 count:v180];
          uint64_t v7 = v166;
          if (v131)
          {
            uint64_t v135 = v131;
            uint64_t v136 = *(void *)v172;
            do
            {
              for (uint64_t j = 0; j != v135; ++j)
              {
                if (*(void *)v172 != v136) {
                  objc_enumerationMutation(v129);
                }
                [*(void **)(*((void *)&v171 + 1) + 8 * j) setRoomOwner:v132 visitingOwner:v133 roomOwner:v134];
              }
              uint64_t v135 = [v129 countByEnumeratingWithState:v132 objects:v180 count:16];
            }
            while (v135);
          }

          uint64_t v138 = *p_visitingOwner;
          v143 = [v57 performSelector:v139 withObject:v140 withObject:v141 withObject:v142];
          [self _welcomeAgent_followedByAgents_:v144 v138:(uint64_t)v143 v145:v145];

          v146 = (void *)*p_visitingOwner;
          uint64_t *p_visitingOwner = 0;

          v147 = v57;
          if (v147)
          {
            [self->_activeTeams removeObject:v43];
            v47 = v147;
            goto LABEL_45;
          }
        }
        else
        {
LABEL_45:
        }
      }
      if (*p_visitingOwner)
      {
        v148 = [*p_visitingOwner performSelector:v43 withObject:v44 withObject:v45 withObject:v46];
        uint64_t v149 = qword_2687AA030;

        if (v148 == (void *)v149)
        {
          [*p_visitingOwner setGreetingTeam:v150];
          [*p_visitingOwner setGreetingVisitor:v153];
          [self _welcomeAgent_:v156 visitingOwner:*p_visitingOwner visitingOwnerType:v157 visitingOwnerTypeName:v158];
          id v8 = (id)*p_visitingOwner;
          uint64_t *p_visitingOwner = 0;
LABEL_5:
        }
      }
    }
  }

  return 1;
}

- (void)_escortAgentToExit:(id)a3 withTicket:(id)a4
{
  id v5 = a3;
  id v12 = v5;
  if (self->_ownerID == v5)
  {
    [v5 setGreetingVisitor:v6];
    [v12 setGreetingTeam:v9];
  }
  else
  {
    [v5 setRoomOwner:v6];
  }
}

- (void)setupMeetingWithOwner:(id)a3 worker:(id)a4 mode:(id)a5
{
  id v19 = a3;
  id v9 = a5;
  if ([a4 _holdsItinerary:v10 withTransitionContext:(uint64_t)v19 completion:v11] == NO)
  {
    v17 = [MEMORY[0x263F08690] currentHandler:v13, v14, v15, v16];
    [v17 _callOutQueue_willDestroyWithTransitionContext:v18 completion:^(BOOL success) {
    if (success) {
        return;
    }
    [self _handleFailureInMethod:v18 object:a2 file:@"XRWaitingRoom.m" lineNumber:198 description:@"Invalid parameter not satisfying: %@", @"[worker holdsItinerary:workersItinerary]"];
}];
  }
  [v19 setNextStop:v13 mode:self ticket:v9];
}

- (void)setupMeetingWithOwner:(id)a3 worker:(id)a4 team:(id)a5 mode:(id)a6
{
  id v36 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  if ([v36 _holdItinerary:v14 withItineraryID:(uint64_t)v13 forUser:(id)v15 withTransitionContext:v16] == NO)
  {
    uint64_t v32 = [MEMORY[0x263F08690] _currentHandler:v17, v18, v19, v20];
    [v32 _handleFailureInMethod:v33 object:a2 file:@"XRWaitingRoom.m" lineNumber:203 description:@"Invalid parameter not satisfying: %@", @"[worker holdsItinerary:workersItinerary]"];
  }
  uint64_t v21 = [v11 v17:v18 v19:v20];
  char v25 = [v21 containsObject:v22 withHash:v36 withKey:v23 withKey:v24];

  if ((v25 & 1) == 0)
  {
    uint64_t v34 = [MEMORY[0x263F08690] _currentHandler:v26 v27:v28 v29:v29];
    [v34 _handleFailureInMethod:v35 object:a2 file:@"XRWaitingRoom.m" lineNumber:204 description:@"Invalid parameter not satisfying: %@", @"[team.members containsObject:worker]"];
  }
  v30 = [self visitorTicketForAgent:v26 team:(uint64_t)v36 transitionContext:(uint64_t)v11];
  [v13 setNextStop:v31 mode:self ticket:v12];
}

- (id)visitorTicketForAgent:(id)a3 team:(id)a4
{
  id v4 = a4;

  return v4;
}

- (id)ownerTicketForAgent:(id)a3 leaveWhenEmpty:(BOOL)a4
{
  BOOL v5 = a4;
  if (self->_ownerID != a3)
  {
    uint64_t v10 = [MEMORY[0x263F08690] performSelector:a2 withObject:a3 withObject:a4 withObject:v4];
    [v10 handleFailureInMethod:v11 object:a2 file:@"XRWaitingRoom.m" lineNumber:215 description:@"Invalid parameter not satisfying: %@", @"agent == _ownerID"];
  }
  if (v5) {
    id v6 = (void *)qword_2687AA030;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)setupOwnerVisit:(id)a3 leaveWhenEmpty:(BOOL)a4 mode:(id)a5
{
  if (a4) {
    [a3 setNextStop:a2 mode:self ticket:a5];
  }
  else {
    [a3 setNextStop:a2 mode:self ticket:a5];
  }
}

- (void)setupOwnerVisit:(id)a3 mode:(id)a4
{
}

- (void)abandon
{
  id v6 = [self _funnelQueue:a2 withBlock:v2 withContext:v3 withCompletion:v4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_234576ECC;
  block[3] = &unk_264BF0B40;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTeams, 0);
  objc_storeStrong((id *)&self->_teamMembersWaiting, 0);
  objc_storeStrong((id *)&self->_unaffiliatedVisitorsWaiting, 0);

  objc_storeStrong((id *)&self->_visitingOwner, 0);
}

@end