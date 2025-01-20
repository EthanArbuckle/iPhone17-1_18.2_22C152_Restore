@interface MPCustomDataPlaybackQueue(MPCAdditions)
- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:;
@end

@implementation MPCustomDataPlaybackQueue(MPCAdditions)

- (void)getMusicPlaybackContextWithOptions:()MPCAdditions completion:
{
  uint64_t v374 = *MEMORY[0x263EF8340];
  v328 = a4;
  v327 = [a1 identifier];
  if ([v327 isEqualToString:@"InProcess-com.apple.mediaplayer.playbackcontext"])
  {
    v6 = [a1 mediaRemoteOptions];
    v7 = [v6 objectForKeyedSubscript:@"playbackContext"];
    v8 = (void (*)(void))v328[2];
LABEL_3:
    v8();

LABEL_4:
    goto LABEL_406;
  }
  if ([v327 isEqualToString:@"com.apple.music.playbackqueue.tracklist"])
  {
    v324 = [a1 data];
    if (!v324)
    {
      v46 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 5, @"Missing tracklist data in playback queue.");
      ((void (*)(void *, void, void *))v328[2])(v328, 0, v46);

LABEL_405:
      goto LABEL_406;
    }
    v9 = [[_MPCProtoTracklist alloc] initWithData:v324];
    *(void *)v353 = 0;
    *(void *)&v353[8] = v353;
    *(void *)&v353[16] = 0x3032000000;
    v354 = __Block_byref_object_copy__24262;
    v355 = __Block_byref_object_dispose__24263;
    id v356 = [a1 featureName];
    v348[0] = 0;
    v348[1] = v348;
    v348[2] = (id)0x3032000000;
    v348[3] = __Block_byref_object_copy__24262;
    v348[4] = __Block_byref_object_dispose__24263;
    id v349 = [a1 queueGroupingID];
    id v10 = objc_alloc_init(MEMORY[0x263F120D8]);
    v351[0] = 0;
    v351[1] = v351;
    v351[2] = 0x3032000000;
    v351[3] = __Block_byref_object_copy__24262;
    v351[4] = __Block_byref_object_dispose__24263;
    id v352 = 0;
    if (v9)
    {
      v11 = v9->_startingItemIndexPath;
      accountInfos = v9->_accountInfos;
    }
    else
    {
      v11 = 0;
      accountInfos = 0;
    }
    v312 = accountInfos;
    v13 = [(NSMutableArray *)v312 firstObject];
    v337[0] = MEMORY[0x263EF8330];
    v337[1] = 3221225472;
    v338 = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke;
    v339 = &unk_2643C3F50;
    v344 = v328;
    v306 = v9;
    v340 = v306;
    id v309 = v10;
    id v341 = v309;
    v345 = v353;
    v346 = v348;
    v347 = v351;
    v311 = v11;
    v342 = v311;
    v343 = a1;
    id v316 = v13;
    v314 = v337;
    v14 = +[MPCPlaybackAccountManager sharedManager];
    v318 = [v14 activeAccount];

    if (v318)
    {
      if ([v318 hasCatalogPlaybackCapability])
      {
        if (!v316)
        {
          v61 = _MPCLogCategoryMusicBehavior();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = 0;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v318;
            _os_log_impl(&dword_21BB87000, v61, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [empty accountInfo] account=%{public}@", buf, 0x16u);
          }

          id v58 = v318;
          v62 = [MPCPlaybackRequestEnvironment alloc];
          v63 = [v58 userIdentity];
          p_super = [(MPCPlaybackRequestEnvironment *)v62 initWithUserIdentity:v63];

          v338((uint64_t)v314, p_super, 0, 0);
          goto LABEL_403;
        }
        v15 = v316;
        v16 = v15;
        if ((a3 & 1) == 0)
        {
          int v320 = 0;
          v17 = @"assume DELEGATION (legacy client)";
LABEL_91:
          v76 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218754;
            *(void *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 0;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = a3 & 1;
            _os_log_impl(&dword_21BB87000, v76, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation NOT SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
          }
          int v77 = 0;
          goto LABEL_126;
        }
        if (v15[2])
        {
          int v320 = 0;
          unint64_t v66 = 0;
          int v67 = 0;
          v17 = @"accountCapabilities.contains(DELEGATION) == NO";
          uint64_t v68 = (uint64_t)v15;
          v69 = (char *)(v15 + 1);
          while (v66 < *((void *)v69 + 1))
          {
            int v70 = -[_MPCProtoDelegateInfo accountCapabilitiesAtIndex:](v68, v66);
            int v71 = v320;
            if (v320) {
              v72 = v17;
            }
            else {
              v72 = @"accountCapabilities.contains(DELEGATION) == YES";
            }
            if (v70 == 3) {
              int v73 = 1;
            }
            else {
              int v73 = v320;
            }
            if (v70 == 3) {
              v74 = @"accountCapabilities.contains(DELEGATION_INLINE) == YES";
            }
            else {
              v74 = v17;
            }
            if (v70 == 3) {
              int v75 = 1;
            }
            else {
              int v75 = v67;
            }
            if (v70 != 2) {
              int v71 = v73;
            }
            int v320 = v71;
            if (v70 == 2) {
              v17 = v72;
            }
            else {
              v17 = v74;
            }
            if (v70 == 2) {
              int v67 = 1;
            }
            else {
              int v67 = v75;
            }
            ++v66;
          }
          v16 = (void *)v68;
          if ((v67 & 1) == 0) {
            goto LABEL_91;
          }
        }
        else
        {
          int v320 = 0;
          v17 = @"assume DELEGATION (legacy client)";
        }
        v76 = _MPCLogCategoryMusicBehavior();
        int v77 = 1;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218754;
          *(void *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1;
          _os_log_impl(&dword_21BB87000, v76, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
        }
LABEL_126:

        v94 = +[MPCPlaybackAccountManager sharedManager];
        v95 = [v94 activeAccount];

        uint64_t v96 = v16[4];
        v97 = &buf[25];
        uint64_t quot = v96;
        do
        {
          lldiv_t v99 = lldiv(quot, 10);
          uint64_t quot = v99.quot;
          if (v99.rem >= 0) {
            LOBYTE(v100) = v99.rem;
          }
          else {
            uint64_t v100 = -v99.rem;
          }
          *(v97 - 2) = v100 + 48;
          v101 = v97 - 2;
          --v97;
        }
        while (v99.quot);
        if (v96 < 0)
        {
          *(v97 - 2) = 45;
          v101 = v97 - 2;
        }
        v102 = (__CFString *)CFStringCreateWithBytes(0, v101, &buf[24] - v101, 0x8000100u, 0);
        v103 = +[MPCPlaybackAccountManager sharedManager];
        v104 = [v103 accountForDSID:v102];

        if (v104)
        {
          if (([v104 isDelegated] & 1) == 0)
          {
            char v110 = [v104 hasCatalogPlaybackCapability];
            if ((a3 & 2) != 0) {
              char v111 = v110;
            }
            else {
              char v111 = 1;
            }
            v105 = _MPCLogCategoryMusicBehavior();
            BOOL v112 = os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
            if (v111)
            {
              if (v112)
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&buf[4] = v16;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v104;
                _os_log_impl(&dword_21BB87000, v105, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using specified account [matching non-delegate account] account=%{public}@", buf, 0x16u);
              }
              goto LABEL_149;
            }
            if (v112)
            {
              *(_DWORD *)buf = 134218242;
              *(void *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v95;
              _os_log_impl(&dword_21BB87000, v105, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [matching non-delegate account, non-sub, fallback allowed] account=%{public}@", buf, 0x16u);
            }

LABEL_226:
            id v109 = v95;
            int v301 = 0;
            int v108 = 1;
            goto LABEL_227;
          }
          if (v77)
          {
            v105 = _MPCLogCategoryMusicBehavior();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v104;
              _os_log_impl(&dword_21BB87000, v105, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using delegate account [matching account] account=%{public}@", buf, 0x16u);
            }
LABEL_149:

            id v109 = v104;
            int v108 = 0;
            int v301 = 0;
LABEL_227:
            id v58 = v109;
            id v130 = 0;
LABEL_228:

            p_super = (MPCPlaybackRequestEnvironment *)v130;
            if (p_super)
            {
              v338((uint64_t)v314, 0, 0, (uint64_t)p_super);
LABEL_403:

              goto LABEL_404;
            }
            int v156 = [v58 isDelegated] ^ 1;
            if (v301) {
              LOBYTE(v156) = 0;
            }
            if (v156)
            {
              v174 = [MPCPlaybackRequestEnvironment alloc];
              v175 = [v58 userIdentity];
              p_super = [(MPCPlaybackRequestEnvironment *)v174 initWithUserIdentity:v175];

              if (v108) {
                v176 = (void *)MEMORY[0x263EFFA88];
              }
              else {
                v176 = 0;
              }
              v338((uint64_t)v314, p_super, v176, 0);
              goto LABEL_403;
            }
            v157 = v16;
            id v294 = v58;
            v293 = [MEMORY[0x263F893C8] defaultIdentityStore];
            id v296 = *((id *)v157 + 13);
            uint64_t v158 = *((void *)v157 + 4);
            v159 = _MPCLogCategoryDelegation();
            if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218499;
              *(void *)&buf[4] = v157;
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v296;
              *(_WORD *)&buf[22] = 2049;
              *(void *)&buf[24] = v158;
              _os_log_impl(&dword_21BB87000, v159, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Received account info for potential delegation - UUID=%{private}@ - DSID=%{private}lld", buf, 0x20u);
            }

            if (v296 && v158)
            {
              if (v294)
              {
                id v160 = [v294 userIdentity];
                v161 = _MPCLogCategoryDelegation();
                if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&buf[4] = v157;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v294;
                  _os_log_impl(&dword_21BB87000, v161, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - delegation supported [found existing account] account=%{public}@", buf, 0x16u);
                }

                id v162 = 0;
                goto LABEL_241;
              }
              v203 = (void *)MEMORY[0x263F893C0];
              v204 = [NSNumber numberWithUnsignedLongLong:v158];
              v205 = [v203 specificAccountWithDSID:v204];
              id v160 = [v205 identityAllowingDelegation:1];

              v206 = _MPCLogCategoryDelegation();
              if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&buf[4] = v157;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v160;
                _os_log_impl(&dword_21BB87000, v206, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Creating delegated identity [] userIdentity=%{public}@", buf, 0x16u);
              }

              id v350 = 0;
              char v207 = [v293 insertPropertiesForUserIdentity:v160 usingBlock:&__block_literal_global_221 error:&v350];
              id v208 = v350;
              if ((v207 & 1) == 0)
              {
                v234 = v157;
                if (v208)
                {
                  id v235 = v208;
                  id v236 = v208;
                }
                else
                {
                  id v235 = 0;
                  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 7, @"Failed to create delegated account from info: %@", v157);
                  id v236 = (id)objc_claimAutoreleasedReturnValue();
                  v234 = v157;
                }
                v245 = _MPCLogCategoryDelegation();
                if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&buf[4] = v234;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v236;
                  _os_log_impl(&dword_21BB87000, v245, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [property insertion failed] - error=%{public}@", buf, 0x16u);
                }

                id v162 = v236;
                v298 = 0;
                v164 = v235;
                goto LABEL_335;
              }
              v300 = v208;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              *(void *)&buf[24] = __Block_byref_object_copy__24262;
              *(void *)&buf[32] = __Block_byref_object_dispose__24263;
              v358 = 0;
              dispatch_semaphore_t v209 = dispatch_semaphore_create(0);
              id v367 = v296;
              v210 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v367 count:1];
              v368 = (__CFString *)MEMORY[0x263EF8330];
              uint64_t v369 = 3221225472;
              v370 = ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke_226;
              v371 = &unk_2643C40E0;
              v373 = buf;
              v211 = v209;
              v372 = v211;
              [v293 addDelegationUUIDs:v210 forUserIdentity:v160 completionHandler:&v368];

              dispatch_semaphore_wait(v211, 0xFFFFFFFFFFFFFFFFLL);
              uint64_t v212 = *(void *)(*(void *)&buf[8] + 40);
              if (v212)
              {
                v213 = _MPCLogCategoryDelegation();
                if (os_log_type_enabled(v213, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v214 = *(void *)(*(void *)&buf[8] + 40);
                  *(_DWORD *)v364 = 134218242;
                  *(void *)&v364[4] = v157;
                  __int16 v365 = 2114;
                  uint64_t v366 = v214;
                  _os_log_impl(&dword_21BB87000, v213, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [uuid addition failed] - error=%{public}@", v364, 0x16u);
                }

                id v162 = *(id *)(*(void *)&buf[8] + 40);
              }
              else
              {
                id v162 = 0;
              }

              _Block_object_dispose(buf, 8);
              if (!v212)
              {
LABEL_241:
                v163 = +[MPCPlaybackAccountManager sharedManager];
                v164 = [v163 anyDelegationHostingAccount];

                if (v164)
                {
                  v165 = [MPCMutablePlaybackRequestEnvironment alloc];
                  v166 = [v164 userIdentity];
                  v298 = [(MPCPlaybackRequestEnvironment *)v165 initWithUserIdentity:v166];

                  v167 = [MPCMutablePlaybackDelegationProperties alloc];
                  v168 = (__CFString *)*((id *)v157 + 6);
                  v169 = v168;
                  if (v168) {
                    v170 = v168;
                  }
                  else {
                    v170 = @"unknown-guid";
                  }
                  v171 = [(MPCPlaybackDelegationProperties *)v167 initWithStoreAccountID:v158 deviceGUID:v170];

                  id v172 = *((id *)v157 + 7);
                  [(MPCMutablePlaybackDelegationProperties *)v171 setDeviceName:v172];

                  if ((v157[116] & 4) != 0) {
                    int v173 = *((_DWORD *)v157 + 18);
                  }
                  else {
                    int v173 = 0;
                  }
                  uint64_t v216 = (v173 - 1);
                  if (v216 < 4) {
                    uint64_t v217 = v216 + 1;
                  }
                  else {
                    uint64_t v217 = 0;
                  }
                  [(MPCMutablePlaybackDelegationProperties *)v171 setSystemReleaseType:v217];
                  id v218 = *((id *)v157 + 8);
                  [(MPCMutablePlaybackDelegationProperties *)v171 setRequestUserAgent:v218];

                  id v219 = *((id *)v157 + 10);
                  if (v219)
                  {
                    v220 = [MEMORY[0x263EFFA18] timeZoneWithName:v219];
                    [(MPCMutablePlaybackDelegationProperties *)v171 setTimeZone:v220];
                  }
                  v221 = _MPCLogCategoryDelegation();
                  if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v157;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v171;
                    _os_log_impl(&dword_21BB87000, v221, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Delegation supported - properties=%{public}@", buf, 0x16u);
                  }

                  [(MPCMutablePlaybackRequestEnvironment *)v298 setDelegationProperties:v171];
                }
                else
                {
                  v215 = _MPCLogCategoryDelegation();
                  if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v157;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v294;
                    _os_log_impl(&dword_21BB87000, v215, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - delegation failed [no delegation host] account=%{public}@", buf, 0x16u);
                  }

                  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 73, @"No host for delegated account: %@", v157);
                  id v162 = (id)objc_claimAutoreleasedReturnValue();
                  v164 = 0;
                  v298 = 0;
                }
LABEL_335:

                goto LABEL_336;
              }
              v298 = 0;
            }
            else
            {
              v177 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 7, @"Invalid delegation info: %@", v157);
              v178 = _MPCLogCategoryDelegation();
              if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&buf[4] = v157;
                _os_log_impl(&dword_21BB87000, v178, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Getting delegated playback request environment failed [no valid delegation info]", buf, 0xCu);
              }

              id v160 = v177;
              v298 = 0;
              id v162 = v160;
            }
LABEL_336:

            id v246 = v162;
            if (v246)
            {
              v247 = _MPCLogCategoryMusicBehavior();
              if (os_log_type_enabled(v247, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&buf[4] = v157;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v246;
                _os_log_impl(&dword_21BB87000, v247, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [failed to create delegate request environment] dsidError=%{public}@", buf, 0x16u);
              }

              v338((uint64_t)v314, 0, 0, (uint64_t)v246);
              v248 = v298;
              goto LABEL_401;
            }
            if (!v320)
            {
              if (v108)
              {
                v248 = (void *)MEMORY[0x263EFFA88];
              }
              else if ((v157[116] & 8) != 0)
              {
                v248 = [NSNumber numberWithBool:v157[112]];
              }
              else
              {
                v248 = 0;
              }
              v338((uint64_t)v314, v298, v248, 0);
              goto LABEL_402;
            }
            v249 = [MEMORY[0x263F893C8] defaultIdentityStore];
            v250 = [v294 userIdentity];
            *(void *)v364 = 0;
            v248 = [v249 getPropertiesForUserIdentity:v250 error:v364];
            id v251 = *(id *)v364;

            if (v251)
            {
              v338((uint64_t)v314, 0, 0, (uint64_t)v251);
            }
            else
            {
              v322 = [v248 delegateToken];
              if ([v322 type] == 1)
              {
                v252 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:604800.0];
                int v253 = [v322 expiresBeforeDate:v252];

                if (!v253)
                {
                  if (v108)
                  {
                    id v251 = (id)MEMORY[0x263EFFA88];
                  }
                  else if ((v157[116] & 8) != 0)
                  {
                    id v251 = [NSNumber numberWithBool:v157[112]];
                  }
                  else
                  {
                    id v251 = 0;
                  }
                  if (!v298)
                  {
                    v289 = [MEMORY[0x263F08690] currentHandler];
                    v290 = objc_msgSend(NSString, "stringWithUTF8String:", "void __MPCPlaybackRequestEnvironmentFromProtoAccountInfo(_MPCProtoDelegateInfo *__strong, MPRemotePlaybackQueuePlaybackContextOptions, void (^__strong)(MPCPlaybackRequestEnvironment * _Nullable __strong, NSNumber * _Nullable __strong, NSError * _Nullable __strong))");
                    [v289 handleFailureInFunction:v290, @"MPRemotePlaybackQueue+MPCAdditions.m", 382, @"Failed to produce playback request environment for accountInfo: %@, desiredAccount: %@", v157, v294 file lineNumber description];
                  }
                  ((void (*)(void *))v338)(v314);
                  goto LABEL_400;
                }
              }
              id v254 = *((id *)v157 + 12);
              if (v254)
              {
                v255 = +[MPCPlaybackAccountManager sharedManager];
                uint64_t v256 = *((void *)v157 + 4);
                *(void *)buf = MEMORY[0x263EF8330];
                *(void *)&buf[8] = 3221225472;
                *(void *)&buf[16] = ____MPCPlaybackRequestEnvironmentFromProtoAccountInfo_block_invoke;
                *(void *)&buf[24] = &unk_2643C4098;
                v360 = v314;
                char v361 = v108;
                char v362 = v301;
                char v363 = 1;
                *(void *)&buf[32] = v157;
                v358 = v298;
                v359 = (MPCPlaybackRequestEnvironment *)v294;
                [v255 updateCredentialsWithDelegateTokenE:v254 forDSID:v256 completion:buf];

                id v257 = v360;
              }
              else
              {
                id v257 = *((id *)v157 + 11);
                if (v257)
                {
                  v258 = +[MPCPlaybackAccountManager sharedManager];
                  uint64_t v259 = *((void *)v157 + 4);
                  id v350 = 0;
                  v303 = [v258 getDelegateTokenBWithTokenA:v257 forDSID:v259 error:&v350];
                  id v260 = v350;

                  v261 = (void *)MEMORY[0x263F087E8];
                  v368 = @"MPCErrorUserInfoKeyRemoteCommandStatusCode";
                  uint64_t v369 = @"MPCErrorUserInfoKeyCustomDataType";
                  *(void *)buf = &unk_26CC19248;
                  *(void *)&buf[8] = @"com.apple.music/wha-delegation/b";
                  v370 = (void (*)(uint64_t, int, id))@"MPCErrorUserInfoKeyCustomData";
                  v262 = [v303 data];
                  *(void *)&buf[16] = v262;
                  v263 = [NSDictionary dictionaryWithObjects:buf forKeys:&v368 count:3];
                  v264 = objc_msgSend(v261, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MPCError", 74, v263, @"Delegation token missing or expired for %@", v298);
                  v338((uint64_t)v314, 0, 0, (uint64_t)v264);
                }
                else
                {
                  v287 = (void *)MEMORY[0x263F087E8];
                  v368 = @"MPCErrorUserInfoKeyRemoteCommandStatusCode";
                  *(void *)buf = &unk_26CC19248;
                  id v260 = [NSDictionary dictionaryWithObjects:buf forKeys:&v368 count:1];
                  v303 = objc_msgSend(v287, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MPCError", 74, v260, @"Delegation token missing and inline delegation missing tokens");
                  v338((uint64_t)v314, 0, 0, (uint64_t)v303);
                }
              }
              id v251 = v248;
            }
            v322 = 0;
            v248 = v298;
            v298 = 0;
LABEL_400:

            id v246 = v322;
            p_super = &v298->super;
LABEL_401:

            v298 = (MPCMutablePlaybackRequestEnvironment *)p_super;
LABEL_402:

            p_super = &v298->super;
            goto LABEL_403;
          }
          v128 = _MPCLogCategoryMusicBehavior();
          v114 = v128;
          if ((a3 & 2) == 0)
          {
            if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
            {
              v129 = MPCHashedDSIDFromDSID(v102);
              *(_DWORD *)buf = 134218499;
              *(void *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v129;
              *(_WORD *)&buf[22] = 2113;
              *(void *)&buf[24] = v102;
              _os_log_impl(&dword_21BB87000, v114, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [delegate account match, delegate not allowed, fallback not allowed] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);
            }
LABEL_177:

            objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 67, @"cannot create playback context without user identity");
            id v130 = (id)objc_claimAutoreleasedReturnValue();
            int v108 = 0;
            int v301 = 0;
            id v58 = 0;
            goto LABEL_228;
          }
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v95;
            _os_log_impl(&dword_21BB87000, v114, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [delegate account match, delegate not allowed, fallback allowed] account=%{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (v77)
          {
            v106 = _MPCLogCategoryMusicBehavior();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
            {
              v107 = MPCHashedDSIDFromDSID(v102);
              *(_DWORD *)buf = 134218499;
              *(void *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v107;
              *(_WORD *)&buf[22] = 2113;
              *(void *)&buf[24] = v102;
              _os_log_impl(&dword_21BB87000, v106, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | creating delegate account [no match, delegate allowed, incoming account supports delegation] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);
            }
            int v108 = 0;
            id v109 = 0;
            int v301 = 1;
            goto LABEL_227;
          }
          v113 = _MPCLogCategoryMusicBehavior();
          v114 = v113;
          if ((a3 & 2) == 0)
          {
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              v115 = MPCHashedDSIDFromDSID(v102);
              *(_DWORD *)buf = 134218755;
              *(void *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 0;
              *(_WORD *)&buf[18] = 2114;
              *(void *)&buf[20] = v115;
              *(_WORD *)&buf[28] = 2113;
              *(void *)&buf[30] = v102;
              _os_log_impl(&dword_21BB87000, v114, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [no match, fallback not allowed] incomingAccountSupportsDelegation=%{BOOL}u delegateAccount=%{public}@[%{private}@]", buf, 0x26u);
            }
            goto LABEL_177;
          }
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v95;
            _os_log_impl(&dword_21BB87000, v114, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [no match, fallback allowed] account=%{public}@", buf, 0x16u);
          }
        }

        goto LABEL_226;
      }
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 27, @"Subscription required for shared queue, and user doesn't have playback capability: %@", v318);
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      v338((uint64_t)v314, 0, 0, (uint64_t)v58);
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 27, @"Subscription required for shared queue and no active account found");
      id v58 = (id)objc_claimAutoreleasedReturnValue();
      v338((uint64_t)v314, 0, 0, (uint64_t)v58);
    }
LABEL_404:

    _Block_object_dispose(v351, 8);
    _Block_object_dispose(v348, 8);

    _Block_object_dispose(v353, 8);
    goto LABEL_405;
  }
  if ([v327 isEqualToString:@"com.apple.music.playbackqueue.radio"])
  {
    v325 = [a1 data];
    if (!v325)
    {
      v59 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 8, @"Missing creation properties data in playback queue.");
      ((void (*)(void *, void, void *))v328[2])(v328, 0, v59);

LABEL_374:
      goto LABEL_406;
    }
    v18 = [[_MPCProtoRadioCreationProperties alloc] initWithData:v325];
    v19 = v18;
    if (v18) {
      accountInfo = v18->_accountInfo;
    }
    else {
      accountInfo = 0;
    }
    v21 = accountInfo;
    v331[0] = MEMORY[0x263EF8330];
    v331[1] = 3221225472;
    v332 = __89__MPCustomDataPlaybackQueue_MPCAdditions__getMusicPlaybackContextWithOptions_completion___block_invoke_6;
    v333 = &unk_2643C3F98;
    v336 = v328;
    v334 = a1;
    v313 = v19;
    v335 = v313;
    v317 = v21;
    v315 = v331;
    v22 = +[MPCPlaybackAccountManager sharedManager];
    v319 = [v22 activeAccount];

    if (v319)
    {
      if ([v319 hasCatalogPlaybackCapability])
      {
        if (!v317)
        {
          v78 = _MPCLogCategoryMusicBehavior();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = 0;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v319;
            _os_log_impl(&dword_21BB87000, v78, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [empty accountInfo] account=%{public}@", buf, 0x16u);
          }

          id v79 = v319;
          v80 = [MPCPlaybackRequestEnvironment alloc];
          v81 = [v79 userIdentity];

          v60 = [(MPCPlaybackRequestEnvironment *)v80 initWithUserIdentity:v81];
          v332((uint64_t)v315, v60, 0, 0);
          goto LABEL_373;
        }
        v23 = v317;
        p_isa = &v23->super.super.isa;
        if ((a3 & 1) == 0)
        {
          int v321 = 0;
          v25 = @"assume DELEGATION (legacy client)";
LABEL_171:
          v125 = _MPCLogCategoryMusicBehavior();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218754;
            v126 = p_isa;
            *(void *)&buf[4] = p_isa;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 0;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = a3 & 1;
            _os_log_impl(&dword_21BB87000, v125, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation NOT SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
            int v127 = 0;
LABEL_185:

            v131 = +[MPCPlaybackAccountManager sharedManager];
            v132 = [v131 activeAccount];

            uint64_t v133 = v126[4];
            v134 = &buf[25];
            uint64_t v135 = v133;
            do
            {
              lldiv_t v136 = lldiv(v135, 10);
              uint64_t v135 = v136.quot;
              if (v136.rem >= 0) {
                LOBYTE(v137) = v136.rem;
              }
              else {
                uint64_t v137 = -v136.rem;
              }
              *(v134 - 2) = v137 + 48;
              v138 = v134 - 2;
              --v134;
            }
            while (v136.quot);
            if (v133 < 0)
            {
              *(v134 - 2) = 45;
              v138 = v134 - 2;
            }
            v139 = (__CFString *)CFStringCreateWithBytes(0, v138, &buf[24] - v138, 0x8000100u, 0);
            v140 = +[MPCPlaybackAccountManager sharedManager];
            v141 = [v140 accountForDSID:v139];

            if (v141)
            {
              if (([v141 isDelegated] & 1) == 0)
              {
                char v147 = [v141 hasCatalogPlaybackCapability];
                if ((a3 & 2) != 0) {
                  char v148 = v147;
                }
                else {
                  char v148 = 1;
                }
                v142 = _MPCLogCategoryMusicBehavior();
                BOOL v149 = os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT);
                if (v148)
                {
                  if (v149)
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v126;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v141;
                    _os_log_impl(&dword_21BB87000, v142, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using specified account [matching non-delegate account] account=%{public}@", buf, 0x16u);
                  }
                  goto LABEL_208;
                }
                if (v149)
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&buf[4] = v126;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v132;
                  _os_log_impl(&dword_21BB87000, v142, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [matching non-delegate account, non-sub, fallback allowed] account=%{public}@", buf, 0x16u);
                }

LABEL_260:
                id v146 = v132;
                int v310 = 0;
                int v145 = 1;
                goto LABEL_261;
              }
              if (v127)
              {
                v142 = _MPCLogCategoryMusicBehavior();
                if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&buf[4] = v126;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v141;
                  _os_log_impl(&dword_21BB87000, v142, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using delegate account [matching account] account=%{public}@", buf, 0x16u);
                }
LABEL_208:

                id v146 = v141;
                int v145 = 0;
                int v310 = 0;
LABEL_261:
                v60 = (MPCPlaybackRequestEnvironment *)v146;
                id v155 = 0;
LABEL_262:

                id v179 = v155;
                if (v179)
                {
                  v332((uint64_t)v315, 0, 0, (uint64_t)v179);
LABEL_372:

                  goto LABEL_373;
                }
                int v180 = [(MPCPlaybackRequestEnvironment *)v60 isDelegated] ^ 1;
                if (v310) {
                  LOBYTE(v180) = 0;
                }
                if (v180)
                {
                  v197 = [MPCPlaybackRequestEnvironment alloc];
                  v198 = [(MPCPlaybackRequestEnvironment *)v60 userIdentity];
                  v189 = [(MPCPlaybackRequestEnvironment *)v197 initWithUserIdentity:v198];

                  if (v145) {
                    v199 = (void *)MEMORY[0x263EFFA88];
                  }
                  else {
                    v199 = 0;
                  }
                  v332((uint64_t)v315, v189, v199, 0);
LABEL_285:

                  goto LABEL_373;
                }
                v181 = v126;
                v305 = v60;
                v299 = [MEMORY[0x263F893C8] defaultIdentityStore];
                id v307 = *((id *)v181 + 13);
                uint64_t v302 = *((void *)v181 + 4);
                v182 = _MPCLogCategoryDelegation();
                if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218499;
                  *(void *)&buf[4] = v181;
                  *(_WORD *)&buf[12] = 2113;
                  *(void *)&buf[14] = v307;
                  *(_WORD *)&buf[22] = 2049;
                  *(void *)&buf[24] = v302;
                  _os_log_impl(&dword_21BB87000, v182, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Received account info for potential delegation - UUID=%{private}@ - DSID=%{private}lld", buf, 0x20u);
                }

                if (!v307 || !v302)
                {
                  v200 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 7, @"Invalid delegation info: %@", v181);
                  v201 = _MPCLogCategoryDelegation();
                  if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(void *)&buf[4] = v181;
                    _os_log_impl(&dword_21BB87000, v201, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Getting delegated playback request environment failed [no valid delegation info]", buf, 0xCu);
                  }

                  id v202 = v200;
                  v189 = 0;
                  id v297 = v202;
                  goto LABEL_367;
                }
                if (v305)
                {
                  uint64_t v183 = [(MPCPlaybackRequestEnvironment *)v305 userIdentity];
                  v184 = _MPCLogCategoryDelegation();
                  if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v181;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v305;
                    _os_log_impl(&dword_21BB87000, v184, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - delegation supported [found existing account] account=%{public}@", buf, 0x16u);
                  }

                  id v297 = 0;
                }
                else
                {
                  v222 = (void *)MEMORY[0x263F893C0];
                  v223 = [NSNumber numberWithUnsignedLongLong:v302];
                  v224 = [v222 specificAccountWithDSID:v223];
                  uint64_t v183 = [v224 identityAllowingDelegation:1];

                  v225 = _MPCLogCategoryDelegation();
                  if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v181;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v183;
                    _os_log_impl(&dword_21BB87000, v225, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Creating delegated identity [] userIdentity=%{public}@", buf, 0x16u);
                  }

                  v348[0] = 0;
                  char v226 = [v299 insertPropertiesForUserIdentity:v183 usingBlock:&__block_literal_global_221 error:v348];
                  id v227 = v348[0];
                  if ((v226 & 1) == 0)
                  {
                    if (v227)
                    {
                      v186 = v227;
                      id v244 = v227;
                    }
                    else
                    {
                      v186 = 0;
                      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 7, @"Failed to create delegated account from info: %@", v181);
                      id v244 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    v265 = v244;
                    v266 = _MPCLogCategoryDelegation();
                    if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218242;
                      *(void *)&buf[4] = v181;
                      *(_WORD *)&buf[12] = 2114;
                      *(void *)&buf[14] = v265;
                      _os_log_impl(&dword_21BB87000, v266, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [property insertion failed] - error=%{public}@", buf, 0x16u);
                    }

                    id v297 = v265;
                    goto LABEL_364;
                  }
                  v295 = v227;
                  *(void *)buf = 0;
                  *(void *)&buf[8] = buf;
                  *(void *)&buf[16] = 0x3032000000;
                  *(void *)&buf[24] = __Block_byref_object_copy__24262;
                  *(void *)&buf[32] = __Block_byref_object_dispose__24263;
                  v358 = 0;
                  dispatch_semaphore_t v228 = dispatch_semaphore_create(0);
                  v351[0] = v307;
                  v229 = [MEMORY[0x263EFF8C0] arrayWithObjects:v351 count:1];
                  v368 = (__CFString *)MEMORY[0x263EF8330];
                  uint64_t v369 = 3221225472;
                  v370 = ____MPCCreateDelegateAccountPlaybackRequestEnvironment_block_invoke_226;
                  v371 = &unk_2643C40E0;
                  v373 = buf;
                  v230 = v228;
                  v372 = v230;
                  [v299 addDelegationUUIDs:v229 forUserIdentity:v183 completionHandler:&v368];

                  dispatch_semaphore_wait(v230, 0xFFFFFFFFFFFFFFFFLL);
                  uint64_t v231 = *(void *)(*(void *)&buf[8] + 40);
                  if (v231)
                  {
                    v232 = _MPCLogCategoryDelegation();
                    if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v233 = *(void *)(*(void *)&buf[8] + 40);
                      *(_DWORD *)v353 = 134218242;
                      *(void *)&v353[4] = v181;
                      *(_WORD *)&v353[12] = 2114;
                      *(void *)&v353[14] = v233;
                      _os_log_impl(&dword_21BB87000, v232, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - Creating delegated identity failed [uuid addition failed] - error=%{public}@", v353, 0x16u);
                    }

                    id v297 = *(id *)(*(void *)&buf[8] + 40);
                  }
                  else
                  {
                    id v297 = 0;
                  }

                  _Block_object_dispose(buf, 8);
                  if (v231)
                  {
                    v189 = 0;
                    goto LABEL_366;
                  }
                }
                v185 = +[MPCPlaybackAccountManager sharedManager];
                v186 = [v185 anyDelegationHostingAccount];

                if (v186)
                {
                  v187 = [MPCMutablePlaybackRequestEnvironment alloc];
                  v188 = [v186 userIdentity];
                  v189 = [(MPCPlaybackRequestEnvironment *)v187 initWithUserIdentity:v188];

                  v190 = [MPCMutablePlaybackDelegationProperties alloc];
                  v191 = (__CFString *)*((id *)v181 + 6);
                  v192 = v191;
                  if (v191) {
                    v193 = v191;
                  }
                  else {
                    v193 = @"unknown-guid";
                  }
                  v194 = [(MPCPlaybackDelegationProperties *)v190 initWithStoreAccountID:v302 deviceGUID:v193];

                  id v195 = *((id *)v181 + 7);
                  [(MPCMutablePlaybackDelegationProperties *)v194 setDeviceName:v195];

                  if ((v181[116] & 4) != 0) {
                    int v196 = *((_DWORD *)v181 + 18);
                  }
                  else {
                    int v196 = 0;
                  }
                  uint64_t v238 = (v196 - 1);
                  if (v238 < 4) {
                    uint64_t v239 = v238 + 1;
                  }
                  else {
                    uint64_t v239 = 0;
                  }
                  [(MPCMutablePlaybackDelegationProperties *)v194 setSystemReleaseType:v239];
                  id v240 = *((id *)v181 + 8);
                  [(MPCMutablePlaybackDelegationProperties *)v194 setRequestUserAgent:v240];

                  id v241 = *((id *)v181 + 10);
                  if (v241)
                  {
                    v242 = [MEMORY[0x263EFFA18] timeZoneWithName:v241];
                    [(MPCMutablePlaybackDelegationProperties *)v194 setTimeZone:v242];
                  }
                  v243 = _MPCLogCategoryDelegation();
                  if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v181;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v194;
                    _os_log_impl(&dword_21BB87000, v243, OS_LOG_TYPE_DEFAULT, "_MPCProtoDelegateInfo %p - Delegation supported - properties=%{public}@", buf, 0x16u);
                  }

                  [(MPCMutablePlaybackRequestEnvironment *)v189 setDelegationProperties:v194];
                  goto LABEL_365;
                }
                v237 = _MPCLogCategoryDelegation();
                if (os_log_type_enabled(v237, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218242;
                  *(void *)&buf[4] = v181;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v305;
                  _os_log_impl(&dword_21BB87000, v237, OS_LOG_TYPE_ERROR, "_MPCProtoDelegateInfo %p - delegation failed [no delegation host] account=%{public}@", buf, 0x16u);
                }

                objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 73, @"No host for delegated account: %@", v181);
                id v297 = (id)objc_claimAutoreleasedReturnValue();
                v186 = 0;
LABEL_364:
                v189 = 0;
LABEL_365:

LABEL_366:
                id v202 = (id)v183;
LABEL_367:

                id v267 = v297;
                if (v267)
                {
                  v268 = _MPCLogCategoryMusicBehavior();
                  if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(void *)&buf[4] = v181;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v267;
                    _os_log_impl(&dword_21BB87000, v268, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [failed to create delegate request environment] dsidError=%{public}@", buf, 0x16u);
                  }

                  v332((uint64_t)v315, 0, 0, (uint64_t)v267);
                  goto LABEL_371;
                }
                if (v321)
                {
                  v269 = [MEMORY[0x263F893C8] defaultIdentityStore];
                  v270 = [(MPCPlaybackRequestEnvironment *)v305 userIdentity];
                  *(void *)v353 = 0;
                  v323 = [v269 getPropertiesForUserIdentity:v270 error:v353];
                  id v271 = *(id *)v353;

                  if (v271)
                  {
                    v332((uint64_t)v315, 0, 0, (uint64_t)v271);

LABEL_371:
                    goto LABEL_372;
                  }
                  v308 = [v323 delegateToken];
                  if ([v308 type] != 1
                    || ([MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:604800.0],
                        v273 = objc_claimAutoreleasedReturnValue(),
                        int v274 = [v308 expiresBeforeDate:v273],
                        v273,
                        v274))
                  {
                    id v304 = *((id *)v181 + 12);
                    if (v304)
                    {
                      v275 = +[MPCPlaybackAccountManager sharedManager];
                      uint64_t v276 = *((void *)v181 + 4);
                      *(void *)buf = MEMORY[0x263EF8330];
                      *(void *)&buf[8] = 3221225472;
                      *(void *)&buf[16] = ____MPCPlaybackRequestEnvironmentFromProtoAccountInfo_block_invoke;
                      *(void *)&buf[24] = &unk_2643C4098;
                      v360 = v315;
                      char v361 = v145;
                      char v362 = v310;
                      char v363 = 1;
                      *(void *)&buf[32] = v181;
                      v358 = v189;
                      v359 = v305;
                      [v275 updateCredentialsWithDelegateTokenE:v304 forDSID:v276 completion:buf];

                      id v277 = v360;
                    }
                    else
                    {
                      id v277 = *((id *)v181 + 11);
                      if (v277)
                      {
                        v278 = +[MPCPlaybackAccountManager sharedManager];
                        uint64_t v279 = *((void *)v181 + 4);
                        v348[0] = 0;
                        v280 = [v278 getDelegateTokenBWithTokenA:v277 forDSID:v279 error:v348];
                        id v281 = v348[0];

                        v282 = (void *)MEMORY[0x263F087E8];
                        v368 = @"MPCErrorUserInfoKeyRemoteCommandStatusCode";
                        uint64_t v369 = @"MPCErrorUserInfoKeyCustomDataType";
                        *(void *)buf = &unk_26CC19248;
                        *(void *)&buf[8] = @"com.apple.music/wha-delegation/b";
                        v370 = (void (*)(uint64_t, int, id))@"MPCErrorUserInfoKeyCustomData";
                        v283 = [v280 data];
                        *(void *)&buf[16] = v283;
                        v284 = [NSDictionary dictionaryWithObjects:buf forKeys:&v368 count:3];
                        v285 = objc_msgSend(v282, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MPCError", 74, v284, @"Delegation token missing or expired for %@", v189);
                        v332((uint64_t)v315, 0, 0, (uint64_t)v285);
                      }
                      else
                      {
                        v288 = (void *)MEMORY[0x263F087E8];
                        v368 = @"MPCErrorUserInfoKeyRemoteCommandStatusCode";
                        *(void *)buf = &unk_26CC19248;
                        v280 = [NSDictionary dictionaryWithObjects:buf forKeys:&v368 count:1];
                        objc_msgSend(v288, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MPCError", 74, v280, @"Delegation token missing and inline delegation missing tokens");
                        id v281 = (id)objc_claimAutoreleasedReturnValue();
                        v332((uint64_t)v315, 0, 0, (uint64_t)v281);
                      }
                    }
                    goto LABEL_371;
                  }
                  if (v145)
                  {
                    v286 = (void *)MEMORY[0x263EFFA88];
                  }
                  else if ((v181[116] & 8) != 0)
                  {
                    v286 = [NSNumber numberWithBool:v181[112]];
                  }
                  else
                  {
                    v286 = 0;
                  }
                  if (!v189)
                  {
                    v291 = [MEMORY[0x263F08690] currentHandler];
                    v292 = objc_msgSend(NSString, "stringWithUTF8String:", "void __MPCPlaybackRequestEnvironmentFromProtoAccountInfo(_MPCProtoDelegateInfo *__strong, MPRemotePlaybackQueuePlaybackContextOptions, void (^__strong)(MPCPlaybackRequestEnvironment * _Nullable __strong, NSNumber * _Nullable __strong, NSError * _Nullable __strong))");
                    [v291 handleFailureInFunction:v292, @"MPRemotePlaybackQueue+MPCAdditions.m", 382, @"Failed to produce playback request environment for accountInfo: %@, desiredAccount: %@", v181, v305 file lineNumber description];
                  }
                  v332((uint64_t)v315, v189, v286, 0);
                }
                else
                {
                  if (v145)
                  {
                    uint64_t v272 = MEMORY[0x263EFFA88];
                  }
                  else if ((v181[116] & 8) != 0)
                  {
                    uint64_t v272 = [NSNumber numberWithBool:v181[112]];
                  }
                  else
                  {
                    uint64_t v272 = 0;
                  }
                  v323 = (void *)v272;
                  ((void (*)(void *, MPCMutablePlaybackRequestEnvironment *))v332)(v315, v189);
                }

                goto LABEL_285;
              }
              v153 = _MPCLogCategoryMusicBehavior();
              v151 = v153;
              if ((a3 & 2) == 0)
              {
                if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                {
                  v154 = MPCHashedDSIDFromDSID(v139);
                  *(_DWORD *)buf = 134218499;
                  *(void *)&buf[4] = v126;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v154;
                  *(_WORD *)&buf[22] = 2113;
                  *(void *)&buf[24] = v139;
                  _os_log_impl(&dword_21BB87000, v151, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [delegate account match, delegate not allowed, fallback not allowed] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);
                }
LABEL_219:

                objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 67, @"cannot create playback context without user identity");
                id v155 = (id)objc_claimAutoreleasedReturnValue();
                int v145 = 0;
                int v310 = 0;
                v60 = 0;
                goto LABEL_262;
              }
              if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&buf[4] = v126;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v132;
                _os_log_impl(&dword_21BB87000, v151, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [delegate account match, delegate not allowed, fallback allowed] account=%{public}@", buf, 0x16u);
              }
            }
            else
            {
              if (v127)
              {
                v143 = _MPCLogCategoryMusicBehavior();
                if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
                {
                  v144 = MPCHashedDSIDFromDSID(v139);
                  *(_DWORD *)buf = 134218499;
                  *(void *)&buf[4] = v126;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v144;
                  *(_WORD *)&buf[22] = 2113;
                  *(void *)&buf[24] = v139;
                  _os_log_impl(&dword_21BB87000, v143, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | creating delegate account [no match, delegate allowed, incoming account supports delegation] delegateAccount=%{public}@[%{private}@]", buf, 0x20u);
                }
                int v145 = 0;
                id v146 = 0;
                int v310 = 1;
                goto LABEL_261;
              }
              v150 = _MPCLogCategoryMusicBehavior();
              v151 = v150;
              if ((a3 & 2) == 0)
              {
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                {
                  v152 = MPCHashedDSIDFromDSID(v139);
                  *(_DWORD *)buf = 134218755;
                  *(void *)&buf[4] = v126;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 0;
                  *(_WORD *)&buf[18] = 2114;
                  *(void *)&buf[20] = v152;
                  *(_WORD *)&buf[28] = 2113;
                  *(void *)&buf[30] = v139;
                  _os_log_impl(&dword_21BB87000, v151, OS_LOG_TYPE_ERROR, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | no account found [no match, fallback not allowed] incomingAccountSupportsDelegation=%{BOOL}u delegateAccount=%{public}@[%{private}@]", buf, 0x26u);
                }
                goto LABEL_219;
              }
              if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                *(void *)&buf[4] = v126;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v132;
                _os_log_impl(&dword_21BB87000, v151, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | using device active account [no match, fallback allowed] account=%{public}@", buf, 0x16u);
              }
            }

            goto LABEL_260;
          }
          int v127 = 0;
          goto LABEL_184;
        }
        if (v23->_accountCapabilities.count)
        {
          int v321 = 0;
          unint64_t v82 = 0;
          int v83 = 0;
          v25 = @"accountCapabilities.contains(DELEGATION) == NO";
          uint64_t v84 = (uint64_t)v23;
          p_accountCapabilities = &v23->_accountCapabilities;
          while (v82 < p_accountCapabilities->count)
          {
            int v86 = -[_MPCProtoDelegateInfo accountCapabilitiesAtIndex:](v84, v82);
            int v87 = v321;
            if (v321) {
              v88 = v25;
            }
            else {
              v88 = @"accountCapabilities.contains(DELEGATION) == YES";
            }
            if (v86 == 3) {
              int v89 = 1;
            }
            else {
              int v89 = v321;
            }
            if (v86 == 3) {
              v90 = @"accountCapabilities.contains(DELEGATION_INLINE) == YES";
            }
            else {
              v90 = v25;
            }
            if (v86 == 3) {
              int v91 = 1;
            }
            else {
              int v91 = v83;
            }
            if (v86 != 2) {
              int v87 = v89;
            }
            int v321 = v87;
            if (v86 == 2) {
              v25 = v88;
            }
            else {
              v25 = v90;
            }
            if (v86 == 2) {
              int v83 = 1;
            }
            else {
              int v83 = v91;
            }
            ++v82;
          }
          p_isa = (void *)v84;
          if ((v83 & 1) == 0) {
            goto LABEL_171;
          }
        }
        else
        {
          int v321 = 0;
          v25 = @"assume DELEGATION (legacy client)";
        }
        v125 = _MPCLogCategoryMusicBehavior();
        int v127 = 1;
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218754;
          v126 = p_isa;
          *(void *)&buf[4] = p_isa;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 1;
          _os_log_impl(&dword_21BB87000, v125, OS_LOG_TYPE_DEFAULT, "[MPRQ:MPC:%p] __MPCPlaybackRequestEnvironmentFromProtoAccountInfo | delegation SUPPORTED [%{public}@] incomingAccountSupportsDelegation=%{BOOL}u playerSupportsDelegation=%{BOOL}u", buf, 0x22u);
          goto LABEL_185;
        }
LABEL_184:
        v126 = p_isa;
        goto LABEL_185;
      }
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 27, @"Subscription required for shared queue, and user doesn't have playback capability: %@", v319);
      v60 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
      v332((uint64_t)v315, 0, 0, (uint64_t)v60);
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 27, @"Subscription required for shared queue and no active account found");
      v60 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
      v332((uint64_t)v315, 0, 0, (uint64_t)v60);
    }
LABEL_373:

    goto LABEL_374;
  }
  if ([v327 isEqualToString:@"com.apple.mediaplayer.playbackcontext"])
  {
    v6 = [a1 data];
    objc_opt_class();
    v7 = MSVUnarchivedObjectOfClass();
    id v26 = a1;
    v27 = [v26 featureName];

    if (v27)
    {
      v28 = [v26 featureName];
      [v7 setPlayActivityFeatureName:v28];
    }
    v29 = [v26 queueGroupingID];

    if (v29)
    {
      v30 = [v26 queueGroupingID];
      [v7 setPlayActivityQueueGroupingID:v30];
    }
    v31 = [v26 siriRecommendationIdentifier];
    v32 = [v31 dataUsingEncoding:4];

    if (v32)
    {
      v33 = [v26 siriRecommendationIdentifier];
      v34 = [v33 dataUsingEncoding:4];
      [v7 setPlayActivityRecommendationData:v34];
    }
    v35 = [v26 siriAssetInfo];

    if (v35)
    {
      v36 = [v26 siriAssetInfo];
      [v7 setSiriAssetInfo:v36];
    }
    v37 = [v26 siriReferenceIdentifier];

    if (v37)
    {
      v38 = [v26 siriReferenceIdentifier];
      [v7 setSiriReferenceIdentifier:v38];
    }
    v39 = [v26 siriWHAMetricsInfo];

    if (v39)
    {
      v40 = [v26 siriWHAMetricsInfo];
      [v7 setSiriWHAMetricsInfo:v40];
    }
    v41 = [v26 privateListeningOverride];

    if (v41)
    {
      v42 = [v26 privateListeningOverride];
      [v7 setPrivateListeningOverride:v42];
    }
    v43 = [v26 userIdentity];

    if (v43)
    {
      v44 = [v26 userIdentity];
      [v7 setUserIdentity:v44];
    }
    if ([v26 isRequestingImmediatePlayback]) {
      uint64_t v45 = 20;
    }
    else {
      uint64_t v45 = 0;
    }
    [v7 setActionAfterQueueLoad:v45];

    v8 = (void (*)(void))v328[2];
    goto LABEL_3;
  }
  if (![v327 isEqualToString:@"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"])
  {
    if ([v327 isEqualToString:@"com.apple.music.playbackqueue.sharedlistening"]) {
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 58, @"Sharedlistening playback context cannot be used for remote set queue.");
    }
    else {
    v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 4, @"Unknown queue identifier: %@", v327);
    }
    ((void (*)(void *, void, void *))v328[2])(v328, 0, v6);
    goto LABEL_4;
  }
  v47 = [a1 data];
  v48 = (void *)MEMORY[0x263F54F00];
  v49 = (void *)MEMORY[0x263EFFA08];
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
  id v330 = 0;
  v53 = [v48 decodedObjectOfClasses:v52 fromData:v47 error:&v330];
  id v54 = v330;

  v55 = [v53 objectForKeyedSubscript:@"original"];
  v56 = [v53 objectForKeyedSubscript:@"supplemental"];
  if ([v55 isSupported])
  {
    v57 = _MPCLogCategoryPlayback();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v57, OS_LOG_TYPE_DEFAULT, "[RemotePlaybackQueue] using originalPlaybackContext", buf, 2u);
    }
    goto LABEL_158;
  }
  if (v56)
  {
    if ([v56 isSupported])
    {
      v65 = _MPCLogCategoryPlayback();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BB87000, v65, OS_LOG_TYPE_DEFAULT, "[RemotePlaybackQueue] originalPlaybackContext is not supported, using supplementalPlaybackContext", buf, 2u);
      }

      v57 = v55;
      v55 = v56;
      goto LABEL_158;
    }

    uint64_t v92 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 58, @"Neither the originalPlaybackContext nor the supplementalPlaybackContext are supported.");

    v57 = _MPCLogCategoryPlayback();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_157;
    }
    *(_WORD *)buf = 0;
    v93 = "[RemotePlaybackQueue] Neither the originalPlaybackContext nor the supplementalPlaybackContext are supported.";
    goto LABEL_156;
  }

  uint64_t v92 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 58, @"originalPlaybackContext is not supported and no supplementalPlaybackContext was provided.");

  v57 = _MPCLogCategoryPlayback();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v93 = "[RemotePlaybackQueue] originalPlaybackContext is not supported and no supplementalPlaybackContext was provided.";
LABEL_156:
    _os_log_impl(&dword_21BB87000, v57, OS_LOG_TYPE_DEFAULT, v93, buf, 2u);
  }
LABEL_157:
  v55 = 0;
  id v54 = (id)v92;
LABEL_158:

  if (v54)
  {
    ((void (*)(void *, void, id))v328[2])(v328, 0, v54);
  }
  else
  {
    v116 = [v53 objectForKeyedSubscript:@"sessionID"];
    [v55 setSessionIdentifier:v116];

    if ([v55 conformsToProtocol:&unk_26CC28748])
    {
      v117 = v55;
      v118 = [v117 playbackRequestEnvironment];
      id v329 = 0;
      v119 = [v118 rectifiedPlaybackRequestEnvironmentWithReasons:&v329];
      id v326 = v329;

      if (v119)
      {
        v120 = _MPCLogCategoryPlayback();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v121 = [v326 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543618;
          v122 = (void *)v121;
          *(void *)&buf[4] = v121;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v117;
          _os_log_impl(&dword_21BB87000, v120, OS_LOG_TYPE_DEFAULT, "[RemotePlaybackQueue] account rectification [%{public}@] context: %{public}@", buf, 0x16u);
        }
        [v117 setPlaybackRequestEnvironment:v119];
      }
    }
    v123 = [a1 mediaRemoteOptions];
    v124 = [v123 objectForKeyedSubscript:*MEMORY[0x263F54D48]];

    if (v124) {
      -[NSObject setQueueEndAction:](v55, "setQueueEndAction:", [v124 integerValue]);
    }
    ((void (*)(void *, NSObject *, void))v328[2])(v328, v55, 0);
  }
LABEL_406:
}

@end