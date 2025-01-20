@interface VPNConnectionStore
+ (__CFString)vpnTypeFromConnectionType:(unint64_t)a3;
+ (id)applicationNameForConfiguration:(id)a3 withGrade:(unint64_t)a4;
+ (id)sharedInstance;
+ (unint64_t)connectionTypeFromVPNType:(__CFString *)a3;
- (BOOL)alwaysOnToggleEnabledForServiceID:(id)a3;
- (BOOL)configurationIsManaged:(id)a3;
- (BOOL)createVPNWithOptions:(id)a3;
- (BOOL)deleteVPNWithServiceID:(id)a3;
- (BOOL)disableToggle;
- (BOOL)enable:(BOOL)a3 serviceID:(id)a4 withGrade:(unint64_t)a5;
- (BOOL)gradePresent:(unint64_t)a3;
- (BOOL)isActiveVPNID:(id)a3 withGrade:(unint64_t)a4;
- (BOOL)isEnabledWithServiceID:(id)a3 withGrade:(unint64_t)a4;
- (BOOL)isProfileBacked:(id)a3;
- (BOOL)isTypeEnabledWithServiceID:(id)a3 withGrade:(unint64_t)a4 outProviderAvailable:(BOOL *)a5;
- (BOOL)isUserCreatedVPN:(id)a3;
- (BOOL)saveActiveVPNIDToPreferences:(id)a3 withGrade:(unint64_t)a4;
- (BOOL)setOptions:(id)a3 toConfiguration:(id)a4;
- (BOOL)updateVPNWithServiceID:(id)a3 withOptions:(id)a4;
- (NEConfigurationManager)configurationManager;
- (NSArray)configurations;
- (OS_dispatch_queue)storeQueue;
- (VPNConnectionStore)init;
- (id)_defaultDictForType:(unint64_t)a3;
- (id)activeVPNIDWithGrade:(unint64_t)a3;
- (id)activeVPNIDsWithGrade:(unint64_t)a3;
- (id)aggregateAlert;
- (id)aggregateStatusText;
- (id)aggregateStatusText:(unint64_t)a3;
- (id)appNameForServiceID:(id)a3 withGrade:(unint64_t)a4;
- (id)connectionWithServiceID:(id)a3 withGrade:(unint64_t)a4;
- (id)copyActiveVPNIDsFromPrefsForGrade:(unint64_t)a3;
- (id)currentConnection:(BOOL)a3 withGrade:(unint64_t)a4;
- (id)currentConnectionWithGrade:(unint64_t)a3;
- (id)currentConnectionsWithGrade:(unint64_t)a3;
- (id)currentPerAppConnections:(BOOL)a3 withGrade:(unint64_t)a4;
- (id)getProfileIDForServiceID:(id)a3;
- (id)optionsForServiceID:(id)a3 withGrade:(unint64_t)a4;
- (id)organizationForService:(__SCNetworkService *)a3;
- (id)organizationForServiceID:(id)a3;
- (id)queue;
- (id)vpnServiceCountWithGrade:(unint64_t)a3;
- (id)vpnServiceTotalCount;
- (id)vpnServicesForCurrentSetWithGrade:(unint64_t)a3;
- (id)vpnServicesForCurrentSetWithGrade:(unint64_t)a3 excludePerApp:(BOOL)a4;
- (unint64_t)aggregateStatus;
- (unint64_t)aggregateStatus:(unint64_t)a3;
- (unint64_t)currentOnlyConnectionGrade;
- (unsigned)vpnServiceCount;
- (unsigned)vpnServiceCountDirty;
- (void)_configurationChanged;
- (void)_connectionsChanged;
- (void)dealloc;
- (void)iterateContentFilterServicesWithBlock:(id)a3;
- (void)iterateDNSServicesWithBlock:(BOOL)a3 iterBlock:(id)a4;
- (void)iterateDNSServicesWithBlock:(id)a3;
- (void)removeConnection:(id)a3 withGrade:(unint64_t)a4;
- (void)setActiveVPNID:(id)a3 withGrade:(unint64_t)a4;
- (void)setConfigurationManager:(id)a3;
- (void)setConfigurations:(id)a3;
- (void)setStoreQueue:(id)a3;
- (void)setVpnServiceCount:(unsigned int)a3;
- (void)setVpnServiceCountDirty:(unsigned int)a3;
- (void)triggerLocalAuthenticationForConfigurationIdentifier:(id)a3 requestedByApp:(id)a4;
@end

@implementation VPNConnectionStore

void __26__VPNConnectionStore_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setConfigurations:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _configurationChanged];

  id v6 = objc_loadWeakRetained(v2);
  [v6 setVpnServiceCountDirty:1];
}

- (void)setConfigurations:(id)a3
{
}

- (void)_configurationChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__VPNConnectionStore__configurationChanged__block_invoke;
  block[3] = &unk_264C065A8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (id)currentConnection:(BOOL)a3 withGrade:(unint64_t)a4
{
  if (a4 == 2)
  {
    id v5 = 0;
  }
  else
  {
    if (a3 && !self->_gradeCurrentConnectionHasBeenSet[a4])
    {
      gradeCurrentConnection = self->_gradeCurrentConnection;
      if (!self->_gradeCurrentConnection[a4])
      {
        v10 = [(VPNConnectionStore *)self activeVPNIDWithGrade:a4];
        uint64_t v11 = [(VPNConnectionStore *)self connectionWithServiceID:v10 withGrade:a4];
        v12 = gradeCurrentConnection[a4];
        gradeCurrentConnection[a4] = (VPNConnection *)v11;

        self->_gradeCurrentConnectionHasBeenSet[a4] = 1;
      }
    }
    id v5 = self->_gradeCurrentConnection[a4];
  }
  return v5;
}

- (id)connectionWithServiceID:(id)a3 withGrade:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 8 || a4 == 2)
  {
    v7 = self->_gradeCurrentConnection[a4];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v8 = v7;
    v9 = (VPNConnection *)[(VPNConnection *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v9; i = (VPNConnection *)((char *)i + 1))
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v13 = [v12 serviceID];
          int v14 = [v13 isEqual:v6];

          if (v14)
          {
            v9 = v12;
            goto LABEL_13;
          }
        }
        v9 = (VPNConnection *)[(VPNConnection *)v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    if (v9) {
      goto LABEL_20;
    }
  }
  else
  {
    v15 = [(VPNConnection *)self->_gradeCurrentConnection[a4] serviceID];
    int v16 = [v6 isEqual:v15];

    if (v16)
    {
      v9 = self->_gradeCurrentConnection[a4];
      if (v9) {
        goto LABEL_20;
      }
    }
  }
  connectionDict = self->_connectionDict;
  v18 = self->_connectionDict[a4];
  if (!v18)
  {
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v20 = connectionDict[a4];
    connectionDict[a4] = v19;

    v18 = connectionDict[a4];
  }
  v9 = [(NSMutableDictionary *)v18 objectForKey:v6];
  if (!v9)
  {
    v22 = [(VPNConnectionStore *)self optionsForServiceID:v6 withGrade:a4];
    if (!v22
      || (v23 = [[VPNConnection alloc] initWithServiceID:v6 options:v22]) == 0)
    {

      v9 = 0;
      goto LABEL_22;
    }
    v9 = v23;
    [(NSMutableDictionary *)connectionDict[a4] setObject:v23 forKey:v6];
  }
LABEL_20:
  if ([(VPNConnection *)v9 vpnConnectionType] == 3)
  {
    unsigned __int8 v24 = 0;
    [(VPNConnectionStore *)self isTypeEnabledWithServiceID:v6 withGrade:a4 outProviderAvailable:&v24];
    [(VPNConnection *)v9 setIsProviderAvailable:v24];
  }
LABEL_22:

  return v9;
}

- (id)optionsForServiceID:(id)a3 withGrade:(unint64_t)a4
{
  uint64_t v361 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v352 = 0u;
  long long v353 = 0u;
  long long v354 = 0u;
  long long v355 = 0u;
  v7 = [(VPNConnectionStore *)self configurations];
  v8 = (void *)[v7 countByEnumeratingWithState:&v352 objects:v360 count:16];
  if (v8)
  {
    v322 = self;
    uint64_t v9 = *(void *)v353;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v353 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v352 + 1) + 8 * v10);
      if ([v11 grade] != 3)
      {
        v12 = [v11 identifier];
        char v13 = [v12 isEqual:v6];

        if (v13) {
          break;
        }
      }
      if (v8 == (void *)++v10)
      {
        v8 = (void *)[v7 countByEnumeratingWithState:&v352 objects:v360 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v15 = v11;

    if (!v15)
    {
      v8 = 0;
      goto LABEL_201;
    }
    v8 = [MEMORY[0x263EFF9A0] dictionary];
    int v16 = [NSNumber numberWithUnsignedInteger:a4];
    [v8 setValue:v16 forKey:@"VPNGrade"];

    v17 = [v15 name];
    uint64_t v18 = [v15 applicationName];
    v334 = [v15 applicationIdentifier];
    v19 = [MEMORY[0x263EFF9A0] dictionary];
    v20 = &unk_26E7CB880;
    v317 = (__CFString *)v18;
    id v318 = v6;
    if (a4 > 1)
    {
      v304 = v15;
      int v14 = v15;
      switch(a4)
      {
        case 2uLL:
          long long v25 = [v15 appVPN];
          long long v26 = [v25 protocol];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            long long v28 = &unk_26E7CB8E0;
          }
          else
          {
            v232 = [v15 appVPN];
            v233 = [v232 protocol];
            objc_opt_class();
            char v234 = objc_opt_isKindOfClass();

            if (v234) {
              long long v28 = &unk_26E7CB8F8;
            }
            else {
              long long v28 = &unk_26E7CB910;
            }
          }
          v303 = v8;
          [v8 setValue:v28 forKey:@"VPNType"];
          v235 = [v15 appVPN];
          if ([v235 isEnabled]) {
            v236 = &unk_26E7CB8C8;
          }
          else {
            v236 = &unk_26E7CB880;
          }
          id v333 = v236;

          v237 = [v15 appVPN];
          v238 = [v237 protocol];
          v335 = [v238 serverAddress];

          v239 = [v15 appVPN];
          v240 = [v239 protocol];
          v332 = [v240 username];

          v241 = [v15 appVPN];
          LODWORD(v240) = [v241 isOnDemandEnabled];

          if (v240) {
            v242 = &unk_26E7CB8C8;
          }
          else {
            v242 = &unk_26E7CB880;
          }
          v316 = v242;
          v243 = [v15 appVPN];
          int v244 = [v243 isOnDemandUserOverrideDisabled];

          if (v244) {
            v245 = &unk_26E7CB8C8;
          }
          else {
            v245 = &unk_26E7CB880;
          }
          v300 = v245;
          long long v350 = 0u;
          long long v351 = 0u;
          long long v348 = 0u;
          long long v349 = 0u;
          v246 = [v15 appVPN];
          v247 = [v246 appRules];

          uint64_t v248 = [v247 countByEnumeratingWithState:&v348 objects:v359 count:16];
          if (v248)
          {
            uint64_t v249 = v248;
            uint64_t v250 = *(void *)v349;
            do
            {
              for (uint64_t i = 0; i != v249; ++i)
              {
                if (*(void *)v349 != v250) {
                  objc_enumerationMutation(v247);
                }
                v252 = *(void **)(*((void *)&v348 + 1) + 8 * i);
                uint64_t v253 = [v252 matchSigningIdentifier];
                if (v253)
                {
                  v254 = (void *)v253;
                  v255 = [v252 matchSigningIdentifier];
                  v256 = [v19 objectForKeyedSubscript:v255];

                  if (!v256)
                  {
                    uint64_t v257 = [v252 matchDomains];
                    if (v257
                      && (v258 = (void *)v257,
                          [v252 matchDomains],
                          v259 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v260 = [v259 count],
                          v259,
                          v258,
                          v260))
                    {
                      v261 = [v252 matchDomains];
                      uint64_t v262 = [v261 count];

                      if (v262 == 1)
                      {
                        v263 = [v252 matchDomains];
                        [v263 objectAtIndexedSubscript:0];
                      }
                      else
                      {
                        v263 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        [v263 localizedStringForKey:@"MULTIPLE_DOMAINS" value:&stru_26E7C6230 table:@"MobileVPN"];
                      v264 = };
                      v265 = [v252 matchSigningIdentifier];
                      [v19 setObject:v264 forKeyedSubscript:v265];
                    }
                    else
                    {
                      v263 = [v252 matchSigningIdentifier];
                      [v19 setObject:&stru_26E7C6230 forKeyedSubscript:v263];
                    }
                  }
                }
              }
              uint64_t v249 = [v247 countByEnumeratingWithState:&v348 objects:v359 count:16];
            }
            while (v249);
          }

          v323 = 0;
          v324 = 0;
          v329 = 0;
          v330 = 0;
          v331 = 0;
          v307 = 0;
          v308 = 0;
          v326 = 0;
          v327 = 0;
          v328 = 0;
          v325 = 0;
          v100 = 0;
          int v101 = 0;
          v102 = &unk_26E7CB8B0;
          v313 = &unk_26E7CB8B0;
          v314 = &unk_26E7CB880;
          v20 = &unk_26E7CB880;
          v305 = 0;
          v306 = &unk_26E7CB8B0;
          v311 = &unk_26E7CB880;
          v312 = &unk_26E7CB880;
          v309 = 0;
          v310 = &unk_26E7CB880;
          v315 = &unk_26E7CB8C8;
          v8 = v303;
          int v14 = v304;
          v103 = v300;
          goto LABEL_138;
        case 3uLL:
          v97 = [v15 alwaysOnVPN];
          int v98 = [v97 isEnabled];
          v99 = &unk_26E7CB8C8;
          if (!v98) {
            v99 = &unk_26E7CB880;
          }
          id v333 = v99;

          [v8 setValue:&unk_26E7CB8E0 forKey:@"VPNType"];
          v323 = 0;
          v324 = 0;
          v329 = 0;
          v330 = 0;
          v331 = 0;
          v332 = 0;
          v307 = 0;
          v308 = 0;
          v326 = 0;
          v327 = 0;
          v328 = 0;
          v325 = 0;
          v100 = 0;
          v309 = 0;
          v310 = &unk_26E7CB880;
          int v101 = 0;
          v335 = 0;
          v102 = &unk_26E7CB8B0;
          v314 = &unk_26E7CB880;
          v315 = &unk_26E7CB880;
          v316 = &unk_26E7CB880;
          v103 = &unk_26E7CB880;
          v305 = 0;
          v306 = &unk_26E7CB8B0;
          v312 = &unk_26E7CB880;
          v313 = &unk_26E7CB8B0;
          goto LABEL_235;
        case 4uLL:
          uint64_t v104 = [v15 grade];
          v105 = &unk_26E7CB8C8;
          if (v104 != 1) {
            v105 = &unk_26E7CB880;
          }
          v310 = v105;
          v106 = [v15 dnsSettings];
          v107 = [v106 settings];
          objc_opt_class();
          char v108 = objc_opt_isKindOfClass();

          v109 = [v15 dnsSettings];
          v110 = [v109 settings];
          v111 = v110;
          if (v108)
          {
            v112 = [v110 serverURL];
            v335 = [v112 absoluteString];

            v323 = 0;
            v324 = 0;
            v329 = 0;
            v330 = 0;
            v331 = 0;
            v332 = 0;
            v307 = 0;
            v308 = 0;
            v326 = 0;
            v327 = 0;
            v328 = 0;
            v325 = 0;
            v100 = 0;
            v309 = 0;
            int v101 = 0;
            v20 = &unk_26E7CB880;
            v315 = &unk_26E7CB880;
            v316 = &unk_26E7CB880;
            v103 = &unk_26E7CB880;
            v305 = 0;
            v306 = &unk_26E7CB8B0;
            v312 = &unk_26E7CB880;
            v313 = &unk_26E7CB8B0;
            id v333 = &unk_26E7CB880;
            v314 = &unk_26E7CB880;
            v311 = &unk_26E7CB880;
            v102 = &unk_26E7CB8F8;
          }
          else
          {
            objc_opt_class();
            char v266 = objc_opt_isKindOfClass();

            v267 = [v15 dnsSettings];
            v268 = [v267 settings];
            v269 = v268;
            if (v266)
            {
              v335 = [v268 serverName];

              v323 = 0;
              v324 = 0;
              v329 = 0;
              v330 = 0;
              v331 = 0;
              v332 = 0;
              v307 = 0;
              v308 = 0;
              v326 = 0;
              v327 = 0;
              v328 = 0;
              v325 = 0;
              v100 = 0;
              v309 = 0;
              int v101 = 0;
              v20 = &unk_26E7CB880;
              v315 = &unk_26E7CB880;
              v316 = &unk_26E7CB880;
              v103 = &unk_26E7CB880;
              v305 = 0;
              v306 = &unk_26E7CB8B0;
              v312 = &unk_26E7CB880;
              v313 = &unk_26E7CB8B0;
              id v333 = &unk_26E7CB880;
              v314 = &unk_26E7CB880;
              v311 = &unk_26E7CB880;
              v102 = &unk_26E7CB898;
            }
            else
            {
              v274 = [v268 servers];
              v335 = [v274 firstObject];

              v323 = 0;
              v324 = 0;
              v329 = 0;
              v330 = 0;
              v331 = 0;
              v332 = 0;
              v307 = 0;
              v308 = 0;
              v326 = 0;
              v327 = 0;
              v328 = 0;
              v325 = 0;
              v100 = 0;
              v309 = 0;
              int v101 = 0;
              v102 = &unk_26E7CB8B0;
              v20 = &unk_26E7CB880;
              v315 = &unk_26E7CB880;
              v316 = &unk_26E7CB880;
              v103 = &unk_26E7CB880;
              v305 = 0;
              v306 = &unk_26E7CB8B0;
              v312 = &unk_26E7CB880;
              v313 = &unk_26E7CB8B0;
              id v333 = &unk_26E7CB880;
              v314 = &unk_26E7CB880;
              v311 = &unk_26E7CB880;
            }
          }
          goto LABEL_138;
        case 5uLL:
          v321 = v17;
          v302 = v8;
          v113 = [MEMORY[0x263F53C50] sharedConnection];
          int v114 = [v113 isSupervised];

          v115 = &unk_26E7CB8C8;
          long long v346 = 0u;
          long long v347 = 0u;
          if (!v114) {
            v115 = &unk_26E7CB880;
          }
          v310 = v115;
          long long v344 = 0uLL;
          long long v345 = 0uLL;
          v116 = [v15 dnsProxy];
          v117 = [v116 perApp];
          v118 = [v117 appRules];

          uint64_t v119 = [v118 countByEnumeratingWithState:&v344 objects:v358 count:16];
          if (v119)
          {
            uint64_t v120 = v119;
            uint64_t v121 = *(void *)v345;
            do
            {
              for (uint64_t j = 0; j != v120; ++j)
              {
                if (*(void *)v345 != v121) {
                  objc_enumerationMutation(v118);
                }
                v123 = *(void **)(*((void *)&v344 + 1) + 8 * j);
                uint64_t v124 = [v123 matchSigningIdentifier];
                if (v124)
                {
                  v125 = (void *)v124;
                  v126 = [v123 matchSigningIdentifier];
                  v127 = [v19 objectForKeyedSubscript:v126];

                  if (!v127)
                  {
                    uint64_t v128 = [v123 matchDomains];
                    if (v128
                      && (v129 = (void *)v128,
                          [v123 matchDomains],
                          v130 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v131 = [v130 count],
                          v130,
                          v129,
                          v131))
                    {
                      v132 = [v123 matchDomains];
                      uint64_t v133 = [v132 count];

                      if (v133 == 1)
                      {
                        v134 = [v123 matchDomains];
                        [v134 objectAtIndexedSubscript:0];
                      }
                      else
                      {
                        v134 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        [v134 localizedStringForKey:@"MULTIPLE_DOMAINS" value:&stru_26E7C6230 table:@"MobileVPN"];
                      v135 = };
                      v136 = [v123 matchSigningIdentifier];
                      [v19 setObject:v135 forKeyedSubscript:v136];
                    }
                    else
                    {
                      v134 = [v123 matchSigningIdentifier];
                      [v19 setObject:&stru_26E7C6230 forKeyedSubscript:v134];
                    }
                  }
                }
              }
              uint64_t v120 = [v118 countByEnumeratingWithState:&v344 objects:v358 count:16];
            }
            while (v120);
          }

          int v14 = v15;
          v137 = [v15 externalIdentifier];
          int v101 = v137 != 0;

          v323 = 0;
          v324 = 0;
          v329 = 0;
          v330 = 0;
          v331 = 0;
          v332 = 0;
          v307 = 0;
          v308 = 0;
          v326 = 0;
          v327 = 0;
          v328 = 0;
          v325 = 0;
          v100 = 0;
          v309 = 0;
          v335 = 0;
          v20 = &unk_26E7CB880;
          v315 = &unk_26E7CB880;
          v316 = &unk_26E7CB880;
          v103 = &unk_26E7CB880;
          v305 = 0;
          v306 = &unk_26E7CB8B0;
          v312 = &unk_26E7CB880;
          v313 = &unk_26E7CB8B0;
          id v333 = &unk_26E7CB880;
          v314 = &unk_26E7CB880;
          v311 = &unk_26E7CB880;
          v102 = &unk_26E7CB910;
          goto LABEL_103;
        case 6uLL:
          v321 = v17;
          v302 = v8;
          long long v342 = 0u;
          long long v343 = 0u;
          long long v340 = 0u;
          long long v341 = 0u;
          v138 = [v15 contentFilter];
          v139 = [v138 perApp];
          v140 = [v139 appRules];

          uint64_t v141 = [v140 countByEnumeratingWithState:&v340 objects:v357 count:16];
          if (v141)
          {
            uint64_t v142 = v141;
            uint64_t v143 = *(void *)v341;
            do
            {
              for (uint64_t k = 0; k != v142; ++k)
              {
                if (*(void *)v341 != v143) {
                  objc_enumerationMutation(v140);
                }
                v145 = *(void **)(*((void *)&v340 + 1) + 8 * k);
                uint64_t v146 = [v145 matchSigningIdentifier];
                if (v146)
                {
                  v147 = (void *)v146;
                  v148 = [v145 matchSigningIdentifier];
                  v149 = [v19 objectForKeyedSubscript:v148];

                  if (!v149)
                  {
                    uint64_t v150 = [v145 matchDomains];
                    if (v150
                      && (v151 = (void *)v150,
                          [v145 matchDomains],
                          v152 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v153 = [v152 count],
                          v152,
                          v151,
                          v153))
                    {
                      v154 = [v145 matchDomains];
                      uint64_t v155 = [v154 count];

                      if (v155 == 1)
                      {
                        v156 = [v145 matchDomains];
                        [v156 objectAtIndexedSubscript:0];
                      }
                      else
                      {
                        v156 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        [v156 localizedStringForKey:@"MULTIPLE_DOMAINS" value:&stru_26E7C6230 table:@"MobileVPN"];
                      v157 = };
                      v158 = [v145 matchSigningIdentifier];
                      [v19 setObject:v157 forKeyedSubscript:v158];
                    }
                    else
                    {
                      v156 = [v145 matchSigningIdentifier];
                      [v19 setObject:&stru_26E7C6230 forKeyedSubscript:v156];
                    }
                  }
                }
              }
              uint64_t v142 = [v140 countByEnumeratingWithState:&v340 objects:v357 count:16];
            }
            while (v142);
          }

          int v14 = v304;
          v159 = [v304 externalIdentifier];
          int v101 = v159 != 0;

          v323 = 0;
          v324 = 0;
          v329 = 0;
          v330 = 0;
          v331 = 0;
          v332 = 0;
          v307 = 0;
          v308 = 0;
          v326 = 0;
          v327 = 0;
          v328 = 0;
          v325 = 0;
          v100 = 0;
          v335 = 0;
          v102 = &unk_26E7CB8B0;
          v314 = &unk_26E7CB880;
          v315 = &unk_26E7CB880;
          v20 = &unk_26E7CB880;
          v316 = &unk_26E7CB880;
          v103 = &unk_26E7CB880;
          v305 = 0;
          v306 = &unk_26E7CB8B0;
          v312 = &unk_26E7CB880;
          v313 = &unk_26E7CB8B0;
          id v333 = &unk_26E7CB880;
          v309 = 0;
          v310 = &unk_26E7CB880;
          v311 = &unk_26E7CB880;
LABEL_103:
          v8 = v302;
          v17 = v321;
          break;
        default:
          int v14 = v15;
          if (a4 - 7 > 1)
          {
            v323 = 0;
            v324 = 0;
            v329 = 0;
            v330 = 0;
            v331 = 0;
            v332 = 0;
            v307 = 0;
            v308 = 0;
            v326 = 0;
            v327 = 0;
            v328 = 0;
            v325 = 0;
            v100 = 0;
            v309 = 0;
            v310 = &unk_26E7CB880;
            int v101 = 0;
            v335 = 0;
            v314 = &unk_26E7CB880;
            v315 = &unk_26E7CB880;
            v102 = &unk_26E7CB8B0;
            v316 = &unk_26E7CB880;
            v103 = &unk_26E7CB880;
            v305 = 0;
            v306 = &unk_26E7CB8B0;
            v312 = &unk_26E7CB880;
            v313 = &unk_26E7CB8B0;
            id v333 = &unk_26E7CB880;
LABEL_235:
            v311 = &unk_26E7CB880;
          }
          else
          {
            v320 = v17;
            v82 = [v15 relay];
            int v83 = [v82 isEnabled];
            v84 = &unk_26E7CB8C8;
            if (!v83) {
              v84 = &unk_26E7CB880;
            }
            id v333 = v84;

            v85 = [v15 relay];
            v86 = [v85 relays];
            v87 = [v86 lastObject];
            v88 = [v87 HTTP3RelayURL];
            uint64_t v89 = [v88 absoluteString];

            v335 = (__CFString *)v89;
            if (!v89)
            {
              v90 = [v304 relay];
              v91 = [v90 relays];
              v92 = [v91 lastObject];
              v93 = [v92 HTTP2RelayURL];
              v335 = [v93 absoluteString];
            }
            v94 = [v304 relay];
            v95 = [v94 perApp];
            v96 = [v95 appRules];
            v301 = v8;
            if ([v96 count])
            {
              BOOL v299 = 1;
            }
            else
            {
              v275 = [v304 relay];
              v276 = [v275 matchDomains];
              BOOL v299 = [v276 count] != 0;
            }
            v277 = [v304 relay];
            v309 = [v277 matchDomains];

            v278 = [v304 relay];
            v308 = [v278 excludedDomains];

            long long v338 = 0u;
            long long v339 = 0u;
            long long v336 = 0u;
            long long v337 = 0u;
            v279 = [v304 relay];
            v280 = [v279 perApp];
            v281 = [v280 appRules];

            uint64_t v282 = [v281 countByEnumeratingWithState:&v336 objects:v356 count:16];
            if (v282)
            {
              uint64_t v283 = v282;
              uint64_t v284 = *(void *)v337;
              do
              {
                for (uint64_t m = 0; m != v283; ++m)
                {
                  if (*(void *)v337 != v284) {
                    objc_enumerationMutation(v281);
                  }
                  v286 = *(void **)(*((void *)&v336 + 1) + 8 * m);
                  uint64_t v287 = [v286 matchSigningIdentifier];
                  if (v287)
                  {
                    v288 = (void *)v287;
                    v289 = [v286 matchSigningIdentifier];
                    v290 = [v19 objectForKeyedSubscript:v289];

                    if (!v290)
                    {
                      v291 = [v286 matchSigningIdentifier];
                      [v19 setObject:&stru_26E7C6230 forKeyedSubscript:v291];
                    }
                  }
                }
                uint64_t v283 = [v281 countByEnumeratingWithState:&v336 objects:v356 count:16];
              }
              while (v283);
            }

            v323 = 0;
            v324 = 0;
            v329 = 0;
            v330 = 0;
            v331 = 0;
            v332 = 0;
            v326 = 0;
            v327 = 0;
            v328 = 0;
            v325 = 0;
            v100 = 0;
            v305 = 0;
            v102 = &unk_26E7CB8B0;
            v314 = &unk_26E7CB880;
            v315 = &unk_26E7CB880;
            v20 = &unk_26E7CB880;
            v316 = &unk_26E7CB880;
            v103 = &unk_26E7CB880;
            v306 = &unk_26E7CB8B0;
            v307 = 0;
            v312 = &unk_26E7CB880;
            v313 = &unk_26E7CB8B0;
            v310 = &unk_26E7CB880;
            v311 = &unk_26E7CB880;
            v8 = v301;
            int v14 = v304;
            v17 = v320;
            int v101 = v299;
          }
          break;
      }
      goto LABEL_138;
    }
    v319 = v17;
    v21 = [v15 VPN];
    v22 = [v21 protocol];
    objc_opt_class();
    char v23 = objc_opt_isKindOfClass();

    int v14 = v15;
    if (v23)
    {
      unsigned __int8 v24 = &unk_26E7CB8E0;
    }
    else
    {
      v29 = [v15 VPN];
      uint64_t v30 = [v29 protocol];
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();

      if (v31)
      {
        unsigned __int8 v24 = &unk_26E7CB8F8;
      }
      else
      {
        v32 = [v15 VPN];
        v33 = [v32 protocol];
        objc_opt_class();
        char v34 = objc_opt_isKindOfClass();

        if (v34) {
          unsigned __int8 v24 = &unk_26E7CB8B0;
        }
        else {
          unsigned __int8 v24 = &unk_26E7CB910;
        }
      }
    }
    [v8 setValue:v24 forKey:@"VPNType"];
    v35 = [v15 VPN];
    if ([v35 isEnabled]) {
      v36 = &unk_26E7CB8C8;
    }
    else {
      v36 = &unk_26E7CB880;
    }
    id v333 = v36;

    v37 = [v15 VPN];
    v38 = [v37 protocol];
    v335 = [v38 serverAddress];

    v39 = [v15 VPN];
    v40 = [v39 protocol];
    v332 = [v40 username];

    v41 = [v15 VPN];
    v42 = [v41 onDemandRules];

    if (v42)
    {
      v43 = [v15 VPN];
      int v44 = [v43 isOnDemandEnabled];

      if (v44) {
        v45 = &unk_26E7CB8C8;
      }
      else {
        v45 = &unk_26E7CB880;
      }
      v316 = v45;
      v46 = [v15 VPN];
      int v47 = [v46 isOnDemandUserOverrideDisabled];

      if (v47) {
        v48 = &unk_26E7CB8C8;
      }
      else {
        v48 = &unk_26E7CB880;
      }
      v315 = &unk_26E7CB8C8;
    }
    else
    {
      v315 = &unk_26E7CB880;
      v316 = &unk_26E7CB880;
      v48 = &unk_26E7CB880;
    }
    v49 = [v15 VPN];
    v50 = [v49 protocol];
    v51 = [v50 passwordKeychainItem];

    if (v51)
    {
      v52 = [v15 VPN];
      v53 = [v52 protocol];
      v54 = [v53 passwordKeychainItem];
      v331 = (__CFString *)[v54 copyPassword];
    }
    else
    {
      v331 = 0;
    }
    v55 = [v15 VPN];
    v56 = [v55 protocol];
    objc_opt_class();
    char v57 = objc_opt_isKindOfClass();

    v58 = [v15 VPN];
    v59 = [v58 protocol];
    if (v57)
    {

      if ([v59 authenticationMethod] == 1)
      {
        v305 = 0;
        v60 = &unk_26E7CB898;
      }
      else
      {
        v69 = [v59 sharedSecretKeychainItem];

        if (v69)
        {
          v70 = [v59 sharedSecretKeychainItem];
          v305 = (__CFString *)[v70 copyPassword];
        }
        else
        {
          v305 = 0;
        }
        v60 = &unk_26E7CB8B0;
      }
      v306 = v60;
      v330 = [v59 localIdentifier];
      v329 = [v59 remoteIdentifier];
      v169 = [v59 identityReferenceInternal];

      if (v169)
      {
        v323 = [v59 identityReferenceInternal];
      }
      else
      {
        v323 = 0;
      }
      v170 = &unk_26E7CB8B0;
      if ([v59 useExtendedAuthentication])
      {
        v171 = [v59 username];

        if (v171)
        {
          v170 = &unk_26E7CB898;
        }
        else
        {
          v172 = [v59 identityReferenceInternal];

          if (v172) {
            v170 = &unk_26E7CB8F8;
          }
        }
      }
      v313 = v170;

      v324 = 0;
      v311 = &unk_26E7CB880;
      v312 = &unk_26E7CB880;
      v314 = &unk_26E7CB880;
LABEL_124:
      v173 = [v15 VPN];
      v174 = [v173 protocol];
      v175 = [v174 proxySettings];

      v102 = &unk_26E7CB8B0;
      if (!v175)
      {
        v307 = 0;
        v308 = 0;
        v326 = 0;
        v327 = 0;
        v328 = 0;
        v325 = 0;
        v100 = 0;
        int v101 = 0;
        v20 = &unk_26E7CB880;
        v309 = 0;
        v310 = &unk_26E7CB880;
LABEL_137:
        v103 = v48;
LABEL_138:
        v214 = v103;
        if ([v103 BOOLValue]
          && [(VPNConnectionStore *)v322 configurationIsManaged:v14])
        {
          [v8 setValue:v214 forKey:@"VPNOnDemandUserOverrideDisabled"];
        }
        [v8 setValue:v333 forKey:@"VPNEnabled"];
        if (v332) {
          v215 = v332;
        }
        else {
          v215 = &stru_26E7C6230;
        }
        [v8 setValue:v215 forKey:@"authorization"];
        if (v335) {
          v216 = v335;
        }
        else {
          v216 = &stru_26E7C6230;
        }
        [v8 setValue:v216 forKey:@"server"];
        if (v17) {
          v217 = v17;
        }
        else {
          v217 = &stru_26E7C6230;
        }
        [v8 setValue:v217 forKey:@"dispName"];
        if (v305) {
          v218 = v305;
        }
        else {
          v218 = &stru_26E7C6230;
        }
        [v8 setValue:v218 forKey:@"secret"];
        [v8 setValue:v312 forKey:@"securID"];
        [v8 setValue:&unk_26E7CB898 forKey:@"encrypLevel"];
        [v8 setValue:v313 forKey:@"eapType"];
        [v8 setValue:v102 forKey:@"dnsType"];
        [v8 setValue:v310 forKey:@"dnsProhibitDisablement"];
        [v8 setValue:v306 forKey:@"authType"];
        if (v324) {
          v219 = v324;
        }
        else {
          v219 = &stru_26E7C6230;
        }
        [v8 setValue:v219 forKey:@"group"];
        if (v331) {
          v220 = v331;
        }
        else {
          v220 = &stru_26E7C6230;
        }
        [v8 setValue:v220 forKey:@"password"];
        [v8 setValue:v314 forKey:@"VPNSendAllTraffic"];
        [v8 setValue:v311 forKey:@"VPNAlwaysPrompt"];
        if (v323) {
          [v8 setValue:v323 forKey:@"VPNCertificate"];
        }
        if (v307) {
          v221 = v307;
        }
        else {
          v221 = &unk_26E7CB880;
        }
        [v8 setValue:v221 forKey:@"VPNProxyType"];
        if (v327) {
          v222 = v327;
        }
        else {
          v222 = &stru_26E7C6230;
        }
        [v8 setValue:v222 forKey:@"VPNProxyServer"];
        if (v326) {
          v223 = v326;
        }
        else {
          v223 = &stru_26E7C6230;
        }
        [v8 setValue:v223 forKey:@"VPNProxyPort"];
        if (v328) {
          v224 = v328;
        }
        else {
          v224 = &stru_26E7C6230;
        }
        [v8 setValue:v224 forKey:@"VPNProxyPacFile"];
        [v8 setValue:v20 forKey:@"VPNProxyAuthenticate"];
        if (v325) {
          v225 = v325;
        }
        else {
          v225 = &stru_26E7C6230;
        }
        [v8 setValue:v225 forKey:@"VPNProxyUsername"];
        [v8 setValue:v315 forKey:@"VPNOnDemandCapable"];
        [v8 setValue:v316 forKey:@"VPNOnDemandEnabled"];
        if (v100) {
          v226 = v100;
        }
        else {
          v226 = &stru_26E7C6230;
        }
        [v8 setValue:v226 forKey:@"VPNProxyPassword"];
        [v8 setValue:&unk_26E7CB880 forKey:@"VPNPasswordRequired"];
        if (v317) {
          v227 = v317;
        }
        else {
          v227 = &stru_26E7C6230;
        }
        [v8 setValue:v227 forKey:@"VPNApplicationName"];
        if (v334) {
          v228 = v334;
        }
        else {
          v228 = &stru_26E7C6230;
        }
        [v8 setValue:v228 forKey:@"VPNApplicationBundleID"];
        if (v330) {
          v229 = v330;
        }
        else {
          v229 = &stru_26E7C6230;
        }
        [v8 setValue:v229 forKey:@"VPNLocalIdentifier"];
        if (v329) {
          v230 = v329;
        }
        else {
          v230 = &stru_26E7C6230;
        }
        [v8 setValue:v230 forKey:@"VPNRemoteIdentifier"];
        id v6 = v318;
        if (v101) {
          [v8 setValue:&unk_26E7CB8C8 forKey:@"VPNIsPerApp"];
        }
        if ([v19 count]) {
          [v8 setValue:v19 forKey:@"VPNIncludedBundleIDs"];
        }
        if ([v309 count]) {
          [v8 setValue:v309 forKey:@"VPNMatchDomains"];
        }
        if ([v308 count]) {
          [v8 setValue:v308 forKey:@"VPNExcludeDomains"];
        }

        goto LABEL_200;
      }
      v176 = [v15 VPN];
      v177 = [v176 protocol];
      v178 = [v177 proxySettings];
      char v179 = [v178 autoProxyConfigurationEnabled];

      if (v179)
      {
        v180 = &unk_26E7CB8F8;
      }
      else
      {
        v181 = [v15 VPN];
        v182 = [v181 protocol];
        v183 = [v182 proxySettings];
        int v184 = [v183 HTTPEnabled];

        v180 = &unk_26E7CB898;
        if (!v184) {
          v180 = &unk_26E7CB8B0;
        }
      }
      v307 = v180;
      v185 = [v15 VPN];
      v186 = [v185 protocol];
      v187 = [v186 proxySettings];
      v188 = [v187 proxyAutoConfigURL];
      v328 = [v188 absoluteString];

      v189 = [v15 VPN];
      v190 = [v189 protocol];
      v191 = [v190 proxySettings];
      v192 = [v191 HTTPServer];

      if (v192)
      {
        v193 = [v15 VPN];
        v194 = [v193 protocol];
        v195 = [v194 proxySettings];
        v196 = [v195 HTTPServer];
        v327 = [v196 address];

        v197 = NSString;
        v198 = [v15 VPN];
        v199 = [v198 protocol];
        v200 = [v199 proxySettings];
        v201 = [v200 HTTPServer];
        objc_msgSend(v197, "stringWithFormat:", @"%lu", objc_msgSend(v201, "port"));
        v326 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v202 = [v14 VPN];
        v203 = [v202 protocol];
        v204 = [v203 proxySettings];
        v205 = [v204 HTTPServer];
        int v101 = [v205 authenticationRequired];

        if (v101)
        {
          v206 = [v14 VPN];
          v207 = [v206 protocol];
          v208 = [v207 proxySettings];
          v209 = [v208 HTTPServer];
          v325 = [v209 username];

          v210 = [v14 VPN];
          v211 = [v210 protocol];
          v212 = [v211 proxySettings];
          v213 = [v212 HTTPServer];
          v100 = (__CFString *)[v213 copyPassword];

          v308 = 0;
          v309 = 0;
          int v101 = 0;
          v20 = &unk_26E7CB8C8;
          v102 = &unk_26E7CB8B0;
          v310 = &unk_26E7CB880;
LABEL_136:
          v17 = v319;
          goto LABEL_137;
        }
        v325 = 0;
        v100 = 0;
        v308 = 0;
        v309 = 0;
      }
      else
      {
        v326 = 0;
        v327 = 0;
        v325 = 0;
        v100 = 0;
        v308 = 0;
        v309 = 0;
        int v101 = 0;
      }
      v20 = &unk_26E7CB880;
      v310 = &unk_26E7CB880;
      goto LABEL_136;
    }
    objc_opt_class();
    char v61 = objc_opt_isKindOfClass();

    v62 = [v15 VPN];
    v63 = [v62 protocol];
    v64 = v63;
    if (v61)
    {
      v65 = [v63 sharedSecretKeychainItem];

      if (v65)
      {
        v66 = [v15 VPN];
        v67 = [v66 protocol];
        v68 = [v67 sharedSecretKeychainItem];
        v305 = (__CFString *)[v68 copyPassword];
      }
      else
      {
        v305 = 0;
      }
      v160 = [v15 VPN];
      v161 = [v160 protocol];
      v162 = [v161 IPv4Settings];
      int v163 = [v162 overridePrimary];

      if (v163) {
        v164 = &unk_26E7CB8C8;
      }
      else {
        v164 = &unk_26E7CB880;
      }
      v314 = v164;
      v165 = [v15 VPN];
      v166 = [v165 protocol];
      uint64_t v167 = [v166 authenticationMethod];

      v323 = 0;
      v324 = 0;
      v329 = 0;
      v330 = 0;
      if (v167 == 2) {
        v168 = &unk_26E7CB8C8;
      }
      else {
        v168 = &unk_26E7CB880;
      }
      v306 = &unk_26E7CB8B0;
      v312 = v168;
      v313 = &unk_26E7CB8B0;
      v311 = &unk_26E7CB880;
      v17 = v319;
      goto LABEL_124;
    }
    objc_opt_class();
    char v71 = objc_opt_isKindOfClass();

    v314 = &unk_26E7CB880;
    if ((v71 & 1) == 0)
    {
      v323 = 0;
      v324 = 0;
      v329 = 0;
      v330 = 0;
      v305 = 0;
      v306 = &unk_26E7CB8B0;
      v312 = &unk_26E7CB880;
      v313 = &unk_26E7CB8B0;
      v311 = &unk_26E7CB880;
      goto LABEL_124;
    }
    v72 = [v15 VPN];
    v73 = [v72 protocol];
    uint64_t v74 = [v73 authenticationMethod];

    v75 = [v15 VPN];
    v76 = [v75 protocol];
    v77 = v76;
    if (v74 == 1)
    {
      v78 = [v76 identityReferenceInternal];

      if (!v78)
      {
        v323 = 0;
        v324 = 0;
        v305 = 0;
        v306 = &unk_26E7CB898;
LABEL_259:
        v295 = [v15 VPN];
        v296 = [v295 protocol];
        int v297 = [v296 extendedAuthPasswordPrompt];

        v329 = 0;
        v330 = 0;
        if (v297) {
          v298 = &unk_26E7CB8C8;
        }
        else {
          v298 = &unk_26E7CB880;
        }
        v311 = v298;
        v312 = &unk_26E7CB880;
        v313 = &unk_26E7CB8B0;
        goto LABEL_124;
      }
      v79 = [v15 VPN];
      v80 = [v79 protocol];
      v323 = [v80 identityReferenceInternal];
      v324 = 0;
      v305 = 0;
      v81 = &unk_26E7CB898;
    }
    else
    {
      v270 = [v76 sharedSecretKeychainItem];

      if (v270)
      {
        v271 = [v15 VPN];
        v272 = [v271 protocol];
        v273 = [v272 sharedSecretKeychainItem];
        v305 = (__CFString *)[v273 copyPassword];
      }
      else
      {
        v305 = 0;
      }
      v292 = [v15 VPN];
      v293 = [v292 protocol];
      v294 = [v293 localIdentifier];

      if (!v294)
      {
        v323 = 0;
        v324 = 0;
        v306 = &unk_26E7CB8B0;
        goto LABEL_259;
      }
      v79 = [v15 VPN];
      v80 = [v79 protocol];
      [v80 localIdentifier];
      v323 = 0;
      v324 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v81 = &unk_26E7CB8B0;
    }
    v306 = v81;

    goto LABEL_259;
  }
LABEL_10:
  int v14 = v7;
LABEL_200:

LABEL_201:

  return v8;
}

- (id)activeVPNIDWithGrade:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    gradeActiveVPNIDLoaded = self->_gradeActiveVPNIDLoaded;
    if (!self->_gradeActiveVPNIDLoaded[a3])
    {
      id v9 = [(VPNConnectionStore *)self copyActiveVPNIDsFromPrefsForGrade:a3];
      gradeActiveVPNID = self->_gradeActiveVPNID;
      uint64_t v11 = self->_gradeActiveVPNID[a3];
      self->_gradeActiveVPNID[a3] = 0;

      if (v9 && [v9 count])
      {
        uint64_t v12 = [v9 firstObject];
        char v13 = gradeActiveVPNID[a3];
        gradeActiveVPNID[a3] = (NSUUID *)v12;
      }
      int v14 = gradeActiveVPNID[a3];
      if (v14) {
        LOBYTE(v14) = 1;
      }
      else {
        gradeActiveVPNID[a3] = 0;
      }
      gradeActiveVPNIDLoaded[a3] = (char)v14;
    }
    uint64_t v4 = self->_gradeActiveVPNID[a3];
  }
  return v4;
}

- (id)copyActiveVPNIDsFromPrefsForGrade:(unint64_t)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v6 = 1;
  if (a3) {
    uint64_t v6 = 2;
  }
  uint64_t v40 = v6;
  v41 = v5;
  long long v44 = 0uLL;
  long long v45 = 0uLL;
  v7 = [(VPNConnectionStore *)self configurations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    unint64_t v11 = a3 - 2;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        char v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v13 grade] != 3)
        {
          switch(v11)
          {
            case 0uLL:
              uint64_t v14 = [v13 appVPN];
              if (!v14) {
                continue;
              }
              id v15 = (void *)v14;
              int v16 = [v13 appVPN];
              int v17 = [v16 isEnabled];

              if (!v17) {
                continue;
              }
              goto LABEL_35;
            case 1uLL:
              v22 = [v13 alwaysOnVPN];
              goto LABEL_21;
            case 2uLL:
              v22 = [v13 dnsSettings];
              goto LABEL_21;
            case 3uLL:
              v22 = [v13 dnsProxy];
              goto LABEL_21;
            case 4uLL:
              v22 = [v13 contentFilter];
LABEL_21:
              char v23 = v22;

              if (v23) {
                goto LABEL_40;
              }
              continue;
            case 5uLL:
              uint64_t v24 = [v13 relay];
              if (!v24) {
                continue;
              }
              v19 = (void *)v24;
              v20 = [v13 relay];
              if (([v20 isEnabled] & 1) == 0) {
                goto LABEL_31;
              }
              long long v25 = [v13 relay];
              long long v26 = [v25 matchDomains];
              if ([v26 count])
              {

LABEL_31:
                goto LABEL_36;
              }
              v36 = [v13 relay];
              char v34 = [v36 perApp];
              v32 = [v34 appRules];
              uint64_t v38 = [v32 count];

              if (v38) {
                continue;
              }
              goto LABEL_35;
            case 6uLL:
              uint64_t v27 = [v13 relay];
              if (!v27) {
                continue;
              }
              v19 = (void *)v27;
              v20 = [v13 relay];
              if (([v20 isEnabled] & 1) == 0) {
                goto LABEL_31;
              }
              long long v28 = [v13 relay];
              v29 = [v28 matchDomains];
              if ([v29 count])
              {
              }
              else
              {
                v37 = [v13 relay];
                v35 = [v37 perApp];
                v33 = [v35 appRules];
                uint64_t v39 = [v33 count];

                if (!v39) {
                  continue;
                }
              }
LABEL_35:
              v19 = [v13 identifier];
              [v41 addObject:v19];
LABEL_36:

              break;
            default:
              uint64_t v18 = [v13 VPN];
              if (!v18) {
                continue;
              }
              v19 = (void *)v18;
              v20 = [v13 VPN];
              if (([v20 isEnabled] & 1) == 0) {
                goto LABEL_31;
              }
              uint64_t v21 = [v13 grade];

              if (v21 != v40) {
                continue;
              }
LABEL_40:
              uint64_t v30 = [v13 identifier];
              [v41 addObject:v30];

              goto LABEL_41;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v9);
  }
LABEL_41:

  return v41;
}

- (NSArray)configurations
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (id)activeVPNIDsWithGrade:(unint64_t)a3
{
  if (a3 == 8 || a3 == 2)
  {
    if (!self->_gradeActiveVPNIDLoaded[a3])
    {
      id v5 = [(VPNConnectionStore *)self copyActiveVPNIDsFromPrefsForGrade:a3];
      uint64_t v6 = self->_gradeActiveVPNID[a3];
      self->_gradeActiveVPNID[a3] = v5;

      if (self->_gradeActiveVPNID[a3])
      {
        BOOL v7 = 1;
      }
      else
      {
        self->_gradeActiveVPNID[a3] = (NSUUID *)MEMORY[0x263EFFA68];

        BOOL v7 = 0;
      }
      self->_gradeActiveVPNIDLoaded[a3] = v7;
    }
    uint64_t v8 = self->_gradeActiveVPNID[a3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)vpnServiceTotalCount
{
  uint64_t v3 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:3];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:1];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:0];
    uint64_t v9 = [v8 count] + v7;
    uint64_t v10 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:2];
    uint64_t v11 = [v10 count];
    uint64_t v12 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:7];
    uint64_t v13 = v9 + v11 + [v12 count];
    uint64_t v14 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:2];
    uint64_t v5 = v13 + [v14 count];
  }
  id v15 = [NSNumber numberWithUnsignedInteger:v5];

  return v15;
}

- (VPNConnectionStore)init
{
  v18.receiver = self;
  v18.super_class = (Class)VPNConnectionStore;
  v2 = [(VPNConnectionStore *)&v18 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    dispatch_queue_t v3 = dispatch_queue_create("MobileVPN Settings", 0);
    storeQueue = v2->_storeQueue;
    v2->_storeQueue = (OS_dispatch_queue *)v3;

    configurations = v2->_configurations;
    v2->_configurations = 0;

    uint64_t v6 = (NEConfigurationManager *)objc_alloc_init(MEMORY[0x263F145C0]);
    configurationManager = v2->_configurationManager;
    v2->_configurationManager = v6;

    uint64_t v8 = v2->_configurationManager;
    uint64_t v9 = v2->_storeQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __26__VPNConnectionStore_init__block_invoke;
    v15[3] = &unk_264C06850;
    objc_copyWeak(&v16, &location);
    [(NEConfigurationManager *)v8 loadConfigurationsWithCompletionQueue:v9 handler:v15];
    uint64_t v10 = v2->_configurationManager;
    uint64_t v11 = v2->_storeQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __26__VPNConnectionStore_init__block_invoke_2;
    v13[3] = &unk_264C06878;
    objc_copyWeak(&v14, &location);
    [(NEConfigurationManager *)v10 setChangedQueue:v11 andHandler:v13];
    v2->_vpnServiceCountDirty = 1;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __43__VPNConnectionStore__configurationChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  do
  {
    *(unsigned char *)(*(void *)(a1 + 32) + v2 + 8) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + v2 + 168) = 0;
    uint64_t v3 = *(void *)(a1 + 32) + 8 * v2;
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;

    uint64_t v5 = *(void *)(a1 + 32) + 8 * v2;
    uint64_t v6 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = 0;

    uint64_t v7 = *(void *)(a1 + 32) + 256;
    if (*(void *)(v7 + 8 * v2))
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = *(id *)(v7 + 8 * v2);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            id v14 = [*(id *)(*(void *)(a1 + 32) + 8 * v2 + 256) objectForKeyedSubscript:v13];
            id v15 = [*(id *)(a1 + 32) optionsForServiceID:v13 withGrade:v2];
            [v14 updateWithOptions:v15];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
    }
    ++v2;
  }
  while (v2 != 9);
  id v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 postNotificationName:@"VPNNEConfigurationChangedNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)gradePresent:(unint64_t)a3
{
  uint64_t v5 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:3];
  uint64_t v6 = [v5 count];

  if (v6) {
    return a3 == 3;
  }
  id v8 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:a3];
  BOOL v7 = [v8 count] != 0;

  return v7;
}

+ (unint64_t)connectionTypeFromVPNType:(__CFString *)a3
{
  BOOL v4 = CFStringCompare(a3, (CFStringRef)*MEMORY[0x263F1BC68], 1uLL) != kCFCompareEqualTo;
  if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x263F1BC48], 1uLL) == kCFCompareEqualTo) {
    return 2;
  }
  if (CFStringCompare(a3, @"VPN", 1uLL) == kCFCompareEqualTo) {
    return 3;
  }
  unint64_t v5 = 4 * v4;
  if (CFStringCompare(a3, @"IKEv2", 1uLL)) {
    return v5;
  }
  else {
    return 4;
  }
}

+ (__CFString)vpnTypeFromConnectionType:(unint64_t)a3
{
  if (!a3) {
    return (__CFString *)*MEMORY[0x263F1BC68];
  }
  uint64_t v3 = @"IKEv2";
  if (a3 == 2) {
    uint64_t v3 = @"IPsec";
  }
  if (a3 == 3) {
    return @"VPN";
  }
  else {
    return v3;
  }
}

+ (id)sharedInstance
{
  uint64_t v2 = (void *)sVPNConnectionStore;
  if (!sVPNConnectionStore)
  {
    uint64_t v3 = objc_alloc_init(VPNConnectionStore);
    BOOL v4 = (void *)sVPNConnectionStore;
    sVPNConnectionStore = (uint64_t)v3;

    uint64_t v2 = (void *)sVPNConnectionStore;
  }

  return v2;
}

- (id)queue
{
  return self->_storeQueue;
}

void __26__VPNConnectionStore_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained configurationManager];
  id v7 = objc_loadWeakRetained(v4);
  id v8 = [v7 storeQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __26__VPNConnectionStore_init__block_invoke_3;
  v9[3] = &unk_264C06850;
  objc_copyWeak(&v10, v4);
  [v6 loadConfigurationsWithCompletionQueue:v8 handler:v9];

  objc_destroyWeak(&v10);
}

void __26__VPNConnectionStore_init__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setConfigurations:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _configurationChanged];

  id v6 = objc_loadWeakRetained(v2);
  [v6 setVpnServiceCountDirty:1];
}

- (void)dealloc
{
  if ((VPNConnectionStore *)sVPNConnectionStore == self)
  {
    sVPNConnectionStore = 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.vpn-changed", 0);
  v4.receiver = self;
  v4.super_class = (Class)VPNConnectionStore;
  [(VPNConnectionStore *)&v4 dealloc];
}

- (BOOL)disableToggle
{
  unint64_t v3 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v4 = 1;
  long long v5 = 0uLL;
  do
  {
    long long v15 = v5;
    long long v16 = v5;
    *((void *)&v13 + 1) = *((void *)&v5 + 1);
    long long v14 = v5;
    id v6 = -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", v3, (void)v5);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 onDemandAction] == 2 || !objc_msgSend(v11, "isProviderAvailable"))
          {

            return v4;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    BOOL v4 = v3++ < 8;
    long long v5 = 0uLL;
  }
  while (v3 != 9);
  return 0;
}

- (unint64_t)aggregateStatus
{
  uint64_t v3 = 0;
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v4 = 1;
  do
  {
    if (v3 != 6 && (v3 & 0x7FFFFFFFFFFFFFFELL) != 4)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v5 = -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", v3, 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (v10)
            {
              uint64_t v11 = [v10 status];
              if (v11 != v4)
              {
                if (v11 == 6)
                {
                  unint64_t v4 = 6;
                }
                else
                {
                  if (v11 == 3)
                  {
                    unint64_t v4 = 3;
                    goto LABEL_32;
                  }
                  if (v11 != 2 || v4 == 6)
                  {
                    if (v4 != 2 && v4 != 6 && v11 == 4) {
                      unint64_t v4 = 4;
                    }
                  }
                  else
                  {
                    unint64_t v4 = 2;
                  }
                }
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_32:
    }
    ++v3;
  }
  while (v3 != 9);
  return v4;
}

- (unint64_t)aggregateStatus:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", a3, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    unint64_t v7 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v9)
        {
          uint64_t v10 = [v9 status];
          if (v10 != v7)
          {
            if (v10 == 6)
            {
              unint64_t v7 = 6;
            }
            else
            {
              if (v10 == 3)
              {
                unint64_t v7 = 3;
                goto LABEL_30;
              }
              if (v10 != 2 || v7 == 6)
              {
                if (v7 != 2 && v7 != 6 && v10 == 4) {
                  unint64_t v7 = 4;
                }
              }
              else
              {
                unint64_t v7 = 2;
              }
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v7 = 1;
  }
LABEL_30:

  return v7;
}

- (id)aggregateAlert
{
  uint64_t v3 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v4 = 0uLL;
  do
  {
    long long v15 = v4;
    long long v16 = v4;
    *((void *)&v13 + 1) = *((void *)&v4 + 1);
    long long v14 = v4;
    uint64_t v5 = -[VPNConnectionStore currentConnectionsWithGrade:](self, "currentConnectionsWithGrade:", v3, (void)v4);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (v10)
          {
            uint64_t v11 = [v10 alertText];
            if ([(__CFString *)v11 length])
            {

              goto LABEL_15;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    ++v3;
    long long v4 = 0uLL;
  }
  while (v3 != 9);
  uint64_t v11 = &stru_26E7C6230;
LABEL_15:

  return v11;
}

- (id)aggregateStatusText
{
  unint64_t v3 = [(VPNConnectionStore *)self aggregateStatus];
  if (v3 == 1)
  {
    long long v4 = [(VPNConnectionStore *)self aggregateAlert];
    if ([v4 length]) {
      goto LABEL_5;
    }
  }
  long long v4 = +[VPNConnection statusTextForStatus:v3];
LABEL_5:

  return v4;
}

- (id)aggregateStatusText:(unint64_t)a3
{
  unint64_t v4 = [(VPNConnectionStore *)self aggregateStatus:a3];
  if (v4 == 1)
  {
    uint64_t v5 = [(VPNConnectionStore *)self aggregateAlert];
    if ([v5 length]) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = +[VPNConnection statusTextForStatus:v4];
LABEL_5:

  return v5;
}

- (unint64_t)currentOnlyConnectionGrade
{
  unint64_t v3 = [(VPNConnectionStore *)self vpnServiceTotalCount];
  if ([v3 intValue] == 1)
  {
    unint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = [(VPNConnectionStore *)self currentConnectionWithGrade:v4];

      if (v5) {
        break;
      }
      if (++v4 == 9) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isUserCreatedVPN:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = [(VPNConnectionStore *)self configurations];
  id v6 = (id)[v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v33 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
      if ([v9 grade] != 3)
      {
        uint64_t v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11) {
          break;
        }
      }
      if (v6 == (id)++v8)
      {
        id v6 = (id)[v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v6 = v9;

    if (!v6
      || ([v6 applicationName], long long v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
    {
      BOOL v12 = 0;
      goto LABEL_15;
    }
    long long v15 = [v6 payloadInfo];
    long long v16 = [v15 profileIdentifier];

    if (!v16)
    {
      BOOL v12 = 1;
      goto LABEL_15;
    }
    long long v17 = [MEMORY[0x263F53C50] sharedConnection];
    BOOL v12 = 1;
    uint64_t v18 = [v17 installedProfilesWithFilterFlags:1];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = v18;
    uint64_t v19 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v5);
          }
          char v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend(v6, "payloadInfo", (void)v28);
          long long v25 = [v24 profileIdentifier];
          long long v26 = [v23 identifier];
          char v27 = [v25 isEqualToString:v26];

          if (v27)
          {
            BOOL v12 = 0;
            goto LABEL_27;
          }
        }
        uint64_t v20 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v20) {
          continue;
        }
        break;
      }
      BOOL v12 = 1;
    }
LABEL_27:
  }
  else
  {
LABEL_10:
    BOOL v12 = 0;
  }

LABEL_15:
  return v12;
}

- (BOOL)isProfileBacked:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(VPNConnectionStore *)self configurations];
  id v6 = (id)[v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      if ([v9 grade] != 3)
      {
        uint64_t v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11) {
          break;
        }
      }
      if (v6 == (id)++v8)
      {
        id v6 = (id)[v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v6 = v9;

    if (!v6)
    {
      LOBYTE(v12) = 0;
      goto LABEL_16;
    }
    long long v13 = [v6 payloadInfo];
    BOOL v12 = [v13 profileIdentifier];

    if (!v12) {
      goto LABEL_16;
    }
    BOOL v12 = [MEMORY[0x263F53C50] sharedConnection];
    long long v14 = [v6 payloadInfo];
    long long v15 = [v14 profileIdentifier];
    id v5 = [v12 installedProfileWithIdentifier:v15];

    LOBYTE(v12) = v5 != 0;
  }
  else
  {
LABEL_10:
    LOBYTE(v12) = 0;
  }

LABEL_16:
  return (char)v12;
}

- (void)_connectionsChanged
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"VPNConnectionsChangedNotification" object:self];
}

- (void)removeConnection:(id)a3 withGrade:(unint64_t)a4
{
  id v6 = (VPNConnection *)a3;
  if (a4 != 2)
  {
    gradeCurrentConnection = self->_gradeCurrentConnection;
    char v11 = v6;
    if (self->_gradeCurrentConnection[a4] == v6)
    {
      [(VPNConnection *)v6 disconnect];
      uint64_t v8 = gradeCurrentConnection[a4];
      gradeCurrentConnection[a4] = 0;

      self->_gradeCurrentConnectionHasBeenSet[a4] = 0;
    }
    uint64_t v9 = self->_connectionDict[a4];
    uint64_t v10 = [(VPNConnection *)v11 serviceID];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];

    [(VPNConnectionStore *)self _connectionsChanged];
    id v6 = v11;
  }
}

- (id)currentPerAppConnections:(BOOL)a3 withGrade:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3 && !self->_gradeCurrentConnectionHasBeenSet[a4] && !self->_gradeCurrentConnection[a4])
  {
    gradeCurrentConnection = self->_gradeCurrentConnection;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = [(VPNConnectionStore *)self activeVPNIDsWithGrade:a4];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          BOOL v12 = [(VPNConnectionStore *)self connectionWithServiceID:*(void *)(*((void *)&v18 + 1) + 8 * i) withGrade:a4];
          if (v12)
          {
            if (!v9) {
              uint64_t v9 = (VPNConnection *)objc_alloc_init(MEMORY[0x263EFF980]);
            }
            [(VPNConnection *)v9 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    long long v13 = gradeCurrentConnection[a4];
    gradeCurrentConnection[a4] = v9;
    long long v14 = v9;

    self->_gradeCurrentConnectionHasBeenSet[a4] = 1;
  }
  long long v15 = self->_gradeCurrentConnection[a4];

  return v15;
}

- (id)currentConnectionWithGrade:(unint64_t)a3
{
  id v6 = 0;
  if (a3 == 2 || a3 == 8)
  {
  }
  else
  {
    id v6 = -[VPNConnectionStore currentConnection:withGrade:](self, "currentConnection:withGrade:", 1, a3, v3);
  }
  return v6;
}

- (id)currentConnectionsWithGrade:(unint64_t)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3 == 8 || a3 == 2)
  {
    uint64_t v3 = [(VPNConnectionStore *)self currentPerAppConnections:1 withGrade:a3];
  }
  else
  {
    uint64_t v4 = [(VPNConnectionStore *)self currentConnection:1 withGrade:a3];
    id v5 = (void *)v4;
    if (v4)
    {
      v7[0] = v4;
      uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }

  return v3;
}

- (id)_defaultDictForType:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = v5;
  if (!a3) {
    [v5 setValue:*MEMORY[0x263F1BD20] forKey:@"AuthenticationMethod"];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v10 = [NSNumber numberWithInt:1];
  char v11 = [NSNumber numberWithInt:0];
  BOOL v12 = [NSNumber numberWithInt:1];
  long long v13 = [NSNumber numberWithInt:0];
  long long v14 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"ConnectByDefault", v11, @"Alternate Number", v12, @"DO NOT SAVE", v13, @"Main Number", v8, @"EAP", v7, @"L2TP", v4, *MEMORY[0x263F1BC78], v6, *MEMORY[0x263F1BE98], 0);

  return v14;
}

- (BOOL)setOptions:(id)a3 toConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"VPNGrade"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [v5 objectForKeyedSubscript:@"VPNType"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (v8 == 2)
  {
    long long v19 = [v5 objectForKeyedSubscript:@"VPNOnDemandEnabled"];

    if (v19)
    {
      long long v18 = [v5 objectForKeyedSubscript:@"VPNOnDemandEnabled"];
      uint64_t v20 = [v18 BOOLValue];
      long long v21 = [v6 appVPN];
      [v21 setOnDemandEnabled:v20];

LABEL_12:
LABEL_16:
      LOBYTE(v19) = 1;
    }
  }
  else
  {
    if (v8 != 1)
    {
      if (v8)
      {
LABEL_62:
        LOBYTE(v19) = 0;
        goto LABEL_63;
      }
      char v11 = [v6 VPN];

      if (!v11)
      {
        id v12 = objc_alloc_init(MEMORY[0x263F14638]);
        [v6 setVPN:v12];
      }
      long long v13 = [v5 objectForKeyedSubscript:@"VPNOnDemandEnabled"];

      if (v13)
      {
        long long v14 = [v5 objectForKeyedSubscript:@"VPNOnDemandEnabled"];
        uint64_t v15 = [v14 BOOLValue];

        long long v16 = [v6 VPN];
        long long v17 = [v16 onDemandRules];

        if (!v17)
        {
          long long v18 = VPNSettingsCopyLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[VPNConnectionStore setOptions:toConfiguration:]();
          }
          goto LABEL_12;
        }
LABEL_15:
        long long v25 = [v6 VPN];
        [v25 setOnDemandEnabled:v15];

        goto LABEL_16;
      }
      if (v10 == 4)
      {
        long long v32 = [v6 VPN];
        long long v33 = [v32 protocol];

        if (v33)
        {
          long long v34 = [v6 VPN];
          long long v35 = [v34 protocol];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_62;
          }
        }
        else
        {
          id v67 = objc_alloc_init(MEMORY[0x263F14648]);
          [v67 setDefaultsForUIConfiguration];
          v68 = [v6 VPN];
          [v68 setProtocol:v67];
        }
        v69 = [v6 VPN];
        v70 = [v69 protocol];

        uint64_t v71 = [v5 objectForKeyedSubscript:@"VPNLocalIdentifier"];
        if (v71
          && (v72 = (void *)v71,
              [v5 objectForKeyedSubscript:@"VPNLocalIdentifier"],
              v73 = objc_claimAutoreleasedReturnValue(),
              uint64_t v74 = [v73 length],
              v73,
              v72,
              v74))
        {
          v75 = [v5 objectForKeyedSubscript:@"VPNLocalIdentifier"];
          [v70 setLocalIdentifier:v75];
        }
        else
        {
          [v70 setLocalIdentifier:0];
        }
        uint64_t v76 = [v5 objectForKeyedSubscript:@"VPNRemoteIdentifier"];
        if (v76
          && (v77 = (void *)v76,
              [v5 objectForKeyedSubscript:@"VPNRemoteIdentifier"],
              v78 = objc_claimAutoreleasedReturnValue(),
              uint64_t v79 = [v78 length],
              v78,
              v77,
              v79))
        {
          v80 = [v5 objectForKeyedSubscript:@"VPNRemoteIdentifier"];
          [v70 setRemoteIdentifier:v80];
        }
        else
        {
          [v70 setRemoteIdentifier:0];
        }
        v81 = [v5 objectForKeyedSubscript:@"eapType"];

        if (v81)
        {
          v82 = [v5 objectForKeyedSubscript:@"eapType"];
          v81 = (void *)[v82 unsignedIntegerValue];
        }
        int v83 = [v5 objectForKeyedSubscript:@"authType"];

        if (v83)
        {
          v84 = [v5 objectForKeyedSubscript:@"authType"];
          int v83 = (void *)[v84 unsignedIntegerValue];
        }
        if (v81)
        {
          [v70 setUseExtendedAuthentication:1];
          BOOL v85 = v81 != (void *)2;
        }
        else
        {
          [v70 setUseExtendedAuthentication:0];
          BOOL v85 = 0;
        }
        if (v83 == (void *)1)
        {
          [v70 setAuthenticationMethod:1];
        }
        else
        {
          [v70 setAuthenticationMethod:2];
          uint64_t v97 = [v5 objectForKeyedSubscript:@"secret"];
          if (v97)
          {
            int v98 = (void *)v97;
            v99 = [v5 objectForKeyedSubscript:@"secret"];
            uint64_t v100 = [v99 length];

            if (v100)
            {
              int v101 = [v70 sharedSecretKeychainItem];

              if (v101)
              {
                v102 = [v70 sharedSecretKeychainItem];
                v103 = (void *)[v102 copyPassword];
                uint64_t v104 = [v5 objectForKeyedSubscript:@"secret"];
                char v105 = [v103 isEqualToString:v104];

                if (v105)
                {
LABEL_103:

                  uint64_t v152 = [v5 objectForKeyedSubscript:@"dispName"];
                  if (v152)
                  {
                    uint64_t v153 = (void *)v152;
                    v154 = [v5 objectForKeyedSubscript:@"dispName"];
                    uint64_t v155 = [v154 length];

                    if (v155)
                    {
                      v156 = [v5 objectForKeyedSubscript:@"dispName"];
                      [v6 setName:v156];
                    }
                  }
                  uint64_t v157 = [v5 objectForKeyedSubscript:@"server"];
                  if (v157)
                  {
                    v158 = (void *)v157;
                    v159 = [v5 objectForKeyedSubscript:@"server"];
                    uint64_t v160 = [v159 length];

                    if (v160)
                    {
                      v161 = [v5 objectForKeyedSubscript:@"server"];
                      v162 = [v6 VPN];
                      int v163 = [v162 protocol];
                      [v163 setServerAddress:v161];
                    }
                  }
                  if (v85)
                  {
                    uint64_t v164 = [v5 objectForKeyedSubscript:@"authorization"];
                    if (v164
                      && (v165 = (void *)v164,
                          [v5 objectForKeyedSubscript:@"authorization"],
                          v166 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v167 = [v166 length],
                          v166,
                          v165,
                          v167))
                    {
                      v168 = [v5 objectForKeyedSubscript:@"authorization"];
                      v169 = [v6 VPN];
                      v170 = [v169 protocol];
                      [v170 setUsername:v168];
                    }
                    else
                    {
                      v168 = [v6 VPN];
                      v169 = [v168 protocol];
                      [v169 setUsername:0];
                    }

                    uint64_t v173 = [v5 objectForKeyedSubscript:@"password"];
                    if (v173)
                    {
                      v174 = (void *)v173;
                      v175 = [v5 objectForKeyedSubscript:@"password"];
                      uint64_t v176 = [v175 length];

                      if (v176)
                      {
                        v177 = [v6 VPN];
                        v178 = [v177 protocol];
                        char v179 = [v178 passwordKeychainItem];

                        if (v179)
                        {
                          v180 = [v6 VPN];
                          uint64_t v181 = [v180 protocol];
                          v182 = [(id)v181 passwordKeychainItem];
                          v183 = (void *)[v182 copyPassword];

                          int v184 = [v5 objectForKeyedSubscript:@"password"];
                          LOBYTE(v181) = [v183 isEqualToString:v184];

                          if (v181) {
                            goto LABEL_123;
                          }
                        }
                        v185 = [v6 VPN];
                        v186 = [v185 protocol];
                        v187 = [v186 passwordKeychainItem];

                        if (v187)
                        {
                          v188 = [v5 objectForKeyedSubscript:@"password"];
                          v189 = [v6 VPN];
                          v190 = [v189 protocol];
                          v191 = [v190 passwordKeychainItem];
                          [v191 setPassword:v188];
                        }
                        else
                        {
                          id v235 = objc_alloc(MEMORY[0x263F145E8]);
                          v188 = [v5 objectForKeyedSubscript:@"password"];
                          v189 = (void *)[v235 initWithPassword:v188 domain:0];
                          v190 = [v6 VPN];
                          v191 = [v190 protocol];
                          [v191 setPasswordKeychainItem:v189];
                        }

LABEL_122:
LABEL_123:
                        v192 = [v5 objectForKeyedSubscript:@"VPNCertificate"];

                        if (v192)
                        {
                          v193 = [v5 objectForKeyedSubscript:@"VPNCertificate"];
                          v194 = [v6 VPN];
                          v195 = [v194 protocol];
                          [v195 setIdentityReferenceInternal:v193];
                        }
                        else
                        {
                          v193 = [v6 VPN];
                          v194 = [v193 protocol];
                          [v194 setIdentityReferenceInternal:0];
                        }

                        v196 = [v6 VPN];
                        v197 = [v196 protocol];
                        long long v18 = [v197 proxySettings];

                        v198 = [v5 objectForKeyedSubscript:@"VPNProxyType"];

                        if (v198)
                        {
                          v199 = [v5 objectForKeyedSubscript:@"VPNProxyType"];
                          v198 = (void *)[v199 unsignedIntegerValue];

                          if (v198 == (void *)1)
                          {
                            if (!v18)
                            {
                              id v208 = objc_alloc_init(MEMORY[0x263F14628]);
                              v209 = [v6 VPN];
                              v210 = [v209 protocol];
                              [v210 setProxySettings:v208];

                              v211 = [v6 VPN];
                              v212 = [v211 protocol];
                              long long v18 = [v212 proxySettings];
                            }
                            [v18 setAutoProxyConfigurationEnabled:0];
                            [v18 setAutoProxyDiscovery:0];
                            [v18 setHTTPEnabled:1];
                            v205 = v18;
                            uint64_t v206 = 1;
                            goto LABEL_138;
                          }
                          if (v198 == (void *)2)
                          {
                            if (!v18)
                            {
                              id v200 = objc_alloc_init(MEMORY[0x263F14628]);
                              v201 = [v6 VPN];
                              v202 = [v201 protocol];
                              [v202 setProxySettings:v200];

                              v203 = [v6 VPN];
                              v204 = [v203 protocol];
                              long long v18 = [v204 proxySettings];
                            }
                            [v18 setAutoProxyConfigurationEnabled:1];
                            [v18 setAutoProxyDiscovery:1];
                            [v18 setHTTPEnabled:0];
                            v205 = v18;
                            uint64_t v206 = 0;
LABEL_138:
                            [v205 setHTTPSEnabled:v206];
                            BOOL v207 = v18 != 0;
LABEL_139:
                            v213 = [v5 objectForKeyedSubscript:@"VPNProxyPacFile"];
                            uint64_t v214 = [v213 length];

                            if (v214)
                            {
                              if (v207
                                && [v18 autoProxyConfigurationEnabled]&& ([v18 HTTPEnabled] & 1) == 0)
                              {
                                v215 = NSURL;
                                v216 = [v5 objectForKeyedSubscript:@"VPNProxyPacFile"];
                                v217 = [v215 URLWithString:v216];
                                [v18 setProxyAutoConfigURL:v217];

                                [v18 setAutoProxyDiscovery:0];
                              }
                            }
                            else
                            {
                              [v18 setProxyAutoConfigURL:0];
                            }
                            uint64_t v218 = [v5 objectForKeyedSubscript:@"VPNProxyServer"];
                            if (v218
                              && (v219 = (void *)v218,
                                  [v5 objectForKeyedSubscript:@"VPNProxyPort"],
                                  v220 = objc_claimAutoreleasedReturnValue(),
                                  v220,
                                  v219,
                                  v220))
                            {
                              if (v207
                                && ([v18 autoProxyConfigurationEnabled] & 1) == 0
                                && [v18 HTTPEnabled])
                              {
                                id v221 = objc_alloc(MEMORY[0x263F14620]);
                                v222 = [v5 objectForKeyedSubscript:@"VPNProxyServer"];
                                v223 = [v5 objectForKeyedSubscript:@"VPNProxyPort"];
                                v224 = objc_msgSend(v221, "initWithType:address:port:", 1, v222, (int)objc_msgSend(v223, "intValue"));

                                v225 = [v5 objectForKeyedSubscript:@"VPNProxyAuthenticate"];
                                LODWORD(v223) = [v225 BOOLValue];

                                if (v223)
                                {
                                  [v224 setAuthenticationRequired:1];
                                  v226 = [v5 objectForKeyedSubscript:@"VPNProxyUsername"];
                                  [v224 setUsername:v226];

                                  v227 = [v5 objectForKeyedSubscript:@"VPNProxyPassword"];
                                  [v224 setPassword:v227];
                                }
                                [v18 setHTTPServer:v224];
                                id v228 = objc_alloc(MEMORY[0x263F14620]);
                                v229 = [v5 objectForKeyedSubscript:@"VPNProxyServer"];
                                v230 = [v5 objectForKeyedSubscript:@"VPNProxyPort"];
                                v231 = objc_msgSend(v228, "initWithType:address:port:", 2, v229, (int)objc_msgSend(v230, "intValue"));

                                v232 = [v5 objectForKeyedSubscript:@"VPNProxyAuthenticate"];
                                LODWORD(v230) = [v232 BOOLValue];

                                if (v230)
                                {
                                  [v231 setAuthenticationRequired:1];
                                  v233 = [v5 objectForKeyedSubscript:@"VPNProxyUsername"];
                                  [v231 setUsername:v233];

                                  char v234 = [v5 objectForKeyedSubscript:@"VPNProxyPassword"];
                                  [v231 setPassword:v234];
                                }
                                [v18 setHTTPSServer:v231];
                              }
                            }
                            else
                            {
                              [v18 setHTTPServer:0];
                              [v18 setHTTPSServer:0];
                            }
                            goto LABEL_12;
                          }
                        }
                        BOOL v207 = v18 != 0;
                        if (!v198 && v18)
                        {
                          [v18 setAutoProxyConfigurationEnabled:0];
                          [v18 setAutoProxyDiscovery:0];
                          [v18 setHTTPEnabled:0];
                          [v18 setHTTPSEnabled:0];
                          BOOL v207 = 1;
                        }
                        goto LABEL_139;
                      }
                    }
                  }
                  else
                  {
                    v171 = [v6 VPN];
                    v172 = [v171 protocol];
                    [v172 setUsername:0];
                  }
                  v188 = [v6 VPN];
                  v189 = [v188 protocol];
                  v190 = [v189 passwordKeychainItem];
                  [v190 setIdentifier:0];
                  goto LABEL_122;
                }
              }
              v106 = [v70 sharedSecretKeychainItem];

              if (v106)
              {
                v95 = [v5 objectForKeyedSubscript:@"secret"];
                v107 = [v70 sharedSecretKeychainItem];
                [v107 setPassword:v95];
              }
              else
              {
                id v145 = objc_alloc(MEMORY[0x263F145E8]);
                v95 = [v5 objectForKeyedSubscript:@"secret"];
                v107 = (void *)[v145 initWithPassword:v95 domain:0];
                [v70 setSharedSecretKeychainItem:v107];
              }

              goto LABEL_102;
            }
          }
        }
        v95 = [v70 sharedSecretKeychainItem];
        [v95 setIdentifier:0];
        goto LABEL_102;
      }
      if (v10 != 2)
      {
        if (!v10)
        {
          long long v26 = [v6 VPN];
          char v27 = [v26 protocol];

          if (v27)
          {
            long long v28 = [v6 VPN];
            long long v29 = [v28 protocol];
            objc_opt_class();
            char v30 = objc_opt_isKindOfClass();

            if ((v30 & 1) == 0) {
              goto LABEL_62;
            }
          }
          else
          {
            id v43 = objc_alloc_init(MEMORY[0x263F14658]);
            long long v44 = [v6 VPN];
            [v44 setProtocol:v43];
          }
          uint64_t v45 = [v5 objectForKeyedSubscript:@"secret"];
          if (v45
            && (v46 = (void *)v45,
                [v5 objectForKeyedSubscript:@"secret"],
                uint64_t v47 = objc_claimAutoreleasedReturnValue(),
                uint64_t v48 = [v47 length],
                v47,
                v46,
                v48))
          {
            v49 = [v6 VPN];
            v50 = [v49 protocol];
            [v50 setMachineAuthenticationMethod:1];

            v51 = [v6 VPN];
            v52 = [v51 protocol];
            v53 = [v52 sharedSecretKeychainItem];

            if (v53)
            {
              v54 = [v6 VPN];
              v55 = [v54 protocol];
              v56 = [v55 sharedSecretKeychainItem];

              char v57 = (void *)[v56 copyPassword];
              v58 = [v5 objectForKeyedSubscript:@"secret"];
              char v59 = [v57 isEqualToString:v58];

              if (v59) {
                goto LABEL_84;
              }
            }
            v60 = [v6 VPN];
            char v61 = [v60 protocol];
            v62 = [v61 sharedSecretKeychainItem];

            if (v62)
            {
              v63 = [v5 objectForKeyedSubscript:@"secret"];
              v64 = [v6 VPN];
              v65 = [v64 protocol];
              v66 = [v65 sharedSecretKeychainItem];
              [v66 setPassword:v63];
            }
            else
            {
              id v128 = objc_alloc(MEMORY[0x263F145E8]);
              v63 = [v5 objectForKeyedSubscript:@"secret"];
              v64 = (void *)[v128 initWithPassword:v63 domain:0];
              v65 = [v6 VPN];
              v66 = [v65 protocol];
              [v66 setSharedSecretKeychainItem:v64];
            }
          }
          else
          {
            v63 = [v6 VPN];
            v64 = [v63 protocol];
            v65 = [v64 sharedSecretKeychainItem];
            [v65 setIdentifier:0];
          }

LABEL_84:
          v129 = [v5 objectForKeyedSubscript:@"VPNSendAllTraffic"];

          if (v129)
          {
            v130 = [v6 VPN];
            uint64_t v131 = [v130 protocol];
            v132 = [v131 IPv4Settings];

            if (!v132)
            {
              id v133 = objc_alloc_init(MEMORY[0x263F145E0]);
              v134 = [v6 VPN];
              v135 = [v134 protocol];
              [v135 setIPv4Settings:v133];
            }
            v136 = [v5 objectForKeyedSubscript:@"VPNSendAllTraffic"];
            uint64_t v137 = [v136 BOOLValue];
            v138 = [v6 VPN];
            v139 = [v138 protocol];
            v140 = [v139 IPv4Settings];
            [v140 setOverridePrimary:v137];
          }
          uint64_t v141 = [v5 objectForKeyedSubscript:@"securID"];
          if (v141)
          {
            uint64_t v142 = (void *)v141;
            uint64_t v143 = [v5 objectForKeyedSubscript:@"securID"];
            int v144 = [v143 BOOLValue];

            if (v144)
            {
              v70 = [v6 VPN];
              v95 = [v70 protocol];
              [v95 setAuthenticationMethod:2];
LABEL_101:
              BOOL v85 = 1;
              goto LABEL_102;
            }
          }
          v70 = [v6 VPN];
          v95 = [v70 protocol];
          BOOL v85 = 1;
          [v95 setAuthenticationMethod:1];
LABEL_102:

          goto LABEL_103;
        }
        long long v31 = VPNSettingsCopyLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[VPNConnectionStore setOptions:toConfiguration:]();
        }
        goto LABEL_61;
      }
      v37 = [v6 VPN];
      uint64_t v38 = [v37 protocol];

      if (!v38)
      {
        id v86 = objc_alloc_init(MEMORY[0x263F14650]);
        v87 = [v6 VPN];
        [v87 setProtocol:v86];

        goto LABEL_58;
      }
      long long v31 = [v6 VPN];
      uint64_t v39 = [v31 protocol];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = [v6 VPN];
        v41 = [v40 protocol];
        objc_opt_class();
        char v42 = objc_opt_isKindOfClass();

        if (v42) {
          goto LABEL_62;
        }
LABEL_58:
        v88 = [v5 objectForKeyedSubscript:@"VPNCertificate"];

        uint64_t v89 = [v6 VPN];
        v90 = [v89 protocol];
        v91 = v90;
        if (v88)
        {
          BOOL v85 = 1;
          [v90 setAuthenticationMethod:1];

          v92 = [v6 VPN];
          v93 = [v92 protocol];
          v94 = [v93 sharedSecretKeychainItem];
          [v94 setIdentifier:0];

          v70 = [v6 VPN];
          v95 = [v70 protocol];
          [v95 setLocalIdentifier:0];
          goto LABEL_102;
        }
        [v90 setAuthenticationMethod:2];

        uint64_t v108 = [v5 objectForKeyedSubscript:@"secret"];
        if (v108
          && (v109 = (void *)v108,
              [v5 objectForKeyedSubscript:@"secret"],
              v110 = objc_claimAutoreleasedReturnValue(),
              uint64_t v111 = [v110 length],
              v110,
              v109,
              v111))
        {
          v112 = [v6 VPN];
          v113 = [v112 protocol];
          int v114 = [v113 sharedSecretKeychainItem];

          if (v114)
          {
            v115 = [v6 VPN];
            v116 = [v115 protocol];
            v117 = [v116 sharedSecretKeychainItem];

            v118 = (void *)[v117 copyPassword];
            uint64_t v119 = [v5 objectForKeyedSubscript:@"secret"];
            char v120 = [v118 isEqualToString:v119];

            if (v120)
            {
LABEL_97:
              uint64_t v147 = [v5 objectForKeyedSubscript:@"group"];
              if (v147
                && (v148 = (void *)v147,
                    [v5 objectForKeyedSubscript:@"group"],
                    v149 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v150 = [v149 length],
                    v149,
                    v148,
                    v150))
              {
                v70 = [v5 objectForKeyedSubscript:@"group"];
                v95 = [v6 VPN];
                v151 = [v95 protocol];
                [v151 setLocalIdentifier:v70];
              }
              else
              {
                v70 = [v6 VPN];
                v95 = [v70 protocol];
                [v95 setLocalIdentifier:0];
              }
              goto LABEL_101;
            }
          }
          uint64_t v121 = [v6 VPN];
          v122 = [v121 protocol];
          v123 = [v122 sharedSecretKeychainItem];

          if (v123)
          {
            uint64_t v124 = [v5 objectForKeyedSubscript:@"secret"];
            v125 = [v6 VPN];
            v126 = [v125 protocol];
            v127 = [v126 sharedSecretKeychainItem];
            [v127 setPassword:v124];
          }
          else
          {
            id v146 = objc_alloc(MEMORY[0x263F145E8]);
            uint64_t v124 = [v5 objectForKeyedSubscript:@"secret"];
            v125 = (void *)[v146 initWithPassword:v124 domain:0];
            v126 = [v6 VPN];
            v127 = [v126 protocol];
            [v127 setSharedSecretKeychainItem:v125];
          }
        }
        else
        {
          uint64_t v124 = [v6 VPN];
          v125 = [v124 protocol];
          v126 = [v125 sharedSecretKeychainItem];
          [v126 setIdentifier:0];
        }

        goto LABEL_97;
      }

LABEL_61:
      goto LABEL_62;
    }
    long long v19 = [v5 objectForKeyedSubscript:@"VPNOnDemandEnabled"];

    if (v19)
    {
      uint64_t v22 = [v5 objectForKeyedSubscript:@"VPNOnDemandEnabled"];
      uint64_t v15 = [v22 BOOLValue];

      uint64_t v23 = [v6 VPN];
      uint64_t v24 = [v23 onDemandRules];

      if (v24) {
        goto LABEL_15;
      }
      long long v31 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[VPNConnectionStore setOptions:toConfiguration:]();
      }
      goto LABEL_61;
    }
  }
LABEL_63:

  return (char)v19;
}

- (BOOL)createVPNWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"dispName"];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F145B8]);
    id v7 = [v4 objectForKeyedSubscript:@"dispName"];
    uint64_t v8 = (void *)[v6 initWithName:v7 grade:1];

    BOOL v9 = [(VPNConnectionStore *)self setOptions:v4 toConfiguration:v8];
    if (v9)
    {
      uint64_t v10 = [(VPNConnectionStore *)self configurationManager];
      char v11 = [(VPNConnectionStore *)self storeQueue];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __43__VPNConnectionStore_createVPNWithOptions___block_invoke;
      v13[3] = &unk_264C068C8;
      id v14 = v8;
      uint64_t v15 = self;
      [v10 saveConfiguration:v14 withCompletionQueue:v11 handler:v13];
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

void __43__VPNConnectionStore_createVPNWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    id v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) configurationManager];
    id v6 = [*(id *)(a1 + 40) storeQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __43__VPNConnectionStore_createVPNWithOptions___block_invoke_196;
    v7[3] = &unk_264C068A0;
    v7[4] = *(void *)(a1 + 40);
    [v5 loadConfigurationsWithCompletionQueue:v6 handler:v7];
  }
}

uint64_t __43__VPNConnectionStore_createVPNWithOptions___block_invoke_196(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setConfigurations:a2];
  [*(id *)(a1 + 32) _configurationChanged];
  id v3 = *(void **)(a1 + 32);

  return [v3 setVpnServiceCountDirty:1];
}

- (BOOL)updateVPNWithServiceID:(id)a3 withOptions:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [(VPNConnectionStore *)self configurations];
  id v9 = (id)[v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
      if ([v12 grade] != 3)
      {
        long long v13 = [v12 identifier];
        char v14 = [v13 isEqual:v6];

        if (v14) {
          break;
        }
      }
      if (v9 == (id)++v11)
      {
        id v9 = (id)[v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v9 = v12;

    if (v9 && [(VPNConnectionStore *)self setOptions:v7 toConfiguration:v9])
    {
      long long v16 = [(VPNConnectionStore *)self configurationManager];
      long long v17 = [(VPNConnectionStore *)self storeQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke;
      v19[3] = &unk_264C068C8;
      id v9 = v9;
      id v20 = v9;
      long long v21 = self;
      [v16 saveConfiguration:v9 withCompletionQueue:v17 handler:v19];

      BOOL v15 = 1;
      uint64_t v8 = v20;
      goto LABEL_14;
    }
    BOOL v15 = 0;
  }
  else
  {
LABEL_10:
    BOOL v15 = 0;
LABEL_14:
  }
  return v15;
}

void __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    id v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) configurationManager];
    id v6 = [*(id *)(a1 + 40) storeQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke_198;
    v7[3] = &unk_264C068A0;
    v7[4] = *(void *)(a1 + 40);
    [v5 loadConfigurationsWithCompletionQueue:v6 handler:v7];
  }
}

uint64_t __57__VPNConnectionStore_updateVPNWithServiceID_withOptions___block_invoke_198(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setConfigurations:a2];
  [*(id *)(a1 + 32) _configurationChanged];
  id v3 = *(void **)(a1 + 32);

  return [v3 setVpnServiceCountDirty:1];
}

- (BOOL)deleteVPNWithServiceID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(VPNConnectionStore *)self configurations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      if ([v10 grade] != 3)
      {
        uint64_t v11 = [v10 identifier];
        char v12 = [v11 isEqual:v4];

        if (v12) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v14 = v10;

    if (v14)
    {
      BOOL v15 = [(VPNConnectionStore *)self configurationManager];
      long long v16 = [(VPNConnectionStore *)self storeQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke;
      v18[3] = &unk_264C068C8;
      id v19 = v14;
      id v20 = self;
      id v5 = v14;
      [v15 removeConfiguration:v5 withCompletionQueue:v16 handler:v18];

      BOOL v13 = 1;
      goto LABEL_13;
    }
    BOOL v13 = 0;
  }
  else
  {
LABEL_10:
    BOOL v13 = 0;
LABEL_13:
  }
  return v13;
}

void __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    id v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) configurationManager];
    uint64_t v6 = [*(id *)(a1 + 40) storeQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_199;
    v7[3] = &unk_264C068A0;
    v7[4] = *(void *)(a1 + 40);
    [v5 loadConfigurationsWithCompletionQueue:v6 handler:v7];
  }
}

uint64_t __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_199(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setConfigurations:a2];
  [*(id *)(a1 + 32) _configurationChanged];
  id v3 = *(void **)(a1 + 32);

  return [v3 setVpnServiceCountDirty:1];
}

- (BOOL)configurationIsManaged:(id)a3
{
  id v3 = a3;
  id v4 = [v3 payloadInfo];

  if (v4)
  {
    id v5 = [v3 payloadInfo];
    uint64_t v6 = [v5 profileSource];

    uint64_t v7 = [v3 payloadInfo];
    uint64_t v8 = v7;
    if (v6)
    {
      char v9 = [v7 profileSource] == 2;
      uint64_t v10 = v8;
    }
    else
    {
      uint64_t v10 = [v7 profileIdentifier];

      if (v10)
      {
        uint64_t v11 = [MEMORY[0x263F53C50] sharedConnection];
        char v12 = [v11 installedProfileWithIdentifier:v10];

        if (v12) {
          char v9 = [v12 isManagedByMDM];
        }
        else {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)setActiveVPNID:(id)a3 withGrade:(unint64_t)a4
{
  id v7 = a3;
  if (a4 != 2)
  {
    uint64_t v8 = &self->super.isa + a4;
    Class v10 = v8[12];
    char v9 = (id *)(v8 + 12);
    if (([(objc_class *)v10 isEqual:v7] & 1) == 0)
    {
      if ([(VPNConnectionStore *)self saveActiveVPNIDToPreferences:v7 withGrade:a4])
      {
        uint64_t v11 = (id *)(&self->super.isa + a4);
        [v11[3] disconnect];
        objc_storeStrong(v9, a3);
        uint64_t v12 = [(VPNConnectionStore *)self connectionWithServiceID:*v9 withGrade:a4];
        id v13 = v11[3];
        v11[3] = (id)v12;

        [(VPNConnectionStore *)self _connectionsChanged];
      }
      else
      {
        id v14 = VPNSettingsCopyLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[VPNConnectionStore setActiveVPNID:withGrade:]();
        }
      }
    }
  }
}

- (BOOL)isActiveVPNID:(id)a3 withGrade:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(VPNConnectionStore *)self activeVPNIDWithGrade:a4];
  LOBYTE(self) = [v7 isEqual:v6];

  return (char)self;
}

- (BOOL)alwaysOnToggleEnabledForServiceID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(VPNConnectionStore *)self configurations];
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v5);
      }
      char v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      if ([v9 grade] != 3)
      {
        Class v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11) {
          break;
        }
      }
      if (v6 == (id)++v8)
      {
        id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v6 = v9;

    if (v6)
    {
      id v13 = [v6 alwaysOnVPN];

      if (v13)
      {
        id v5 = [v6 alwaysOnVPN];
        char v12 = [v5 isToggleEnabled];
        goto LABEL_14;
      }
    }
    char v12 = 0;
  }
  else
  {
LABEL_10:
    char v12 = 0;
LABEL_14:
  }
  return v12;
}

- (id)organizationForServiceID:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [(VPNConnectionStore *)self configurations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(v5);
      }
      Class v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
      if ([v10 grade] != 3)
      {
        char v11 = [v10 identifier];
        char v12 = [v11 isEqual:v4];

        if (v12) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v14 = [v13 payloadInfo];
    if (v14)
    {
      long long v15 = (void *)v14;
      long long v16 = [v13 payloadInfo];
      long long v17 = [v16 payloadOrganization];

      if (v17)
      {
        long long v18 = [v13 payloadInfo];
        id v19 = [v18 payloadOrganization];

        goto LABEL_17;
      }
    }
    long long v22 = [v13 applicationName];

    if (v22)
    {
      uint64_t v20 = [v13 applicationName];
    }
    else
    {
      long long v23 = [v13 appVPN];

      if (v23)
      {
        uint64_t v24 = 2;
      }
      else
      {
        long long v25 = [v13 dnsProxy];

        if (v25)
        {
          uint64_t v24 = 5;
        }
        else
        {
          uint64_t v26 = [v13 contentFilter];

          if (v26) {
            uint64_t v24 = 6;
          }
          else {
            uint64_t v24 = 0;
          }
        }
      }
      uint64_t v20 = +[VPNConnectionStore applicationNameForConfiguration:v13 withGrade:v24];
    }
  }
  else
  {
LABEL_10:

LABEL_15:
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v13 localizedStringForKey:@"CUSTOM" value:&stru_26E7C6230 table:@"MobileVPN"];
  }
  id v19 = (void *)v20;
LABEL_17:

  return v19;
}

- (id)organizationForService:(__SCNetworkService *)a3
{
  id v3 = SCNetworkServiceCopyProtocol(a3, @"com.apple.payload");
  if (v3)
  {
    id v4 = v3;
    id v5 = SCNetworkProtocolGetConfiguration(v3);
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:@"PayloadOrganization"];
    }
    else
    {
      uint64_t v7 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([v7 length]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)getProfileIDForServiceID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(VPNConnectionStore *)self configurations];
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 grade] != 3)
        {
          Class v10 = [v9 identifier];
          char v11 = [v10 isEqual:v4];

          if (v11)
          {
            char v12 = [v9 payloadInfo];
            uint64_t v6 = [v12 profileIdentifier];

            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)vpnServicesForCurrentSetWithGrade:(unint64_t)a3 excludePerApp:(BOOL)a4
{
  BOOL v78 = a4;
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = [(VPNConnectionStore *)self configurations];
  if (!v8) {
    goto LABEL_77;
  }
  id v68 = v8;
  uint64_t v9 = (void *)[v8 mutableCopy];
  if ((unint64_t)[v9 count] <= 0x20) {
    Class v10 = compareConfigurationNames;
  }
  else {
    Class v10 = compareConfigurationNamesNonLocalized;
  }
  [v9 sortUsingFunction:v10 context:0];
  uint64_t v11 = 1;
  if (a3) {
    uint64_t v11 = 2;
  }
  uint64_t v77 = v11;
  v70 = v9;
  unint64_t v71 = a3;
  id v80 = v6;
  v69 = self;
  if (a3 == 4)
  {
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v89 objects:v95 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      char v15 = 0;
      uint64_t v16 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v90 != v16) {
            objc_enumerationMutation(v12);
          }
          long long v18 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          if ([v18 grade] != 3)
          {
            uint64_t v19 = [v18 dnsSettings];
            if (v19)
            {
              uint64_t v20 = (void *)v19;
              uint64_t v21 = [v18 grade];

              if (v21 == 1)
              {
                long long v22 = [v18 identifier];
                [v6 addObject:v22];

                char v15 = 1;
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v89 objects:v95 count:16];
      }
      while (v14);

      long long v23 = v70;
      if (v15) {
        goto LABEL_74;
      }
    }
    else
    {
    }
    id v76 = v7;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v57 = v12;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v85 objects:v94 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v86;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v86 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          if ([v62 grade] != 3)
          {
            uint64_t v63 = [v62 dnsSettings];
            if (v63)
            {
              v64 = (void *)v63;
              uint64_t v65 = [v62 grade];

              if (v65 == 2)
              {
                v66 = [v62 identifier];
                [v6 addObject:v66];
              }
            }
          }
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v85 objects:v94 count:16];
      }
      while (v59);
    }
  }
  else
  {
    id v76 = v7;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v24 = v9;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v81 objects:v93 count:16];
    BOOL v26 = v78;
    if (v25)
    {
      uint64_t v27 = v25;
      uint64_t v28 = *(void *)v82;
      id v79 = v24;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v82 != v28) {
            objc_enumerationMutation(v24);
          }
          long long v30 = *(void **)(*((void *)&v81 + 1) + 8 * v29);
          if ([v30 grade] != 3)
          {
            if (!v26
              || ([v30 externalIdentifier],
                  long long v31 = objc_claimAutoreleasedReturnValue(),
                  v31,
                  !v31))
            {
              switch(v71)
              {
                case 2uLL:
                  uint64_t v32 = [v30 appVPN];

                  if (v32)
                  {
                    long long v33 = [v30 appVPN];
                    int v34 = [v33 isEnabled];

                    long long v35 = [v30 identifier];
                    if (v34) {
                      goto LABEL_41;
                    }
                    v36 = v7;
                    goto LABEL_42;
                  }
                  break;
                case 3uLL:
                  v37 = [v30 alwaysOnVPN];
                  goto LABEL_39;
                case 5uLL:
                  v37 = [v30 dnsProxy];
                  goto LABEL_39;
                case 6uLL:
                  v37 = [v30 contentFilter];
LABEL_39:
                  v41 = v37;

                  if (v41) {
                    goto LABEL_40;
                  }
                  break;
                case 7uLL:
                  uint64_t v42 = [v30 relay];
                  if (!v42) {
                    break;
                  }
                  long long v35 = (void *)v42;
                  id v43 = [v30 relay];
                  long long v44 = [v43 matchDomains];
                  if ([v44 count])
                  {

                    id v24 = v79;
                    goto LABEL_43;
                  }
                  v72 = [v30 relay];
                  v49 = [v72 perApp];
                  v50 = [v49 appRules];
                  uint64_t v74 = [v50 count];

                  BOOL v26 = v78;
                  id v24 = v79;
                  if (v74) {
                    break;
                  }
LABEL_40:
                  long long v35 = [v30 identifier];
LABEL_41:
                  v36 = v80;
LABEL_42:
                  [v36 addObject:v35];
                  goto LABEL_43;
                case 8uLL:
                  uint64_t v45 = [v30 relay];
                  if (!v45) {
                    break;
                  }
                  v46 = (void *)v45;
                  uint64_t v47 = [v30 relay];
                  uint64_t v48 = [v47 matchDomains];
                  if ([v48 count])
                  {

                    id v24 = v79;
                  }
                  else
                  {
                    v73 = [v30 relay];
                    v51 = [v73 perApp];
                    v52 = [v51 appRules];
                    uint64_t v75 = [v52 count];

                    BOOL v26 = v78;
                    id v24 = v79;
                    if (!v75) {
                      break;
                    }
                  }
                  v53 = [v30 relay];
                  int v54 = [v53 isEnabled];

                  long long v35 = [v30 identifier];
                  if (v54) {
                    v55 = v80;
                  }
                  else {
                    v55 = v7;
                  }
                  [v55 addObject:v35];
                  BOOL v26 = v78;
LABEL_43:

                  break;
                default:
                  uint64_t v38 = [v30 VPN];
                  if (!v38) {
                    break;
                  }
                  uint64_t v39 = (void *)v38;
                  uint64_t v40 = [v30 grade];

                  if (v40 != v77) {
                    break;
                  }
                  goto LABEL_40;
              }
            }
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v56 = [v24 countByEnumeratingWithState:&v81 objects:v93 count:16];
        uint64_t v27 = v56;
      }
      while (v56);
    }
  }
  long long v23 = v70;

  id v6 = v80;
  id v7 = v76;
LABEL_74:
  if ([v7 count]) {
    [v6 addObjectsFromArray:v7];
  }
  objc_storeStrong((id *)&v69->_gradeVPNServiceIDs[v71], v6);

  id v8 = v68;
LABEL_77:

  return v6;
}

- (id)vpnServicesForCurrentSetWithGrade:(unint64_t)a3
{
  return [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:a3 excludePerApp:0];
}

- (id)vpnServiceCountWithGrade:(unint64_t)a3
{
  id v3 = NSNumber;
  id v4 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:a3];
  id v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));

  return v5;
}

- (id)appNameForServiceID:(id)a3 withGrade:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(VPNConnectionStore *)self configurations];
  id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 grade] != 3)
        {
          id v12 = [v11 identifier];
          int v13 = [v12 isEqual:v6];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  uint64_t v14 = +[VPNConnectionStore applicationNameForConfiguration:v8 withGrade:a4];

  return v14;
}

- (BOOL)enable:(BOOL)a3 serviceID:(id)a4 withGrade:(unint64_t)a5
{
  BOOL v6 = a3;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v9 = [(VPNConnectionStore *)self configurations];
  id v10 = (id)[v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v32 = self;
    BOOL v11 = v6;
    uint64_t v12 = *(void *)v37;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v37 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
      if ([v14 grade] != 3)
      {
        char v15 = [v14 identifier];
        char v16 = [v15 isEqual:v8];

        if (v16) {
          break;
        }
      }
      if (v10 == (id)++v13)
      {
        id v10 = (id)[v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v10 = v14;

    if (!v10)
    {
LABEL_33:
      BOOL v17 = 0;
      goto LABEL_34;
    }
    BOOL v18 = v11;
    switch(a5)
    {
      case 0uLL:
        BOOL v19 = [v10 grade] == 1;
        goto LABEL_18;
      case 1uLL:
        BOOL v19 = [v10 grade] == 2;
LABEL_18:
        uint64_t v20 = v32;
        if (!v19) {
          goto LABEL_33;
        }
        long long v23 = [v10 VPN];

        if (!v23) {
          goto LABEL_33;
        }
        long long v22 = [v10 VPN];
        goto LABEL_30;
      case 2uLL:
        id v24 = [v10 appVPN];

        uint64_t v20 = v32;
        if (!v24) {
          goto LABEL_33;
        }
        long long v22 = [v10 appVPN];
        goto LABEL_30;
      case 3uLL:
        uint64_t v25 = [v10 alwaysOnVPN];

        uint64_t v20 = v32;
        if (!v25) {
          goto LABEL_33;
        }
        long long v22 = [v10 alwaysOnVPN];
        goto LABEL_30;
      case 4uLL:
        BOOL v26 = [v10 dnsSettings];

        uint64_t v20 = v32;
        if (!v26) {
          goto LABEL_33;
        }
        long long v22 = [v10 dnsSettings];
        goto LABEL_30;
      case 5uLL:
        uint64_t v27 = [v10 dnsProxy];

        uint64_t v20 = v32;
        if (!v27) {
          goto LABEL_33;
        }
        long long v22 = [v10 dnsProxy];
        goto LABEL_30;
      default:
        BOOL v18 = v11;
        uint64_t v20 = v32;
        if (a5 - 7 > 1) {
          goto LABEL_31;
        }
        uint64_t v21 = [v10 relay];

        if (!v21) {
          goto LABEL_33;
        }
        long long v22 = [v10 relay];
LABEL_30:
        uint64_t v28 = v22;
        [v22 setEnabled:v18];

LABEL_31:
        uint64_t v29 = [(VPNConnectionStore *)v20 configurationManager];
        long long v30 = [(VPNConnectionStore *)v20 storeQueue];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke;
        v33[3] = &unk_264C068C8;
        id v10 = v10;
        id v34 = v10;
        long long v35 = v20;
        [v29 saveConfiguration:v10 withCompletionQueue:v30 handler:v33];

        BOOL v17 = 1;
        uint64_t v9 = v34;
        break;
    }
  }
  else
  {
LABEL_10:
    BOOL v17 = 0;
  }

LABEL_34:
  return v17;
}

void __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 code] != 9)
  {
    id v5 = VPNSettingsCopyLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) configurationManager];
    BOOL v6 = [*(id *)(a1 + 40) storeQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke_236;
    v7[3] = &unk_264C068A0;
    v7[4] = *(void *)(a1 + 40);
    [v5 loadConfigurationsWithCompletionQueue:v6 handler:v7];
  }
}

uint64_t __49__VPNConnectionStore_enable_serviceID_withGrade___block_invoke_236(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setConfigurations:a2];
  [*(id *)(a1 + 32) _configurationChanged];
  id v3 = *(void **)(a1 + 32);

  return [v3 setVpnServiceCountDirty:1];
}

- (BOOL)isTypeEnabledWithServiceID:(id)a3 withGrade:(unint64_t)a4 outProviderAvailable:(BOOL *)a5
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a5) {
    *a5 = 1;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v9 = [(VPNConnectionStore *)self configurations];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v60;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v60 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v59 + 1) + 8 * v13);
      if ([v14 grade] != 3)
      {
        char v15 = [v14 identifier];
        char v16 = [v15 isEqual:v8];

        if (v16) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    id v17 = v14;

    if (!v17) {
      goto LABEL_49;
    }
    if (a4 <= 1)
    {
      BOOL v18 = [v17 VPN];

      if (!v18) {
        goto LABEL_49;
      }
      BOOL v19 = [v17 VPN];
      uint64_t v20 = [v19 protocol];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v22 = [v17 VPN];
        goto LABEL_18;
      }
      goto LABEL_48;
    }
    switch(a4)
    {
      case 4uLL:
        v46 = [v17 dnsSettings];
        break;
      case 3uLL:
        v46 = [v17 alwaysOnVPN];
        break;
      case 2uLL:
        uint64_t v42 = [v17 appVPN];

        if (!v42) {
          goto LABEL_49;
        }
        id v43 = [v17 appVPN];
        long long v44 = [v43 protocol];
        objc_opt_class();
        char v45 = objc_opt_isKindOfClass();

        if (v45)
        {
          long long v22 = [v17 appVPN];
LABEL_18:
          long long v23 = v22;
          id v24 = [v22 protocol];
          uint64_t v25 = [v24 pluginType];

          if (!v25) {
            goto LABEL_50;
          }
          BOOL v26 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v25];
          uint64_t v27 = v26;
          if (v26)
          {
            uint64_t v28 = [v26 appState];
            if (v28)
            {
              uint64_t v29 = (void *)v28;
              long long v30 = [v27 appState];
              if ([v30 isInstalled])
              {
                long long v31 = [v27 appState];
                int v32 = [v31 isValid];

                if (v32)
                {
                  if (!a5)
                  {
                    char v48 = 1;
                    goto LABEL_57;
                  }
                  [v27 plugInKitPlugins];
                  long long v55 = 0u;
                  long long v56 = 0u;
                  long long v57 = 0u;
                  long long v58 = 0u;
                  long long v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  uint64_t v54 = [(__CFString *)v33 countByEnumeratingWithState:&v55 objects:v63 count:16];
                  if (v54)
                  {
                    v52 = v27;
                    uint64_t v53 = *(void *)v56;
                    while (2)
                    {
                      for (uint64_t i = 0; i != v54; ++i)
                      {
                        if (*(void *)v56 != v53) {
                          objc_enumerationMutation(v33);
                        }
                        long long v35 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                        if (a4 > 1)
                        {
                          long long v38 = [*(id *)(*((void *)&v55 + 1) + 8 * i) protocol];
                          if ([v38 isEqualToString:@"com.apple.networkextension.packet-tunnel"])
                          {

LABEL_61:
                            BOOL v41 = 1;
                            goto LABEL_62;
                          }
                          long long v39 = [v35 protocol];
                          char v40 = [v39 isEqualToString:@"com.apple.networkextension.app-proxy"];

                          if (v40) {
                            goto LABEL_61;
                          }
                        }
                        else
                        {
                          long long v36 = [*(id *)(*((void *)&v55 + 1) + 8 * i) protocol];
                          char v37 = [v36 isEqualToString:@"com.apple.networkextension.packet-tunnel"];

                          if (v37) {
                            goto LABEL_61;
                          }
                        }
                      }
                      uint64_t v54 = [(__CFString *)v33 countByEnumeratingWithState:&v55 objects:v63 count:16];
                      if (v54) {
                        continue;
                      }
                      break;
                    }
                    BOOL v41 = 0;
LABEL_62:
                    uint64_t v27 = v52;
                  }
                  else
                  {
                    BOOL v41 = 0;
                  }

                  *a5 = v41;
                  char v48 = 1;
LABEL_56:

LABEL_57:
                  goto LABEL_51;
                }
              }
              else
              {
              }
            }
          }
          long long v33 = [NSString stringWithFormat:@"VPN-%@.plist", v25];
          v50 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"com.apple.mobilevpn", v33);
          if (v50)
          {
            v51 = v50;
            char v48 = objc_msgSend((id)SCPreferencesGetValue(v50, @"Enabled"), "BOOLValue");
            CFRelease(v51);
          }
          else
          {
            char v48 = 0;
            *a5 = 0;
          }
          goto LABEL_56;
        }
LABEL_48:
        uint64_t v25 = 0;
        char v48 = 1;
        goto LABEL_51;
      default:
        if (a4 - 7 > 1) {
          goto LABEL_49;
        }
        v46 = [v17 relay];
        break;
    }
    uint64_t v47 = v46;

    if (!v47) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_12:

  id v17 = 0;
LABEL_49:
  uint64_t v25 = 0;
LABEL_50:
  char v48 = 0;
LABEL_51:

  return v48;
}

- (BOOL)isEnabledWithServiceID:(id)a3 withGrade:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [(VPNConnectionStore *)self configurations];
  id v8 = (id)[v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
      if ([v11 grade] != 3)
      {
        uint64_t v12 = [v11 identifier];
        char v13 = [v12 isEqual:v6];

        if (v13) {
          break;
        }
      }
      if (v8 == (id)++v10)
      {
        id v8 = (id)[v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v8 = v11;

    if (!v8)
    {
LABEL_33:
      char v14 = 0;
      goto LABEL_34;
    }
    switch(a4)
    {
      case 0uLL:
        if ([v8 grade] != 1) {
          goto LABEL_33;
        }
        goto LABEL_19;
      case 1uLL:
        if ([v8 grade] != 2) {
          goto LABEL_33;
        }
LABEL_19:
        id v17 = [v8 VPN];

        if (!v17) {
          goto LABEL_33;
        }
        char v16 = [v8 VPN];
LABEL_31:
        id v7 = v16;
        char v14 = [v16 isEnabled];
        break;
      case 2uLL:
        BOOL v18 = [v8 appVPN];

        if (!v18) {
          goto LABEL_33;
        }
        char v16 = [v8 appVPN];
        goto LABEL_31;
      case 3uLL:
        BOOL v19 = [v8 alwaysOnVPN];

        if (!v19) {
          goto LABEL_33;
        }
        char v16 = [v8 alwaysOnVPN];
        goto LABEL_31;
      case 4uLL:
        uint64_t v20 = [v8 dnsSettings];

        if (!v20) {
          goto LABEL_33;
        }
        char v16 = [v8 dnsSettings];
        goto LABEL_31;
      case 5uLL:
        uint64_t v21 = [v8 dnsProxy];

        if (!v21) {
          goto LABEL_33;
        }
        char v16 = [v8 dnsProxy];
        goto LABEL_31;
      case 6uLL:
        long long v22 = [v8 contentFilter];

        if (!v22) {
          goto LABEL_33;
        }
        char v16 = [v8 contentFilter];
        goto LABEL_31;
      default:
        if (a4 - 7 > 1) {
          goto LABEL_33;
        }
        char v15 = [v8 relay];

        if (!v15) {
          goto LABEL_33;
        }
        char v16 = [v8 relay];
        goto LABEL_31;
    }
  }
  else
  {
LABEL_10:
    char v14 = 0;
  }

LABEL_34:
  return v14;
}

+ (id)applicationNameForConfiguration:(id)a3 withGrade:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 applicationName];
  id v7 = (id)v6;
  if (!v5 || v6) {
    goto LABEL_19;
  }
  if (a4 <= 1)
  {
    id v8 = [v5 VPN];
    uint64_t v9 = [v8 protocol];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v11 = [v5 VPN];
      goto LABEL_15;
    }
LABEL_18:
    id v7 = 0;
    goto LABEL_19;
  }
  switch(a4)
  {
    case 6uLL:
      id v7 = [v5 application];
      if (v7) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 5uLL:
      char v15 = [v5 dnsProxy];
      char v16 = [v15 protocol];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if ((v17 & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v11 = [v5 dnsProxy];
      break;
    case 2uLL:
      uint64_t v12 = [v5 appVPN];
      char v13 = [v12 protocol];
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v11 = [v5 appVPN];
      break;
    default:
      goto LABEL_18;
  }
LABEL_15:
  BOOL v18 = v11;
  BOOL v19 = [v11 protocol];
  id v7 = [v19 pluginType];

  if (v7)
  {
LABEL_16:
    if ([v7 isEqualToString:@"com.cisco.anyconnect.applevpn.plugin"])
    {
      uint64_t v20 = @"com.cisco.Cisco-AnyConnect.vpnplugin";
    }
    else
    {
      if (![v7 isEqualToString:@"net.juniper.sslvpn"])
      {
LABEL_24:
        long long v22 = [v7 componentsSeparatedByString:@"."];
        if ((unint64_t)[v22 count] >= 4
          && ([v22 lastObject],
              long long v23 = objc_claimAutoreleasedReturnValue(),
              char v24 = [v23 isEqualToString:@"vpnplugin"],
              v23,
              (v24 & 1) != 0))
        {
          uint64_t v25 = -2;
        }
        else
        {
          if ((unint64_t)[v22 count] < 3) {
            goto LABEL_30;
          }
          uint64_t v25 = -1;
        }
        long long v26 = objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v22, "count") + v25);

        id v7 = [v26 stringByReplacingOccurrencesOfString:@"-" withString:@" "];

LABEL_30:
        id v7 = v7;

        if (!v7) {
          goto LABEL_31;
        }
LABEL_20:
        id v21 = v7;
        goto LABEL_32;
      }
      uint64_t v20 = @"net.juniper.Junos-Pulse.vpnplugin";
    }

    id v7 = v20;
    goto LABEL_24;
  }
LABEL_19:
  if (v7) {
    goto LABEL_20;
  }
LABEL_31:
  long long v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v21 = [v27 localizedStringForKey:@"UNKNOWN" value:&stru_26E7C6230 table:@"MobileVPN"];

LABEL_32:

  return v21;
}

- (void)triggerLocalAuthenticationForConfigurationIdentifier:(id)a3 requestedByApp:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263F08C38];
  id v8 = a3;
  uint64_t v9 = (void *)[[v7 alloc] initWithUUIDString:v8];

  if (v9)
  {
    uint64_t v10 = [(VPNConnectionStore *)self configurationManager];
    uint64_t v11 = [(VPNConnectionStore *)self storeQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __90__VPNConnectionStore_triggerLocalAuthenticationForConfigurationIdentifier_requestedByApp___block_invoke;
    v12[3] = &unk_264C065A8;
    id v13 = v6;
    [v10 triggerLocalAuthenticationForConfigurationWithID:v9 withCompletionQueue:v11 handler:v12];
  }
}

uint64_t __90__VPNConnectionStore_triggerLocalAuthenticationForConfigurationIdentifier_requestedByApp___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F77188](*(void *)(a1 + 32), 0);
}

- (void)iterateDNSServicesWithBlock:(BOOL)a3 iterBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = (unsigned int (**)(id, void, uint64_t))a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:4];
  uint64_t v9 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:5 excludePerApp:v4];
  if ([v8 count]) {
    [v7 setObject:v8 forKeyedSubscript:&unk_26E7CB8E0];
  }
  if ([v9 count]) {
    [v7 setObject:v9 forKeyedSubscript:&unk_26E7CB928];
  }
  uint64_t v10 = [v7 allKeys];
  uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_0];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v11;
  uint64_t v24 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v13 = *(void *)v31;
    id v25 = v7;
    uint64_t v22 = *(void *)v31;
    long long v23 = v9;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v12);
        }
        char v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        char v16 = [v7 objectForKeyedSubscript:v15];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v27 != v20) {
                objc_enumerationMutation(v17);
              }
              if (!v6[2](v6, *(void *)(*((void *)&v26 + 1) + 8 * j), [v15 unsignedIntegerValue]))
              {

                id v7 = v25;
                uint64_t v9 = v23;
                goto LABEL_22;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        id v7 = v25;
        uint64_t v13 = v22;
      }
      uint64_t v9 = v23;
      uint64_t v24 = [v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }
LABEL_22:
}

uint64_t __60__VPNConnectionStore_iterateDNSServicesWithBlock_iterBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)iterateDNSServicesWithBlock:(id)a3
{
}

- (void)iterateContentFilterServicesWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = (unsigned int (**)(id, void, uint64_t))a3;
  id v5 = [(VPNConnectionStore *)self vpnServicesForCurrentSetWithGrade:6];
  if ([v5 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10), 6)) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (NEConfigurationManager)configurationManager
{
  return (NEConfigurationManager *)objc_getProperty(self, a2, 344, 1);
}

- (void)setConfigurationManager:(id)a3
{
}

- (OS_dispatch_queue)storeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 352, 1);
}

- (void)setStoreQueue:(id)a3
{
}

- (unsigned)vpnServiceCountDirty
{
  return self->_vpnServiceCountDirty;
}

- (void)setVpnServiceCountDirty:(unsigned int)a3
{
  self->_vpnServiceCountDirty = a3;
}

- (unsigned)vpnServiceCount
{
  return self->_vpnServiceCount;
}

- (void)setVpnServiceCount:(unsigned int)a3
{
  self->_vpnServiceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  for (uint64_t i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_connectionDict[i + 8], 0);
  for (uint64_t j = 0; j != -9; --j)
    objc_storeStrong((id *)&self->_gradeVPNServiceIDs[j + 8], 0);
  for (uint64_t k = 160; k != 88; k -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
    k -= 8;
  }
  while (k != 16);
}

- (BOOL)saveActiveVPNIDToPreferences:(id)a3 withGrade:(unint64_t)a4
{
  return [(VPNConnectionStore *)self enable:1 serviceID:a3 withGrade:a4];
}

- (void)setOptions:toConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_234C0A000, v0, v1, "NEConfiguration is not IKEv2, L2TP, or Cisco IPsec: %@", v2, v3, v4, v5, v6);
}

- (void)setOptions:toConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_234C0A000, v0, v1, "NEConfiguration is not On Demand ready: %@", v2, v3, v4, v5, v6);
}

void __43__VPNConnectionStore_createVPNWithOptions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_234C0A000, v0, v1, "Save error: %@ configuration: %@");
}

void __45__VPNConnectionStore_deleteVPNWithServiceID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_234C0A000, v0, v1, "Remove error: %@ configuration: %@");
}

- (void)setActiveVPNID:withGrade:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_234C0A000, v0, v1, "Unable to set the active VPN to %@", v2, v3, v4, v5, v6);
}

@end