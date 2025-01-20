@interface AMDJSDebugHandler
+ (id)handleDebugRequest:(id)a3 error:(id *)a4;
+ (id)testInference:(id)a3 error:(id *)a4;
+ (void)handleAsyncDebugRequest:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation AMDJSDebugHandler

+ (id)handleDebugRequest:(id)a3 error:(id *)a4
{
  uint64_t v471 = *MEMORY[0x263EF8340];
  id v403 = a1;
  v402[1] = (id)a2;
  v402[0] = 0;
  objc_storeStrong(v402, a3);
  v401 = a4;
  id v400 = (id)[v402[0] objectForKey:@"event"];
  id v399 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([v400 isEqualToString:@"fetch_taste_profiles"])
  {
    id v398 = +[AMDTasteProfile fetchTasteProfile:v401];
    if (*v401)
    {
      os_log_t oslog = (os_log_t)&_os_log_internal;
      char v396 = 1;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        os_log_type_t type = v396;
        id v171 = (id)[*v401 localizedDescription];
        id v395 = v171;
        __os_log_helper_16_2_1_8_64((uint64_t)v470, (uint64_t)v395);
        _os_log_impl(&dword_20ABD4000, log, type, "Error fetching all the Taste Profiles: %@", v470, 0xCu);

        objc_storeStrong(&v395, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v398 forKey:@"taste_profiles"];
      int v394 = 0;
    }
    objc_storeStrong(&v398, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_events"])
  {
    id v393 = +[AMDAppEvent fetchEvents:v401];
    if (*v401)
    {
      os_log_t v392 = (os_log_t)&_os_log_internal;
      char v391 = 1;
      if (os_log_type_enabled(v392, OS_LOG_TYPE_INFO))
      {
        v166 = v392;
        os_log_type_t v167 = v391;
        id v168 = (id)[*v401 localizedDescription];
        id v390 = v168;
        __os_log_helper_16_2_1_8_64((uint64_t)v469, (uint64_t)v390);
        _os_log_impl(&dword_20ABD4000, v166, v167, "Error fetching all the Events: %@", v469, 0xCu);

        objc_storeStrong(&v390, 0);
      }
      objc_storeStrong((id *)&v392, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v393 forKey:@"events"];
      int v394 = 0;
    }
    objc_storeStrong(&v393, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_tab_info"])
  {
    id v389 = +[AMDAppTabInfo fetchAllTabInfo:v401];
    if (*v401)
    {
      os_log_t v388 = (os_log_t)&_os_log_internal;
      char v387 = 1;
      if (os_log_type_enabled(v388, OS_LOG_TYPE_INFO))
      {
        v163 = v388;
        os_log_type_t v164 = v387;
        id v165 = (id)[*v401 localizedDescription];
        id v386 = v165;
        __os_log_helper_16_2_1_8_64((uint64_t)v468, (uint64_t)v386);
        _os_log_impl(&dword_20ABD4000, v163, v164, "Error fetching tab info: %@", v468, 0xCu);

        objc_storeStrong(&v386, 0);
      }
      objc_storeStrong((id *)&v388, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v389 forKey:@"tabInfo"];
      int v394 = 0;
    }
    objc_storeStrong(&v389, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_model_urls"])
  {
    id v385 = +[AMDModel fetchAll:v401];
    if (*v401)
    {
      os_log_t v384 = (os_log_t)&_os_log_internal;
      char v383 = 1;
      if (os_log_type_enabled(v384, OS_LOG_TYPE_INFO))
      {
        v160 = v384;
        os_log_type_t v161 = v383;
        id v162 = (id)[*v401 localizedDescription];
        id v382 = v162;
        __os_log_helper_16_2_1_8_64((uint64_t)v467, (uint64_t)v382);
        _os_log_impl(&dword_20ABD4000, v160, v161, "Error fetching all the ModelUrls: %@", v467, 0xCu);

        objc_storeStrong(&v382, 0);
      }
      objc_storeStrong((id *)&v384, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v385 forKey:@"ModelUrls"];
      int v394 = 0;
    }
    objc_storeStrong(&v385, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_coldstart_urls"])
  {
    id v381 = +[AMDColdstartURL fetchAll:v401];
    if (*v401)
    {
      os_log_t v380 = (os_log_t)&_os_log_internal;
      char v379 = 1;
      if (os_log_type_enabled(v380, OS_LOG_TYPE_INFO))
      {
        v157 = v380;
        os_log_type_t v158 = v379;
        id v159 = (id)[*v401 localizedDescription];
        id v378 = v159;
        __os_log_helper_16_2_1_8_64((uint64_t)v466, (uint64_t)v378);
        _os_log_impl(&dword_20ABD4000, v157, v158, "Error fetching all the ColdstartUrls: %@", v466, 0xCu);

        objc_storeStrong(&v378, 0);
      }
      objc_storeStrong((id *)&v380, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v381 forKey:@"ColdstartUrls"];
      int v394 = 0;
    }
    objc_storeStrong(&v381, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_descriptors"])
  {
    id v377 = +[AMDDescriptor getDescriptorsForDomain:error:](AMDDescriptor, "getDescriptorsForDomain:error:", +[AMDDomains getCodeForDomain:@"apps"], v401);
    if (*v401)
    {
      os_log_t v376 = (os_log_t)&_os_log_internal;
      char v375 = 1;
      if (os_log_type_enabled(v376, OS_LOG_TYPE_INFO))
      {
        v154 = v376;
        os_log_type_t v155 = v375;
        id v156 = (id)[*v401 localizedDescription];
        id v374 = v156;
        __os_log_helper_16_2_1_8_64((uint64_t)v465, (uint64_t)v374);
        _os_log_impl(&dword_20ABD4000, v154, v155, "Error getting descriptors: %@", v465, 0xCu);

        objc_storeStrong(&v374, 0);
      }
      objc_storeStrong((id *)&v376, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v377 forKey:@"descriptors_saved"];
      int v394 = 0;
    }
    objc_storeStrong(&v377, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_segments"])
  {
    id v373 = +[AMDAppSegment getSegmentsDictForAllTreatments:v401];
    if (*v401)
    {
      os_log_t v372 = (os_log_t)&_os_log_internal;
      char v371 = 1;
      if (os_log_type_enabled(v372, OS_LOG_TYPE_INFO))
      {
        v151 = v372;
        os_log_type_t v152 = v371;
        id v153 = (id)[*v401 localizedDescription];
        id v370 = v153;
        __os_log_helper_16_2_1_8_64((uint64_t)v464, (uint64_t)v370);
        _os_log_impl(&dword_20ABD4000, v151, v152, "Error fetching the Segments Dict: %@", v464, 0xCu);

        objc_storeStrong(&v370, 0);
      }
      objc_storeStrong((id *)&v372, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      id v369 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      memset(v367, 0, sizeof(v367));
      id obj = v373;
      uint64_t v150 = [obj countByEnumeratingWithState:v367 objects:v463 count:16];
      if (v150)
      {
        uint64_t v146 = *(void *)v367[2];
        uint64_t v147 = 0;
        unint64_t v148 = v150;
        while (1)
        {
          uint64_t v145 = v147;
          if (*(void *)v367[2] != v146) {
            objc_enumerationMutation(obj);
          }
          uint64_t v368 = *(void *)(v367[1] + 8 * v147);
          id v366 = (id)[v373 objectForKey:v368];
          id v141 = v369;
          v461[0] = @"segmentsData";
          id v144 = (id)[v366 first];
          v462[0] = v144;
          v461[1] = @"algoId";
          id v143 = (id)[v366 second];
          v462[1] = v143;
          id v142 = (id)[NSDictionary dictionaryWithObjects:v462 forKeys:v461 count:2];
          objc_msgSend(v141, "setObject:forKey:");

          objc_storeStrong(&v366, 0);
          ++v147;
          if (v145 + 1 >= v148)
          {
            uint64_t v147 = 0;
            unint64_t v148 = [obj countByEnumeratingWithState:v367 objects:v463 count:16];
            if (!v148) {
              break;
            }
          }
        }
      }

      [v399 setObject:v369 forKey:@"segments"];
      objc_storeStrong(&v369, 0);
      int v394 = 0;
    }
    objc_storeStrong(&v373, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"delete_taste_profiles"])
  {
    id v365 = +[AMDTasteProfile deleteAll:v401];
    if (*v401)
    {
      os_log_t v364 = (os_log_t)&_os_log_internal;
      char v363 = 1;
      if (os_log_type_enabled(v364, OS_LOG_TYPE_INFO))
      {
        v138 = v364;
        os_log_type_t v139 = v363;
        id v140 = (id)[*v401 localizedDescription];
        id v362 = v140;
        __os_log_helper_16_2_1_8_64((uint64_t)v460, (uint64_t)v362);
        _os_log_impl(&dword_20ABD4000, v138, v139, "Error clearing the Taste Profile table: %@", v460, 0xCu);

        objc_storeStrong(&v362, 0);
      }
      objc_storeStrong((id *)&v364, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v365 forKey:@"taste_profiles_deleted"];
      int v394 = 0;
    }
    objc_storeStrong(&v365, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"delete_events"])
  {
    id v361 = +[AMDAppEvent deleteAllEvents:v401];
    if (*v401)
    {
      os_log_t v360 = (os_log_t)&_os_log_internal;
      char v359 = 1;
      if (os_log_type_enabled(v360, OS_LOG_TYPE_INFO))
      {
        v135 = v360;
        os_log_type_t v136 = v359;
        id v137 = (id)[*v401 localizedDescription];
        id v358 = v137;
        __os_log_helper_16_2_1_8_64((uint64_t)v459, (uint64_t)v358);
        _os_log_impl(&dword_20ABD4000, v135, v136, "Error clearing the events table: %@", v459, 0xCu);

        objc_storeStrong(&v358, 0);
      }
      objc_storeStrong((id *)&v360, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v361 forKey:@"events_deleted"];
      int v394 = 0;
    }
    objc_storeStrong(&v361, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"clear_core_data"])
  {
    id v357 = +[AMDAppTabInfo deleteAllTabs:v401];
    if (*v401)
    {
      os_log_t v356 = (os_log_t)&_os_log_internal;
      char v355 = 1;
      if (os_log_type_enabled(v356, OS_LOG_TYPE_INFO))
      {
        v132 = v356;
        os_log_type_t v133 = v355;
        id v134 = (id)[*v401 localizedDescription];
        id v354 = v134;
        __os_log_helper_16_2_1_8_64((uint64_t)v458, (uint64_t)v354);
        _os_log_impl(&dword_20ABD4000, v132, v133, "Error clearing the AppTabInfo table: %@", v458, 0xCu);

        objc_storeStrong(&v354, 0);
      }
      objc_storeStrong((id *)&v356, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      os_log_t v353 = (os_log_t)&_os_log_internal;
      os_log_type_t v352 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v353, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v457, (uint64_t)v357);
        _os_log_impl(&dword_20ABD4000, v353, v352, "Deleted %@ tabs", v457, 0xCu);
      }
      objc_storeStrong((id *)&v353, 0);
      [v399 setObject:v357 forKey:@"tabs_deleted"];
      id v351 = +[AMDDescriptor deleteAll:v401];
      if (*v401)
      {
        os_log_t v350 = (os_log_t)&_os_log_internal;
        char v349 = 1;
        if (os_log_type_enabled(v350, OS_LOG_TYPE_INFO))
        {
          v129 = v350;
          os_log_type_t v130 = v349;
          id v131 = (id)[*v401 localizedDescription];
          id v348 = v131;
          __os_log_helper_16_2_1_8_64((uint64_t)v456, (uint64_t)v348);
          _os_log_impl(&dword_20ABD4000, v129, v130, "Error clearing the descriptors table: %@", v456, 0xCu);

          objc_storeStrong(&v348, 0);
        }
        objc_storeStrong((id *)&v350, 0);
        id v404 = 0;
        int v394 = 1;
      }
      else
      {
        os_log_t v347 = (os_log_t)&_os_log_internal;
        os_log_type_t v346 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v347, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v455, (uint64_t)v351);
          _os_log_impl(&dword_20ABD4000, v347, v346, "Deleted %@ descriptors", v455, 0xCu);
        }
        objc_storeStrong((id *)&v347, 0);
        [v399 setObject:v351 forKey:@"descriptors_deleted"];
        id v345 = +[AMDModel deleteAllModelUrls:v401];
        if (*v401)
        {
          os_log_t v344 = (os_log_t)&_os_log_internal;
          char v343 = 1;
          if (os_log_type_enabled(v344, OS_LOG_TYPE_INFO))
          {
            v126 = v344;
            os_log_type_t v127 = v343;
            id v128 = (id)[*v401 localizedDescription];
            id v342 = v128;
            __os_log_helper_16_2_1_8_64((uint64_t)v454, (uint64_t)v342);
            _os_log_impl(&dword_20ABD4000, v126, v127, "Error clearing the Model Url table: %@", v454, 0xCu);

            objc_storeStrong(&v342, 0);
          }
          objc_storeStrong((id *)&v344, 0);
          id v404 = 0;
          int v394 = 1;
        }
        else
        {
          os_log_t v341 = (os_log_t)&_os_log_internal;
          os_log_type_t v340 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v341, OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v453, (uint64_t)v345);
            _os_log_impl(&dword_20ABD4000, v341, v340, "Deleted %@ Model Urs", v453, 0xCu);
          }
          objc_storeStrong((id *)&v341, 0);
          [v399 setObject:v345 forKey:@"model_urls_deleted"];
          id v339 = +[AMDColdstartURL deleteAllColdstartUrls:v401];
          if (*v401)
          {
            os_log_t v338 = (os_log_t)&_os_log_internal;
            char v337 = 1;
            if (os_log_type_enabled(v338, OS_LOG_TYPE_INFO))
            {
              v123 = v338;
              os_log_type_t v124 = v337;
              id v125 = (id)[*v401 localizedDescription];
              id v336 = v125;
              __os_log_helper_16_2_1_8_64((uint64_t)v452, (uint64_t)v336);
              _os_log_impl(&dword_20ABD4000, v123, v124, "Error clearing the Coldstart Url table: %@", v452, 0xCu);

              objc_storeStrong(&v336, 0);
            }
            objc_storeStrong((id *)&v338, 0);
            id v404 = 0;
            int v394 = 1;
          }
          else
          {
            os_log_t v335 = (os_log_t)&_os_log_internal;
            os_log_type_t v334 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v335, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v451, (uint64_t)v339);
              _os_log_impl(&dword_20ABD4000, v335, v334, "Deleted %@ Coldstart Urs", v451, 0xCu);
            }
            objc_storeStrong((id *)&v335, 0);
            [v399 setObject:v339 forKey:@"coldstart_urls_deleted"];
            id v333 = +[AMDUserDataManager deleteAllUserData:v401];
            if (*v401)
            {
              os_log_t v332 = (os_log_t)&_os_log_internal;
              os_log_type_t v331 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v332, OS_LOG_TYPE_INFO))
              {
                v120 = v332;
                os_log_type_t v121 = v331;
                id v122 = (id)[*v401 localizedDescription];
                id v330 = v122;
                __os_log_helper_16_2_1_8_64((uint64_t)v450, (uint64_t)v330);
                _os_log_impl(&dword_20ABD4000, v120, v121, "Error clearing the User Data tables: %@", v450, 0xCu);

                objc_storeStrong(&v330, 0);
              }
              objc_storeStrong((id *)&v332, 0);
              id v404 = 0;
              int v394 = 1;
            }
            else
            {
              os_log_t v329 = (os_log_t)&_os_log_internal;
              os_log_type_t v328 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v329, OS_LOG_TYPE_INFO))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v449, (uint64_t)v333);
                _os_log_impl(&dword_20ABD4000, v329, v328, "Deleted %@ UserData entries", v449, 0xCu);
              }
              objc_storeStrong((id *)&v329, 0);
              [v399 setObject:v333 forKey:@"user_data_deleted"];
              id v327 = +[AMDWorkflow deleteAllWorkflows:v401];
              if (*v401)
              {
                os_log_t v326 = (os_log_t)&_os_log_internal;
                os_log_type_t v325 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v326, OS_LOG_TYPE_INFO))
                {
                  v117 = v326;
                  os_log_type_t v118 = v325;
                  id v119 = (id)[*v401 localizedDescription];
                  id v324 = v119;
                  __os_log_helper_16_2_1_8_64((uint64_t)v448, (uint64_t)v324);
                  _os_log_impl(&dword_20ABD4000, v117, v118, "Error clearing the Workflow table: %@", v448, 0xCu);

                  objc_storeStrong(&v324, 0);
                }
                objc_storeStrong((id *)&v326, 0);
                id v404 = 0;
                int v394 = 1;
              }
              else
              {
                os_log_t v323 = (os_log_t)&_os_log_internal;
                os_log_type_t v322 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled(v323, OS_LOG_TYPE_INFO))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v447, (uint64_t)v327);
                  _os_log_impl(&dword_20ABD4000, v323, v322, "Deleted %@ workflow entries", v447, 0xCu);
                }
                objc_storeStrong((id *)&v323, 0);
                [v399 setObject:v327 forKey:@"workflows_deleted"];
                id v321 = +[AMDWorkflowInFlight deleteAllInflightWorkflows:v401];
                if (*v401)
                {
                  os_log_t v320 = (os_log_t)&_os_log_internal;
                  os_log_type_t v319 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled(v320, OS_LOG_TYPE_INFO))
                  {
                    v114 = v320;
                    os_log_type_t v115 = v319;
                    id v116 = (id)[*v401 localizedDescription];
                    id v318 = v116;
                    __os_log_helper_16_2_1_8_64((uint64_t)v446, (uint64_t)v318);
                    _os_log_impl(&dword_20ABD4000, v114, v115, "Error clearing the Inflight Workflow table: %@", v446, 0xCu);

                    objc_storeStrong(&v318, 0);
                  }
                  objc_storeStrong((id *)&v320, 0);
                  id v404 = 0;
                  int v394 = 1;
                }
                else
                {
                  os_log_t v317 = (os_log_t)&_os_log_internal;
                  os_log_type_t v316 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled(v317, OS_LOG_TYPE_INFO))
                  {
                    __os_log_helper_16_2_1_8_64((uint64_t)v445, (uint64_t)v321);
                    _os_log_impl(&dword_20ABD4000, v317, v316, "Deleted %@ in-flight workflow entries", v445, 0xCu);
                  }
                  objc_storeStrong((id *)&v317, 0);
                  [v399 setObject:v321 forKey:@"inflight_workflows_deleted"];
                  id v315 = +[AMDAppStoreEvent deleteAllEvents:v401];
                  if (*v401)
                  {
                    os_log_t v314 = (os_log_t)&_os_log_internal;
                    os_log_type_t v313 = OS_LOG_TYPE_INFO;
                    if (os_log_type_enabled(v314, OS_LOG_TYPE_INFO))
                    {
                      v111 = v314;
                      os_log_type_t v112 = v313;
                      id v113 = (id)[*v401 localizedDescription];
                      id v312 = v113;
                      __os_log_helper_16_2_1_8_64((uint64_t)v444, (uint64_t)v312);
                      _os_log_impl(&dword_20ABD4000, v111, v112, "Error clearing the Appstore events table: %@", v444, 0xCu);

                      objc_storeStrong(&v312, 0);
                    }
                    objc_storeStrong((id *)&v314, 0);
                    id v404 = 0;
                    int v394 = 1;
                  }
                  else
                  {
                    os_log_t v311 = (os_log_t)&_os_log_internal;
                    os_log_type_t v310 = OS_LOG_TYPE_INFO;
                    if (os_log_type_enabled(v311, OS_LOG_TYPE_INFO))
                    {
                      __os_log_helper_16_2_1_8_64((uint64_t)v443, (uint64_t)v321);
                      _os_log_impl(&dword_20ABD4000, v311, v310, "Deleted %@ appstore event entries", v443, 0xCu);
                    }
                    objc_storeStrong((id *)&v311, 0);
                    [v399 setObject:v315 forKey:@"deleted_appstore_events"];
                    id v309 = +[AMDKVStore deleteWithPredicate:0 error:v401];
                    if (*v401)
                    {
                      os_log_t v308 = (os_log_t)&_os_log_internal;
                      os_log_type_t v307 = OS_LOG_TYPE_INFO;
                      if (os_log_type_enabled(v308, OS_LOG_TYPE_INFO))
                      {
                        v108 = v308;
                        os_log_type_t v109 = v307;
                        id v110 = (id)[*v401 localizedDescription];
                        id v306 = v110;
                        __os_log_helper_16_2_1_8_64((uint64_t)v442, (uint64_t)v306);
                        _os_log_impl(&dword_20ABD4000, v108, v109, "Error clearing the KVStore table: %@", v442, 0xCu);

                        objc_storeStrong(&v306, 0);
                      }
                      objc_storeStrong((id *)&v308, 0);
                      id v404 = 0;
                      int v394 = 1;
                    }
                    else
                    {
                      os_log_t v305 = (os_log_t)&_os_log_internal;
                      os_log_type_t v304 = OS_LOG_TYPE_INFO;
                      if (os_log_type_enabled(v305, OS_LOG_TYPE_INFO))
                      {
                        __os_log_helper_16_2_1_8_64((uint64_t)v441, (uint64_t)v309);
                        _os_log_impl(&dword_20ABD4000, v305, v304, "Deleted %@ kv entries", v441, 0xCu);
                      }
                      objc_storeStrong((id *)&v305, 0);
                      [v399 setObject:v309 forKey:@"deleted_kv_entries"];
                      int v394 = 0;
                    }
                    objc_storeStrong(&v309, 0);
                  }
                  objc_storeStrong(&v315, 0);
                }
                objc_storeStrong(&v321, 0);
              }
              objc_storeStrong(&v327, 0);
            }
            objc_storeStrong(&v333, 0);
          }
          objc_storeStrong(&v339, 0);
        }
        objc_storeStrong(&v345, 0);
      }
      objc_storeStrong(&v351, 0);
    }
    objc_storeStrong(&v357, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_workflows"])
  {
    id v303 = +[AMDWorkflow fetchAllWorkflows:v401];
    if (*v401)
    {
      os_log_t v302 = (os_log_t)&_os_log_internal;
      os_log_type_t v301 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v302, OS_LOG_TYPE_INFO))
      {
        v105 = v302;
        os_log_type_t v106 = v301;
        id v107 = (id)[*v401 localizedDescription];
        id v300 = v107;
        __os_log_helper_16_2_1_8_64((uint64_t)v440, (uint64_t)v300);
        _os_log_impl(&dword_20ABD4000, v105, v106, "Error getting workflows: %@", v440, 0xCu);

        objc_storeStrong(&v300, 0);
      }
      objc_storeStrong((id *)&v302, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v303 forKey:@"workflows_saved"];
      int v394 = 0;
    }
    objc_storeStrong(&v303, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_appstore_events"])
  {
    id v299 = +[AMDAppStoreEvent fetchEvents:v401];
    if (*v401)
    {
      os_log_t v298 = (os_log_t)&_os_log_internal;
      os_log_type_t v297 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v298, OS_LOG_TYPE_INFO))
      {
        v102 = v298;
        os_log_type_t v103 = v297;
        id v104 = (id)[*v401 localizedDescription];
        id v296 = v104;
        __os_log_helper_16_2_1_8_64((uint64_t)v439, (uint64_t)v296);
        _os_log_impl(&dword_20ABD4000, v102, v103, "Error getting appstore events: %@", v439, 0xCu);

        objc_storeStrong(&v296, 0);
      }
      objc_storeStrong((id *)&v298, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v299 forKey:@"appstore_events_saved"];
      int v394 = 0;
    }
    objc_storeStrong(&v299, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_inflight_workflows"])
  {
    id v295 = +[AMDWorkflowInFlight fetchAllWorkflows:v401];
    if (*v401)
    {
      os_log_t v294 = (os_log_t)&_os_log_internal;
      os_log_type_t v293 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v294, OS_LOG_TYPE_INFO))
      {
        v99 = v294;
        os_log_type_t v100 = v293;
        id v101 = (id)[*v401 localizedDescription];
        id v292 = v101;
        __os_log_helper_16_2_1_8_64((uint64_t)v438, (uint64_t)v292);
        _os_log_impl(&dword_20ABD4000, v99, v100, "Error getting inflight workflows: %@", v438, 0xCu);

        objc_storeStrong(&v292, 0);
      }
      objc_storeStrong((id *)&v294, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      [v399 setObject:v295 forKey:@"inflight_workflows_saved"];
      int v394 = 0;
    }
    objc_storeStrong(&v295, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else if ([v400 isEqualToString:@"fetch_arcade_games"])
  {
    id v291 = +[AMDTasteProfile getPurchasedArcadeGamesSet:v401];
    if (*v401)
    {
      os_log_t v290 = (os_log_t)&_os_log_internal;
      os_log_type_t v289 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v290, OS_LOG_TYPE_INFO))
      {
        v96 = v290;
        os_log_type_t v97 = v289;
        id v98 = (id)[*v401 localizedDescription];
        id v288 = v98;
        __os_log_helper_16_2_1_8_64((uint64_t)v437, (uint64_t)v288);
        _os_log_impl(&dword_20ABD4000, v96, v97, "Error fetching purchased arcade games: %@", v437, 0xCu);

        objc_storeStrong(&v288, 0);
      }
      objc_storeStrong((id *)&v290, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      id v95 = (id)[v291 allObjects];
      objc_msgSend(v399, "setObject:forKey:");

      int v394 = 0;
    }
    objc_storeStrong(&v291, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
  else
  {
    if (([v400 isEqualToString:@"fetch_purchased_apps"] & 1) == 0)
    {
      if ([v400 isEqualToString:@"fetch_device_storage"])
      {
        id v283 = 0;
        id v281 = 0;
        id v90 = +[AMDDeviceStorage queryDeviceStorageWithError:&v281];
        objc_storeStrong(&v283, v281);
        id v282 = v90;
        if (v283)
        {
          id v88 = v399;
          id v89 = (id)[v283 localizedDescription];
          objc_msgSend(v88, "setObject:forKey:");
        }
        else
        {
          [v399 setObject:v282 forKey:@"storage_info"];
        }
        objc_storeStrong(&v282, 0);
        objc_storeStrong(&v283, 0);
      }
      else
      {
        if ([v400 isEqualToString:@"test_segment_computation"])
        {
          id v280 = &unk_26BEC2490;
          id v279 = +[AMDAppSegment assignSegmentsWithParameters:v280 error:v401];
          if (v279)
          {
            id v278 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            memset(__b, 0, sizeof(__b));
            id v86 = v279;
            uint64_t v87 = [v86 countByEnumeratingWithState:__b objects:v435 count:16];
            if (v87)
            {
              uint64_t v83 = *(void *)__b[2];
              uint64_t v84 = 0;
              unint64_t v85 = v87;
              while (1)
              {
                uint64_t v82 = v84;
                if (*(void *)__b[2] != v83) {
                  objc_enumerationMutation(v86);
                }
                uint64_t v277 = *(void *)(__b[1] + 8 * v84);
                id v79 = v278;
                id v81 = (id)[v279 objectForKey:v277];
                id v80 = (id)[NSString stringWithFormat:@"%@", v277];
                objc_msgSend(v79, "setObject:forKey:", v81);

                ++v84;
                if (v82 + 1 >= v85)
                {
                  uint64_t v84 = 0;
                  unint64_t v85 = [v86 countByEnumeratingWithState:__b objects:v435 count:16];
                  if (!v85) {
                    break;
                  }
                }
              }
            }

            [v399 setObject:v278 forKey:@"segmentRefreshSummary"];
            objc_storeStrong(&v278, 0);
          }
          else
          {
            [v399 setObject:@"Segment Computation Error" forKey:@"segmentRefreshSummary"];
          }
          objc_storeStrong(&v279, 0);
          objc_storeStrong(&v280, 0);
          goto LABEL_345;
        }
        if ([v400 isEqualToString:@"add_taste_profiles"])
        {
          id v275 = (id)[v402[0] objectForKey:@"tasteProfiles"];
          memset(v273, 0, sizeof(v273));
          id v77 = v275;
          uint64_t v78 = [v77 countByEnumeratingWithState:v273 objects:v434 count:16];
          if (v78)
          {
            uint64_t v74 = *(void *)v273[2];
            uint64_t v75 = 0;
            unint64_t v76 = v78;
            while (1)
            {
              uint64_t v73 = v75;
              if (*(void *)v273[2] != v74) {
                objc_enumerationMutation(v77);
              }
              uint64_t v274 = *(void *)(v273[1] + 8 * v75);
              id v272 = (id)[v275 objectForKey:v274];
              memset(v270, 0, sizeof(v270));
              id v71 = v272;
              uint64_t v72 = [v71 countByEnumeratingWithState:v270 objects:v433 count:16];
              if (v72)
              {
                uint64_t v68 = *(void *)v270[2];
                uint64_t v69 = 0;
                unint64_t v70 = v72;
                while (1)
                {
                  uint64_t v67 = v69;
                  if (*(void *)v270[2] != v68) {
                    objc_enumerationMutation(v71);
                  }
                  uint64_t v271 = *(void *)(v270[1] + 8 * v69);
                  id v269 = (id)[v272 objectForKey:v271];
                  id v268 = 0;
                  id v267 = 0;
                  id v4 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:v269 inDomain:v274 forSource:v271 error:&v267];
                  objc_storeStrong(&v268, v267);
                  if (v268)
                  {
                    id v404 = v399;
                    int v394 = 1;
                  }
                  else
                  {
                    int v394 = 0;
                  }
                  objc_storeStrong(&v268, 0);
                  objc_storeStrong(&v269, 0);
                  if (v394) {
                    break;
                  }
                  ++v69;
                  if (v67 + 1 >= v70)
                  {
                    uint64_t v69 = 0;
                    unint64_t v70 = [v71 countByEnumeratingWithState:v270 objects:v433 count:16];
                    if (!v70) {
                      goto LABEL_216;
                    }
                  }
                }
              }
              else
              {
LABEL_216:
                int v394 = 0;
              }

              if (!v394) {
                int v394 = 0;
              }
              objc_storeStrong(&v272, 0);
              if (v394) {
                break;
              }
              ++v75;
              if (v73 + 1 >= v76)
              {
                uint64_t v75 = 0;
                unint64_t v76 = [v77 countByEnumeratingWithState:v273 objects:v434 count:16];
                if (!v76) {
                  goto LABEL_222;
                }
              }
            }
          }
          else
          {
LABEL_222:
            int v394 = 0;
          }

          if (!v394)
          {
            [v399 setObject:@"success" forKey:@"status"];
            int v394 = 0;
          }
          objc_storeStrong(&v275, 0);
          if (!v394) {
            goto LABEL_345;
          }
          goto LABEL_346;
        }
        if ([v400 isEqualToString:@"test_biome"])
        {
          id v66 = (id)[v402[0] objectForKey:@"testPayload"];
          id v266 = +[AMDBiomeTest test:](AMDBiomeTest, "test:");

          [v399 setObject:v266 forKey:@"biomeTestStatus"];
          objc_storeStrong(&v266, 0);
        }
        else if ([v400 isEqualToString:@"test_megadome"])
        {
          id v65 = (id)[v402[0] objectForKey:@"testPayload"];
          id v265 = +[AMDMegadomeTest testMegadome:](AMDMegadomeTest, "testMegadome:");

          [v399 setObject:v265 forKey:@"megadomeTestStatus"];
          objc_storeStrong(&v265, 0);
        }
        else if ([v400 isEqualToString:@"test_memory_feature_provider_save"])
        {
          id v264 = +[AMDFeatureProvider getProviderForSource:0x26BEB0F78 WithDomain:@"foo"];
          id v263 = 0;
          id v262 = (id)[v402[0] objectForKey:@"testPayload"];
          id v261 = 0;
          id v63 = v264;
          id v64 = (id)[v262 objectForKey:@"featureData"];
          id v260 = v263;
          objc_msgSend(v63, "storeFeatureData:error:");
          objc_storeStrong(&v263, v260);

          if (v263)
          {
            v431 = @"failure";
            id v62 = (id)[v263 localizedDescription];
            id v432 = v62;
            id v5 = (id)[NSDictionary dictionaryWithObjects:&v432 forKeys:&v431 count:1];
            id v6 = v261;
            id v261 = v5;
          }
          else
          {
            objc_storeStrong(&v261, @"saved");
          }
          [v399 setObject:v261 forKey:@"memoryFeatureProviderSaveTestStatus"];
          objc_storeStrong(&v261, 0);
          objc_storeStrong(&v262, 0);
          objc_storeStrong(&v263, 0);
          objc_storeStrong(&v264, 0);
        }
        else if ([v400 isEqualToString:@"test_memory_feature_provider_fetch"])
        {
          id v259 = +[AMDFeatureProvider getProviderForSource:0x26BEB0F78 WithDomain:@"bar"];
          id v258 = 0;
          id v257 = (id)[v402[0] objectForKey:@"testPayload"];
          id v256 = (id)[v257 objectForKey:@"featureName"];
          id v255 = 0;
          id v253 = v258;
          id v61 = (id)[v259 getFeatureWithName:v256 withColumn:0 error:&v253];
          objc_storeStrong(&v258, v253);
          id v254 = v61;
          if (v258)
          {
            v429 = @"failure";
            id v60 = (id)[v258 localizedDescription];
            id v430 = v60;
            id v7 = (id)[NSDictionary dictionaryWithObjects:&v430 forKeys:&v429 count:1];
            id v8 = v255;
            id v255 = v7;
          }
          else
          {
            v427 = @"featureValue";
            id v59 = (id)[v254 getValue];
            id v428 = v59;
            id v9 = (id)[NSDictionary dictionaryWithObjects:&v428 forKeys:&v427 count:1];
            id v10 = v255;
            id v255 = v9;
          }
          [v399 setObject:v255 forKey:@"memoryFeatureProviderFetchTestStatus"];
          objc_storeStrong(&v254, 0);
          objc_storeStrong(&v255, 0);
          objc_storeStrong(&v256, 0);
          objc_storeStrong(&v257, 0);
          objc_storeStrong(&v258, 0);
          objc_storeStrong(&v259, 0);
        }
        else if ([v400 isEqualToString:@"test_inference"])
        {
          id v252 = 0;
          id v251 = (id)[v402[0] objectForKey:@"testPayload"];
          id v249 = v252;
          id v58 = (id)[v403 testInference:v251 error:&v249];
          objc_storeStrong(&v252, v249);
          id v250 = v58;
          id v248 = 0;
          if (v252)
          {
            v425 = @"failure";
            id v57 = (id)[v252 localizedDescription];
            id v426 = v57;
            id v11 = (id)[NSDictionary dictionaryWithObjects:&v426 forKeys:&v425 count:1];
            id v12 = v248;
            id v248 = v11;
          }
          else
          {
            v423 = @"inferenceResult";
            id v424 = v250;
            id v13 = (id)[NSDictionary dictionaryWithObjects:&v424 forKeys:&v423 count:1];
            id v14 = v248;
            id v248 = v13;
          }
          [v399 setObject:v248 forKey:@"inferenceTestStatus"];
          objc_storeStrong(&v248, 0);
          objc_storeStrong(&v250, 0);
          objc_storeStrong(&v251, 0);
          objc_storeStrong(&v252, 0);
        }
        else if ([v400 isEqualToString:@"test_SQLite"])
        {
          id v247 = 0;
          id v246 = (id)[v402[0] objectForKey:@"testPayload"];
          id v244 = v247;
          id v56 = +[AMDJSDebugTestSQLite test:v246 error:&v244];
          objc_storeStrong(&v247, v244);
          id v245 = v56;
          id v243 = 0;
          if (v247)
          {
            v421 = @"failure";
            id v55 = (id)[v247 localizedDescription];
            id v422 = v55;
            id v15 = (id)[NSDictionary dictionaryWithObjects:&v422 forKeys:&v421 count:1];
            id v16 = v243;
            id v243 = v15;
          }
          else
          {
            v419 = @"result";
            id v420 = v245;
            id v17 = (id)[NSDictionary dictionaryWithObjects:&v420 forKeys:&v419 count:1];
            id v18 = v243;
            id v243 = v17;
          }
          [v399 setObject:v243 forKey:@"SQLiteTestStatus"];
          objc_storeStrong(&v243, 0);
          objc_storeStrong(&v245, 0);
          objc_storeStrong(&v246, 0);
          objc_storeStrong(&v247, 0);
        }
        else if ([v400 isEqualToString:@"test_modelPath"])
        {
          id v242 = 0;
          id v241 = (id)[v402[0] objectForKey:@"testPayload"];
          id v240 = (id)[v241 objectForKey:0x26BEAEA98];
          id v239 = (id)[v241 objectForKey:0x26BEAE298];
          id v238 = (id)[v241 objectForKey:0x26BEB76F8];
          id v237 = (id)[v241 objectForKey:0x26BEB05F8];
          id v235 = v242;
          id v54 = +[AMDModel getModelPathForUsecase:v240 inDomain:v239 forModelId:v238 withTreatmentId:v237 error:&v235];
          objc_storeStrong(&v242, v235);
          id v236 = v54;
          if (v54) {
            id v53 = v236;
          }
          else {
            id v53 = (id)MEMORY[0x263EFFA78];
          }
          [v399 setObject:v53 forKey:@"modelPathResponse"];
          objc_storeStrong(&v236, 0);
          objc_storeStrong(&v237, 0);
          objc_storeStrong(&v238, 0);
          objc_storeStrong(&v239, 0);
          objc_storeStrong(&v240, 0);
          objc_storeStrong(&v241, 0);
          objc_storeStrong(&v242, 0);
        }
        else if ([v400 isEqualToString:@"test_DR_newDevicePayloadCreation"])
        {
          id v234 = 0;
          id v232 = 0;
          id v52 = +[AMDJSDebugDataSync testNewDevicePayloadCreation:&v232];
          objc_storeStrong(&v234, v232);
          id v233 = v52;
          [v399 setObject:v52 forKey:@"drResponse"];
          objc_storeStrong(&v233, 0);
          objc_storeStrong(&v234, 0);
        }
        else if ([v400 isEqualToString:@"test_DR_fullSyncInitiation"])
        {
          id v231 = 0;
          id v229 = 0;
          id v51 = +[AMDJSDebugDataSync testfullSyncInitiation:&v229];
          objc_storeStrong(&v231, v229);
          id v230 = v51;
          [v399 setObject:v51 forKey:@"drResponse"];
          objc_storeStrong(&v230, 0);
          objc_storeStrong(&v231, 0);
        }
        else if ([v400 isEqualToString:@"test_DR_fullSyncDataIngestion"])
        {
          id v228 = 0;
          id v226 = 0;
          id v50 = +[AMDJSDebugDataSync testfullSyncDataIngestion:&v226];
          objc_storeStrong(&v228, v226);
          id v227 = v50;
          [v399 setObject:v50 forKey:@"drResponse"];
          objc_storeStrong(&v227, 0);
          objc_storeStrong(&v228, 0);
        }
        else if ([v400 isEqualToString:@"test_DR_fullSyncRequestCompletion"])
        {
          id v225 = 0;
          id v223 = 0;
          id v49 = +[AMDJSDebugDataSync testfullSyncRequestCompletion:&v223];
          objc_storeStrong(&v225, v223);
          id v224 = v49;
          [v399 setObject:v49 forKey:@"drResponse"];
          objc_storeStrong(&v224, 0);
          objc_storeStrong(&v225, 0);
        }
        else if ([v400 isEqualToString:@"test_DR_eventDeltaAlgorithm"])
        {
          id v222 = 0;
          id v220 = 0;
          id v48 = +[AMDJSDebugDataSync testEventDeltaAlgorithm:&v220];
          objc_storeStrong(&v222, v220);
          id v221 = v48;
          [v399 setObject:v48 forKey:@"drResponse"];
          objc_storeStrong(&v221, 0);
          objc_storeStrong(&v222, 0);
        }
        else if ([v400 isEqualToString:@"fetch_device_ID"])
        {
          id v219 = 0;
          id v217 = 0;
          id v47 = +[AMDDataSync fetchDeviceID:&v217];
          objc_storeStrong(&v219, v217);
          id v218 = v47;
          if (v219)
          {
            id v45 = v399;
            id v46 = (id)[v219 localizedDescription];
            objc_msgSend(v45, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v218 forKey:@"drResponse"];
          }
          objc_storeStrong(&v218, 0);
          objc_storeStrong(&v219, 0);
        }
        else if ([v400 isEqualToString:@"fetch_kv_store"])
        {
          id v216 = 0;
          id v214 = 0;
          id v44 = +[AMDKVStore fetchAllKeyValues:&v214];
          objc_storeStrong(&v216, v214);
          id v215 = v44;
          if (v216)
          {
            id v42 = v399;
            id v43 = (id)[v216 localizedDescription];
            objc_msgSend(v42, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v215 forKey:@"kvResponse"];
          }
          objc_storeStrong(&v215, 0);
          objc_storeStrong(&v216, 0);
        }
        else if ([v400 isEqualToString:@"add_pir_call_handle"])
        {
          id v213 = 0;
          id v212 = 0;
          +[AMDKVStore setValue:&unk_26BEC24B8 forKey:@"test_call_handle" error:&v212];
          objc_storeStrong(&v213, v212);
          if (v213)
          {
            id v40 = v399;
            id v41 = (id)[v213 localizedDescription];
            objc_msgSend(v40, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:@"success" forKey:@"pirCallHandleAdd"];
          }
          objc_storeStrong(&v213, 0);
        }
        else if ([v400 isEqualToString:@"test_pir"])
        {
          id v39 = (id)[v402[0] objectForKey:@"testPayload"];
          id v211 = +[AMDPirTest testPir:](AMDPirTest, "testPir:");

          [v399 setObject:v211 forKey:@"pirTestStatus"];
          objc_storeStrong(&v211, 0);
        }
        else if ([v400 isEqualToString:@"test_batched_sql_queries"])
        {
          id v210 = +[AMDJSCustomAggregator runBatchedSQLDescriptorsUsing:v402[0] error:v401];
          [v399 setObject:v210 forKey:@"aggregationResult"];
          objc_storeStrong(&v210, 0);
        }
        else if ([v400 isEqualToString:@"test_sql_event_truncation"])
        {
          id v38 = (id)[v402[0] objectForKey:@"testPayload"];
          id v209 = +[AMDSQLite trimEventsForStreams:error:](AMDSQLite, "trimEventsForStreams:error:");

          if (*v401)
          {
            id v37 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v209 forKey:@"eventDeletionSummary"];
          }
          objc_storeStrong(&v209, 0);
        }
        else if ([v400 isEqualToString:@"test_get_version"])
        {
          id v36 = +[AMDJSRequestHandler getVersion];
          objc_msgSend(v399, "setObject:forKey:");
        }
        else if ([v400 isEqualToString:@"test_vector_db_init"])
        {
          id v208 = &unk_26BEC24E0;
          v417 = @"dbConfigArray";
          id v416 = v208;
          id v35 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v416);
          id v418 = v35;
          id v207 = (id)[NSDictionary dictionaryWithObjects:&v418 forKeys:&v417 count:1];

          id v206 = +[AMDVectorDBManager createVectorDBWithCreateDBPayload:v207 error:v401];
          if (*v401)
          {
            id v34 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v206 forKey:@"response"];
          }
          objc_storeStrong(&v206, 0);
          objc_storeStrong(&v207, 0);
          objc_storeStrong(&v208, 0);
        }
        else if ([v400 isEqualToString:@"test_vector_db_insert"])
        {
          id v205 = &unk_26BEC2508;
          id v204 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v203 = objc_alloc_init(MEMORY[0x263EFF980]);
          for (int i = 1; i <= 32; ++i)
          {
            id v33 = (id)[NSNumber numberWithInt:i];
            objc_msgSend(v203, "addObject:");
          }
          for (int j = 1; j <= 5000; ++j)
          {
            id v415 = v203;
            id v32 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v415 count:1];
            id v31 = (id)[NSNumber numberWithInt:j];
            id v30 = (id)[v31 stringValue];
            objc_msgSend(v204, "setObject:forKey:", v32);
          }
          v413[0] = @"vectorDBConfig";
          v414[0] = v205;
          v413[1] = @"vectorDict";
          v414[1] = v204;
          id v200 = (id)[NSDictionary dictionaryWithObjects:v414 forKeys:v413 count:2];
          id v199 = +[AMDVectorDBManager insertVectorsHandlerWithInsertVectorsPayload:v200 error:v401];
          if (*v401)
          {
            id v29 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v199 forKey:@"response"];
          }
          objc_storeStrong(&v199, 0);
          objc_storeStrong(&v200, 0);
          objc_storeStrong(&v203, 0);
          objc_storeStrong(&v204, 0);
          objc_storeStrong(&v205, 0);
        }
        else if ([v400 isEqualToString:@"test_vector_db_search"])
        {
          id v198 = &unk_26BEC2530;
          id v197 = objc_alloc_init(MEMORY[0x263EFF980]);
          for (int k = 1; k <= 32; ++k)
          {
            id v28 = (id)[NSNumber numberWithInt:k];
            objc_msgSend(v197, "addObject:");
          }
          v411 = @"queryVector";
          id v412 = v197;
          id v195 = (id)[NSDictionary dictionaryWithObjects:&v412 forKeys:&v411 count:1];
          v409[0] = @"vectorDBConfig";
          v410[0] = v198;
          v409[1] = @"queryDict";
          v410[1] = v195;
          id v194 = (id)[NSDictionary dictionaryWithObjects:v410 forKeys:v409 count:2];
          id v193 = +[AMDVectorDBManager runVectorDBSearchWithSearchPayload:v194 error:v401];
          if (*v401)
          {
            id v27 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v193 forKey:@"response"];
          }
          objc_storeStrong(&v193, 0);
          objc_storeStrong(&v194, 0);
          objc_storeStrong(&v195, 0);
          objc_storeStrong(&v197, 0);
          objc_storeStrong(&v198, 0);
        }
        else if ([v400 isEqualToString:@"test_vector_db_delete"])
        {
          id v192 = &unk_26BEC2558;
          v407 = @"vectorDBConfig";
          id v408 = v192;
          id v191 = (id)[NSDictionary dictionaryWithObjects:&v408 forKeys:&v407 count:1];
          id v190 = +[AMDVectorDBManager clearVectorsHandlerWithClearVectorDBPayload:v191 error:v401];
          if (*v401)
          {
            id v26 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v190 forKey:@"response"];
          }
          objc_storeStrong(&v190, 0);
          objc_storeStrong(&v191, 0);
          objc_storeStrong(&v192, 0);
        }
        else if ([v400 isEqualToString:@"test_vector_db_file_delete"])
        {
          id v189 = (id)[v402[0] objectForKey:@"vectorDBName"];
          v405 = @"dbName";
          id v406 = v189;
          id v188 = (id)[NSDictionary dictionaryWithObjects:&v406 forKeys:&v405 count:1];
          id v187 = +[AMDVectorDBManager deleteVectorDatabaseWithDeletionPayload:v188 error:v401];
          if (*v401)
          {
            id v25 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v187 forKey:@"response"];
          }
          objc_storeStrong(&v187, 0);
          objc_storeStrong(&v188, 0);
          objc_storeStrong(&v189, 0);
        }
        else if ([v400 isEqualToString:@"test_swift_str_to_int"])
        {
          id v186 = (id)[v402[0] objectForKey:@"strValue"];
          id v185 = +[AMDSwiftTests strToIntWithStrValue:v186];
          [v399 setObject:v185 forKey:@"result"];
          objc_storeStrong(&v185, 0);
          objc_storeStrong(&v186, 0);
        }
        else if ([v400 isEqualToString:@"test_sql_add_table_schema"])
        {
          id v184 = (id)[v402[0] objectForKey:@"table_name"];
          id v183 = (id)[v402[0] objectForKey:@"table_schema"];
          id v182 = +[AMDSQLite getSharedInstance];
          id v181 = (id)[v182 getDataSchema];
          id v180 = (id)[v181 addTable:v184 withSchema:v183 error:v401];
          if (*v401)
          {
            id v24 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v180 forKey:@"schemaAddSummary"];
            id v179 = (id)[v182 applySchema:v181 error:v401];
            if (*v401)
            {
              id v23 = (id)[*v401 localizedDescription];
              objc_msgSend(v399, "setObject:forKey:");
            }
            else
            {
              [v399 setObject:v179 forKey:@"schemaApplySummary"];
            }
            objc_storeStrong(&v179, 0);
          }
          objc_storeStrong(&v180, 0);
          objc_storeStrong(&v181, 0);
          objc_storeStrong(&v182, 0);
          objc_storeStrong(&v183, 0);
          objc_storeStrong(&v184, 0);
        }
        else if ([v400 isEqualToString:@"test_sql_create_indexes"])
        {
          id v178 = (id)[v402[0] objectForKey:AMD_SQLITE_SCHEMA_INDICES];
          id v177 = +[AMDSQLite getSharedInstance];
          id v176 = (id)[v177 getDataSchema];
          id v175 = (id)[v176 addIndices:v178 error:v401];
          if (*v401)
          {
            id v22 = (id)[*v401 localizedDescription];
            objc_msgSend(v399, "setObject:forKey:");
          }
          else
          {
            [v399 setObject:v175 forKey:@"indexesAddSummary"];
            id v174 = (id)[v177 applySchema:v176 error:v401];
            if (*v401)
            {
              id v21 = (id)[*v401 localizedDescription];
              objc_msgSend(v399, "setObject:forKey:");
            }
            else
            {
              [v399 setObject:v174 forKey:@"schemaApplySummary"];
            }
            objc_storeStrong(&v174, 0);
          }
          objc_storeStrong(&v175, 0);
          objc_storeStrong(&v176, 0);
          objc_storeStrong(&v177, 0);
          objc_storeStrong(&v178, 0);
        }
        else
        {
          id v173 = (id)[NSString stringWithFormat:@"Action '%@' not found", v400];
          [v399 setObject:v173 forKey:@"status"];
          objc_storeStrong(&v173, 0);
        }
      }
LABEL_345:
      id v404 = v399;
      int v394 = 1;
      goto LABEL_346;
    }
    id v287 = +[AMDTasteProfile getPurchasedAppsSet:v401];
    if (*v401)
    {
      os_log_t v286 = (os_log_t)&_os_log_internal;
      os_log_type_t v285 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v286, OS_LOG_TYPE_INFO))
      {
        v92 = v286;
        os_log_type_t v93 = v285;
        id v94 = (id)[*v401 localizedDescription];
        id v284 = v94;
        __os_log_helper_16_2_1_8_64((uint64_t)v436, (uint64_t)v284);
        _os_log_impl(&dword_20ABD4000, v92, v93, "Error fetching purchased apps: %@", v436, 0xCu);

        objc_storeStrong(&v284, 0);
      }
      objc_storeStrong((id *)&v286, 0);
      id v404 = 0;
      int v394 = 1;
    }
    else
    {
      id v91 = (id)[v287 allObjects];
      objc_msgSend(v399, "setObject:forKey:");

      int v394 = 0;
    }
    objc_storeStrong(&v287, 0);
    if (!v394) {
      goto LABEL_345;
    }
  }
LABEL_346:
  objc_storeStrong(&v399, 0);
  objc_storeStrong(&v400, 0);
  objc_storeStrong(v402, 0);
  v19 = v404;

  return v19;
}

+ (id)testInference:(id)a3 error:(id *)a4
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v107 = a4;
  id v106 = (id)[location[0] objectForKey:@"inferencePayload"];
  if (v106)
  {
    id v101 = (id)[v106 objectForKey:0x26BEAE298];
    id v36 = (void *)MEMORY[0x263EFFA08];
    id v37 = (id)[v106 objectForKey:0x26BEB87B8];
    id v100 = (id)objc_msgSend(v36, "setWithArray:");

    if (v101 && v100)
    {
      int64_t v98 = +[AMDDomains getCodeForDomain:v101];
      if (v98)
      {
        id v96 = (id)[location[0] objectForKey:@"inferenceWorkflow"];
        if (v96)
        {
          +[AMDWorkflowInFlight saveWorkflow:v96 forDomain:v98 withCallUUID:@"TEST" error:v107];
          id v92 = &_os_log_internal;
          os_log_type_t v91 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v92, OS_LOG_TYPE_INFO))
          {
            id v34 = v92;
            os_log_type_t v35 = v91;
            __os_log_helper_16_0_0(v90);
            _os_log_impl(&dword_20ABD4000, v34, v35, "Saved the model workflow successfully.", v90, 2u);
          }
          objc_storeStrong(&v92, 0);
          id v89 = (id)[location[0] objectForKey:@"tasteProfiles"];
          if (!v89) {
            goto LABEL_44;
          }
          id v88 = (id)[v89 objectForKey:@"serverTasteProfiles"];
          if (!v88) {
            goto LABEL_28;
          }
          memset(__b, 0, sizeof(__b));
          id v32 = v88;
          uint64_t v33 = [v32 countByEnumeratingWithState:__b objects:v118 count:16];
          if (v33)
          {
            uint64_t v29 = *(void *)__b[2];
            uint64_t v30 = 0;
            unint64_t v31 = v33;
            while (1)
            {
              uint64_t v28 = v30;
              if (*(void *)__b[2] != v29) {
                objc_enumerationMutation(v32);
              }
              uint64_t v87 = *(void *)(__b[1] + 8 * v30);
              id v4 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:v87 inDomain:@"apps" forSource:0x26BEB7E98 error:v107];
              if (*v107) {
                break;
              }
              ++v30;
              if (v28 + 1 >= v31)
              {
                uint64_t v30 = 0;
                unint64_t v31 = [v32 countByEnumeratingWithState:__b objects:v118 count:16];
                if (!v31) {
                  goto LABEL_26;
                }
              }
            }
            id v109 = 0;
            int v102 = 1;
          }
          else
          {
LABEL_26:
            int v102 = 0;
          }

          if (!v102)
          {
LABEL_28:
            id v85 = (id)[v89 objectForKey:@"onDeviceTasteProfiles"];
            if (!v85) {
              goto LABEL_39;
            }
            memset(v83, 0, sizeof(v83));
            id v26 = v85;
            uint64_t v27 = [v26 countByEnumeratingWithState:v83 objects:v117 count:16];
            if (v27)
            {
              uint64_t v23 = *(void *)v83[2];
              uint64_t v24 = 0;
              unint64_t v25 = v27;
              while (1)
              {
                uint64_t v22 = v24;
                if (*(void *)v83[2] != v23) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v84 = *(void *)(v83[1] + 8 * v24);
                id v5 = +[AMDTasteProfile saveTasteProfileEntriesFromDict:v84 inDomain:@"apps" forSource:0x26BEB7E78 error:v107];
                if (*v107) {
                  break;
                }
                ++v24;
                if (v22 + 1 >= v25)
                {
                  uint64_t v24 = 0;
                  unint64_t v25 = [v26 countByEnumeratingWithState:v83 objects:v117 count:16];
                  if (!v25) {
                    goto LABEL_37;
                  }
                }
              }
              id v109 = 0;
              int v102 = 1;
            }
            else
            {
LABEL_37:
              int v102 = 0;
            }

            if (!v102)
            {
LABEL_39:
              id v82 = &_os_log_internal;
              os_log_type_t v81 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_INFO))
              {
                v20 = v82;
                os_log_type_t v21 = v81;
                __os_log_helper_16_0_0(v80);
                _os_log_impl(&dword_20ABD4000, v20, v21, "Saved the model taste profiles successfully.", v80, 2u);
              }
              objc_storeStrong(&v82, 0);
              int v102 = 0;
            }
            objc_storeStrong(&v85, 0);
          }
          objc_storeStrong(&v88, 0);
          if (!v102)
          {
LABEL_44:
            id v79 = (id)[v96 objectForKey:0x26BEAE8D8];
            id v78 = (id)[v96 objectForKey:0x26BEB05B8];
            id v77 = +[AMDModel getModelInfo:v79 error:v107];
            if (!*v107 && v77) {
              +[AMDModelDownloader deleteModelFromStorage:v77 isVersionChange:0 error:v107];
            }
            if (v78)
            {
              id v76 = +[AMDModel getModelInfo:v78 error:v107];
              if (!*v107 && v76) {
                +[AMDModelDownloader deleteModelFromStorage:v76 isVersionChange:0 error:v107];
              }
              objc_storeStrong(&v76, 0);
            }
            if (*v107)
            {
              uint64_t v75 = @"Unable to reset Models table and delete older models";
              id v74 = &_os_log_internal;
              os_log_type_t v73 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled((os_log_t)v74, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v116, (uint64_t)v75);
                _os_log_error_impl(&dword_20ABD4000, (os_log_t)v74, v73, "%@", v116, 0xCu);
              }
              objc_storeStrong(&v74, 0);
              *id v107 = +[AMDError allocError:15 withMessage:v75];
              id v109 = 0;
              int v102 = 1;
              objc_storeStrong((id *)&v75, 0);
            }
            else
            {
              id v6 = +[AMDModel deleteAllModelUrls:v107];
              id v72 = (id)[location[0] objectForKey:@"modelDownloadPayload"];
              if (v72)
              {
                memset(v67, 0, sizeof(v67));
                id v18 = v72;
                uint64_t v19 = [v18 countByEnumeratingWithState:v67 objects:v114 count:16];
                if (v19)
                {
                  uint64_t v15 = *(void *)v67[2];
                  uint64_t v16 = 0;
                  unint64_t v17 = v19;
                  while (1)
                  {
                    uint64_t v14 = v16;
                    if (*(void *)v67[2] != v15) {
                      objc_enumerationMutation(v18);
                    }
                    id v68 = *(id *)(v67[1] + 8 * v16);
                    id v7 = +[AMDModelDownloader processModelDownload:v68 withStorefrontID:@"143441" error:v107];
                    if (*v107) {
                      break;
                    }
                    id v66 = &_os_log_internal;
                    os_log_type_t v65 = OS_LOG_TYPE_ERROR;
                    if (os_log_type_enabled((os_log_t)v66, OS_LOG_TYPE_ERROR))
                    {
                      id v11 = v66;
                      os_log_type_t v12 = v65;
                      id v13 = (id)[v68 objectForKey:@"modelId"];
                      id v64 = v13;
                      __os_log_helper_16_2_1_8_64((uint64_t)v113, (uint64_t)v64);
                      _os_log_error_impl(&dword_20ABD4000, v11, v12, "Saved the compiled model %@ successfully", v113, 0xCu);

                      objc_storeStrong(&v64, 0);
                    }
                    objc_storeStrong(&v66, 0);
                    ++v16;
                    if (v14 + 1 >= v17)
                    {
                      uint64_t v16 = 0;
                      unint64_t v17 = [v18 countByEnumeratingWithState:v67 objects:v114 count:16];
                      if (!v17) {
                        goto LABEL_70;
                      }
                    }
                  }
                  id v109 = 0;
                  int v102 = 1;
                }
                else
                {
LABEL_70:
                  int v102 = 0;
                }

                if (!v102)
                {
                  id v63 = (id)[v106 objectForKey:0x26BEB0DB8];
                  if (v63)
                  {
                    id v61 = (id)[v106 objectForKey:0x26BEB0D98];
                    if (v61)
                    {
                      id v59 = (id)[v106 objectForKey:0x26BEB1038];
                      if (!v59
                        || ((id v58 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x26BEB0F78, v101), [v58 storeFeatureData:v59 error:v107], !*v107)? (v102 = 0): (v109 = 0, v102 = 1), objc_storeStrong(&v58, 0), !v102))
                      {
                        id v57 = (id)[v106 objectForKey:@"auxillaryData"];
                        if (!v57
                          || ((id v56 = +[AMDFeatureProvider getProviderForSource:WithDomain:](AMDFeatureProvider, "getProviderForSource:WithDomain:", 0x26BEB0F78, v101), [v56 storeOutputRemapData:v57 error:v107], !*v107)? (v102 = 0): (v109 = 0, v102 = 1), objc_storeStrong(&v56, 0), !v102))
                        {
                          id v55 = (id)[v106 objectForKey:@"usecaseId"];
                          id v54 = (id)[v106 objectForKey:0x26BEB05F8];
                          id v53 = +[AMDWorkflow getCurrentWorkflowForDomain:v98 andTreatmentId:v54 andUseCaseId:v55 error:v107];
                          if (*v107)
                          {
                            id v109 = 0;
                            int v102 = 1;
                          }
                          else
                          {
                            id v52 = (id)[v53 second];
                            if (!v54)
                            {
                              id v54 = (id)[v53 first];
                            }
                            if (v52 && [v52 count])
                            {
                              id v48 = [[AMDUseCaseWorkflow alloc] initWithDictionary:v52];
                              if ([v48 isValid])
                              {
                                id v10 = (id)[v48 getMaxItemsToDisplay];
                                id v44 = (id)objc_msgSend(v48, "getPredictions:forDomain:error:", ((double)objc_msgSend(v10, "unsignedIntValue")* 1.5), v101, v107);

                                id v43 = (id)[v106 objectForKey:0x26BEB8618];
                                if (v43) {
                                  objc_storeStrong(&v43, v43);
                                }
                                else {
                                  objc_storeStrong(&v43, MEMORY[0x263EFFA78]);
                                }
                                id v42 = (id)[v43 objectForKey:v55];
                                if (v42)
                                {
                                  id v41 = +[AMDJSInference persist:v44 withUsecase:v55 withConfig:v42 domainName:v101];
                                  id v109 = v41;
                                  int v102 = 1;
                                  objc_storeStrong(&v41, 0);
                                }
                                else if (*v107)
                                {
                                  id v109 = 0;
                                  int v102 = 1;
                                }
                                else if (v44)
                                {
                                  id v109 = v44;
                                  int v102 = 1;
                                }
                                else
                                {
                                  id v40 = @"Inference output is nil";
                                  os_log_t v39 = (os_log_t)&_os_log_internal;
                                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                                  {
                                    __os_log_helper_16_2_1_8_64((uint64_t)v110, (uint64_t)v40);
                                    _os_log_error_impl(&dword_20ABD4000, v39, OS_LOG_TYPE_ERROR, "%@", v110, 0xCu);
                                  }
                                  objc_storeStrong((id *)&v39, 0);
                                  *id v107 = +[AMDError allocError:15 withMessage:v40];
                                  id v109 = 0;
                                  int v102 = 1;
                                  objc_storeStrong((id *)&v40, 0);
                                }
                                objc_storeStrong(&v42, 0);
                                objc_storeStrong(&v43, 0);
                                objc_storeStrong(&v44, 0);
                              }
                              else
                              {
                                id v47 = (id)[NSString stringWithFormat:@"invalid workflow for use case %@, treatment %@", v55, v54];
                                os_log_t v46 = (os_log_t)&_os_log_internal;
                                os_log_type_t v45 = OS_LOG_TYPE_ERROR;
                                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                                {
                                  __os_log_helper_16_2_1_8_64((uint64_t)v111, (uint64_t)v47);
                                  _os_log_error_impl(&dword_20ABD4000, v46, v45, "%@", v111, 0xCu);
                                }
                                objc_storeStrong((id *)&v46, 0);
                                *id v107 = +[AMDError allocError:15 withMessage:v47];
                                id v109 = 0;
                                int v102 = 1;
                                objc_storeStrong(&v47, 0);
                              }
                              objc_storeStrong(&v48, 0);
                            }
                            else
                            {
                              id v51 = (id)[NSString stringWithFormat:@"no workflow for use case %@, treatment %@", v55, v54];
                              os_log_t oslog = (os_log_t)&_os_log_internal;
                              os_log_type_t v49 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                              {
                                __os_log_helper_16_2_1_8_64((uint64_t)v112, (uint64_t)v51);
                                _os_log_error_impl(&dword_20ABD4000, oslog, v49, "%@", v112, 0xCu);
                              }
                              objc_storeStrong((id *)&oslog, 0);
                              *id v107 = +[AMDError allocError:15 withMessage:v51];
                              id v109 = 0;
                              int v102 = 1;
                              objc_storeStrong(&v51, 0);
                            }
                            objc_storeStrong(&v52, 0);
                          }
                          objc_storeStrong(&v53, 0);
                          objc_storeStrong(&v54, 0);
                          objc_storeStrong(&v55, 0);
                        }
                        objc_storeStrong(&v57, 0);
                      }
                      objc_storeStrong(&v59, 0);
                    }
                    else
                    {
                      id v60 = @"Missing dsId";
                      *id v107 = +[AMDError allocError:15 withMessage:v60];
                      id v109 = 0;
                      int v102 = 1;
                      objc_storeStrong((id *)&v60, 0);
                    }
                    objc_storeStrong(&v61, 0);
                  }
                  else
                  {
                    id v62 = @"Missing storeFrontId";
                    *id v107 = +[AMDError allocError:15 withMessage:v62];
                    id v109 = 0;
                    int v102 = 1;
                    objc_storeStrong((id *)&v62, 0);
                  }
                  objc_storeStrong(&v63, 0);
                }
              }
              else
              {
                id v71 = @"Missing model download payload";
                id v70 = &_os_log_internal;
                os_log_type_t v69 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_2_1_8_64((uint64_t)v115, (uint64_t)v71);
                  _os_log_error_impl(&dword_20ABD4000, (os_log_t)v70, v69, "%@", v115, 0xCu);
                }
                objc_storeStrong(&v70, 0);
                *id v107 = +[AMDError allocError:15 withMessage:v71];
                id v109 = 0;
                int v102 = 1;
                objc_storeStrong((id *)&v71, 0);
              }
              objc_storeStrong(&v72, 0);
            }
            objc_storeStrong(&v77, 0);
            objc_storeStrong(&v78, 0);
            objc_storeStrong(&v79, 0);
          }
          objc_storeStrong(&v89, 0);
        }
        else
        {
          id v95 = @"Missing inference workflow";
          id v94 = &_os_log_internal;
          os_log_type_t v93 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v94, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v119, (uint64_t)v95);
            _os_log_error_impl(&dword_20ABD4000, (os_log_t)v94, v93, "%@", v119, 0xCu);
          }
          objc_storeStrong(&v94, 0);
          *id v107 = +[AMDError allocError:15 withMessage:v95];
          id v109 = 0;
          int v102 = 1;
          objc_storeStrong((id *)&v95, 0);
        }
        objc_storeStrong(&v96, 0);
      }
      else
      {
        os_log_type_t v97 = @"Unknown domain";
        *id v107 = +[AMDError allocError:15 withMessage:v97];
        id v109 = 0;
        int v102 = 1;
        objc_storeStrong((id *)&v97, 0);
      }
    }
    else
    {
      v99 = @"Missing domain or use cases";
      *id v107 = +[AMDError allocError:15 withMessage:v99];
      id v109 = 0;
      int v102 = 1;
      objc_storeStrong((id *)&v99, 0);
    }
    objc_storeStrong(&v100, 0);
    objc_storeStrong(&v101, 0);
  }
  else
  {
    v105 = @"Missing inference payload";
    id v104 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v104, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v120, (uint64_t)v105);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v104, type, "%@", v120, 0xCu);
    }
    objc_storeStrong(&v104, 0);
    *id v107 = +[AMDError allocError:15 withMessage:v105];
    id v109 = 0;
    int v102 = 1;
    objc_storeStrong((id *)&v105, 0);
  }
  objc_storeStrong(&v106, 0);
  objc_storeStrong(location, 0);
  id v8 = v109;

  return v8;
}

+ (void)handleAsyncDebugRequest:(id)a3 withCompletionHandler:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v49 = 0;
  objc_storeStrong(&v49, a4);
  id v48 = 0;
  id v47 = (id)[location[0] objectForKey:@"event"];
  if ([v47 isEqualToString:@"query_search_tool"])
  {
    os_log_type_t v12 = objc_alloc_init(_TtC19AppleMediaDiscovery22SearchToolQueryHandler);
    id v11 = location[0];
    uint64_t v40 = MEMORY[0x263EF8330];
    int v41 = -1073741824;
    int v42 = 0;
    id v43 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke;
    id v44 = &unk_263FE1BB8;
    id v46 = v49;
    id v45 = v48;
    [(SearchToolQueryHandler *)v12 querySearchToolWithSearchtoolQueryConfig:v11 completionHandler:&v40];

    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
  }
  else if ([v47 isEqualToString:@"filter_fitcored_catalog"])
  {
    id v10 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    id v9 = location[0];
    uint64_t v33 = MEMORY[0x263EF8330];
    int v34 = -1073741824;
    int v35 = 0;
    id v36 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_2;
    id v37 = &unk_263FE1BB8;
    id v39 = v49;
    id v38 = v48;
    [(FitCoreDQueryClass *)v10 filterFitcoreDCatalogDebugWithCatalogFilterConfig:v9 completionHandler:&v33];

    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else if ([v47 isEqualToString:@"fetch_workout_info"])
  {
    id v8 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    id v7 = location[0];
    uint64_t v26 = MEMORY[0x263EF8330];
    int v27 = -1073741824;
    int v28 = 0;
    uint64_t v29 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_3;
    uint64_t v30 = &unk_263FE1BB8;
    id v32 = v49;
    id v31 = v48;
    [(FitCoreDQueryClass *)v8 queryWorkoutReferencesWithWorkoutQueryConfig:v7 completionHandler:&v26];

    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else if ([v47 isEqualToString:@"fetch_catalog"])
  {
    id v6 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    uint64_t v20 = MEMORY[0x263EF8330];
    int v21 = -1073741824;
    int v22 = 0;
    uint64_t v23 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_4;
    uint64_t v24 = &unk_263FE1BE0;
    id v25 = v49;
    [(FitCoreDQueryClass *)v6 fetchCatalogMetadataWithCompletionHandler:&v20];

    objc_storeStrong(&v25, 0);
  }
  else if ([v47 isEqualToString:@"fetch_bootstrap_catalog"])
  {
    id v5 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
    id v4 = location[0];
    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    unint64_t v17 = __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_555;
    id v18 = &unk_263FE1BE0;
    id v19 = v49;
    [(FitCoreDQueryClass *)v5 runBootstrapCatalogSyncWithBootstrapCatalogSyncConfig:v4 completionHandler:&v14];

    objc_storeStrong(&v19, 0);
  }
  else
  {
    (*((void (**)(id, void *, id))v49 + 2))(v49, &unk_26BEC2580, v48);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_4(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v16 = 0;
  objc_storeStrong(&v16, a3);
  v15[1] = a1;
  if (v16)
  {
    v15[0] = &_os_log_internal;
    char v14 = 16;
    if (os_log_type_enabled((os_log_t)v15[0], OS_LOG_TYPE_ERROR))
    {
      log = v15[0];
      os_log_type_t type = v14;
      id v7 = (id)[v16 localizedDescription];
      id v13 = v7;
      __os_log_helper_16_2_1_8_64((uint64_t)v18, (uint64_t)v13);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Data fetch from fitcored failed with error: %@", v18, 0xCu);

      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(v15, 0);
    (*(void (**)(void))(a1[4] + 16))();
  }
  id v12 = &_os_log_internal;
  char v11 = 1;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    v3 = v12;
    os_log_type_t v4 = v11;
    __os_log_helper_16_0_0(v10);
    _os_log_impl(&dword_20ABD4000, v3, v4, "Calling completion handler", v10, 2u);
  }
  objc_storeStrong(&v12, 0);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __67__AMDJSDebugHandler_handleAsyncDebugRequest_withCompletionHandler___block_invoke_555(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

@end