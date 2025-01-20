@interface MPCPlaybackEngineLoggingConsumer
+ (NSString)identifier;
- (BOOL)_logAccountEvent:(id)a3 subscription:(id)a4 cursor:(id)a5;
- (MPCPlaybackEngineEvent)lastTimeControlStatusEvent;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (__CFString)_symbolForCommand:(__CFString *)result;
- (id)_playbackBarWithElapsedTime:(double)a3 duration:(double)a4;
- (void)_chartWithLevel:(void *)a1 type:;
- (void)_updateChartWithEvent:(uint64_t)a1;
- (void)setLastTimeControlStatusEvent:(id)a3;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCPlaybackEngineLoggingConsumer

- (void)subscribeToEventStream:(id)a3
{
  uint64_t v3 = MEMORY[0x270FA5388](self, a2, a3);
  v5 = v4;
  uint64_t v6 = v3;
  uint64_t v384 = *MEMORY[0x263EF8340];
  id v7 = v4;
  objc_storeStrong((id *)(v6 + 64), v5);
  *(void *)(v6 + 56) = -1;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = MSVLogDateFormatter();
    v10 = (void *)MEMORY[0x263EFF910];
    MSVGetProcessLaunchTime();
    v11 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
    v12 = [v9 stringFromDate:v11];
    v13 = [v7 streamID];
    v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [v14 infoDictionary];
    v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263EFFB68]];
    *(_DWORD *)buf = 138544130;
    v377 = v12;
    __int16 v378 = 2114;
    v379 = v13;
    __int16 v380 = 2114;
    v381 = v16;
    __int16 v382 = 1024;
    pid_t v383 = getpid();
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@  ═════ STREAM START ═══════════ %{public}@ [%d] ══════════════════════════", buf, 0x26u);
  }
  v17 = *(void **)(v6 + 64);
  v374[0] = MEMORY[0x263EF8330];
  v374[1] = 3221225472;
  v374[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke;
  v374[3] = &unk_2643BEDC0;
  v374[4] = v6;
  id v18 = v7;
  id v375 = v18;
  [v17 subscribeToEventType:@"session-begin" handler:v374];
  v19 = *(void **)(v6 + 64);
  v372[0] = MEMORY[0x263EF8330];
  v372[1] = 3221225472;
  v372[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_3;
  v372[3] = &unk_2643BEDC0;
  v372[4] = v6;
  id v20 = v18;
  id v373 = v20;
  [v19 subscribeToEventType:@"session-reuse" handler:v372];
  v21 = *(void **)(v6 + 64);
  v370[0] = MEMORY[0x263EF8330];
  v370[1] = 3221225472;
  v370[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_4;
  v370[3] = &unk_2643BEDC0;
  v370[4] = v6;
  id v22 = v20;
  id v371 = v22;
  [v21 subscribeToEventType:@"session-end" handler:v370];
  v23 = *(void **)(v6 + 64);
  v368[0] = MEMORY[0x263EF8330];
  v368[1] = 3221225472;
  v368[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_5;
  v368[3] = &unk_2643BEDC0;
  v368[4] = v6;
  id v24 = v22;
  id v369 = v24;
  [v23 subscribeToEventType:@"session-restore-begin" handler:v368];
  v25 = *(void **)(v6 + 64);
  v366[0] = MEMORY[0x263EF8330];
  v366[1] = 3221225472;
  v366[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_6;
  v366[3] = &unk_2643BEDC0;
  v366[4] = v6;
  id v26 = v24;
  id v367 = v26;
  [v25 subscribeToEventType:@"session-restore-end" handler:v366];
  v27 = *(void **)(v6 + 64);
  v364[0] = MEMORY[0x263EF8330];
  v364[1] = 3221225472;
  v364[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_11;
  v364[3] = &unk_2643BEDC0;
  v364[4] = v6;
  id v28 = v26;
  id v365 = v28;
  [v27 subscribeToEventType:@"session-reset" handler:v364];
  v29 = *(void **)(v6 + 64);
  v362[0] = MEMORY[0x263EF8330];
  v362[1] = 3221225472;
  v362[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_12;
  v362[3] = &unk_2643BEDC0;
  v362[4] = v6;
  id v30 = v28;
  id v363 = v30;
  [v29 subscribeToEventType:@"application-termination" handler:v362];
  v31 = *(void **)(v6 + 64);
  v360[0] = MEMORY[0x263EF8330];
  v360[1] = 3221225472;
  v360[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_13;
  v360[3] = &unk_2643BEDC0;
  v360[4] = v6;
  id v32 = v30;
  id v361 = v32;
  [v31 subscribeToEventType:@"application-foreground" handler:v360];
  v33 = *(void **)(v6 + 64);
  v358[0] = MEMORY[0x263EF8330];
  v358[1] = 3221225472;
  v358[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_14;
  v358[3] = &unk_2643BEDC0;
  v358[4] = v6;
  id v34 = v32;
  id v359 = v34;
  [v33 subscribeToEventType:@"application-background" handler:v358];
  v35 = *(void **)(v6 + 64);
  v356[0] = MEMORY[0x263EF8330];
  v356[1] = 3221225472;
  v356[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_15;
  v356[3] = &unk_2643BEDC0;
  v356[4] = v6;
  id v36 = v34;
  id v357 = v36;
  [v35 subscribeToEventType:@"device-changed" handler:v356];
  v37 = *(void **)(v6 + 64);
  v354[0] = MEMORY[0x263EF8330];
  v354[1] = 3221225472;
  v354[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_18;
  v354[3] = &unk_2643BEDC0;
  v354[4] = v6;
  id v38 = v36;
  id v355 = v38;
  [v37 subscribeToEventType:@"network-reachability-changed" handler:v354];
  v39 = *(void **)(v6 + 64);
  v352[0] = MEMORY[0x263EF8330];
  v352[1] = 3221225472;
  v352[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_19;
  v352[3] = &unk_2643BEDC0;
  v352[4] = v6;
  id v40 = v38;
  id v353 = v40;
  [v39 subscribeToEventType:@"network-type-changed" handler:v352];
  v41 = *(void **)(v6 + 64);
  v350[0] = MEMORY[0x263EF8330];
  v350[1] = 3221225472;
  v350[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_30;
  v350[3] = &unk_2643BEDC0;
  v350[4] = v6;
  id v42 = v40;
  id v351 = v42;
  [v41 subscribeToEventType:@"account-begin" handler:v350];
  v43 = *(void **)(v6 + 64);
  v348[0] = MEMORY[0x263EF8330];
  v348[1] = 3221225472;
  v348[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_2;
  v348[3] = &unk_2643BEDC0;
  v348[4] = v6;
  id v44 = v42;
  id v349 = v44;
  [v43 subscribeToEventType:@"account-update" handler:v348];
  v45 = *(void **)(v6 + 64);
  v346[0] = MEMORY[0x263EF8330];
  v346[1] = 3221225472;
  v346[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_3;
  v346[3] = &unk_2643BEDC0;
  v346[4] = v6;
  id v46 = v44;
  id v347 = v46;
  [v45 subscribeToEventType:@"remote-control-begin" handler:v346];
  v47 = *(void **)(v6 + 64);
  v344[0] = MEMORY[0x263EF8330];
  v344[1] = 3221225472;
  v344[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_31;
  v344[3] = &unk_2643BEDC0;
  v344[4] = v6;
  id v48 = v46;
  id v345 = v48;
  [v47 subscribeToEventType:@"remote-control-timeout" handler:v344];
  v49 = *(void **)(v6 + 64);
  v342[0] = MEMORY[0x263EF8330];
  v342[1] = 3221225472;
  v342[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_47;
  v342[3] = &unk_2643BEDC0;
  v342[4] = v6;
  id v50 = v48;
  id v343 = v50;
  [v49 subscribeToEventType:@"remote-control-end" handler:v342];
  v51 = *(void **)(v6 + 64);
  v340[0] = MEMORY[0x263EF8330];
  v340[1] = 3221225472;
  v340[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_48;
  v340[3] = &unk_2643BEDC0;
  v340[4] = v6;
  id v52 = v50;
  id v341 = v52;
  [v51 subscribeToEventType:@"remote-control-commands-changed" handler:v340];
  v53 = *(void **)(v6 + 64);
  v338[0] = MEMORY[0x263EF8330];
  v338[1] = 3221225472;
  v338[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_88;
  v338[3] = &unk_2643BEDC0;
  v338[4] = v6;
  id v54 = v52;
  id v339 = v54;
  [v53 subscribeToEventType:@"queue-add" handler:v338];
  v55 = *(void **)(v6 + 64);
  v336[0] = MEMORY[0x263EF8330];
  v336[1] = 3221225472;
  v336[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_95;
  v336[3] = &unk_2643BEDC0;
  v336[4] = v6;
  id v56 = v54;
  id v337 = v56;
  [v55 subscribeToEventType:@"queue-item-add" handler:v336];
  v57 = *(void **)(v6 + 64);
  v334[0] = MEMORY[0x263EF8330];
  v334[1] = 3221225472;
  v334[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_96;
  v334[3] = &unk_2643BEDC0;
  v334[4] = v6;
  id v58 = v56;
  id v335 = v58;
  [v57 subscribeToEventType:@"queue-item-remove" handler:v334];
  v59 = *(void **)(v6 + 64);
  v332[0] = MEMORY[0x263EF8330];
  v332[1] = 3221225472;
  v332[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_97;
  v332[3] = &unk_2643BEDC0;
  v332[4] = v6;
  id v60 = v58;
  id v333 = v60;
  [v59 subscribeToEventType:@"queue-item-reorder" handler:v332];
  v61 = *(void **)(v6 + 64);
  v330[0] = MEMORY[0x263EF8330];
  v330[1] = 3221225472;
  v330[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_98;
  v330[3] = &unk_2643BEDC0;
  v330[4] = v6;
  id v62 = v60;
  id v331 = v62;
  [v61 subscribeToEventType:@"queue-load-begin" handler:v330];
  v63 = *(void **)(v6 + 64);
  v328[0] = MEMORY[0x263EF8330];
  v328[1] = 3221225472;
  v328[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_99;
  v328[3] = &unk_2643BEDC0;
  v328[4] = v6;
  id v64 = v62;
  id v329 = v64;
  [v63 subscribeToEventType:@"queue-load-end" handler:v328];
  v65 = *(void **)(v6 + 64);
  v326[0] = MEMORY[0x263EF8330];
  v326[1] = 3221225472;
  v326[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_100;
  v326[3] = &unk_2643BEDC0;
  v326[4] = v6;
  id v66 = v64;
  id v327 = v66;
  [v65 subscribeToEventType:@"container-begin" handler:v326];
  v67 = *(void **)(v6 + 64);
  v324[0] = MEMORY[0x263EF8330];
  v324[1] = 3221225472;
  v324[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_101;
  v324[3] = &unk_2643BEDC0;
  v324[4] = v6;
  id v68 = v66;
  id v325 = v68;
  [v67 subscribeToEventType:@"container-end" handler:v324];
  v69 = *(void **)(v6 + 64);
  v322[0] = MEMORY[0x263EF8330];
  v322[1] = 3221225472;
  v322[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_102;
  v322[3] = &unk_2643BEDC0;
  v322[4] = v6;
  id v70 = v68;
  id v323 = v70;
  [v69 subscribeToEventType:@"item-begin" handler:v322];
  v71 = *(void **)(v6 + 64);
  v320[0] = MEMORY[0x263EF8330];
  v320[1] = 3221225472;
  v320[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_103;
  v320[3] = &unk_2643BEDC0;
  v320[4] = v6;
  id v72 = v70;
  id v321 = v72;
  [v71 subscribeToEventType:@"item-update" handler:v320];
  v73 = *(void **)(v6 + 64);
  v318[0] = MEMORY[0x263EF8330];
  v318[1] = 3221225472;
  v318[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_104;
  v318[3] = &unk_2643BEDC0;
  v318[4] = v6;
  id v74 = v72;
  id v319 = v74;
  [v73 subscribeToEventType:@"item-position-jump" handler:v318];
  v75 = *(void **)(v6 + 64);
  v316[0] = MEMORY[0x263EF8330];
  v316[1] = 3221225472;
  v316[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_105;
  v316[3] = &unk_2643BEDC0;
  v316[4] = v6;
  id v76 = v74;
  id v317 = v76;
  [v75 subscribeToEventType:@"item-position-tick" handler:v316];
  v77 = *(void **)(v6 + 64);
  v314[0] = MEMORY[0x263EF8330];
  v314[1] = 3221225472;
  v314[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_106;
  v314[3] = &unk_2643BEDC0;
  v314[4] = v6;
  id v78 = v76;
  id v315 = v78;
  [v77 subscribeToEventType:@"item-pause" handler:v314];
  v79 = *(void **)(v6 + 64);
  v312[0] = MEMORY[0x263EF8330];
  v312[1] = 3221225472;
  v312[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_107;
  v312[3] = &unk_2643BEDC0;
  v312[4] = v6;
  id v80 = v78;
  id v313 = v80;
  [v79 subscribeToEventType:@"item-rate-changed" handler:v312];
  v81 = *(void **)(v6 + 64);
  v310[0] = MEMORY[0x263EF8330];
  v310[1] = 3221225472;
  v310[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_108;
  v310[3] = &unk_2643BEDC0;
  v310[4] = v6;
  id v82 = v80;
  id v311 = v82;
  [v81 subscribeToEventType:@"item-first-audio-frame" handler:v310];
  if (MSVDeviceOSIsInternalInstall())
  {
    v83 = *(void **)(v6 + 64);
    v308[0] = MEMORY[0x263EF8330];
    v308[1] = 3221225472;
    v308[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_112;
    v308[3] = &unk_2643BEDC0;
    v308[4] = v6;
    id v309 = v82;
    [v83 subscribeToEventType:@"item-ready-for-metrics" handler:v308];
  }
  v84 = *(void **)(v6 + 64);
  v306[0] = MEMORY[0x263EF8330];
  v306[1] = 3221225472;
  v306[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_113;
  v306[3] = &unk_2643BEDC0;
  v306[4] = v6;
  id v85 = v82;
  id v307 = v85;
  [v84 subscribeToEventType:@"item-resume" handler:v306];
  v86 = *(void **)(v6 + 64);
  v304[0] = MEMORY[0x263EF8330];
  v304[1] = 3221225472;
  v304[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_114;
  v304[3] = &unk_2643BEDC0;
  v304[4] = v6;
  id v87 = v85;
  id v305 = v87;
  [v86 subscribeToEventType:@"item-ready-to-play" handler:v304];
  v88 = *(void **)(v6 + 64);
  v302[0] = MEMORY[0x263EF8330];
  v302[1] = 3221225472;
  v302[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_115;
  v302[3] = &unk_2643BEDC0;
  v302[4] = v6;
  id v89 = v87;
  id v303 = v89;
  [v88 subscribeToEventType:@"item-buffer-ready" handler:v302];
  v90 = *(void **)(v6 + 64);
  v300[0] = MEMORY[0x263EF8330];
  v300[1] = 3221225472;
  v300[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_116;
  v300[3] = &unk_2643BEDC0;
  v300[4] = v6;
  id v91 = v89;
  id v301 = v91;
  [v90 subscribeToEventType:@"item-buffer-stall" handler:v300];
  v92 = *(void **)(v6 + 64);
  v298[0] = MEMORY[0x263EF8330];
  v298[1] = 3221225472;
  v298[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_117;
  v298[3] = &unk_2643BEDC0;
  v298[4] = v6;
  id v93 = v91;
  id v299 = v93;
  [v92 subscribeToEventType:@"item-buffer-finish" handler:v298];
  v94 = *(void **)(v6 + 64);
  v296[0] = MEMORY[0x263EF8330];
  v296[1] = 3221225472;
  v296[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_118;
  v296[3] = &unk_2643BEDC0;
  v296[4] = v6;
  id v95 = v93;
  id v297 = v95;
  [v94 subscribeToEventType:@"item-key-request-begin" handler:v296];
  v96 = *(void **)(v6 + 64);
  v294[0] = MEMORY[0x263EF8330];
  v294[1] = 3221225472;
  v294[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_119;
  v294[3] = &unk_2643BEDC0;
  v294[4] = v6;
  id v97 = v95;
  id v295 = v97;
  [v96 subscribeToEventType:@"item-key-request-end" handler:v294];
  v98 = *(void **)(v6 + 64);
  v292[0] = MEMORY[0x263EF8330];
  v292[1] = 3221225472;
  v292[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_120;
  v292[3] = &unk_2643BEDC0;
  v292[4] = v6;
  id v99 = v97;
  id v293 = v99;
  [v98 subscribeToEventType:@"item-timed-metadata-ping" handler:v292];
  v100 = *(void **)(v6 + 64);
  v290[0] = MEMORY[0x263EF8330];
  v290[1] = 3221225472;
  v290[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_121;
  v290[3] = &unk_2643BEDC0;
  v290[4] = v6;
  id v101 = v99;
  id v291 = v101;
  [v100 subscribeToEventType:@"item-end" handler:v290];
  v102 = *(void **)(v6 + 64);
  v288[0] = MEMORY[0x263EF8330];
  v288[1] = 3221225472;
  v288[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_122;
  v288[3] = &unk_2643BEDC0;
  v288[4] = v6;
  id v103 = v101;
  id v289 = v103;
  [v102 subscribeToEventType:@"audio-format-changed" handler:v288];
  v104 = *(void **)(v6 + 64);
  v286[0] = MEMORY[0x263EF8330];
  v286[1] = 3221225472;
  v286[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_123;
  v286[3] = &unk_2643BEDC0;
  v286[4] = v6;
  id v105 = v103;
  id v287 = v105;
  [v104 subscribeToEventType:@"asset-selection" handler:v286];
  v106 = *(void **)(v6 + 64);
  v284[0] = MEMORY[0x263EF8330];
  v284[1] = 3221225472;
  v284[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_128;
  v284[3] = &unk_2643BEDC0;
  v284[4] = v6;
  id v107 = v105;
  id v285 = v107;
  [v106 subscribeToEventType:@"audio-format-selection" handler:v284];
  v108 = *(void **)(v6 + 64);
  v282[0] = MEMORY[0x263EF8330];
  v282[1] = 3221225472;
  v282[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_132;
  v282[3] = &unk_2643BEDC0;
  v282[4] = v6;
  id v109 = v107;
  id v283 = v109;
  [v108 subscribeToEventType:@"asset-load-begin" handler:v282];
  v110 = *(void **)(v6 + 64);
  v280[0] = MEMORY[0x263EF8330];
  v280[1] = 3221225472;
  v280[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_133;
  v280[3] = &unk_2643BEDC0;
  v280[4] = v6;
  id v111 = v109;
  id v281 = v111;
  [v110 subscribeToEventType:@"asset-load-end" handler:v280];
  v112 = *(void **)(v6 + 64);
  v278[0] = MEMORY[0x263EF8330];
  v278[1] = 3221225472;
  v278[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_134;
  v278[3] = &unk_2643BEDC0;
  v278[4] = v6;
  id v113 = v111;
  id v279 = v113;
  [v112 subscribeToEventType:@"item-configuration-begin" handler:v278];
  v114 = *(void **)(v6 + 64);
  v276[0] = MEMORY[0x263EF8330];
  v276[1] = 3221225472;
  v276[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_135;
  v276[3] = &unk_2643BEDC0;
  v276[4] = v6;
  id v115 = v113;
  id v277 = v115;
  [v114 subscribeToEventType:@"item-configuration-end" handler:v276];
  v116 = *(void **)(v6 + 64);
  v274[0] = MEMORY[0x263EF8330];
  v274[1] = 3221225472;
  v274[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_137;
  v274[3] = &unk_2643BEDC0;
  v274[4] = v6;
  id v117 = v115;
  id v275 = v117;
  [v116 subscribeToEventType:@"item-failed" handler:v274];
  v118 = *(void **)(v6 + 64);
  v272[0] = MEMORY[0x263EF8330];
  v272[1] = 3221225472;
  v272[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_138;
  v272[3] = &unk_2643BEDC0;
  v272[4] = v6;
  id v119 = v117;
  id v273 = v119;
  [v118 subscribeToEventType:@"item-placeholder-begin" handler:v272];
  v120 = *(void **)(v6 + 64);
  v270[0] = MEMORY[0x263EF8330];
  v270[1] = 3221225472;
  v270[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_139;
  v270[3] = &unk_2643BEDC0;
  v270[4] = v6;
  id v121 = v119;
  id v271 = v121;
  [v120 subscribeToEventType:@"item-placeholder-end" handler:v270];
  v122 = *(void **)(v6 + 64);
  v268[0] = MEMORY[0x263EF8330];
  v268[1] = 3221225472;
  v268[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_140;
  v268[3] = &unk_2643BEDC0;
  v268[4] = v6;
  id v123 = v121;
  id v269 = v123;
  [v122 subscribeToEventType:@"item-hls-stream-begin" handler:v268];
  v124 = *(void **)(v6 + 64);
  v266[0] = MEMORY[0x263EF8330];
  v266[1] = 3221225472;
  v266[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_141;
  v266[3] = &unk_2643BEDC0;
  v266[4] = v6;
  id v125 = v123;
  id v267 = v125;
  [v124 subscribeToEventType:@"item-hls-stream-end" handler:v266];
  v126 = *(void **)(v6 + 64);
  v264[0] = MEMORY[0x263EF8330];
  v264[1] = 3221225472;
  v264[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_142;
  v264[3] = &unk_2643BEDC0;
  v264[4] = v6;
  id v127 = v125;
  id v265 = v127;
  [v126 subscribeToEventType:@"item-hls-timed-metadata-begin" handler:v264];
  v128 = *(void **)(v6 + 64);
  v262[0] = MEMORY[0x263EF8330];
  v262[1] = 3221225472;
  v262[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_143;
  v262[3] = &unk_2643BEDC0;
  v262[4] = v6;
  id v129 = v127;
  id v263 = v129;
  [v128 subscribeToEventType:@"item-hls-timed-metadata-end" handler:v262];
  v130 = *(void **)(v6 + 64);
  v260[0] = MEMORY[0x263EF8330];
  v260[1] = 3221225472;
  v260[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_144;
  v260[3] = &unk_2643BEDC0;
  v260[4] = v6;
  id v131 = v129;
  id v261 = v131;
  [v130 subscribeToEventType:@"item-transition-created" handler:v260];
  v132 = *(void **)(v6 + 64);
  v258[0] = MEMORY[0x263EF8330];
  v258[1] = 3221225472;
  v258[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_207;
  v258[3] = &unk_2643BEDC0;
  v258[4] = v6;
  id v133 = v131;
  id v259 = v133;
  [v132 subscribeToEventType:@"item-transition-cancelled" handler:v258];
  v134 = *(void **)(v6 + 64);
  v256[0] = MEMORY[0x263EF8330];
  v256[1] = 3221225472;
  v256[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_208;
  v256[3] = &unk_2643BEDC0;
  v256[4] = v6;
  id v135 = v133;
  id v257 = v135;
  [v134 subscribeToEventType:@"transition-will-start" handler:v256];
  v136 = *(void **)(v6 + 64);
  v254[0] = MEMORY[0x263EF8330];
  v254[1] = 3221225472;
  v254[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_209;
  v254[3] = &unk_2643BEDC0;
  v254[4] = v6;
  id v137 = v135;
  id v255 = v137;
  [v136 subscribeToEventType:@"transition-did-end" handler:v254];
  v138 = *(void **)(v6 + 64);
  v252[0] = MEMORY[0x263EF8330];
  v252[1] = 3221225472;
  v252[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_210;
  v252[3] = &unk_2643BEDC0;
  v252[4] = v6;
  id v139 = v137;
  id v253 = v139;
  [v138 subscribeToEventType:@"overlapped-playback-will-start" handler:v252];
  v140 = *(void **)(v6 + 64);
  v250[0] = MEMORY[0x263EF8330];
  v250[1] = 3221225472;
  v250[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_211;
  v250[3] = &unk_2643BEDC0;
  v250[4] = v6;
  id v141 = v139;
  id v251 = v141;
  [v140 subscribeToEventType:@"overlapped-playback-did-end" handler:v250];
  v142 = *(void **)(v6 + 64);
  v248[0] = MEMORY[0x263EF8330];
  v248[1] = 3221225472;
  v248[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_212;
  v248[3] = &unk_2643BEDC0;
  v248[4] = v6;
  id v143 = v141;
  id v249 = v143;
  [v142 subscribeToEventType:@"error-resolution" handler:v248];
  v144 = *(void **)(v6 + 64);
  v246[0] = MEMORY[0x263EF8330];
  v246[1] = 3221225472;
  v246[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_213;
  v246[3] = &unk_2643BEDC0;
  v246[4] = v6;
  id v145 = v143;
  id v247 = v145;
  [v144 subscribeToEventType:@"interrupt-begin" handler:v246];
  v146 = *(void **)(v6 + 64);
  v244[0] = MEMORY[0x263EF8330];
  v244[1] = 3221225472;
  v244[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_214;
  v244[3] = &unk_2643BEDC0;
  v244[4] = v6;
  id v147 = v145;
  id v245 = v147;
  [v146 subscribeToEventType:@"interrupt-end" handler:v244];
  v148 = *(void **)(v6 + 64);
  v242[0] = MEMORY[0x263EF8330];
  v242[1] = 3221225472;
  v242[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_215;
  v242[3] = &unk_2643BEDC0;
  v242[4] = v6;
  id v149 = v147;
  id v243 = v149;
  [v148 subscribeToEventType:@"policy-begin" handler:v242];
  v150 = *(void **)(v6 + 64);
  v240[0] = MEMORY[0x263EF8330];
  v240[1] = 3221225472;
  v240[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_216;
  v240[3] = &unk_2643BEDC0;
  v240[4] = v6;
  id v151 = v149;
  id v241 = v151;
  [v150 subscribeToEventType:@"policy-end" handler:v240];
  v152 = *(void **)(v6 + 64);
  v238[0] = MEMORY[0x263EF8330];
  v238[1] = 3221225472;
  v238[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_217;
  v238[3] = &unk_2643BEDC0;
  v238[4] = v6;
  id v153 = v151;
  id v239 = v153;
  [v152 subscribeToEventType:@"playback-behavior-changed" handler:v238];
  v154 = *(void **)(v6 + 64);
  v236[0] = MEMORY[0x263EF8330];
  v236[1] = 3221225472;
  v236[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_218;
  v236[3] = &unk_2643BEDC0;
  v236[4] = v6;
  id v155 = v153;
  id v237 = v155;
  [v154 subscribeToEventType:@"media-server-died" handler:v236];
  v156 = *(void **)(v6 + 64);
  v234[0] = MEMORY[0x263EF8330];
  v234[1] = 3221225472;
  v234[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_219;
  v234[3] = &unk_2643BEDC0;
  v234[4] = v6;
  id v157 = v155;
  id v235 = v157;
  [v156 subscribeToEventType:@"media-server-reset" handler:v234];
  v158 = *(void **)(v6 + 64);
  v232[0] = MEMORY[0x263EF8330];
  v232[1] = 3221225472;
  v232[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_220;
  v232[3] = &unk_2643BEDC0;
  v232[4] = v6;
  id v159 = v157;
  id v233 = v159;
  [v158 subscribeToEventType:@"media-server-purge" handler:v232];
  v160 = *(void **)(v6 + 64);
  v230[0] = MEMORY[0x263EF8330];
  v230[1] = 3221225472;
  v230[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_221;
  v230[3] = &unk_2643BEDC0;
  v230[4] = v6;
  id v161 = v159;
  id v231 = v161;
  [v160 subscribeToEventType:@"audio-route-changed" handler:v230];
  v162 = *(void **)(v6 + 64);
  v228[0] = MEMORY[0x263EF8330];
  v228[1] = 3221225472;
  v228[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_222;
  v228[3] = &unk_2643BEDC0;
  v228[4] = v6;
  id v163 = v161;
  id v229 = v163;
  [v162 subscribeToEventType:@"audio-rendering-mode-changed" handler:v228];
  v164 = *(void **)(v6 + 64);
  v226[0] = MEMORY[0x263EF8330];
  v226[1] = 3221225472;
  v226[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_223;
  v226[3] = &unk_2643BEDC0;
  v226[4] = v6;
  id v165 = v163;
  id v227 = v165;
  [v164 subscribeToEventType:@"time-control-status-changed" handler:v226];
  v166 = *(void **)(v6 + 64);
  v224[0] = MEMORY[0x263EF8330];
  v224[1] = 3221225472;
  v224[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_225;
  v224[3] = &unk_2643BEDC0;
  v224[4] = v6;
  id v167 = v165;
  id v225 = v167;
  [v166 subscribeToEventType:@"network-operation" handler:v224];
  v168 = *(void **)(v6 + 64);
  v222[0] = MEMORY[0x263EF8330];
  v222[1] = 3221225472;
  v222[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_226;
  v222[3] = &unk_2643BEDC0;
  v222[4] = v6;
  id v169 = v167;
  id v223 = v169;
  [v168 subscribeToEventType:@"player-operation-begin" handler:v222];
  v170 = *(void **)(v6 + 64);
  v220[0] = MEMORY[0x263EF8330];
  v220[1] = 3221225472;
  v220[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_227;
  v220[3] = &unk_2643BEDC0;
  v220[4] = v6;
  id v171 = v169;
  id v221 = v171;
  [v170 subscribeToEventType:@"player-operation-end" handler:v220];
  v172 = *(void **)(v6 + 64);
  v218[0] = MEMORY[0x263EF8330];
  v218[1] = 3221225472;
  v218[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_228;
  v218[3] = &unk_2643BEDC0;
  v218[4] = v6;
  id v173 = v171;
  id v219 = v173;
  [v172 subscribeToEventType:@"reload-current-item-begin" handler:v218];
  v174 = *(void **)(v6 + 64);
  v216[0] = MEMORY[0x263EF8330];
  v216[1] = 3221225472;
  v216[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_229;
  v216[3] = &unk_2643BEDC0;
  v216[4] = v6;
  id v175 = v173;
  id v217 = v175;
  [v174 subscribeToEventType:@"reload-current-item-end" handler:v216];
  v176 = *(void **)(v6 + 64);
  v214[0] = MEMORY[0x263EF8330];
  v214[1] = 3221225472;
  v214[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_230;
  v214[3] = &unk_2643BEDC0;
  v214[4] = v6;
  id v177 = v175;
  id v215 = v177;
  [v176 subscribeToEventType:@"session-activation-begin" handler:v214];
  v178 = *(void **)(v6 + 64);
  v212[0] = MEMORY[0x263EF8330];
  v212[1] = 3221225472;
  v212[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_231;
  v212[3] = &unk_2643BEDC0;
  v212[4] = v6;
  id v179 = v177;
  id v213 = v179;
  [v178 subscribeToEventType:@"session-activation-end" handler:v212];
  v180 = *(void **)(v6 + 64);
  v210[0] = MEMORY[0x263EF8330];
  v210[1] = 3221225472;
  v210[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_232;
  v210[3] = &unk_2643BEDC0;
  v210[4] = v6;
  id v181 = v179;
  id v211 = v181;
  [v180 subscribeToEventType:@"shared-session-begin" handler:v210];
  v182 = *(void **)(v6 + 64);
  v208[0] = MEMORY[0x263EF8330];
  v208[1] = 3221225472;
  v208[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_233;
  v208[3] = &unk_2643BEDC0;
  v208[4] = v6;
  id v183 = v181;
  id v209 = v183;
  [v182 subscribeToEventType:@"shared-session-end" handler:v208];
  v184 = *(void **)(v6 + 64);
  v206[0] = MEMORY[0x263EF8330];
  v206[1] = 3221225472;
  v206[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_234;
  v206[3] = &unk_2643BEDC0;
  v206[4] = v6;
  id v185 = v183;
  id v207 = v185;
  [v184 subscribeToEventType:@"shared-session-participants-changed" handler:v206];
  v186 = *(void **)(v6 + 64);
  v204[0] = MEMORY[0x263EF8330];
  v204[1] = 3221225472;
  v204[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_235;
  v204[3] = &unk_2643BEDC0;
  v204[4] = v6;
  id v187 = v185;
  id v205 = v187;
  [v186 subscribeToEventType:@"shared-session-synchronization-begin" handler:v204];
  v188 = *(void **)(v6 + 64);
  v202[0] = MEMORY[0x263EF8330];
  v202[1] = 3221225472;
  v202[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_236;
  v202[3] = &unk_2643BEDC0;
  v202[4] = v6;
  id v189 = v187;
  id v203 = v189;
  [v188 subscribeToEventType:@"shared-session-synchronization-end" handler:v202];
  v190 = *(void **)(v6 + 64);
  v200[0] = MEMORY[0x263EF8330];
  v200[1] = 3221225472;
  v200[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_237;
  v200[3] = &unk_2643BEDC0;
  v200[4] = v6;
  id v191 = v189;
  id v201 = v191;
  [v190 subscribeToEventType:@"item-vocal-attenuation-changed" handler:v200];
  v192 = *(void **)(v6 + 64);
  v198[0] = MEMORY[0x263EF8330];
  v198[1] = 3221225472;
  v198[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_238;
  v198[3] = &unk_2643BEDC0;
  v198[4] = v6;
  id v193 = v191;
  id v199 = v193;
  [v192 subscribeToEventType:@"vocal-attenuation-statistics" handler:v198];
  v194 = *(void **)(v6 + 64);
  v196[0] = MEMORY[0x263EF8330];
  v196[1] = 3221225472;
  v196[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_239;
  v196[3] = &unk_2643BEDC0;
  v196[4] = v6;
  id v197 = v193;
  id v195 = v193;
  [v194 subscribeToEventType:@"perf-report" handler:v196];
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/logging";
}

void __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"commandType"];
  unsigned int v8 = [v7 integerValue];

  v9 = MPCRemoteCommandDescriptionCopy(v8);
  v10 = [v6 objectForKeyedSubscript:@"supported"];
  LOBYTE(v8) = [v10 BOOLValue];

  if (v8)
  {
    v11 = @"enabled";
    v12 = [v6 objectForKeyedSubscript:@"enabled"];
    char v13 = [v12 BOOLValue];

    if (v13) {
      goto LABEL_6;
    }
    v14 = NSString;
    v15 = [v6 objectForKeyedSubscript:@"disabledReasons"];
    v16 = objc_msgSend(v15, "msv_compactDescription");
    [v14 stringWithFormat:@"disabled: %@", v16];
  }
  else
  {
    v17 = NSString;
    v15 = [v6 objectForKeyedSubscript:@"unsupportedReasons"];
    v16 = objc_msgSend(v15, "msv_compactDescription");
    [v17 stringWithFormat:@"unsupported: %@", v16];
  }
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  id v18 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = [*(id *)(a1 + 40) streamID];
    int v21 = [*(id *)(a1 + 48) threadPriority];
    uint64_t v22 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544898;
    uint64_t v48 = v19;
    __int16 v49 = 2114;
    id v50 = v20;
    __int16 v51 = 1024;
    int v52 = v21;
    __int16 v53 = 2114;
    uint64_t v54 = v22;
    __int16 v55 = 2114;
    id v56 = v5;
    __int16 v57 = 2114;
    id v58 = v9;
    __int16 v59 = 2114;
    id v60 = v11;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ├╴%{public}@ %{public}-40@ [%{public}@]", buf, 0x44u);
  }
  v23 = [v6 objectForKeyedSubscript:@"options"];
  if ([v23 count])
  {
    id v44 = v11;
    v45 = v9;
    id v46 = v6;
    v43 = v23;
    id v24 = [v23 description];
    v25 = [v24 componentsSeparatedByString:@"\n"];

    if ([v25 count])
    {
      for (unint64_t i = 0; i < [v25 count]; ++i)
      {
        v27 = [v25 objectAtIndexedSubscript:i];
        if (i)
        {
          uint64_t v28 = [v25 count] - 1;
          v29 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (i == v28)
          {
            if (v30)
            {
              uint64_t v31 = *(void *)(a1 + 32);
              id v32 = [*(id *)(a1 + 40) streamID];
              int v33 = [*(id *)(a1 + 48) threadPriority];
              uint64_t v34 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138544386;
              uint64_t v48 = v31;
              __int16 v49 = 2114;
              id v50 = v32;
              __int16 v51 = 1024;
              int v52 = v33;
              __int16 v53 = 2114;
              uint64_t v54 = v34;
              __int16 v55 = 2114;
              id v56 = v27;
              v35 = v29;
              id v36 = "|%{public}@ %{public}@ %2i %{public}@  │   ╰ %{public}@";
LABEL_19:
              _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0x30u);
            }
          }
          else if (v30)
          {
            uint64_t v40 = *(void *)(a1 + 32);
            id v32 = [*(id *)(a1 + 40) streamID];
            int v41 = [*(id *)(a1 + 48) threadPriority];
            uint64_t v42 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138544386;
            uint64_t v48 = v40;
            __int16 v49 = 2114;
            id v50 = v32;
            __int16 v51 = 1024;
            int v52 = v41;
            __int16 v53 = 2114;
            uint64_t v54 = v42;
            __int16 v55 = 2114;
            id v56 = v27;
            v35 = v29;
            id v36 = "|%{public}@ %{public}@ %2i %{public}@  │   │ %{public}@";
            goto LABEL_19;
          }
        }
        else
        {
          v29 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = *(void *)(a1 + 32);
            id v32 = [*(id *)(a1 + 40) streamID];
            int v38 = [*(id *)(a1 + 48) threadPriority];
            uint64_t v39 = *(void *)(a1 + 56);
            *(_DWORD *)buf = 138544386;
            uint64_t v48 = v37;
            __int16 v49 = 2114;
            id v50 = v32;
            __int16 v51 = 1024;
            int v52 = v38;
            __int16 v53 = 2114;
            uint64_t v54 = v39;
            __int16 v55 = 2114;
            id v56 = v27;
            v35 = v29;
            id v36 = "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ options: %{public}@";
            goto LABEL_19;
          }
        }
      }
    }

    id v6 = v46;
    v11 = v44;
    v9 = v45;
    v23 = v43;
  }
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  id v6 = [v4 stringFromDate:v5];

  id v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  unsigned int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [*(id *)(a1 + 40) streamID];
    int v10 = [v3 threadPriority];
    v11 = [v3 payload];
    v12 = [v11 objectForKeyedSubscript:@"queue-section-id"];
    int v14 = 138544386;
    v15 = v6;
    __int16 v16 = 2114;
    v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    __int16 v20 = 2114;
    int v21 = v7;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈽 QUEUE LOAD BEGIN           %{public}@", (uint8_t *)&v14, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"private-listening-source"];
  uint64_t v75 = [v5 integerValue];

  id v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-reporting-metadata"];

  unsigned int v8 = [v7 objectForKeyedSubscript:@"private-listening-enabled"];
  uint64_t v77 = [v7 objectForKeyedSubscript:@"application-bundle-id"];
  id v76 = [v7 objectForKeyedSubscript:@"application-version"];
  v9 = [v3 payload];
  v79 = [v9 objectForKeyedSubscript:@"queue-delegated-account-metadata"];

  id v80 = [v7 objectForKeyedSubscript:@"device-metadata"];
  int v10 = MSVLogDateFormatter();
  v11 = [v3 date];
  v81 = [v10 stringFromDate:v11];

  v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  char v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [*(id *)(a1 + 40) streamID];
    int v15 = [v3 threadPriority];
    __int16 v16 = [v3 payload];
    [v16 objectForKeyedSubscript:@"queue-section-id"];
    __int16 v18 = v17 = v8;
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    __int16 v84 = 2114;
    id v85 = v14;
    __int16 v86 = 1024;
    int v87 = v15;
    __int16 v88 = 2114;
    id v89 = v12;
    __int16 v90 = 2114;
    uint64_t v91 = (uint64_t)v18;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀋾 QUEUE ADD                  %{public}@", buf, 0x30u);

    unsigned int v8 = v17;
  }

  int v19 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [*(id *)(a1 + 40) streamID];
    int v22 = [v3 threadPriority];
    v23 = [v3 payload];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"queue-description"];
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    __int16 v84 = 2114;
    id v85 = v21;
    __int16 v86 = 1024;
    int v87 = v22;
    __int16 v88 = 2114;
    id v89 = v19;
    __int16 v90 = 2114;
    uint64_t v91 = (uint64_t)v24;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ queue: %{public}@", buf, 0x30u);
  }
  v25 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [*(id *)(a1 + 40) streamID];
    int v27 = [v3 threadPriority];
    uint64_t v28 = [v3 payload];
    v29 = [v28 objectForKeyedSubscript:@"queue-start-item-ids"];
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    __int16 v84 = 2114;
    id v85 = v26;
    __int16 v86 = 1024;
    int v87 = v27;
    __int16 v88 = 2114;
    id v89 = v19;
    __int16 v90 = 2114;
    uint64_t v91 = (uint64_t)v29;
    _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ start-item: %{public}@", buf, 0x30u);
  }
  BOOL v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [*(id *)(a1 + 40) streamID];
    int v32 = [v3 threadPriority];
    int v33 = [v7 objectForKeyedSubscript:@"feature-name"];
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    __int16 v84 = 2114;
    id v85 = v31;
    __int16 v86 = 1024;
    int v87 = v32;
    __int16 v88 = 2114;
    id v89 = v19;
    __int16 v90 = 2114;
    uint64_t v91 = (uint64_t)v33;
    _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ feature: %{public}@", buf, 0x30u);
  }
  uint64_t v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [*(id *)(a1 + 40) streamID];
    int v36 = [v3 threadPriority];
    uint64_t v37 = [v7 objectForKeyedSubscript:@"queue-grouping-id"];
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    __int16 v84 = 2114;
    id v85 = v35;
    __int16 v86 = 1024;
    int v87 = v36;
    __int16 v88 = 2114;
    id v89 = v19;
    __int16 v90 = 2114;
    uint64_t v91 = (uint64_t)v37;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ queue-grouping-id: %{public}@", buf, 0x30u);
  }
  int v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = [*(id *)(a1 + 40) streamID];
    int v40 = [v3 threadPriority];
    int v41 = [v3 payload];
    uint64_t v42 = [v41 objectForKeyedSubscript:@"account-id"];
    *(_DWORD *)buf = 138544386;
    v83 = v81;
    __int16 v84 = 2114;
    id v85 = v39;
    __int16 v86 = 1024;
    int v87 = v40;
    __int16 v88 = 2114;
    id v89 = v19;
    __int16 v90 = 2114;
    uint64_t v91 = (uint64_t)v42;
    _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ account: %{public}@", buf, 0x30u);
  }
  v43 = (void *)v77;
  if (v77)
  {
    id v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = [*(id *)(a1 + 40) streamID];
      int v46 = [v3 threadPriority];
      *(_DWORD *)buf = 138544642;
      v83 = v81;
      __int16 v84 = 2114;
      id v85 = v45;
      __int16 v86 = 1024;
      int v87 = v46;
      __int16 v88 = 2114;
      id v89 = v19;
      __int16 v90 = 2114;
      uint64_t v91 = v77;
      __int16 v92 = 2114;
      id v93 = v76;
      _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ requesting-application: %{public}@/%{public}@", buf, 0x3Au);
    }
  }
  id v78 = v19;
  if (v80)
  {
    v47 = [v80 objectForKeyedSubscript:@"device-name"];
    uint64_t v48 = [v80 objectForKeyedSubscript:@"device-software-variant"];
    __int16 v49 = [v80 objectForKeyedSubscript:@"user-agent"];
    id v50 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v51 = [*(id *)(a1 + 40) streamID];
      int v52 = [v3 threadPriority];
      [v3 payload];
      v53 = id v74 = v7;
      [v53 objectForKeyedSubscript:@"queue-delegated-account-id"];
      v73 = v49;
      uint64_t v54 = v48;
      uint64_t v55 = a1;
      v57 = id v56 = v8;
      *(_DWORD *)buf = 138544642;
      v83 = v81;
      __int16 v84 = 2114;
      id v85 = v51;
      __int16 v86 = 1024;
      int v87 = v52;
      __int16 v88 = 2114;
      id v89 = v78;
      __int16 v90 = 2114;
      uint64_t v91 = (uint64_t)v57;
      __int16 v92 = 2114;
      id v93 = v47;
      _os_log_impl(&dword_21BB87000, v50, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ delegatedAccount: %{public}@; delegatedDeviceName: %{public}@",
        buf,
        0x3Au);

      unsigned int v8 = v56;
      a1 = v55;
      uint64_t v48 = v54;
      __int16 v49 = v73;

      id v7 = v74;
    }

    id v58 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v59 = [*(id *)(a1 + 40) streamID];
      int v60 = [v3 threadPriority];
      *(_DWORD *)buf = 138544642;
      v83 = v81;
      __int16 v84 = 2114;
      id v85 = v59;
      __int16 v86 = 1024;
      int v87 = v60;
      __int16 v88 = 2114;
      id v89 = v78;
      __int16 v90 = 2114;
      uint64_t v91 = (uint64_t)v48;
      __int16 v92 = 2114;
      id v93 = v49;
      _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ delegatedDeviceOSVariant: %{public}@; delegatedDeviceUserAgent: %{public}@",
        buf,
        0x3Au);
    }
    v43 = (void *)v77;
    int v19 = v78;
  }
  if (v79)
  {
    uint64_t v61 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      id v62 = [*(id *)(a1 + 40) streamID];
      int v63 = [v3 threadPriority];
      id v64 = [v79 objectForKeyedSubscript:@"private-listening-enabled"];
      int v65 = [v64 BOOLValue];
      *(_DWORD *)buf = 138544386;
      v83 = v81;
      __int16 v84 = 2114;
      id v85 = v62;
      __int16 v86 = 1024;
      int v87 = v63;
      int v19 = v78;
      __int16 v88 = 2114;
      id v89 = v78;
      __int16 v90 = 1024;
      LODWORD(v91) = v65;
      _os_log_impl(&dword_21BB87000, v61, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ delegated-private-listening: %{BOOL}u", buf, 0x2Cu);
    }
  }
  id v66 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = [*(id *)(a1 + 40) streamID];
    int v68 = [v3 threadPriority];
    if ((unint64_t)(v75 - 1) > 2)
    {
      v69 = @"Unknown";
      if (v8)
      {
LABEL_30:
        int v70 = [v8 BOOLValue];
        v71 = @"NO";
        if (v70) {
          v71 = @"YES";
        }
        goto LABEL_35;
      }
    }
    else
    {
      v69 = off_2643BEEC8[v75 - 1];
      if (v8) {
        goto LABEL_30;
      }
    }
    v71 = 0;
LABEL_35:
    *(_DWORD *)buf = 138544642;
    v83 = v81;
    __int16 v84 = 2114;
    id v85 = v67;
    __int16 v86 = 1024;
    int v87 = v68;
    __int16 v88 = 2114;
    id v89 = v78;
    __int16 v90 = 2114;
    uint64_t v91 = (uint64_t)v69;
    int v19 = v78;
    __int16 v92 = 2114;
    id v93 = v71;
    _os_log_impl(&dword_21BB87000, v66, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ private-listening-source: %{public}@; private-listening-override: %{public}@",
      buf,
      0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  id v6 = [v4 stringFromDate:v5];

  id v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  unsigned int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [*(id *)(a1 + 40) streamID];
    int v10 = [v3 threadPriority];
    v11 = [v3 payload];
    v12 = [v11 objectForKeyedSubscript:@"session-id"];
    int v14 = 138544386;
    int v15 = v6;
    __int16 v16 = 2114;
    v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    __int16 v20 = 2114;
    int v21 = v7;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈈 SESSION RESTORE BEGIN      %{public}@", (uint8_t *)&v14, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_221(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"route-metadata"];

  id v6 = [v5 objectForKeyedSubscript:@"route-description"];
  int v40 = v5;
  id v7 = [v5 objectForKeyedSubscript:@"route-is-airplay"];
  int v38 = [v7 BOOLValue];

  unsigned int v8 = [v3 payload];
  v9 = [v8 objectForKeyedSubscript:@"route-should-pause"];
  int v39 = [v9 BOOLValue];

  int v10 = MSVLogDateFormatter();
  uint64_t v42 = v3;
  v11 = [v3 date];
  int v41 = [v10 stringFromDate:v11];

  v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  char v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [*(id *)(a1 + 40) streamID];
    int v15 = [v3 threadPriority];
    __int16 v16 = [v3 payload];
    v17 = [v16 objectForKeyedSubscript:@"session-id"];
    *(_DWORD *)buf = 138544386;
    id v44 = v41;
    __int16 v45 = 2114;
    int v46 = v14;
    __int16 v47 = 1024;
    int v48 = v15;
    __int16 v49 = 2114;
    id v50 = v12;
    __int16 v51 = 2114;
    int v52 = v17;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀥑 ROUTE CHANGED              %{public}@", buf, 0x30u);
  }
  uint64_t v18 = a1;
  int v19 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v20 = [v6 componentsSeparatedByString:@"\n"];
  if ([v20 count])
  {
    for (unint64_t i = 0; i < [v20 count]; ++i)
    {
      __int16 v22 = [v20 objectAtIndexedSubscript:i];
      if (i)
      {
        uint64_t v23 = [v20 count] - 1;
        uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (i == v23)
        {
          if (v25) {
            goto LABEL_12;
          }
        }
        else if (v25)
        {
LABEL_12:
          id v26 = [*(id *)(v18 + 40) streamID];
          int v30 = [v42 threadPriority];
          *(_DWORD *)buf = 138544386;
          id v44 = v41;
          __int16 v45 = 2114;
          int v46 = v26;
          __int16 v47 = 1024;
          int v48 = v30;
          __int16 v49 = 2114;
          id v50 = v19;
          __int16 v51 = 2114;
          int v52 = v22;
          uint64_t v28 = v24;
          v29 = "|%{public}@ %{public}@ %2i %{public}@  │ %{public}@";
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [*(id *)(v18 + 40) streamID];
          int v27 = [v42 threadPriority];
          *(_DWORD *)buf = 138544386;
          id v44 = v41;
          __int16 v45 = 2114;
          int v46 = v26;
          __int16 v47 = 1024;
          int v48 = v27;
          __int16 v49 = 2114;
          id v50 = v19;
          __int16 v51 = 2114;
          int v52 = v22;
          uint64_t v28 = v24;
          v29 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ %{public}@";
LABEL_13:
          _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x30u);
        }
      }
    }
  }

  uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = [*(id *)(v18 + 40) streamID];
    int v33 = [v42 threadPriority];
    *(_DWORD *)buf = 138544386;
    id v44 = v41;
    __int16 v45 = 2114;
    int v46 = v32;
    __int16 v47 = 1024;
    int v48 = v33;
    __int16 v49 = 2114;
    id v50 = v19;
    __int16 v51 = 1024;
    LODWORD(v52) = v38;
    _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ isAirPlay: %{BOOL}u", buf, 0x2Cu);
  }
  uint64_t v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [*(id *)(v18 + 40) streamID];
    int v36 = [v42 threadPriority];
    *(_DWORD *)buf = 138544386;
    id v44 = v41;
    __int16 v45 = 2114;
    int v46 = v35;
    __int16 v47 = 1024;
    int v48 = v36;
    __int16 v49 = 2114;
    id v50 = v19;
    __int16 v51 = 1024;
    LODWORD(v52) = v39;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ shouldPause: %{BOOL}u", buf, 0x2Cu);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"network-reachability"];
  uint64_t v6 = [v5 integerValue];

  id v7 = @"Unreachable";
  if (v6 == 1) {
    id v7 = @"Likely Reachable";
  }
  if (v6 == 2) {
    unsigned int v8 = @"Reachable";
  }
  else {
    unsigned int v8 = v7;
  }
  v9 = MSVLogDateFormatter();
  int v10 = [v3 date];
  v11 = [v9 stringFromDate:v10];

  v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  char v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [*(id *)(a1 + 40) streamID];
    int v16 = 138544386;
    v17 = v11;
    __int16 v18 = 2114;
    int v19 = v14;
    __int16 v20 = 1024;
    int v21 = [v3 threadPriority];
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    BOOL v25 = v8;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀤆 NET REACHABILITY CHANGED   %{public}@", (uint8_t *)&v16, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"device-metadata"];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"device-name"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"device-model"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"application-bundle-id"];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"application-name"];
  id v72 = [v5 objectForKeyedSubscript:@"application-version"];
  uint64_t v62 = [v5 objectForKeyedSubscript:@"system-name"];
  v71 = [v5 objectForKeyedSubscript:@"device-software-variant"];
  int v70 = [v5 objectForKeyedSubscript:@"system-version"];
  v69 = [v5 objectForKeyedSubscript:@"system-build"];
  int v68 = [v5 objectForKeyedSubscript:@"application-source-version"];
  v67 = [v5 objectForKeyedSubscript:@"application-uuid"];
  int v10 = [v5 objectForKeyedSubscript:@"internal-carry"];
  HIDWORD(v59) = [v10 BOOLValue];

  v11 = [v5 objectForKeyedSubscript:@"private-listening-enabled"];
  LODWORD(v59) = [v11 BOOLValue];

  v12 = [v5 objectForKeyedSubscript:@"focus-mode-private-listening-enabled"];
  uint64_t v66 = [v12 integerValue];

  char v13 = MSVLogDateFormatter();
  uint64_t v77 = v3;
  int v14 = [v3 date];
  id v76 = [v13 stringFromDate:v14];

  int v15 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544130;
    id v85 = v76;
    __int16 v86 = 2114;
    int v87 = v17;
    __int16 v88 = 1024;
    int v89 = [v77 threadPriority];
    __int16 v90 = 2114;
    uint64_t v91 = v15;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁄩 DEVICE CHANGED", buf, 0x26u);
  }
  uint64_t v75 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [*(id *)(a1 + 40) streamID];
    int v20 = [v77 threadPriority];
    *(_DWORD *)buf = 138544643;
    id v85 = v76;
    __int16 v86 = 2114;
    int v87 = v19;
    __int16 v88 = 1024;
    int v89 = v20;
    __int16 v90 = 2114;
    uint64_t v91 = v75;
    __int16 v92 = 2113;
    *(void *)id v93 = v6;
    *(_WORD *)&v93[8] = 2114;
    *(void *)&v93[10] = v7;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ name: %{private}@; model: %{public}@",
      buf,
      0x3Au);
  }
  int v65 = (void *)v7;
  int v60 = (void *)v6;

  int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = [*(id *)(a1 + 40) streamID];
    int v23 = [v77 threadPriority];
    *(_DWORD *)buf = 138545410;
    id v85 = v76;
    __int16 v86 = 2114;
    int v87 = v22;
    __int16 v88 = 1024;
    int v89 = v23;
    __int16 v90 = 2114;
    uint64_t v91 = v75;
    __int16 v92 = 2114;
    *(void *)id v93 = v9;
    *(_WORD *)&v93[8] = 2114;
    *(void *)&v93[10] = v72;
    __int16 v94 = 2114;
    uint64_t v95 = v8;
    __int16 v96 = 2114;
    id v97 = v67;
    __int16 v98 = 2114;
    id v99 = v68;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ application: %{public}@/%{public}@; bundleID: %{public}@; uuid: %{public}"
      "@; version: %{public}@",
      buf,
      0x58u);
  }
  int v63 = (void *)v9;
  id v64 = (void *)v8;

  uint64_t v61 = v5;
  __int16 v24 = [v5 objectForKeyedSubscript:@"media-frameworks"];
  BOOL v25 = [v24 sortedArrayUsingComparator:&__block_literal_global_1643];

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v80;
    int v30 = "PlaybackEvents";
    uint64_t v73 = *(void *)v80;
    id v74 = v26;
    do
    {
      uint64_t v31 = 0;
      uint64_t v78 = v28;
      do
      {
        if (*(void *)v80 != v29) {
          objc_enumerationMutation(v26);
        }
        int v32 = *(void **)(*((void *)&v79 + 1) + 8 * v31);
        if (objc_msgSend(v32, "isRoot", v59))
        {
          int v33 = os_log_create("com.apple.amp.mediaplaybackcore", v30);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = [*(id *)(a1 + 40) streamID];
            v35 = v30;
            uint64_t v36 = a1;
            int v37 = [v77 threadPriority];
            int v38 = [v32 name];
            int v39 = [v32 uuid];
            int v40 = [v39 UUIDString];
            int v41 = [v32 version];
            *(_DWORD *)buf = 138544898;
            id v85 = v76;
            __int16 v86 = 2114;
            int v87 = v34;
            __int16 v88 = 1024;
            int v89 = v37;
            a1 = v36;
            int v30 = v35;
            uint64_t v28 = v78;
            __int16 v90 = 2114;
            uint64_t v91 = v75;
            __int16 v92 = 2114;
            *(void *)id v93 = v38;
            *(_WORD *)&v93[8] = 2114;
            *(void *)&v93[10] = v40;
            __int16 v94 = 2114;
            uint64_t v95 = (uint64_t)v41;
            _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ root: %{public}-26@; uuid: %{public}@; version: %{public}@",
              buf,
              0x44u);

            uint64_t v29 = v73;
            id v26 = v74;
          }
        }
        ++v31;
      }
      while (v28 != v31);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v28);
  }

  if (v66 == 2)
  {
    uint64_t v53 = @"Disabled";
    __int16 v47 = v60;
    v43 = v64;
    uint64_t v42 = v65;
    __int16 v45 = (void *)v62;
    id v44 = v63;
  }
  else
  {
    v43 = v64;
    uint64_t v42 = v65;
    __int16 v45 = (void *)v62;
    id v44 = v63;
    if (!v66)
    {
      int v46 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      __int16 v47 = v60;
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v48 = [*(id *)(a1 + 40) streamID];
      int v49 = [v77 threadPriority];
      *(_DWORD *)buf = 138544386;
      id v85 = v76;
      __int16 v86 = 2114;
      int v87 = v48;
      __int16 v88 = 1024;
      int v89 = v49;
      __int16 v90 = 2114;
      uint64_t v91 = v75;
      __int16 v92 = 1024;
      *(_DWORD *)id v93 = v59;
      id v50 = "|%{public}@ %{public}@ %2i %{public}@  │ private-listening: %{BOOL}u";
      __int16 v51 = v46;
      uint32_t v52 = 44;
      goto LABEL_26;
    }
    uint64_t v53 = @"Enabled";
    __int16 v47 = v60;
  }
  int v46 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_27;
  }
  int v48 = [*(id *)(a1 + 40) streamID];
  int v54 = [v77 threadPriority];
  *(_DWORD *)buf = 138544642;
  id v85 = v76;
  __int16 v86 = 2114;
  int v87 = v48;
  __int16 v88 = 1024;
  int v89 = v54;
  __int16 v90 = 2114;
  uint64_t v91 = v75;
  __int16 v92 = 1024;
  *(_DWORD *)id v93 = v59;
  *(_WORD *)&v93[4] = 2114;
  *(void *)&v93[6] = v53;
  id v50 = "|%{public}@ %{public}@ %2i %{public}@  │ private-listening: %{BOOL}u; focus-mode-private-listening: %{public}@";
  __int16 v51 = v46;
  uint32_t v52 = 54;
LABEL_26:
  _os_log_impl(&dword_21BB87000, v51, OS_LOG_TYPE_DEFAULT, v50, buf, v52);

LABEL_27:
  uint64_t v55 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    id v56 = [*(id *)(a1 + 40) streamID];
    int v57 = [v77 threadPriority];
    *(_DWORD *)buf = 138545410;
    id v85 = v76;
    __int16 v86 = 2114;
    int v87 = v56;
    __int16 v88 = 1024;
    int v89 = v57;
    __int16 v90 = 2114;
    uint64_t v91 = v75;
    __int16 v92 = 2114;
    *(void *)id v93 = v45;
    *(_WORD *)&v93[8] = 2114;
    *(void *)&v93[10] = v71;
    __int16 v94 = 2114;
    uint64_t v95 = (uint64_t)v70;
    __int16 v96 = 2114;
    id v97 = v69;
    __int16 v98 = 1024;
    LODWORD(v99) = HIDWORD(v59);
    _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ os: %{public}@ [%{public}@]/%{public}@ %{public}@; internalCarry: %{BOOL}u",
      buf,
      0x54u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  int v10 = [v8 stringFromDate:v9];

  v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = [*(id *)(a1 + 40) streamID];
    int v15 = 138544642;
    int v16 = v10;
    __int16 v17 = 2114;
    __int16 v18 = v13;
    __int16 v19 = 1024;
    int v20 = [v3 threadPriority];
    __int16 v21 = 2114;
    __int16 v22 = v11;
    __int16 v23 = 2114;
    __int16 v24 = v5;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀧒 PLACEHOLDER END            %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-metadata"];
  int v10 = [v9 objectForKeyedSubscript:@"item-title"];

  v11 = MSVLogDateFormatter();
  v12 = [v3 date];
  char v13 = [v11 stringFromDate:v12];

  int v14 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 40) streamID];
    int v22 = 138544642;
    __int16 v23 = v13;
    __int16 v24 = 2114;
    __int16 v25 = v16;
    __int16 v26 = 1024;
    int v27 = [v3 threadPriority];
    __int16 v28 = 2114;
    uint64_t v29 = v14;
    __int16 v30 = 2114;
    uint64_t v31 = v5;
    __int16 v32 = 2114;
    int v33 = v7;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀓞 PLACEHOLDER BEGIN          %{public}@ %{public}@", (uint8_t *)&v22, 0x3Au);
  }
  __int16 v17 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = [*(id *)(a1 + 40) streamID];
    int v20 = [v3 threadPriority];
    int v22 = 138544386;
    __int16 v23 = v13;
    __int16 v24 = 2114;
    __int16 v25 = v19;
    __int16 v26 = 1024;
    int v27 = v20;
    __int16 v28 = 2114;
    uint64_t v29 = v17;
    __int16 v30 = 2114;
    uint64_t v31 = v10;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@", (uint8_t *)&v22, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_102(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  v4 = [v3 payload];
  int v57 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  id v5 = [v3 payload];
  id v56 = [v5 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"item-metadata"];
  uint64_t v55 = [v7 objectForKeyedSubscript:@"item-title"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-metadata"];
  int v10 = [v9 objectForKeyedSubscript:@"explicit-treatment"];

  v11 = [v3 payload];
  int v54 = [v11 objectForKeyedSubscript:@"item-ids"];

  v12 = [v3 payload];
  char v13 = [v12 objectForKeyedSubscript:@"item-metadata"];

  int v14 = [v13 objectForKeyedSubscript:@"item-duration"];
  [v14 doubleValue];
  uint64_t v16 = v15;

  __int16 v17 = [v13 objectForKeyedSubscript:@"item-initial-position"];
  [v17 doubleValue];
  __int16 v19 = v18;

  int v20 = [v13 objectForKeyedSubscript:@"item-start-boundary"];
  [v20 doubleValue];
  uint64_t v22 = v21;

  __int16 v23 = [v13 objectForKeyedSubscript:@"item-end-boundary"];
  [v23 doubleValue];
  uint64_t v25 = v24;

  __int16 v26 = [v13 objectForKeyedSubscript:@"requires-mpaf"];
  int v53 = [v26 BOOLValue];

  int v27 = [v13 objectForKeyedSubscript:@"item-has-video"];
  int v52 = [v27 BOOLValue];

  __int16 v28 = [v13 objectForKeyedSubscript:@"item-artist-uploaded"];
  int v29 = [v28 BOOLValue];

  __int16 v30 = MSVLogDateFormatter();
  uint64_t v31 = [v3 date];
  __int16 v32 = [v30 stringFromDate:v31];

  int v33 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    uint64_t v59 = v32;
    __int16 v60 = 2114;
    uint64_t v61 = v35;
    __int16 v62 = 1024;
    int v63 = [v3 threadPriority];
    __int16 v64 = 2114;
    int v65 = v33;
    __int16 v66 = 2114;
    *(void *)v67 = v57;
    *(_WORD *)&v67[8] = 2114;
    int v68 = v56;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀀀 ITEM BEGIN                 %{public}@ %{public}@", buf, 0x3Au);
  }
  uint64_t v36 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = [*(id *)(a1 + 40) streamID];
    int v39 = [v3 threadPriority];
    int v40 = &stru_26CBCA930;
    *(_DWORD *)buf = 138544642;
    if (v10) {
      int v40 = v10;
    }
    uint64_t v59 = v32;
    __int16 v60 = 2114;
    uint64_t v61 = v38;
    __int16 v62 = 1024;
    int v63 = v39;
    __int16 v64 = 2114;
    int v65 = v36;
    __int16 v66 = 2114;
    *(void *)v67 = v55;
    *(_WORD *)&v67[8] = 2114;
    int v68 = v40;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@ %{public}@", buf, 0x3Au);
  }
  int v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [*(id *)(a1 + 40) streamID];
    int v43 = [v3 threadPriority];
    *(_DWORD *)buf = 138545154;
    uint64_t v59 = v32;
    __int16 v60 = 2114;
    uint64_t v61 = v42;
    __int16 v62 = 1024;
    int v63 = v43;
    __int16 v64 = 2114;
    int v65 = v36;
    __int16 v66 = 2048;
    *(void *)v67 = v16;
    *(_WORD *)&v67[8] = 2048;
    int v68 = v19;
    __int16 v69 = 2048;
    uint64_t v70 = v22;
    __int16 v71 = 2048;
    uint64_t v72 = v25;
    _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ duration: %0.2f; initialPosition: %0.2f; startBoundary: %0.2f; endBoundary: %0.2f",
      buf,
      0x4Eu);
  }
  id v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v45 = [*(id *)(a1 + 40) streamID];
    int v46 = [v3 threadPriority];
    *(_DWORD *)buf = 138544898;
    uint64_t v59 = v32;
    __int16 v60 = 2114;
    uint64_t v61 = v45;
    __int16 v62 = 1024;
    int v63 = v46;
    __int16 v64 = 2114;
    int v65 = v36;
    __int16 v66 = 1024;
    *(_DWORD *)v67 = v53;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = v52;
    LOWORD(v68) = 1024;
    *(_DWORD *)((char *)&v68 + 2) = v29;
    _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ requiresPAF: %{BOOL}u; video: %{BOOL}u; artistUploaded: %{BOOL}u",
      buf,
      0x38u);
  }
  __int16 v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    int v48 = [*(id *)(a1 + 40) streamID];
    int v49 = [v3 threadPriority];
    id v50 = [v54 humanDescription];
    *(_DWORD *)buf = 138544386;
    uint64_t v59 = v32;
    __int16 v60 = 2114;
    uint64_t v61 = v48;
    __int16 v62 = 1024;
    int v63 = v49;
    __int16 v64 = 2114;
    int v65 = v36;
    __int16 v66 = 2114;
    *(void *)v67 = v50;
    _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ identifiers: %{public}@", buf, 0x30u);
  }
  return 1;
}

- (void)_updateChartWithEvent:(uint64_t)a1
{
  v67[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = [v3 type];
    v67[0] = @"remote-control-begin";
    v67[1] = @"shared-session-synchronization-begin";
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
    char v7 = [v6 containsObject:v5];

    if (v7)
    {
      uint64_t v8 = 1;
    }
    else
    {
      v66[0] = @"remote-control-end";
      v66[1] = @"shared-session-synchronization-end";
      uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:2];
      char v10 = [v9 containsObject:v5];

      if ((v10 & 1) == 0)
      {
        int v65 = @"session-begin";
        uint64_t v8 = 1;
        uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
        char v32 = [v31 containsObject:v5];

        if ((v32 & 1) == 0)
        {
          __int16 v64 = @"session-end";
          int v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
          char v34 = [v33 containsObject:v5];

          if ((v34 & 1) == 0)
          {
            v63[0] = @"container-begin";
            v63[1] = @"item-placeholder-begin";
            int v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
            char v39 = [v38 containsObject:v5];

            if (v39)
            {
              uint64_t v8 = 1;
            }
            else
            {
              v62[0] = @"container-end";
              v62[1] = @"item-placeholder-end";
              uint64_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
              char v43 = [v42 containsObject:v5];

              if ((v43 & 1) == 0)
              {
                uint64_t v61 = @"item-begin";
                uint64_t v8 = 1;
                id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
                char v45 = [v44 containsObject:v5];

                if ((v45 & 1) == 0)
                {
                  __int16 v60 = @"item-end";
                  int v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
                  char v47 = [v46 containsObject:v5];

                  if ((v47 & 1) == 0)
                  {
                    uint64_t v59 = @"asset-load-begin";
                    uint64_t v8 = 1;
                    id v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
                    char v51 = [v50 containsObject:v5];

                    if ((v51 & 1) == 0)
                    {
                      id v58 = @"asset-load-end";
                      int v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v58 count:1];
                      int v53 = [v52 containsObject:v5];

                      if (!v53)
                      {
LABEL_8:
                        v12 = [v4 payload];
                        char v13 = [v12 objectForKeyedSubscript:@"time-control-status"];

                        if (v13)
                        {
                          int v14 = [v4 payload];
                          uint64_t v15 = [v14 objectForKeyedSubscript:@"time-control-status"];
                          *(void *)(a1 + 56) = [v15 integerValue];
                        }
                        uint64_t v16 = @"remote-control-begin";
                        if (v5 == @"remote-control-begin")
                        {
                        }
                        else
                        {
                          int v17 = [(__CFString *)v5 isEqual:@"remote-control-begin"];

                          if (!v17)
                          {
                            __int16 v18 = @"audio-route-changed";
                            if (v5 == @"audio-route-changed")
                            {
                            }
                            else
                            {
                              int v19 = [(__CFString *)v5 isEqual:@"audio-route-changed"];

                              if (!v19)
                              {
                                int v20 = @"item-rate-changed";
                                if (v5 == @"item-rate-changed")
                                {
                                }
                                else
                                {
                                  int v21 = [(__CFString *)v5 isEqual:@"item-rate-changed"];

                                  if (!v21)
                                  {
                                    v57[0] = @"session-reset";
                                    v57[1] = @"media-server-died";
                                    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
                                    int v23 = [v22 containsObject:v5];

                                    if (!v23)
                                    {
                                      uint64_t v24 = @"interrupt-begin";
                                      if (v5 == @"interrupt-begin")
                                      {
                                      }
                                      else
                                      {
                                        int v25 = [(__CFString *)v5 isEqual:@"interrupt-begin"];

                                        if (!v25)
                                        {
LABEL_55:
                                          int v48 = @"interrupt-end";
                                          if (v5 == @"interrupt-end")
                                          {

                                            goto LABEL_63;
                                          }
                                          int v49 = [(__CFString *)v5 isEqual:@"interrupt-end"];

                                          if (v49)
                                          {
LABEL_63:
                                            if (*(unsigned char *)(a1 + 49))
                                            {
                                              int v54 = [v4 payload];
                                              uint64_t v55 = [v54 objectForKeyedSubscript:@"interrupt-should-resume"];
                                              char v56 = [v55 BOOLValue];

                                              *(unsigned char *)(a1 + 48) = v56;
LABEL_36:
                                              *(unsigned char *)(a1 + 49) = 0;
                                            }
                                          }
LABEL_43:

                                          goto LABEL_44;
                                        }
                                      }
                                      if (*(unsigned char *)(a1 + 48))
                                      {
                                        *(_WORD *)(a1 + 48) = 256;
                                        goto LABEL_43;
                                      }
                                      goto LABEL_55;
                                    }
LABEL_34:
                                    *(_WORD *)(a1 + 48) = 0;
                                    goto LABEL_43;
                                  }
                                }
                                int v40 = [v4 payload];
                                int v41 = [v40 objectForKeyedSubscript:@"item-rate-change-participant-id"];

                                if ([v41 length]) {
                                  *(_WORD *)(a1 + 48) = 0;
                                }

                                goto LABEL_43;
                              }
                            }
                            v35 = [v4 payload];
                            uint64_t v36 = [v35 objectForKeyedSubscript:@"route-should-pause"];
                            int v37 = [v36 BOOLValue];

                            if (!v37) {
                              goto LABEL_43;
                            }
                            goto LABEL_34;
                          }
                        }
                        __int16 v26 = [v4 payload];
                        int v27 = [v26 objectForKeyedSubscript:@"remote-control-type"];
                        int v28 = [v27 integerValue];

                        if (!(!v30 & v29))
                        {
                          switch(v28)
                          {
                            case 0:
                              goto LABEL_27;
                            case 1:
                            case 3:
                              goto LABEL_34;
                            case 2:
                              *(unsigned char *)(a1 + 48) ^= 1u;
                              goto LABEL_36;
                            default:
                              JUMPOUT(0);
                          }
                        }
                        if ((v28 - 121) <= 0xA && ((1 << (v28 - 121)) & 0x403) != 0) {
LABEL_27:
                        }
                          *(unsigned char *)(a1 + 48) = 1;
                        goto LABEL_43;
                      }
                      uint64_t v8 = -1;
                    }
                    uint64_t v11 = 40;
LABEL_7:
                    *(void *)(a1 + v11) += v8;
                    goto LABEL_8;
                  }
                  uint64_t v8 = -1;
                }
                uint64_t v11 = 32;
                goto LABEL_7;
              }
              uint64_t v8 = -1;
            }
            uint64_t v11 = 24;
            goto LABEL_7;
          }
          uint64_t v8 = -1;
        }
        uint64_t v11 = 16;
        goto LABEL_7;
      }
      uint64_t v8 = -1;
    }
    uint64_t v11 = 8;
    goto LABEL_7;
  }
LABEL_44:
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v5, v7);
  uint64_t v8 = [*(id *)(a1 + 32) _logAccountEvent:v7 subscription:*(void *)(a1 + 40) cursor:v6];

  return v8;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v5, v7);
  uint64_t v8 = [*(id *)(a1 + 32) _logAccountEvent:v7 subscription:*(void *)(a1 + 40) cursor:v6];

  return v8;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  v53[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  id v7 = [v5 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"queue-load-error"];

  uint64_t v9 = [v5 payload];
  char v10 = [v9 objectForKeyedSubscript:@"queue-section-id"];

  int v52 = @"queue-section-id";
  v53[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
  v12 = [v6 findPreviousEventWithType:@"queue-load-begin" matchingPayload:v11];

  [v5 durationSinceEvent:v12];
  uint64_t v14 = v13;
  uint64_t v15 = MSVLogDateFormatter();
  uint64_t v16 = [v5 date];
  char v39 = [v15 stringFromDate:v16];

  uint64_t v38 = a1;
  int v17 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v41 = v39;
    __int16 v42 = 2114;
    char v43 = v19;
    __int16 v44 = 1024;
    int v45 = [v5 threadPriority];
    __int16 v46 = 2114;
    char v47 = v17;
    __int16 v48 = 2114;
    int v49 = v10;
    __int16 v50 = 2048;
    uint64_t v51 = v14;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈾 QUEUE LOAD END             %{public}@ [%.3fs]", buf, 0x3Au);
  }
  if (v8)
  {
    v35 = v12;
    uint64_t v36 = v10;
    id v37 = v6;
    int v20 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v38 + 32));
    int v21 = objc_msgSend(v8, "msv_description");
    uint64_t v22 = [v21 componentsSeparatedByString:@"\n"];

    if ([v22 count])
    {
      for (unint64_t i = 0; i < [v22 count]; ++i)
      {
        uint64_t v24 = objc_msgSend(v22, "objectAtIndexedSubscript:", i, v35, v36);
        if (i)
        {
          uint64_t v25 = [v22 count] - 1;
          __int16 v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (i == v25)
          {
            if (v27)
            {
              int v28 = [*(id *)(v38 + 40) streamID];
              int v29 = [v5 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v41 = v39;
              __int16 v42 = 2114;
              char v43 = v28;
              __int16 v44 = 1024;
              int v45 = v29;
              __int16 v46 = 2114;
              char v47 = v20;
              __int16 v48 = 2114;
              int v49 = v24;
              char v30 = v26;
              uint64_t v31 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);
            }
          }
          else if (v27)
          {
            int v28 = [*(id *)(v38 + 40) streamID];
            int v33 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v41 = v39;
            __int16 v42 = 2114;
            char v43 = v28;
            __int16 v44 = 1024;
            int v45 = v33;
            __int16 v46 = 2114;
            char v47 = v20;
            __int16 v48 = 2114;
            int v49 = v24;
            char v30 = v26;
            uint64_t v31 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          __int16 v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v28 = [*(id *)(v38 + 40) streamID];
            int v32 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v41 = v39;
            __int16 v42 = 2114;
            char v43 = v28;
            __int16 v44 = 1024;
            int v45 = v32;
            __int16 v46 = 2114;
            char v47 = v20;
            __int16 v48 = 2114;
            int v49 = v24;
            char v30 = v26;
            uint64_t v31 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }
      }
    }

    id v6 = v37;
    v12 = v35;
    char v10 = v36;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  id v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"behavior-type"];
  unint64_t v6 = [v5 integerValue];

  if (*(void *)(a1 + 32))
  {
    if (v6 > 5) {
      id v7 = @"􀿪";
    }
    else {
      id v7 = off_2643BEE80[v6];
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  char v10 = [v8 stringFromDate:v9];

  uint64_t v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [*(id *)(a1 + 40) streamID];
    unint64_t v14 = v6;
    uint64_t v15 = v7;
    int v16 = [v3 threadPriority];
    [v3 payload];
    v17 = id v25 = v3;
    __int16 v18 = [v17 objectForKeyedSubscript:@"session-id"];
    *(_DWORD *)buf = 138544386;
    BOOL v27 = v10;
    __int16 v28 = 2114;
    int v29 = v13;
    __int16 v30 = 1024;
    int v31 = v16;
    id v7 = v15;
    unint64_t v6 = v14;
    __int16 v32 = 2114;
    int v33 = v11;
    __int16 v34 = 2114;
    v35 = v18;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈄 SESSION BEGIN              %{public}@", buf, 0x30u);

    id v3 = v25;
  }

  int v19 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [*(id *)(a1 + 40) streamID];
    int v22 = [v3 threadPriority];
    if (v6 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown/%lld", v6);
      int v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v23 = off_2643BEE50[v6];
    }
    *(_DWORD *)buf = 138544642;
    BOOL v27 = v10;
    __int16 v28 = 2114;
    int v29 = v21;
    __int16 v30 = 1024;
    int v31 = v22;
    __int16 v32 = 2114;
    int v33 = v19;
    __int16 v34 = 2114;
    v35 = v7;
    __int16 v36 = 2114;
    id v37 = v23;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ behaviorType: %{public}@  %{public}@", buf, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  id v97 = v6;
  __int16 v96 = [v6 findPreviousEventWithType:@"remote-control-commands-changed" matchingPayload:0];
  id v7 = [v96 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"remote-control-commands"];

  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v131 objects:v153 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v132;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v132 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        int v16 = [v15 objectForKeyedSubscript:@"commandType"];
        [v9 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v131 objects:v153 count:16];
    }
    while (v12);
  }
  uint64_t v98 = a1;
  id v95 = v10;

  id v99 = v5;
  int v17 = [v5 payload];
  __int16 v18 = [v17 objectForKeyedSubscript:@"remote-control-commands"];

  v104 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  id v103 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v102 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  __int16 v94 = v18;
  obuint64_t j = [v18 reverseObjectEnumerator];
  uint64_t v19 = [obj countByEnumeratingWithState:&v127 objects:v152 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    int v21 = @"commandType";
    unint64_t v22 = 0x263F08000uLL;
    uint64_t v23 = *(void *)v128;
    id v105 = v9;
    uint64_t v106 = *(void *)v128;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v128 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v127 + 1) + 8 * v24);
        __int16 v26 = [v25 objectForKeyedSubscript:v21];
        uint64_t v27 = [v26 integerValue];

        __int16 v28 = [*(id *)(v22 + 2584) numberWithUnsignedInt:v27];
        int v29 = [v9 objectForKeyedSubscript:v28];

        if (v27 != 99990)
        {
          __int16 v30 = [v25 objectForKeyedSubscript:@"supported"];
          int v31 = [v30 BOOLValue];

          if (v29)
          {
            __int16 v32 = v21;
            int v33 = [v29 objectForKeyedSubscript:@"supported"];
            int v34 = [v33 BOOLValue];

            if (v31 != v34)
            {
              int v21 = v32;
              if (v31) {
                v35 = v104;
              }
              else {
                v35 = v103;
              }
              [v35 addObject:v25];
              goto LABEL_26;
            }
            id v37 = [v25 objectForKeyedSubscript:@"enabled"];
            int v38 = [v37 BOOLValue];

            char v39 = [v29 objectForKeyedSubscript:@"enabled"];
            int v40 = [v39 BOOLValue];

            if (v38 != v40)
            {
              [v102 addObject:v25];
              int v21 = v32;
LABEL_26:
              uint64_t v9 = v105;
              uint64_t v23 = v106;
              goto LABEL_27;
            }
            int v41 = [v25 objectForKeyedSubscript:@"unsupportedReasons"];
            __int16 v42 = [v29 objectForKeyedSubscript:@"unsupportedReasons"];
            uint64_t v23 = v106;
            if (v41 == v42) {
              int v43 = 1;
            }
            else {
              int v43 = [v41 isEqual:v42];
            }

            __int16 v44 = [v25 objectForKeyedSubscript:@"disabledReasons"];
            int v45 = [v29 objectForKeyedSubscript:@"disabledReasons"];
            if (v44 == v45) {
              int v46 = 1;
            }
            else {
              int v46 = [v44 isEqual:v45];
            }

            if ((v43 & v46 & 1) == 0)
            {
              [v102 addObject:v25];
              int v21 = v32;
              goto LABEL_42;
            }
            id v47 = [v25 objectForKeyedSubscript:@"options"];
            id v48 = [v29 objectForKeyedSubscript:@"options"];
            int v21 = v32;
            if (v47 == v48)
            {

LABEL_42:
              uint64_t v9 = v105;
LABEL_27:
              unint64_t v22 = 0x263F08000;
              goto LABEL_28;
            }
            int v49 = v48;
            char v100 = [v47 isEqual:v48];

            uint64_t v9 = v105;
            unint64_t v22 = 0x263F08000;
            if ((v100 & 1) == 0) {
              [v102 addObject:v25];
            }
          }
          else
          {
            if (v31) {
              __int16 v36 = v104;
            }
            else {
              __int16 v36 = v103;
            }
            [v36 addObject:v25];
            uint64_t v23 = v106;
          }
        }
LABEL_28:

        ++v24;
      }
      while (v20 != v24);
      uint64_t v50 = [obj countByEnumeratingWithState:&v127 objects:v152 count:16];
      uint64_t v20 = v50;
    }
    while (v50);
  }

  uint64_t v51 = v104;
  if ([v104 count] || objc_msgSend(v103, "count") || objc_msgSend(v102, "count"))
  {
    int v52 = MSVLogDateFormatter();
    int v53 = [v99 date];
    int v54 = [v52 stringFromDate:v53];

    uint64_t v55 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v98 + 32));
    char v56 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      int v57 = [*(id *)(v98 + 40) streamID];
      int v58 = [v99 threadPriority];
      *(_DWORD *)buf = 138544130;
      id v136 = v54;
      __int16 v137 = 2114;
      v138 = v57;
      __int16 v139 = 1024;
      int v140 = v58;
      __int16 v141 = 2114;
      v142 = v55;
      _os_log_impl(&dword_21BB87000, v56, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪂 COMMANDS CHANGED", buf, 0x26u);
    }
    uint64_t v59 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v98 + 32));
    __int16 v60 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v61 = [*(id *)(v98 + 40) streamID];
      int v62 = [v99 threadPriority];
      *(_DWORD *)buf = 138544130;
      id v136 = v54;
      __int16 v137 = 2114;
      v138 = v61;
      __int16 v139 = 1024;
      int v140 = v62;
      __int16 v141 = 2114;
      v142 = v59;
      _os_log_impl(&dword_21BB87000, v60, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ commands:", buf, 0x26u);
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_70;
    aBlock[3] = &unk_2643BEE08;
    id obja = v54;
    id v123 = obja;
    id v124 = *(id *)(v98 + 40);
    id v101 = v99;
    id v125 = v101;
    id v107 = v59;
    id v126 = v107;
    int v63 = (void (**)(void *, __CFString *, void))_Block_copy(aBlock);
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v64 = v104;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v118 objects:v151 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v119;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v119 != v67) {
            objc_enumerationMutation(v64);
          }
          v63[2](v63, @"􀃝", *(void *)(*((void *)&v118 + 1) + 8 * j));
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v118 objects:v151 count:16];
      }
      while (v66);
    }

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v69 = v102;
    uint64_t v70 = [v69 countByEnumeratingWithState:&v114 objects:v150 count:16];
    if (v70)
    {
      uint64_t v71 = v70;
      uint64_t v72 = *(void *)v115;
      do
      {
        for (uint64_t k = 0; k != v71; ++k)
        {
          if (*(void *)v115 != v72) {
            objc_enumerationMutation(v69);
          }
          v63[2](v63, @"􀃩", *(void *)(*((void *)&v114 + 1) + 8 * k));
        }
        uint64_t v71 = [v69 countByEnumeratingWithState:&v114 objects:v150 count:16];
      }
      while (v71);
    }

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v74 = v103;
    uint64_t v75 = [v74 countByEnumeratingWithState:&v110 objects:v149 count:16];
    if (v75)
    {
      uint64_t v76 = v75;
      uint64_t v77 = *(void *)v111;
      do
      {
        for (uint64_t m = 0; m != v76; ++m)
        {
          if (*(void *)v111 != v77) {
            objc_enumerationMutation(v74);
          }
          v63[2](v63, @"􀃞", *(void *)(*((void *)&v110 + 1) + 8 * m));
        }
        uint64_t v76 = [v74 countByEnumeratingWithState:&v110 objects:v149 count:16];
      }
      while (v76);
    }

    long long v79 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v98 + 32));
    long long v80 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      long long v81 = [*(id *)(v98 + 40) streamID];
      int v82 = [v101 threadPriority];
      uint64_t v83 = [v64 count];
      uint64_t v84 = [v74 count];
      uint64_t v85 = [v69 count];
      *(_DWORD *)buf = 138544898;
      __int16 v86 = obja;
      id v136 = obja;
      __int16 v137 = 2114;
      v138 = v81;
      __int16 v139 = 1024;
      int v140 = v82;
      __int16 v141 = 2114;
      v142 = v79;
      __int16 v143 = 2048;
      uint64_t v144 = v83;
      __int16 v145 = 2048;
      uint64_t v146 = v84;
      __int16 v147 = 2048;
      uint64_t v148 = v85;
      _os_log_impl(&dword_21BB87000, v80, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ added: %lld; removed: %lld; updated: %lld",
        buf,
        0x44u);

      int v87 = v99;
      __int16 v88 = v95;
      uint64_t v51 = v104;
    }
    else
    {
      int v87 = v99;
      __int16 v88 = v95;
      uint64_t v51 = v104;
      __int16 v86 = obja;
    }
  }
  else
  {
    __int16 v90 = MSVLogDateFormatter();
    int v87 = v99;
    uint64_t v91 = [v99 date];
    __int16 v86 = [v90 stringFromDate:v91];

    long long v79 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v98 + 32));
    long long v80 = os_log_create("com.apple.amp.mediaplaybackcore", "CommandsChanged");
    __int16 v88 = v95;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v92 = [*(id *)(v98 + 40) streamID];
      int v93 = [v99 threadPriority];
      *(_DWORD *)buf = 138544130;
      id v136 = v86;
      __int16 v137 = 2114;
      v138 = v92;
      __int16 v139 = 1024;
      int v140 = v93;
      __int16 v141 = 2114;
      v142 = v79;
      _os_log_impl(&dword_21BB87000, v80, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪂 COMMANDS CHANGED           [no change]", buf, 0x26u);
    }
  }

  return 1;
}

- (BOOL)_logAccountEvent:(id)a3 subscription:(id)a4 cursor:(id)a5
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 payload];
  id v10 = [v9 objectForKeyedSubscript:@"account-id"];

  uint64_t v11 = [v7 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"account-metadata"];

  uint64_t v13 = [v12 objectForKeyedSubscript:@"store-account-id"];
  int v53 = [v12 objectForKeyedSubscript:@"store-front-id"];
  unint64_t v14 = [v12 objectForKeyedSubscript:@"delegated"];
  int v15 = [v14 BOOLValue];

  int v16 = [v12 objectForKeyedSubscript:@"private-listening-enabled"];
  int v52 = [v16 BOOLValue];

  int v17 = MSVLogDateFormatter();
  __int16 v18 = [v7 date];
  int v54 = [v17 stringFromDate:v18];

  uint64_t v19 = [v7 type];
  LODWORD(v18) = [v19 isEqualToString:@"account-begin"];

  if (v18)
  {
    uint64_t v20 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](self);
    int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = [v8 streamID];
      *(_DWORD *)buf = 138544386;
      char v56 = v54;
      __int16 v57 = 2114;
      int v58 = v22;
      __int16 v59 = 1024;
      int v60 = [v7 threadPriority];
      __int16 v61 = 2114;
      int v62 = v20;
      __int16 v63 = 2114;
      *(void *)id v64 = v10;
      uint64_t v23 = "|%{public}@ %{public}@ %2i %{public}@􀉯 ACCOUNT BEGIN              %{public}@";
LABEL_7:
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x30u);
    }
  }
  else
  {
    uint64_t v24 = [v7 type];
    int v25 = [v24 isEqualToString:@"account-update"];

    if (!v25) {
      goto LABEL_9;
    }
    uint64_t v20 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](self);
    int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = [v8 streamID];
      *(_DWORD *)buf = 138544386;
      char v56 = v54;
      __int16 v57 = 2114;
      int v58 = v22;
      __int16 v59 = 1024;
      int v60 = [v7 threadPriority];
      __int16 v61 = 2114;
      int v62 = v20;
      __int16 v63 = 2114;
      *(void *)id v64 = v10;
      uint64_t v23 = "|%{public}@ %{public}@ %2i %{public}@􀉷 ACCOUNT UPDATE             %{public}@";
      goto LABEL_7;
    }
  }

LABEL_9:
  __int16 v26 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](self);
  uint64_t v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = [v8 streamID];
    int v29 = [v7 threadPriority];
    uint64_t v30 = [v13 unsignedLongLongValue];
    *(_DWORD *)buf = 138544899;
    char v56 = v54;
    __int16 v57 = 2114;
    int v58 = v28;
    __int16 v59 = 1024;
    int v60 = v29;
    __int16 v61 = 2114;
    int v62 = v26;
    __int16 v63 = 2049;
    *(void *)id v64 = v30;
    *(_WORD *)&v64[8] = 2114;
    uint64_t v65 = v53;
    __int16 v66 = 1024;
    int v67 = v15;
    _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ store-id: %{private}llu; storefront: %{public}@; delegated: %{BOOL}u",
      buf,
      0x40u);
  }
  int v31 = [v12 objectForKeyedSubscript:@"household-id"];
  if ([v31 length])
  {
    __int16 v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = [v8 streamID];
      int v34 = [v7 threadPriority];
      *(_DWORD *)buf = 138544386;
      char v56 = v54;
      __int16 v57 = 2114;
      int v58 = v33;
      __int16 v59 = 1024;
      int v60 = v34;
      __int16 v61 = 2114;
      int v62 = v26;
      __int16 v63 = 2114;
      *(void *)id v64 = v31;
      _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ household-id: %{public}@", buf, 0x30u);
    }
  }
  v35 = [v12 objectForKeyedSubscript:@"subscription-status"];
  __int16 v36 = [v12 objectForKeyedSubscript:@"explicit-allowed"];
  int v51 = [v36 BOOLValue];

  if (v35)
  {
    id v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      [v8 streamID];
      int v38 = v26;
      char v39 = v13;
      id v40 = v8;
      __int16 v42 = v41 = v10;
      int v43 = [v7 threadPriority];
      *(_DWORD *)buf = 138544386;
      char v56 = v54;
      __int16 v57 = 2114;
      int v58 = v42;
      __int16 v59 = 1024;
      int v60 = v43;
      __int16 v61 = 2114;
      int v62 = v38;
      __int16 v63 = 2114;
      *(void *)id v64 = v35;
      _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ subscription: %{public}@", buf, 0x30u);

      id v10 = v41;
      id v8 = v40;
      uint64_t v13 = v39;
      __int16 v26 = v38;
    }
  }
  __int16 v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    [v8 streamID];
    int v45 = v13;
    id v46 = v8;
    id v48 = v47 = v10;
    int v49 = [v7 threadPriority];
    *(_DWORD *)buf = 138544642;
    char v56 = v54;
    __int16 v57 = 2114;
    int v58 = v48;
    __int16 v59 = 1024;
    int v60 = v49;
    __int16 v61 = 2114;
    int v62 = v26;
    __int16 v63 = 1024;
    *(_DWORD *)id v64 = v52;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = v51;
    _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ private-listening: %{BOOL}u; explicitContentAllowed: %{BOOL}u",
      buf,
      0x32u);

    id v10 = v47;
    id v8 = v46;
    uint64_t v13 = v45;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  id v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"network-type"];
  uint64_t v6 = [v5 integerValue];

  id v7 = @"Unknown";
  if (v6 <= 99)
  {
    if ((unint64_t)(v6 - 1) >= 8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6 > 1000)
  {
    switch(v6)
    {
      case 1001:
        id v7 = @"Bridged WiFi";
        break;
      case 2000:
        id v7 = @"Wired Ethernet";
        break;
      case 3000:
        id v7 = @"Other";
        break;
    }
  }
  else
  {
    switch(v6)
    {
      case 100:
LABEL_3:
        id v7 = @"Cellular";
        break;
      case 500:
        id v7 = @"Bluetooth";
        break;
      case 1000:
        id v7 = @"WiFi";
        break;
    }
  }
LABEL_4:
  id v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"network-constrained"];
  int v10 = [v9 BOOLValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"network-expensive"];
  int v13 = [v12 BOOLValue];

  unint64_t v14 = [v3 payload];
  int v15 = [v14 objectForKeyedSubscript:@"network-high-quality"];
  LODWORD(v12) = [v15 BOOLValue];

  int v16 = [v3 payload];
  int v17 = [v16 objectForKeyedSubscript:@"network-signal-strength"];

  int v44 = (int)v12;
  int v43 = v7;
  if (![v17 count])
  {
    int v22 = v10;
LABEL_24:
    __int16 v26 = @"<unknown>";
    goto LABEL_25;
  }
  __int16 v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F88EF0]];
  uint64_t v19 = [v18 integerValue];

  uint64_t v20 = [v17 objectForKeyedSubscript:*MEMORY[0x263F88EF8]];
  uint64_t v21 = [v20 integerValue];

  if ((unint64_t)v21 > 0xA || v19 < 0 || v19 > v21)
  {
    uint64_t v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = v17;
      _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_FAULT, "Unexpected signalStrength values: %{public}@", buf, 0xCu);
    }
    int v22 = v10;

    goto LABEL_24;
  }
  int v22 = v10;
  uint64_t v23 = [MEMORY[0x263F089D8] stringWithCapacity:v21];
  if (v21)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (i >= v19) {
        int v25 = @"○";
      }
      else {
        int v25 = @"●";
      }
      objc_msgSend(v23, "appendString:", v25, v43);
    }
  }
  __int16 v26 = (__CFString *)objc_msgSend(v23, "copy", v43);

LABEL_25:
  __int16 v28 = MSVLogDateFormatter();
  int v29 = [v3 date];
  uint64_t v30 = [v28 stringFromDate:v29];

  int v31 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = [*(id *)(a1 + 40) streamID];
    int v34 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    id v46 = v30;
    __int16 v47 = 2114;
    id v48 = v33;
    __int16 v49 = 1024;
    int v50 = v34;
    __int16 v51 = 2114;
    int v52 = v31;
    __int16 v53 = 2114;
    *(void *)int v54 = v43;
    _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀤆 NETWORK TYPE CHANGED       %{public}@", buf, 0x30u);
  }
  v35 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = [*(id *)(a1 + 40) streamID];
    int v38 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    id v46 = v30;
    __int16 v47 = 2114;
    id v48 = v37;
    __int16 v49 = 1024;
    int v50 = v38;
    __int16 v51 = 2114;
    int v52 = v35;
    __int16 v53 = 2114;
    *(void *)int v54 = v26;
    _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ strength: %{public}@", buf, 0x30u);
  }
  char v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = [*(id *)(a1 + 40) streamID];
    int v41 = [v3 threadPriority];
    *(_DWORD *)buf = 138544898;
    id v46 = v30;
    __int16 v47 = 2114;
    id v48 = v40;
    __int16 v49 = 1024;
    int v50 = v41;
    __int16 v51 = 2114;
    int v52 = v35;
    __int16 v53 = 1024;
    *(_DWORD *)int v54 = v22;
    *(_WORD *)&v54[4] = 1024;
    *(_DWORD *)&v54[6] = v44;
    __int16 v55 = 1024;
    int v56 = v13;
    _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ constrained: %{BOOL}u; high quality: %{BOOL}u; expensive: %{BOOL}u",
      buf,
      0x38u);
  }
  return 1;
}

- (void)_chartWithLevel:(void *)a1 type:
{
  v1 = a1;
  if (a1)
  {
    v2 = MSVTimelineChartPrefix();
    uint64_t v3 = v1[7];
    if (v3 == 2)
    {
      int v4 = *((unsigned __int8 *)v1 + 48);
      id v5 = @"🟩";
      uint64_t v6 = @"🟧";
    }
    else
    {
      if (v3 == 1)
      {
        int v4 = *((unsigned __int8 *)v1 + 48);
        id v5 = @"🟧";
      }
      else
      {
        if (v3)
        {
          int v4 = *((unsigned __int8 *)v1 + 48);
          id v5 = @"🟥";
          uint64_t v6 = @"⬛️";
          goto LABEL_10;
        }
        int v4 = *((unsigned __int8 *)v1 + 48);
        id v5 = @"🟥";
      }
      uint64_t v6 = @"⬜️";
    }
LABEL_10:
    if (v4) {
      id v7 = v5;
    }
    else {
      id v7 = v6;
    }
    id v8 = v7;
    v1 = [(__CFString *)v8 stringByAppendingString:v2];
  }

  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimeControlStatusEvent, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

- (void)setLastTimeControlStatusEvent:(id)a3
{
}

- (MPCPlaybackEngineEvent)lastTimeControlStatusEvent
{
  return self->_lastTimeControlStatusEvent;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (id)_playbackBarWithElapsedTime:(double)a3 duration:(double)a4
{
  if (a4 <= 0.0)
  {
    id v8 = 0;
  }
  else
  {
    if (_playbackBarWithElapsedTime_duration__onceToken != -1) {
      dispatch_once(&_playbackBarWithElapsedTime_duration__onceToken, &__block_literal_global_458);
    }
    uint64_t v6 = (void *)MEMORY[0x263F089D8];
    id v7 = [@" " stringByPaddingToLength:29 withString:@"━" startingAtIndex:0];
    id v8 = [v6 stringWithString:v7];

    if (a3 >= a4) {
      double v9 = a4;
    }
    else {
      double v9 = a3;
    }
    [v8 insertString:@"●" atIndex:(unint64_t)(round(v9 / a4 * 28.0) + 1.0)];
    [v8 appendString:@" -"];
    int v10 = [(id)_playbackBarWithElapsedTime_duration____elapsedTimeFormatter stringFromSeconds:a3];
    [v8 insertString:v10 atIndex:0];

    uint64_t v11 = objc_msgSend((id)_playbackBarWithElapsedTime_duration____remainingTimeFormatter, "stringFromSeconds:", fmax(a4 - a3, 0.0));
    [v8 appendString:v11];
  }

  return v8;
}

uint64_t __73__MPCPlaybackEngineLoggingConsumer__playbackBarWithElapsedTime_duration___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFA8B8]);
  v1 = (void *)_playbackBarWithElapsedTime_duration____elapsedTimeFormatter;
  _playbackBarWithElapsedTime_duration____elapsedTimeFormatter = (uint64_t)v0;

  [(id)_playbackBarWithElapsedTime_duration____elapsedTimeFormatter setStyle:3];
  id v2 = objc_alloc_init(MEMORY[0x263EFA8B8]);
  uint64_t v3 = (void *)_playbackBarWithElapsedTime_duration____remainingTimeFormatter;
  _playbackBarWithElapsedTime_duration____remainingTimeFormatter = (uint64_t)v2;

  int v4 = (void *)_playbackBarWithElapsedTime_duration____remainingTimeFormatter;

  return [v4 setStyle:3];
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;

  lastTimeControlStatusEvent = self->_lastTimeControlStatusEvent;
  self->_lastTimeControlStatusEvent = 0;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"session-reuse-reason"];

  uint64_t v6 = MSVLogDateFormatter();
  id v7 = [v3 date];
  id v8 = [v6 stringFromDate:v7];

  double v9 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) streamID];
    int v12 = [v3 threadPriority];
    int v13 = [v3 payload];
    unint64_t v14 = [v13 objectForKeyedSubscript:@"session-id"];
    int v20 = 138544386;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    __int16 v24 = 1024;
    int v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    int v29 = v14;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􂅟 SESSION REUSE              %{public}@", (uint8_t *)&v20, 0x30u);
  }
  int v15 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [*(id *)(a1 + 40) streamID];
    int v18 = [v3 threadPriority];
    int v20 = 138544386;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    __int16 v24 = 1024;
    int v25 = v18;
    __int16 v26 = 2114;
    uint64_t v27 = v15;
    __int16 v28 = 2114;
    int v29 = v5;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ reason: %{public}@", (uint8_t *)&v20, 0x30u);
  }
  return 1;
}

{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  unint64_t i;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  BOOL v36;
  void *v37;
  int v38;
  NSObject *v39;
  const char *v40;
  int v41;
  int v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  int v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  long long v80 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"remote-control-type"];
  uint64_t v6 = [v5 unsignedIntValue];

  id v7 = -[MPCPlaybackEngineLoggingConsumer _symbolForCommand:](*(__CFString **)(a1 + 32), v6);
  id v8 = MPCRemoteCommandDescriptionCopy(v6);
  double v9 = [v3 payload];
  int v10 = [v9 objectForKeyedSubscript:@"remote-control-id"];

  uint64_t v11 = [v3 payload];
  int v12 = [v11 objectForKeyedSubscript:@"remote-control-source"];

  int v13 = [v3 payload];
  __int16 v63 = [v13 objectForKeyedSubscript:@"remote-control-associated-participant-id"];

  unint64_t v14 = [v3 payload];
  int v15 = [v14 objectForKeyedSubscript:@"remote-control-options"];
  int v16 = (void *)[v15 mutableCopy];

  int v17 = *MEMORY[0x263F54CF8];
  int v62 = [v16 objectForKeyedSubscript:*MEMORY[0x263F54CF8]];
  int v18 = *MEMORY[0x263F54C68];
  id v64 = [v16 objectForKeyedSubscript:*MEMORY[0x263F54C68]];
  [v16 setObject:0 forKeyedSubscript:v17];
  [v16 setObject:0 forKeyedSubscript:v18];
  uint64_t v65 = v16;
  [v16 setObject:0 forKeyedSubscript:*MEMORY[0x263F54CB0]];
  uint64_t v19 = MSVLogDateFormatter();
  int v20 = [v3 date];
  int v67 = [v19 stringFromDate:v20];

  uint64_t v21 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v22 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544386;
    id v69 = v67;
    uint64_t v70 = 2114;
    uint64_t v71 = v23;
    uint64_t v72 = 1024;
    uint64_t v73 = [v3 threadPriority];
    id v74 = 2114;
    uint64_t v75 = v21;
    uint64_t v76 = 2114;
    uint64_t v77 = v10;
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀩿 COMMAND BEGIN              %{public}@", buf, 0x30u);
  }
  __int16 v66 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = [*(id *)(a1 + 40) streamID];
    __int16 v26 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    id v69 = v67;
    uint64_t v70 = 2114;
    uint64_t v71 = v25;
    uint64_t v72 = 1024;
    uint64_t v73 = v26;
    id v74 = 2114;
    uint64_t v75 = v66;
    uint64_t v76 = 2114;
    uint64_t v77 = v12;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭  source: %{public}@", buf, 0x30u);
  }
  if (v63)
  {
    uint64_t v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = [*(id *)(a1 + 40) streamID];
      int v29 = [v3 threadPriority];
      *(_DWORD *)buf = 138544386;
      id v69 = v67;
      uint64_t v70 = 2114;
      uint64_t v71 = v28;
      uint64_t v72 = 1024;
      uint64_t v73 = v29;
      id v74 = 2114;
      uint64_t v75 = v66;
      uint64_t v76 = 2114;
      uint64_t v77 = v63;
      _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ associatedParticipantID: %{public}@", buf, 0x30u);
    }
  }
  int v60 = v12;
  __int16 v61 = v7;
  if ([v65 count])
  {
    __int16 v59 = v10;
    uint64_t v30 = [v65 description];
    int v31 = [v30 componentsSeparatedByString:@"\n"];

    if ([v31 count])
    {
      for (uint64_t i = 0; i < [v31 count]; ++i)
      {
        int v33 = [v31 objectAtIndexedSubscript:i];
        if (i)
        {
          int v34 = [v31 count] - 1;
          v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          __int16 v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
          if (i == v34)
          {
            if (v36)
            {
              id v37 = [*(id *)(a1 + 40) streamID];
              int v38 = [v3 threadPriority];
              *(_DWORD *)buf = 138544386;
              id v69 = v67;
              uint64_t v70 = 2114;
              uint64_t v71 = v37;
              uint64_t v72 = 1024;
              uint64_t v73 = v38;
              id v74 = 2114;
              uint64_t v75 = v66;
              uint64_t v76 = 2114;
              uint64_t v77 = v33;
              char v39 = v35;
              id v40 = "|%{public}@ %{public}@ %2i %{public}@  │   ╰ %{public}@";
LABEL_20:
              _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 0x30u);
            }
          }
          else if (v36)
          {
            id v37 = [*(id *)(a1 + 40) streamID];
            __int16 v42 = [v3 threadPriority];
            *(_DWORD *)buf = 138544386;
            id v69 = v67;
            uint64_t v70 = 2114;
            uint64_t v71 = v37;
            uint64_t v72 = 1024;
            uint64_t v73 = v42;
            id v74 = 2114;
            uint64_t v75 = v66;
            uint64_t v76 = 2114;
            uint64_t v77 = v33;
            char v39 = v35;
            id v40 = "|%{public}@ %{public}@ %2i %{public}@  │   │ %{public}@";
            goto LABEL_20;
          }
        }
        else
        {
          v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            id v37 = [*(id *)(a1 + 40) streamID];
            int v41 = [v3 threadPriority];
            *(_DWORD *)buf = 138544386;
            id v69 = v67;
            uint64_t v70 = 2114;
            uint64_t v71 = v37;
            uint64_t v72 = 1024;
            uint64_t v73 = v41;
            id v74 = 2114;
            uint64_t v75 = v66;
            uint64_t v76 = 2114;
            uint64_t v77 = v33;
            char v39 = v35;
            id v40 = "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ options: %{public}@";
            goto LABEL_20;
          }
        }
      }
    }

    id v7 = v61;
    int v10 = v59;
  }
  if (v62)
  {
    int v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      int v44 = [*(id *)(a1 + 40) streamID];
      int v45 = [v3 threadPriority];
      *(_DWORD *)buf = 138544386;
      id v69 = v67;
      uint64_t v70 = 2114;
      uint64_t v71 = v44;
      uint64_t v72 = 1024;
      uint64_t v73 = v45;
      id v74 = 2114;
      uint64_t v75 = v66;
      uint64_t v76 = 2114;
      uint64_t v77 = v62;
      _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ nowPlayingContentItemID: %{public}@", buf, 0x30u);
    }
  }
  if (v64)
  {
    id v46 = (void *)MEMORY[0x263EFF910];
    [v64 doubleValue];
    __int16 v47 = objc_msgSend(v46, "dateWithTimeIntervalSinceReferenceDate:");
    id v48 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v49 = [*(id *)(a1 + 40) streamID];
      int v50 = v8;
      __int16 v51 = [v3 threadPriority];
      MSVLogDateFormatter();
      v53 = int v52 = v10;
      int v54 = [v53 stringFromDate:v47];
      *(_DWORD *)buf = 138544386;
      id v69 = v67;
      uint64_t v70 = 2114;
      uint64_t v71 = v49;
      uint64_t v72 = 1024;
      uint64_t v73 = v51;
      id v8 = v50;
      id v74 = 2114;
      uint64_t v75 = v66;
      uint64_t v76 = 2114;
      uint64_t v77 = v54;
      _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ sendTime: %{public}@", buf, 0x30u);

      int v10 = v52;
      id v7 = v61;

      int v12 = v60;
    }
  }
  __int16 v55 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = [*(id *)(a1 + 40) streamID];
    uint64_t v57 = [v3 threadPriority];
    *(_DWORD *)buf = 138544642;
    id v69 = v67;
    uint64_t v70 = 2114;
    uint64_t v71 = v56;
    uint64_t v72 = 1024;
    uint64_t v73 = v57;
    id v74 = 2114;
    uint64_t v75 = v66;
    uint64_t v76 = 2114;
    uint64_t v77 = v7;
    uint64_t v78 = 2114;
    long long v79 = v8;
    _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ command: %{public}@  %{public}@", buf, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  uint64_t v6 = [v4 stringFromDate:v5];

  id v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [*(id *)(a1 + 40) streamID];
    int v10 = [v3 threadPriority];
    uint64_t v11 = [v3 payload];
    int v12 = [v11 objectForKeyedSubscript:@"session-id"];
    int v14 = 138544386;
    int v15 = v6;
    __int16 v16 = 2114;
    int v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    __int16 v20 = 2114;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈅 SESSION END                %{public}@", (uint8_t *)&v14, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  v53[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  id v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"session-id"];

  int v52 = @"session-id";
  v53[0] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
  int v10 = [v6 findPreviousEventWithType:@"session-restore-begin" matchingPayload:v9];

  [v5 durationSinceEvent:v10];
  uint64_t v12 = v11;
  int v13 = [v5 payload];
  int v14 = [v13 objectForKeyedSubscript:@"session-restoration-error"];

  int v15 = MSVLogDateFormatter();
  __int16 v16 = [v5 date];
  char v39 = [v15 stringFromDate:v16];

  uint64_t v38 = a1;
  int v17 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v41 = v39;
    __int16 v42 = 2114;
    int v43 = v19;
    __int16 v44 = 1024;
    int v45 = [v5 threadPriority];
    __int16 v46 = 2114;
    __int16 v47 = v17;
    __int16 v48 = 2114;
    __int16 v49 = v8;
    __int16 v50 = 2048;
    uint64_t v51 = v12;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈉 SESSION RESTORE END        %{public}@ [%.3fs]", buf, 0x3Au);
  }
  if (v14)
  {
    __int16 v36 = v8;
    id v37 = v6;
    __int16 v20 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v38 + 32));
    v35 = v14;
    uint64_t v21 = objc_msgSend(v14, "msv_description");
    __int16 v22 = [v21 componentsSeparatedByString:@"\n"];

    if ([v22 count])
    {
      for (unint64_t i = 0; i < [v22 count]; ++i)
      {
        uint64_t v24 = [v22 objectAtIndexedSubscript:i];
        if (i)
        {
          uint64_t v25 = [v22 count] - 1;
          __int16 v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (i == v25)
          {
            if (v27)
            {
              __int16 v28 = [*(id *)(v38 + 40) streamID];
              int v29 = [v5 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v41 = v39;
              __int16 v42 = 2114;
              int v43 = v28;
              __int16 v44 = 1024;
              int v45 = v29;
              __int16 v46 = 2114;
              __int16 v47 = v20;
              __int16 v48 = 2114;
              __int16 v49 = v24;
              uint64_t v30 = v26;
              int v31 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);
            }
          }
          else if (v27)
          {
            __int16 v28 = [*(id *)(v38 + 40) streamID];
            int v33 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v41 = v39;
            __int16 v42 = 2114;
            int v43 = v28;
            __int16 v44 = 1024;
            int v45 = v33;
            __int16 v46 = 2114;
            __int16 v47 = v20;
            __int16 v48 = 2114;
            __int16 v49 = v24;
            uint64_t v30 = v26;
            int v31 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          __int16 v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            __int16 v28 = [*(id *)(v38 + 40) streamID];
            int v32 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v41 = v39;
            __int16 v42 = 2114;
            int v43 = v28;
            __int16 v44 = 1024;
            int v45 = v32;
            __int16 v46 = 2114;
            __int16 v47 = v20;
            __int16 v48 = 2114;
            __int16 v49 = v24;
            uint64_t v30 = v26;
            int v31 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }
      }
    }

    id v8 = v36;
    id v6 = v37;
    int v14 = v35;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"session-id"];

  id v6 = MSVLogDateFormatter();
  id v7 = [v3 date];
  id v8 = [v6 stringFromDate:v7];

  double v9 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) streamID];
    int v13 = 138544386;
    int v14 = v8;
    __int16 v15 = 2114;
    __int16 v16 = v11;
    __int16 v17 = 1024;
    int v18 = [v3 threadPriority];
    __int16 v19 = 2114;
    __int16 v20 = v9;
    __int16 v21 = 2114;
    __int16 v22 = v5;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈃 SESSION RESET [BOUNDARY]   %{public}@", (uint8_t *)&v13, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  id v6 = [v4 stringFromDate:v5];

  id v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [*(id *)(a1 + 40) streamID];
    int v11 = 138544130;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    int v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v3 threadPriority];
    __int16 v17 = 2114;
    int v18 = v7;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀭨 APPLICATION TERMINATION", (uint8_t *)&v11, 0x26u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  id v6 = [v4 stringFromDate:v5];

  id v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [*(id *)(a1 + 40) streamID];
    int v11 = 138544130;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    int v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v3 threadPriority];
    __int16 v17 = 2114;
    int v18 = v7;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀑐 APPLICATION FOREGROUND", (uint8_t *)&v11, 0x26u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  id v6 = [v4 stringFromDate:v5];

  id v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [*(id *)(a1 + 40) streamID];
    int v11 = 138544130;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    int v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v3 threadPriority];
    __int16 v17 = 2114;
    int v18 = v7;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀑏 APPLICATION BACKGROUND", (uint8_t *)&v11, 0x26u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  v129[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  long long v128 = @"remote-control-id";
  id v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"remote-control-id"];
  v129[0] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v129 forKeys:&v128 count:1];
  int v10 = [v6 findPreviousEventWithType:@"remote-control-begin" matchingPayload:v9];

  int v11 = [v10 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"remote-control-type"];
  LODWORD(v9) = [v12 unsignedIntValue];

  __int16 v13 = MPCRemoteCommandDescriptionCopy(v9);
  -[MPCPlaybackEngineLoggingConsumer _symbolForCommand:](*(__CFString **)(a1 + 32), (int)v9);
  int v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  __int16 v15 = [v5 payload];
  int v16 = [v15 objectForKeyedSubscript:@"remote-control-id"];

  v108 = v5;
  __int16 v17 = v5;
  uint64_t v18 = a1;
  uint64_t v19 = [v17 payload];
  __int16 v20 = [v19 objectForKeyedSubscript:@"remote-control-status"];
  __int16 v21 = [v20 firstObject];

  [v21 statusCode];
  int v22 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus();
  id v103 = v6;
  if (*(void *)(v18 + 32))
  {
    if (v22 > 9)
    {
      if (v22 == 10)
      {
        uint64_t v23 = @"🚷";
        goto LABEL_11;
      }
      if (v22 == 20)
      {
LABEL_5:
        uint64_t v23 = @"📵";
LABEL_11:
        v102 = v23;
        goto LABEL_12;
      }
    }
    else
    {
      if (!v22)
      {
        uint64_t v23 = @"✅";
        goto LABEL_11;
      }
      if (v22 == 1) {
        goto LABEL_5;
      }
    }
    uint64_t v23 = @"🚫";
    goto LABEL_11;
  }
  v102 = 0;
LABEL_12:
  uint64_t v24 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
  [v108 durationSinceEvent:v10];
  uint64_t v26 = v25;
  BOOL v27 = MSVLogDateFormatter();
  __int16 v28 = [v108 date];
  id v107 = [v27 stringFromDate:v28];

  int v29 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v18 + 32));
  uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = [*(id *)(v18 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    long long v114 = v107;
    __int16 v115 = 2114;
    long long v116 = v31;
    __int16 v117 = 1024;
    int v118 = [v108 threadPriority];
    __int16 v119 = 2114;
    long long v120 = v29;
    __int16 v121 = 2114;
    v122 = v16;
    __int16 v123 = 2048;
    uint64_t v124 = v26;
    _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀹷 COMMAND TIMEOUT            %{public}@ [%.3fs]", buf, 0x3Au);
  }
  uint64_t v106 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v18 + 32));
  int v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = [*(id *)(v18 + 40) streamID];
    int v34 = [v108 threadPriority];
    *(_DWORD *)buf = 138544642;
    long long v114 = v107;
    __int16 v115 = 2114;
    long long v116 = v33;
    __int16 v117 = 1024;
    int v118 = v34;
    __int16 v119 = 2114;
    long long v120 = v106;
    __int16 v121 = 2114;
    v122 = v14;
    __int16 v123 = 2114;
    uint64_t v124 = (uint64_t)v13;
    _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ command: %{public}@  %{public}@ 💢", buf, 0x3Au);
  }
  uint64_t v35 = [v21 type];
  if (v35 <= 2)
  {
    if ((unint64_t)v35 < 2)
    {
      uint64_t v36 = v18;
      id v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_61:

        goto LABEL_62;
      }
      uint64_t v38 = [*(id *)(v36 + 40) streamID];
      int v39 = [v108 threadPriority];
      *(_DWORD *)buf = 138544642;
      long long v114 = v107;
      __int16 v115 = 2114;
      long long v116 = v38;
      __int16 v117 = 1024;
      int v118 = v39;
      __int16 v119 = 2114;
      long long v120 = v106;
      __int16 v121 = 2114;
      v122 = v102;
      __int16 v123 = 2114;
      uint64_t v124 = (uint64_t)v24;
      id v40 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@";
LABEL_26:
      _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, v40, buf, 0x3Au);

      goto LABEL_61;
    }
    if (v35 == 2)
    {
      id v101 = v24;
      uint64_t v104 = v18;
      id v95 = v16;
      __int16 v96 = v14;
      id v97 = v13;
      uint64_t v98 = v10;
      __int16 v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v50 = [*(id *)(v18 + 40) streamID];
        uint64_t v51 = v21;
        int v52 = [v108 threadPriority];
        __int16 v53 = [v51 dialog];
        int v54 = [v53 localizedTitle];
        __int16 v55 = [v51 dialog];
        int v56 = [v55 localizedMessage];
        *(_DWORD *)buf = 138544642;
        long long v114 = v107;
        __int16 v115 = 2114;
        long long v116 = v50;
        __int16 v117 = 1024;
        int v118 = v52;
        __int16 v21 = v51;
        __int16 v119 = 2114;
        long long v120 = v106;
        __int16 v121 = 2114;
        v122 = v54;
        __int16 v123 = 2114;
        uint64_t v124 = (uint64_t)v56;
        _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.title: %{public}@; dialog.message: %{public}@",
          buf,
          0x3Au);
      }
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      char v100 = v21;
      uint64_t v57 = [v21 dialog];
      int v58 = [v57 actions];

      obuint64_t j = v58;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v109 objects:v127 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v110 != v61) {
              objc_enumerationMutation(obj);
            }
            __int16 v63 = *(void **)(*((void *)&v109 + 1) + 8 * i);
            unint64_t v64 = objc_msgSend(v63, "type", v95, v96, v97, v98);
            uint64_t v65 = @"􀿨 ";
            if (v64 <= 2) {
              uint64_t v65 = off_2643BEEB0[v64];
            }
            __int16 v66 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              int v67 = [*(id *)(v104 + 40) streamID];
              int v68 = [v108 threadPriority];
              [v63 title];
              uint64_t v69 = v60;
              v71 = uint64_t v70 = v61;
              uint64_t v72 = [v63 event];
              uint64_t v73 = (void *)v72;
              *(_DWORD *)buf = 138544898;
              id v74 = &stru_26CBCA930;
              if (v72) {
                id v74 = (__CFString *)v72;
              }
              long long v114 = v107;
              __int16 v115 = 2114;
              long long v116 = v67;
              __int16 v117 = 1024;
              int v118 = v68;
              __int16 v119 = 2114;
              long long v120 = v106;
              __int16 v121 = 2114;
              v122 = v65;
              __int16 v123 = 2114;
              uint64_t v124 = (uint64_t)v71;
              __int16 v125 = 2114;
              id v126 = v74;
              _os_log_impl(&dword_21BB87000, v66, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.action[%{public}@]: %{public}@ %{public}@", buf, 0x44u);

              uint64_t v61 = v70;
              uint64_t v60 = v69;
            }
          }
          uint64_t v60 = [obj countByEnumeratingWithState:&v109 objects:v127 count:16];
        }
        while (v60);
      }

      id v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v75 = [*(id *)(v104 + 40) streamID];
        int v76 = [v108 threadPriority];
        *(_DWORD *)buf = 138544642;
        long long v114 = v107;
        __int16 v115 = 2114;
        long long v116 = v75;
        __int16 v117 = 1024;
        int v118 = v76;
        __int16 v119 = 2114;
        long long v120 = v106;
        __int16 v121 = 2114;
        uint64_t v24 = v101;
        v122 = v102;
        __int16 v123 = 2114;
        uint64_t v124 = (uint64_t)v101;
        _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@", buf, 0x3Au);

        __int16 v13 = v97;
        int v10 = v98;
        int v16 = v95;
        int v14 = v96;
        __int16 v21 = v100;
        goto LABEL_61;
      }
LABEL_59:
      __int16 v13 = v97;
      int v10 = v98;
      int v16 = v95;
      int v14 = v96;
      __int16 v21 = v100;
      goto LABEL_60;
    }
    goto LABEL_62;
  }
  if (v35 == 3)
  {
    uint64_t v77 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v78 = [*(id *)(v18 + 40) streamID];
      int v79 = [v108 threadPriority];
      *(_DWORD *)buf = 138544642;
      long long v114 = v107;
      __int16 v115 = 2114;
      long long v116 = v78;
      __int16 v117 = 1024;
      int v118 = v79;
      __int16 v119 = 2114;
      long long v120 = v106;
      __int16 v121 = 2114;
      v122 = v102;
      __int16 v123 = 2114;
      uint64_t v124 = (uint64_t)v24;
      _os_log_impl(&dword_21BB87000, v77, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │  status: %{public}@ %{public}@", buf, 0x3Au);
    }
    id v101 = v24;
    uint64_t v80 = v18;

    long long v81 = [v21 error];
    int v82 = objc_msgSend(v81, "msv_description");
    id v37 = [v82 componentsSeparatedByString:@"\n"];

    if (![v37 count]) {
      goto LABEL_60;
    }
    uint64_t v98 = v10;
    char v100 = v21;
    id v95 = v16;
    __int16 v96 = v14;
    id v97 = v13;
    uint64_t v83 = 0;
    while (1)
    {
      -[NSObject objectAtIndexedSubscript:](v37, "objectAtIndexedSubscript:", v83, v95, v96, v97, v98);
      uint64_t v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v83)
      {
        uint64_t v85 = [v37 count] - 1;
        __int16 v86 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_ERROR);
        if (v83 == v85)
        {
          if (v87)
          {
            __int16 v88 = [*(id *)(v80 + 40) streamID];
            int v89 = [v108 threadPriority];
            *(_DWORD *)buf = 138544386;
            long long v114 = v107;
            __int16 v115 = 2114;
            long long v116 = v88;
            __int16 v117 = 1024;
            int v118 = v89;
            __int16 v119 = 2114;
            long long v120 = v106;
            __int16 v121 = 2114;
            v122 = v84;
            __int16 v90 = v86;
            uint64_t v91 = "|%{public}@ %{public}@ %2i %{public}@  ╰             %{public}@";
LABEL_57:
            _os_log_impl(&dword_21BB87000, v90, OS_LOG_TYPE_ERROR, v91, buf, 0x30u);
          }
        }
        else if (v87)
        {
          __int16 v88 = [*(id *)(v80 + 40) streamID];
          int v93 = [v108 threadPriority];
          *(_DWORD *)buf = 138544386;
          long long v114 = v107;
          __int16 v115 = 2114;
          long long v116 = v88;
          __int16 v117 = 1024;
          int v118 = v93;
          __int16 v119 = 2114;
          long long v120 = v106;
          __int16 v121 = 2114;
          v122 = v84;
          __int16 v90 = v86;
          uint64_t v91 = "|%{public}@ %{public}@ %2i %{public}@  │             %{public}@";
          goto LABEL_57;
        }
      }
      else
      {
        __int16 v86 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
        {
          __int16 v88 = [*(id *)(v80 + 40) streamID];
          int v92 = [v108 threadPriority];
          *(_DWORD *)buf = 138544386;
          long long v114 = v107;
          __int16 v115 = 2114;
          long long v116 = v88;
          __int16 v117 = 1024;
          int v118 = v92;
          __int16 v119 = 2114;
          long long v120 = v106;
          __int16 v121 = 2114;
          v122 = v84;
          __int16 v90 = v86;
          uint64_t v91 = "|%{public}@ %{public}@ %2i %{public}@  │   error: ❌ %{public}@";
          goto LABEL_57;
        }
      }

      if (++v83 >= (unint64_t)[v37 count]) {
        goto LABEL_59;
      }
    }
  }
  if (v35 == 999)
  {
    id v101 = v24;
    uint64_t v41 = v18;
    __int16 v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      int v43 = [*(id *)(v18 + 40) streamID];
      int v44 = [v108 threadPriority];
      int v45 = [v21 customDataType];
      [v21 customData];
      __int16 v46 = v99 = v21;
      uint64_t v47 = [v46 length];
      *(_DWORD *)buf = 138544642;
      long long v114 = v107;
      __int16 v115 = 2114;
      long long v116 = v43;
      __int16 v117 = 1024;
      int v118 = v44;
      __int16 v119 = 2114;
      long long v120 = v106;
      __int16 v121 = 2114;
      v122 = v45;
      __int16 v123 = 2048;
      uint64_t v124 = v47;
      _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ customDataType: %{public}@; customDataSize: %llu",
        buf,
        0x3Au);

      __int16 v21 = v99;
    }

    id v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = [*(id *)(v41 + 40) streamID];
      int v48 = [v108 threadPriority];
      *(_DWORD *)buf = 138544642;
      long long v114 = v107;
      __int16 v115 = 2114;
      long long v116 = v38;
      __int16 v117 = 1024;
      int v118 = v48;
      __int16 v119 = 2114;
      long long v120 = v106;
      __int16 v121 = 2114;
      uint64_t v24 = v101;
      v122 = v102;
      __int16 v123 = 2114;
      uint64_t v124 = (uint64_t)v101;
      id v40 = "|%{public}@ %{public}@ %2i %{public}@  ╰ status: %{public}@ %{public}@";
      goto LABEL_26;
    }
LABEL_60:
    uint64_t v24 = v101;
    goto LABEL_61;
  }
LABEL_62:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  v153[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  v152 = @"remote-control-id";
  id v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"remote-control-id"];
  v153[0] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v153 forKeys:&v152 count:1];
  int v10 = [v6 findPreviousEventWithType:@"remote-control-begin" matchingPayload:v9];

  uint64_t v124 = v10;
  int v11 = [v10 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"remote-control-type"];
  LODWORD(v9) = [v12 unsignedIntValue];

  __int16 v13 = -[MPCPlaybackEngineLoggingConsumer _symbolForCommand:](*(__CFString **)(a1 + 32), (int)v9);
  int v14 = MPCRemoteCommandDescriptionCopy(v9);
  __int16 v15 = [v5 payload];
  uint64_t v123 = [v15 objectForKeyedSubscript:@"remote-control-id"];

  long long v132 = v5;
  int v16 = [v5 payload];
  __int16 v17 = [v16 objectForKeyedSubscript:@"remote-control-status"];
  uint64_t v18 = [v17 firstObject];

  [v18 statusCode];
  int v19 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus();
  if (*(void *)(a1 + 32))
  {
    if (v19 > 9)
    {
      __int16 v20 = v124;
      if (v19 == 10)
      {
        __int16 v21 = @"🚷";
        goto LABEL_11;
      }
      if (v19 == 20)
      {
LABEL_5:
        __int16 v21 = @"📵";
LABEL_11:
        __int16 v121 = v21;
        goto LABEL_12;
      }
    }
    else
    {
      __int16 v20 = v124;
      if (!v19)
      {
        __int16 v21 = @"✅";
        goto LABEL_11;
      }
      if (v19 == 1) {
        goto LABEL_5;
      }
    }
    __int16 v21 = @"🚫";
    goto LABEL_11;
  }
  __int16 v121 = 0;
  __int16 v20 = v124;
LABEL_12:
  int v22 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();
  uint64_t v23 = [v132 payload];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"remote-control-internal-status"];

  [v132 durationSinceEvent:v20];
  uint64_t v26 = v25;
  BOOL v27 = MSVLogDateFormatter();
  __int16 v28 = [v132 date];
  long long v131 = [v27 stringFromDate:v28];

  int v29 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) streamID];
    int v31 = v14;
    int v32 = v13;
    int v33 = v24;
    id v34 = v6;
    uint64_t v35 = a1;
    v37 = uint64_t v36 = v22;
    *(_DWORD *)buf = 138544642;
    __int16 v139 = v131;
    __int16 v140 = 2114;
    __int16 v141 = v37;
    __int16 v142 = 1024;
    int v143 = [v132 threadPriority];
    __int16 v144 = 2114;
    __int16 v145 = v29;
    __int16 v146 = 2114;
    uint64_t v147 = v123;
    __int16 v148 = 2048;
    uint64_t v149 = v26;
    _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪀 COMMAND END                %{public}@ [%.3fs]", buf, 0x3Au);

    int v22 = v36;
    a1 = v35;
    id v6 = v34;
    uint64_t v24 = v33;
    __int16 v13 = v32;
    int v14 = v31;
    __int16 v20 = v124;
  }

  long long v130 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = [*(id *)(a1 + 40) streamID];
    int v40 = [v132 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v139 = v131;
    __int16 v140 = 2114;
    __int16 v141 = v39;
    __int16 v142 = 1024;
    int v143 = v40;
    __int16 v144 = 2114;
    __int16 v145 = v130;
    __int16 v146 = 2114;
    uint64_t v147 = (uint64_t)v13;
    __int16 v148 = 2114;
    uint64_t v149 = (uint64_t)v14;
    _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ command: %{public}@  %{public}@", buf, 0x3Au);
  }
  uint64_t v41 = [v18 type];
  if (v41 > 2)
  {
    if (v41 != 3)
    {
      int v48 = (void *)v123;
      if (v41 == 999)
      {
        uint64_t v125 = a1;
        v122 = v18;
        __int16 v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          id obja = [*(id *)(a1 + 40) streamID];
          __int16 v50 = v24;
          id v51 = v6;
          int v52 = v22;
          int v53 = [v132 threadPriority];
          int v54 = [v18 customDataType];
          __int16 v55 = [v18 customData];
          uint64_t v56 = [v55 length];
          *(_DWORD *)buf = 138544642;
          __int16 v139 = v131;
          __int16 v140 = 2114;
          __int16 v141 = obja;
          __int16 v142 = 1024;
          int v143 = v53;
          int v22 = v52;
          id v6 = v51;
          uint64_t v24 = v50;
          __int16 v144 = 2114;
          __int16 v145 = v130;
          __int16 v146 = 2114;
          uint64_t v147 = (uint64_t)v54;
          __int16 v148 = 2048;
          uint64_t v149 = v56;
          _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ customDataType: %{public}@; customDataSize: %llu",
            buf,
            0x3Au);

          __int16 v20 = v124;
        }

        int v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_74;
        }
        int v45 = [*(id *)(v125 + 40) streamID];
        int v57 = [v132 threadPriority];
        *(_DWORD *)buf = 138544642;
        __int16 v139 = v131;
        __int16 v140 = 2114;
        __int16 v141 = v45;
        __int16 v142 = 1024;
        int v143 = v57;
        __int16 v144 = 2114;
        __int16 v145 = v130;
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v121;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v22;
        uint64_t v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰ status: %{public}@ %{public}@";
        goto LABEL_54;
      }
      goto LABEL_75;
    }
    __int16 v88 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    BOOL v89 = os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);
    id v120 = v6;
    if (v24)
    {
      if (v89)
      {
        __int16 v90 = [*(id *)(a1 + 40) streamID];
        int v91 = [v132 threadPriority];
        *(_DWORD *)buf = 138544898;
        __int16 v139 = v131;
        __int16 v140 = 2114;
        __int16 v141 = v90;
        __int16 v142 = 1024;
        int v143 = v91;
        __int16 v144 = 2114;
        __int16 v145 = v130;
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v121;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v22;
        __int16 v150 = 2114;
        id v151 = v24;
        int v92 = "|%{public}@ %{public}@ %2i %{public}@  │  status: %{public}@ %{public}@; internalStatus: %{public}@";
        int v93 = v88;
        uint32_t v94 = 68;
LABEL_58:
        _os_log_impl(&dword_21BB87000, v93, OS_LOG_TYPE_DEFAULT, v92, buf, v94);
      }
    }
    else if (v89)
    {
      __int16 v90 = [*(id *)(a1 + 40) streamID];
      int v97 = [v132 threadPriority];
      *(_DWORD *)buf = 138544642;
      __int16 v139 = v131;
      __int16 v140 = 2114;
      __int16 v141 = v90;
      __int16 v142 = 1024;
      int v143 = v97;
      __int16 v144 = 2114;
      __int16 v145 = v130;
      __int16 v146 = 2114;
      uint64_t v147 = (uint64_t)v121;
      __int16 v148 = 2114;
      uint64_t v149 = (uint64_t)v22;
      int v92 = "|%{public}@ %{public}@ %2i %{public}@  │  status: %{public}@ %{public}@";
      int v93 = v88;
      uint32_t v94 = 58;
      goto LABEL_58;
    }
    uint64_t v98 = a1;

    v122 = v18;
    id v99 = [v18 error];
    char v100 = objc_msgSend(v99, "msv_description");
    int v43 = [v100 componentsSeparatedByString:@"\n"];

    if (![v43 count])
    {
      __int16 v20 = v124;
LABEL_73:
      id v6 = v120;
      goto LABEL_74;
    }
    long long v114 = v24;
    long long v116 = v22;
    int v118 = v14;
    uint64_t v101 = 0;
    while (1)
    {
      v102 = [v43 objectAtIndexedSubscript:v101];
      if (v101)
      {
        uint64_t v103 = [v43 count] - 1;
        uint64_t v104 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        BOOL v105 = os_log_type_enabled(v104, OS_LOG_TYPE_ERROR);
        if (v101 == v103)
        {
          if (v105)
          {
            uint64_t v106 = [*(id *)(v98 + 40) streamID];
            int v107 = [v132 threadPriority];
            *(_DWORD *)buf = 138544386;
            __int16 v139 = v131;
            __int16 v140 = 2114;
            __int16 v141 = v106;
            __int16 v142 = 1024;
            int v143 = v107;
            __int16 v144 = 2114;
            __int16 v145 = v130;
            __int16 v146 = 2114;
            uint64_t v147 = (uint64_t)v102;
            v108 = v104;
            long long v109 = "|%{public}@ %{public}@ %2i %{public}@  ╰             %{public}@";
LABEL_69:
            _os_log_impl(&dword_21BB87000, v108, OS_LOG_TYPE_ERROR, v109, buf, 0x30u);
          }
        }
        else if (v105)
        {
          uint64_t v106 = [*(id *)(v98 + 40) streamID];
          int v111 = [v132 threadPriority];
          *(_DWORD *)buf = 138544386;
          __int16 v139 = v131;
          __int16 v140 = 2114;
          __int16 v141 = v106;
          __int16 v142 = 1024;
          int v143 = v111;
          __int16 v144 = 2114;
          __int16 v145 = v130;
          __int16 v146 = 2114;
          uint64_t v147 = (uint64_t)v102;
          v108 = v104;
          long long v109 = "|%{public}@ %{public}@ %2i %{public}@  │             %{public}@";
          goto LABEL_69;
        }
      }
      else
      {
        uint64_t v104 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          uint64_t v106 = [*(id *)(v98 + 40) streamID];
          int v110 = [v132 threadPriority];
          *(_DWORD *)buf = 138544386;
          __int16 v139 = v131;
          __int16 v140 = 2114;
          __int16 v141 = v106;
          __int16 v142 = 1024;
          int v143 = v110;
          __int16 v144 = 2114;
          __int16 v145 = v130;
          __int16 v146 = 2114;
          uint64_t v147 = (uint64_t)v102;
          v108 = v104;
          long long v109 = "|%{public}@ %{public}@ %2i %{public}@  │   error: ❌ %{public}@";
          goto LABEL_69;
        }
      }

      if (++v101 >= (unint64_t)[v43 count])
      {
        __int16 v20 = v124;
        int v14 = v118;
        uint64_t v24 = v114;
        int v22 = v116;
        goto LABEL_73;
      }
    }
  }
  if ((unint64_t)v41 < 2)
  {
    uint64_t v42 = a1;
    v122 = v18;
    int v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v44)
      {
        int v45 = [*(id *)(v42 + 40) streamID];
        int v46 = [v132 threadPriority];
        *(_DWORD *)buf = 138544898;
        __int16 v139 = v131;
        __int16 v140 = 2114;
        __int16 v141 = v45;
        __int16 v142 = 1024;
        int v143 = v46;
        __int16 v144 = 2114;
        __int16 v145 = v130;
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v121;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v22;
        __int16 v150 = 2114;
        id v151 = v24;
        uint64_t v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@; internalStatus: %{public}@";
LABEL_46:
        __int16 v86 = v43;
        uint32_t v87 = 68;
LABEL_55:
        _os_log_impl(&dword_21BB87000, v86, OS_LOG_TYPE_DEFAULT, v47, buf, v87);

        goto LABEL_74;
      }
      goto LABEL_74;
    }
    if (!v44) {
      goto LABEL_74;
    }
    int v45 = [*(id *)(v42 + 40) streamID];
    int v95 = [v132 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v139 = v131;
    __int16 v140 = 2114;
    __int16 v141 = v45;
    __int16 v142 = 1024;
    int v143 = v95;
    __int16 v144 = 2114;
    __int16 v145 = v130;
    __int16 v146 = 2114;
    uint64_t v147 = (uint64_t)v121;
    __int16 v148 = 2114;
    uint64_t v149 = (uint64_t)v22;
    uint64_t v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@";
    goto LABEL_54;
  }
  int v48 = (void *)v123;
  if (v41 == 2)
  {
    uint64_t v126 = a1;
    long long v113 = v24;
    __int16 v115 = v22;
    __int16 v117 = v14;
    id v119 = v6;
    int v58 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v59 = [*(id *)(a1 + 40) streamID];
      int v60 = [v132 threadPriority];
      uint64_t v61 = [v18 dialog];
      int v62 = [v61 localizedTitle];
      __int16 v63 = [v18 dialog];
      unint64_t v64 = [v63 localizedMessage];
      *(_DWORD *)buf = 138544642;
      __int16 v139 = v131;
      __int16 v140 = 2114;
      __int16 v141 = v59;
      __int16 v142 = 1024;
      int v143 = v60;
      __int16 v144 = 2114;
      __int16 v145 = v130;
      __int16 v146 = 2114;
      uint64_t v147 = (uint64_t)v62;
      __int16 v148 = 2114;
      uint64_t v149 = (uint64_t)v64;
      _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.title: %{public}@; dialog.message: %{public}@",
        buf,
        0x3Au);
    }
    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    v122 = v18;
    uint64_t v65 = [v18 dialog];
    __int16 v66 = [v65 actions];

    obuint64_t j = v66;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v133 objects:v137 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v134;
      uint64_t v70 = "PlaybackEvents";
      do
      {
        uint64_t v71 = 0;
        uint64_t v127 = v68;
        do
        {
          if (*(void *)v134 != v69) {
            objc_enumerationMutation(obj);
          }
          uint64_t v72 = *(void **)(*((void *)&v133 + 1) + 8 * v71);
          unint64_t v73 = [v72 type];
          id v74 = @"􀿨 ";
          if (v73 <= 2) {
            id v74 = off_2643BEEB0[v73];
          }
          uint64_t v75 = os_log_create("com.apple.amp.mediaplaybackcore", v70);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            [*(id *)(v126 + 40) streamID];
            v77 = uint64_t v76 = v69;
            int v78 = [v132 threadPriority];
            [v72 title];
            uint64_t v80 = v79 = v70;
            uint64_t v81 = [v72 event];
            int v82 = (void *)v81;
            *(_DWORD *)buf = 138544898;
            uint64_t v83 = &stru_26CBCA930;
            if (v81) {
              uint64_t v83 = (__CFString *)v81;
            }
            __int16 v139 = v131;
            __int16 v140 = 2114;
            __int16 v141 = v77;
            __int16 v142 = 1024;
            int v143 = v78;
            __int16 v144 = 2114;
            __int16 v145 = v130;
            __int16 v146 = 2114;
            uint64_t v147 = (uint64_t)v74;
            __int16 v148 = 2114;
            uint64_t v149 = (uint64_t)v80;
            __int16 v150 = 2114;
            id v151 = v83;
            _os_log_impl(&dword_21BB87000, v75, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ dialog.action[%{public}@]: %{public}@ %{public}@", buf, 0x44u);

            uint64_t v70 = v79;
            uint64_t v69 = v76;
            uint64_t v68 = v127;
          }

          ++v71;
        }
        while (v68 != v71);
        uint64_t v68 = [obj countByEnumeratingWithState:&v133 objects:v137 count:16];
      }
      while (v68);
    }

    int v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    BOOL v84 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
    uint64_t v24 = v113;
    int v22 = v115;
    if (v113)
    {
      id v6 = v119;
      __int16 v20 = v124;
      int v14 = v117;
      if (v84)
      {
        int v45 = [*(id *)(v126 + 40) streamID];
        int v85 = [v132 threadPriority];
        *(_DWORD *)buf = 138544898;
        __int16 v139 = v131;
        __int16 v140 = 2114;
        __int16 v141 = v45;
        __int16 v142 = 1024;
        int v143 = v85;
        __int16 v144 = 2114;
        __int16 v145 = v130;
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v121;
        __int16 v148 = 2114;
        uint64_t v149 = (uint64_t)v115;
        __int16 v150 = 2114;
        id v151 = v113;
        uint64_t v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@; internalStatus: %{public}@";
        goto LABEL_46;
      }
LABEL_74:

      uint64_t v18 = v122;
      int v48 = (void *)v123;
      goto LABEL_75;
    }
    id v6 = v119;
    __int16 v20 = v124;
    int v14 = v117;
    if (!v84) {
      goto LABEL_74;
    }
    int v45 = [*(id *)(v126 + 40) streamID];
    int v96 = [v132 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v139 = v131;
    __int16 v140 = 2114;
    __int16 v141 = v45;
    __int16 v142 = 1024;
    int v143 = v96;
    __int16 v144 = 2114;
    __int16 v145 = v130;
    __int16 v146 = 2114;
    uint64_t v147 = (uint64_t)v121;
    __int16 v148 = 2114;
    uint64_t v149 = (uint64_t)v115;
    uint64_t v47 = "|%{public}@ %{public}@ %2i %{public}@  ╰  status: %{public}@ %{public}@";
LABEL_54:
    __int16 v86 = v43;
    uint32_t v87 = 58;
    goto LABEL_55;
  }
LABEL_75:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  id v8 = [v5 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  int v10 = [v5 payload];
  id v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v12 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:0];

  __int16 v13 = [v12 payload];
  int v14 = [v13 objectForKeyedSubscript:@"queue-section-id"];

  __int16 v15 = [v12 payload];
  int v16 = [v15 objectForKeyedSubscript:@"queue-item-id"];

  id v17 = v14;
  if (v9 == v17)
  {
  }
  else
  {
    int v18 = [v9 isEqual:v17];

    if (!v18) {
      goto LABEL_12;
    }
  }
  id v19 = v16;
  if (v11 == v19)
  {
  }
  else
  {
    __int16 v20 = v19;
    int v21 = [v11 isEqual:v19];

    if (!v21) {
      goto LABEL_12;
    }
  }
  int v22 = MSVLogDateFormatter();
  uint64_t v23 = [v5 date];
  uint64_t v24 = [v22 stringFromDate:v23];

  uint64_t v25 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    BOOL v27 = [*(id *)(a1 + 40) streamID];
    int v29 = 138544642;
    uint64_t v30 = v24;
    __int16 v31 = 2114;
    int v32 = v27;
    __int16 v33 = 1024;
    int v34 = [v5 threadPriority];
    __int16 v35 = 2114;
    uint64_t v36 = v25;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 2114;
    id v40 = v11;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀃜 QUEUE ITEM ADD             %{public}@ %{public}@", (uint8_t *)&v29, 0x3Au);
  }
LABEL_12:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  id v8 = [v5 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  int v10 = [v5 payload];
  id v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v12 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:0];

  __int16 v13 = [v12 payload];
  int v14 = [v13 objectForKeyedSubscript:@"queue-section-id"];

  __int16 v15 = [v12 payload];
  int v16 = [v15 objectForKeyedSubscript:@"queue-item-id"];

  id v17 = v14;
  if (v9 == v17)
  {
  }
  else
  {
    int v18 = [v9 isEqual:v17];

    if (!v18) {
      goto LABEL_12;
    }
  }
  id v19 = v16;
  if (v11 == v19)
  {
  }
  else
  {
    __int16 v20 = v19;
    int v21 = [v11 isEqual:v19];

    if (!v21) {
      goto LABEL_12;
    }
  }
  int v22 = MSVLogDateFormatter();
  uint64_t v23 = [v5 date];
  uint64_t v24 = [v22 stringFromDate:v23];

  uint64_t v25 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    BOOL v27 = [*(id *)(a1 + 40) streamID];
    int v29 = 138544642;
    uint64_t v30 = v24;
    __int16 v31 = 2114;
    int v32 = v27;
    __int16 v33 = 1024;
    int v34 = [v5 threadPriority];
    __int16 v35 = 2114;
    uint64_t v36 = v25;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 2114;
    id v40 = v11;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀃞 QUEUE ITEM REMOVE          %{public}@ %{public}@", (uint8_t *)&v29, 0x3Au);
  }
LABEL_12:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  id v8 = [v5 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  int v10 = [v5 payload];
  id v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v12 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:0];

  __int16 v13 = [v12 payload];
  int v14 = [v13 objectForKeyedSubscript:@"queue-section-id"];

  __int16 v15 = [v12 payload];
  int v16 = [v15 objectForKeyedSubscript:@"queue-item-id"];

  id v17 = v14;
  if (v9 == v17)
  {
  }
  else
  {
    int v18 = [v9 isEqual:v17];

    if (!v18) {
      goto LABEL_12;
    }
  }
  id v19 = v16;
  if (v11 == v19)
  {
  }
  else
  {
    __int16 v20 = v19;
    int v21 = [v11 isEqual:v19];

    if (!v21) {
      goto LABEL_12;
    }
  }
  int v22 = MSVLogDateFormatter();
  uint64_t v23 = [v5 date];
  uint64_t v24 = [v22 stringFromDate:v23];

  uint64_t v25 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    BOOL v27 = [*(id *)(a1 + 40) streamID];
    int v29 = 138544642;
    uint64_t v30 = v24;
    __int16 v31 = 2114;
    int v32 = v27;
    __int16 v33 = 1024;
    int v34 = [v5 threadPriority];
    __int16 v35 = 2114;
    uint64_t v36 = v25;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 2114;
    id v40 = v11;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀄎 QUEUE ITEM REORDER         %{public}@ %{public}@", (uint8_t *)&v29, 0x3Au);
  }
LABEL_12:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_100(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"container-metadata"];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"container-title"];
  id v7 = [v3 payload];
  int v52 = [v7 objectForKeyedSubscript:@"container-kind"];

  id v8 = [v3 payload];
  id v51 = [v8 objectForKeyedSubscript:@"container-ids"];

  id v9 = MSVLogDateFormatter();
  int v10 = [v3 date];
  uint64_t v53 = [v9 stringFromDate:v10];

  id v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [*(id *)(a1 + 40) streamID];
    int v14 = [v3 threadPriority];
    __int16 v15 = [v3 payload];
    int v16 = [v15 objectForKeyedSubscript:@"queue-section-id"];
    *(_DWORD *)buf = 138544386;
    uint64_t v55 = v53;
    __int16 v56 = 2114;
    int v57 = v13;
    __int16 v58 = 1024;
    int v59 = v14;
    __int16 v60 = 2114;
    uint64_t v61 = (uint64_t)v11;
    __int16 v62 = 2114;
    uint64_t v63 = (uint64_t)v16;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈯 CONTAINER BEGIN            %{public}@", buf, 0x30u);
  }
  uint64_t v17 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  id v19 = (void *)v53;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = [*(id *)(a1 + 40) streamID];
    int v21 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    uint64_t v55 = v53;
    __int16 v56 = 2114;
    int v57 = v20;
    __int16 v58 = 1024;
    int v59 = v21;
    __int16 v60 = 2114;
    uint64_t v61 = v17;
    __int16 v62 = 2114;
    uint64_t v63 = (uint64_t)v6;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@", buf, 0x30u);
  }
  int v22 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [*(id *)(a1 + 40) streamID];
    int v24 = [v3 threadPriority];
    uint64_t v25 = [v52 humanDescription];
    *(_DWORD *)buf = 138544386;
    uint64_t v55 = v53;
    __int16 v56 = 2114;
    int v57 = v23;
    __int16 v58 = 1024;
    int v59 = v24;
    __int16 v60 = 2114;
    uint64_t v61 = v17;
    __int16 v62 = 2114;
    uint64_t v63 = (uint64_t)v25;
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ kind: %{public}@", buf, 0x30u);
  }
  uint64_t v26 = [v5 objectForKeyedSubscript:@"container-playlist-version-hash"];
  if (v26)
  {
    BOOL v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = [*(id *)(a1 + 40) streamID];
      int v29 = [v3 threadPriority];
      *(_DWORD *)buf = 138544386;
      uint64_t v55 = v53;
      __int16 v56 = 2114;
      int v57 = v28;
      __int16 v58 = 1024;
      int v59 = v29;
      __int16 v60 = 2114;
      uint64_t v61 = v17;
      __int16 v62 = 2114;
      uint64_t v63 = v26;
      _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ playlistVersionHash: %{public}@", buf, 0x30u);
    }
  }
  __int16 v50 = (void *)v26;
  uint64_t v30 = (void *)v17;
  __int16 v31 = [v5 objectForKeyedSubscript:@"container-is-collaborative-playlist"];
  if (v31)
  {
    int v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v33 = [*(id *)(a1 + 40) streamID];
      int v34 = [v3 threadPriority];
      int v35 = [v31 BOOLValue];
      *(_DWORD *)buf = 138544386;
      uint64_t v55 = v53;
      __int16 v56 = 2114;
      int v57 = v33;
      __int16 v58 = 1024;
      int v59 = v34;
      __int16 v60 = 2114;
      uint64_t v61 = (uint64_t)v30;
      __int16 v62 = 1024;
      LODWORD(v63) = v35;
      _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ isCollaborative: %{BOOL}u", buf, 0x2Cu);
    }
  }
  uint64_t v36 = [v5 objectForKeyedSubscript:@"container-radio-type"];
  uint64_t v37 = [v36 integerValue];

  id v38 = [v5 objectForKeyedSubscript:@"container-radio-subtype"];
  [v38 integerValue];

  if (v37)
  {
    __int16 v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) streamID];
      id v40 = v49 = v6;
      int v41 = [v3 threadPriority];
      uint64_t v42 = NSStringFromMPModelRadioStationType();
      int v43 = NSStringFromMPModelRadioStationSubtype();
      *(_DWORD *)buf = 138544642;
      uint64_t v55 = v53;
      __int16 v56 = 2114;
      int v57 = v40;
      __int16 v58 = 1024;
      int v59 = v41;
      id v19 = (void *)v53;
      __int16 v60 = 2114;
      uint64_t v61 = (uint64_t)v30;
      __int16 v62 = 2114;
      uint64_t v63 = (uint64_t)v42;
      __int16 v64 = 2114;
      uint64_t v65 = v43;
      _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ stationType: %{public}@; stationSubtype: %{public}@",
        buf,
        0x3Au);

      uint64_t v6 = v49;
    }
  }
  BOOL v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = [*(id *)(a1 + 40) streamID];
    int v46 = [v3 threadPriority];
    uint64_t v47 = [v51 humanDescription];
    *(_DWORD *)buf = 138544386;
    uint64_t v55 = (uint64_t)v19;
    __int16 v56 = 2114;
    int v57 = v45;
    __int16 v58 = 1024;
    int v59 = v46;
    __int16 v60 = 2114;
    uint64_t v61 = (uint64_t)v30;
    __int16 v62 = 2114;
    uint64_t v63 = (uint64_t)v47;
    _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ identifiers: %{public}@", buf, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  v49[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  int v48 = @"queue-section-id";
  id v8 = [v5 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];
  v49[0] = v9;
  int v10 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
  id v11 = [v7 findPreviousEventWithType:@"container-begin" matchingPayload:v10];

  uint64_t v12 = [v11 payload];
  __int16 v13 = [v12 objectForKeyedSubscript:@"container-metadata"];
  int v14 = [v13 objectForKeyedSubscript:@"container-title"];

  __int16 v15 = [v11 payload];
  int v16 = [v15 objectForKeyedSubscript:@"container-ids"];

  uint64_t v17 = MSVLogDateFormatter();
  int v18 = [v5 date];
  id v19 = [v17 stringFromDate:v18];

  __int16 v20 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) streamID];
    uint64_t v36 = v14;
    int v22 = v37 = v11;
    uint64_t v23 = v16;
    int v24 = [v5 threadPriority];
    uint64_t v25 = [v5 payload];
    uint64_t v26 = [v25 objectForKeyedSubscript:@"queue-section-id"];
    *(_DWORD *)buf = 138544386;
    __int16 v39 = v19;
    __int16 v40 = 2114;
    int v41 = v22;
    __int16 v42 = 1024;
    int v43 = v24;
    int v16 = v23;
    __int16 v44 = 2114;
    int v45 = v20;
    __int16 v46 = 2114;
    uint64_t v47 = v26;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀈰 CONTAINER END              %{public}@", buf, 0x30u);

    int v14 = v36;
    id v11 = v37;
  }

  BOOL v27 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = [*(id *)(a1 + 40) streamID];
    int v30 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    __int16 v39 = v19;
    __int16 v40 = 2114;
    int v41 = v29;
    __int16 v42 = 1024;
    int v43 = v30;
    __int16 v44 = 2114;
    int v45 = v27;
    __int16 v46 = 2114;
    uint64_t v47 = v14;
    _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ title: %{public}@", buf, 0x30u);
  }
  __int16 v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = [*(id *)(a1 + 40) streamID];
    int v33 = [v5 threadPriority];
    int v34 = [v16 humanDescription];
    *(_DWORD *)buf = 138544386;
    __int16 v39 = v19;
    __int16 v40 = 2114;
    int v41 = v32;
    __int16 v42 = 1024;
    int v43 = v33;
    __int16 v44 = 2114;
    int v45 = v27;
    __int16 v46 = 2114;
    uint64_t v47 = v34;
    _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ identifiers: %{public}@", buf, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  id v8 = [v3 payload];
  id v9 = [v8 objectForKeyedSubscript:@"item-ids"];

  int v10 = MSVLogDateFormatter();
  id v11 = [v3 date];
  uint64_t v12 = [v10 stringFromDate:v11];

  __int16 v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [*(id *)(a1 + 40) streamID];
    int v22 = 138544642;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v15;
    __int16 v26 = 1024;
    int v27 = [v3 threadPriority];
    __int16 v28 = 2114;
    int v29 = v13;
    __int16 v30 = 2114;
    __int16 v31 = v5;
    __int16 v32 = 2114;
    int v33 = v7;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍷 ITEM UPDATE                %{public}@ %{public}@", (uint8_t *)&v22, 0x3Au);
  }
  int v16 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = [*(id *)(a1 + 40) streamID];
    int v19 = [v3 threadPriority];
    __int16 v20 = [v9 humanDescription];
    int v22 = 138544386;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v18;
    __int16 v26 = 1024;
    int v27 = v19;
    __int16 v28 = 2114;
    int v29 = v16;
    __int16 v30 = 2114;
    __int16 v31 = v20;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ identifiers: %{public}@", (uint8_t *)&v22, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  v72[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  id v8 = [v5 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  int v10 = [v5 payload];
  id v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v12 = [v5 payload];
  __int16 v13 = [v12 objectForKeyedSubscript:@"item-start-position"];
  [v13 doubleValue];
  __int16 v15 = v14;

  int v16 = [v5 payload];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"item-end-position"];
  [v17 doubleValue];
  double v19 = v18;

  __int16 v20 = [v5 payload];
  int v54 = [v20 objectForKeyedSubscript:@"item-jump-identifier"];

  int v21 = [v5 payload];
  int v22 = [v21 objectForKeyedSubscript:@"item-jump-user-initiated"];
  int v51 = [v22 BOOLValue];

  v71[0] = @"queue-section-id";
  v71[1] = @"queue-item-id";
  v72[0] = v9;
  v72[1] = v11;
  uint64_t v23 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
  __int16 v24 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v23];

  v69[0] = @"queue-section-id";
  v69[1] = @"queue-item-id";
  v70[0] = v9;
  v70[1] = v11;
  uint64_t v25 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
  __int16 v26 = [v7 findPreviousEventWithType:@"item-update" matchingPayload:v25];

  uint64_t v53 = v24;
  int v27 = [v24 payload];
  __int16 v28 = [v27 objectForKeyedSubscript:@"item-metadata"];
  int v29 = [v28 objectForKeyedSubscript:@"item-duration"];
  [v29 doubleValue];
  int v52 = v26;
  if (v30 == 0.0)
  {
    __int16 v31 = [v26 payload];
    __int16 v32 = [v31 objectForKeyedSubscript:@"item-metadata"];
    int v33 = [v32 objectForKeyedSubscript:@"item-duration"];
    [v33 doubleValue];
    double v35 = v34;
  }
  else
  {
    double v35 = v30;
  }

  uint64_t v36 = [*(id *)(a1 + 32) _playbackBarWithElapsedTime:v19 duration:v35];
  uint64_t v37 = MSVLogDateFormatter();
  id v38 = [v5 date];
  __int16 v39 = [v37 stringFromDate:v38];

  __int16 v40 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v42 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    __int16 v56 = v39;
    __int16 v57 = 2114;
    __int16 v58 = v42;
    __int16 v59 = 1024;
    int v60 = [v5 threadPriority];
    __int16 v61 = 2114;
    __int16 v62 = v40;
    __int16 v63 = 2114;
    __int16 v64 = v9;
    __int16 v65 = 2114;
    double v66 = *(double *)&v11;
    __int16 v67 = 2114;
    uint64_t v68 = v36;
    _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘨 ITEM JUMP                  %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);
  }
  int v43 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = [*(id *)(a1 + 40) streamID];
    int v46 = [v5 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v56 = v39;
    __int16 v57 = 2114;
    __int16 v58 = v45;
    __int16 v59 = 1024;
    int v60 = v46;
    __int16 v61 = 2114;
    __int16 v62 = v43;
    __int16 v63 = 2048;
    __int16 v64 = v15;
    __int16 v65 = 2048;
    double v66 = v19;
    _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f; end: %0.2f",
      buf,
      0x3Au);
  }
  uint64_t v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    int v48 = [*(id *)(a1 + 40) streamID];
    int v49 = [v5 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v56 = v39;
    __int16 v57 = 2114;
    __int16 v58 = v48;
    __int16 v59 = 1024;
    int v60 = v49;
    __int16 v61 = 2114;
    __int16 v62 = v43;
    __int16 v63 = 2114;
    __int16 v64 = v54;
    __int16 v65 = 1024;
    LODWORD(v66) = v51;
    _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ jumpIdentifier: %{public}@; userInitiated: %{BOOL}u",
      buf,
      0x36u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  v55[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  id v7 = [v5 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"queue-section-id"];

  id v9 = [v5 payload];
  int v10 = [v9 objectForKeyedSubscript:@"queue-item-id"];

  v54[0] = @"queue-section-id";
  v54[1] = @"queue-item-id";
  v55[0] = v8;
  v55[1] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
  uint64_t v12 = [v6 findPreviousEventWithType:@"item-begin" matchingPayload:v11];

  __int16 v13 = [v5 payload];
  int v14 = [v13 objectForKeyedSubscript:@"item-end-position"];
  [v14 doubleValue];
  double v16 = v15;

  uint64_t v37 = v12;
  uint64_t v17 = [v12 payload];
  double v18 = [v17 objectForKeyedSubscript:@"item-metadata"];
  double v19 = [v18 objectForKeyedSubscript:@"item-duration"];
  [v19 doubleValue];
  double v21 = v20;

  if (v21 == 0.0)
  {
    v52[0] = @"queue-section-id";
    v52[1] = @"queue-item-id";
    int v22 = (void *)v8;
    v53[0] = v8;
    v53[1] = v10;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
    __int16 v24 = [v6 findPreviousEventWithType:@"item-update" matchingPayload:v23];

    uint64_t v25 = [v24 payload];
    __int16 v26 = [v25 objectForKeyedSubscript:@"item-metadata"];
    int v27 = [v26 objectForKeyedSubscript:@"item-duration"];
    [v27 doubleValue];
    double v21 = v28;
  }
  else
  {
    int v22 = (void *)v8;
  }
  int v29 = [*(id *)(a1 + 32) _playbackBarWithElapsedTime:v16 duration:v21];
  double v30 = MSVLogDateFormatter();
  __int16 v31 = [v5 date];
  __int16 v32 = [v30 stringFromDate:v31];

  int v33 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    double v35 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    __int16 v39 = v32;
    __int16 v40 = 2114;
    int v41 = v35;
    __int16 v42 = 1024;
    int v43 = [v5 threadPriority];
    __int16 v44 = 2114;
    int v45 = v33;
    __int16 v46 = 2114;
    uint64_t v47 = v22;
    __int16 v48 = 2114;
    int v49 = v10;
    __int16 v50 = 2114;
    int v51 = v29;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀡐 ITEM TICK                  %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  v73[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v51 = a1;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  uint64_t v8 = [v5 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  int v10 = [v5 payload];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v12 = [v5 payload];
  __int16 v13 = [v12 objectForKeyedSubscript:@"item-end-position"];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = [v5 payload];
  int v54 = [v16 objectForKeyedSubscript:@"item-rate-change-reason"];

  uint64_t v17 = [v5 payload];
  uint64_t v55 = [v17 objectForKeyedSubscript:@"item-rate-change-source"];

  v72[0] = @"queue-section-id";
  v72[1] = @"queue-item-id";
  v73[0] = v9;
  v73[1] = v11;
  double v18 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
  double v19 = [v7 findPreviousEventWithType:@"item-update" matchingPayload:v18];

  v70[0] = @"queue-section-id";
  v70[1] = @"queue-item-id";
  double v20 = (void *)v9;
  v71[0] = v9;
  v71[1] = v11;
  uint64_t v53 = (void *)v11;
  double v21 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
  int v22 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v21];

  uint64_t v23 = [v22 payload];
  __int16 v24 = [v23 objectForKeyedSubscript:@"item-metadata"];
  uint64_t v25 = [v24 objectForKeyedSubscript:@"item-duration"];
  [v25 doubleValue];
  int v52 = v19;
  if (v26 == 0.0)
  {
    int v27 = [v19 payload];
    double v28 = [v27 objectForKeyedSubscript:@"item-metadata"];
    int v29 = [v28 objectForKeyedSubscript:@"item-duration"];
    [v29 doubleValue];
    double v31 = v30;
  }
  else
  {
    double v31 = v26;
  }

  __int16 v32 = [*(id *)(v51 + 32) _playbackBarWithElapsedTime:v15 duration:v31];
  int v33 = MSVLogDateFormatter();
  double v34 = [v5 date];
  double v35 = [v33 stringFromDate:v34];

  uint64_t v36 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v51 + 32));
  uint64_t v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    id v38 = [*(id *)(v51 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    __int16 v57 = v35;
    __int16 v58 = 2114;
    __int16 v59 = v38;
    __int16 v60 = 1024;
    int v61 = [v5 threadPriority];
    __int16 v62 = 2114;
    __int16 v63 = v36;
    __int16 v64 = 2114;
    double v65 = *(double *)&v20;
    __int16 v66 = 2114;
    __int16 v67 = v53;
    __int16 v68 = 2114;
    uint64_t v69 = v32;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀊘 ITEM PAUSE                 %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);
  }
  __int16 v39 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v51 + 32));
  __int16 v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = [*(id *)(v51 + 40) streamID];
    int v42 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    __int16 v57 = v35;
    __int16 v58 = 2114;
    __int16 v59 = v41;
    __int16 v60 = 1024;
    int v61 = v42;
    __int16 v62 = 2114;
    __int16 v63 = v39;
    __int16 v64 = 2048;
    double v65 = v15;
    _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ end: %0.2f", buf, 0x30u);
  }
  int v43 = (void *)v55;
  if ([v54 length])
  {
    __int16 v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = [*(id *)(v51 + 40) streamID];
      int v46 = [v5 threadPriority];
      *(_DWORD *)buf = 138544386;
      __int16 v57 = v35;
      __int16 v58 = 2114;
      __int16 v59 = v45;
      __int16 v60 = 1024;
      int v61 = v46;
      __int16 v62 = 2114;
      __int16 v63 = v39;
      __int16 v64 = 2114;
      double v65 = *(double *)&v54;
      _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ reason: %{public}@", buf, 0x30u);

      int v43 = (void *)v55;
    }
  }
  if ([v43 length])
  {
    uint64_t v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v48 = [*(id *)(v51 + 40) streamID];
      int v49 = [v5 threadPriority];
      *(_DWORD *)buf = 138544386;
      __int16 v57 = v35;
      __int16 v58 = 2114;
      __int16 v59 = v48;
      __int16 v60 = 1024;
      int v61 = v49;
      __int16 v62 = 2114;
      __int16 v63 = v39;
      __int16 v64 = 2114;
      double v65 = *(double *)&v43;
      _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ source: %{public}@", buf, 0x30u);
    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_107(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  double v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-rate-change-position"];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v3 payload];
  __int16 v13 = [v12 objectForKeyedSubscript:@"item-rate"];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = [v3 payload];
  double v17 = [v16 objectForKeyedSubscript:@"item-rate-change-reason"];

  double v18 = [v3 payload];
  double v19 = [v18 objectForKeyedSubscript:@"item-rate-change-participant-id"];

  double v20 = MSVLogDateFormatter();
  double v21 = [v3 date];
  int v22 = [v20 stringFromDate:v21];

  uint64_t v23 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [*(id *)(a1 + 40) streamID];
    int v41 = 138544642;
    int v42 = v22;
    __int16 v43 = 2114;
    __int16 v44 = v25;
    __int16 v45 = 1024;
    int v46 = [v3 threadPriority];
    __int16 v47 = 2114;
    __int16 v48 = v23;
    __int16 v49 = 2114;
    double v50 = v5;
    __int16 v51 = 2114;
    int v52 = v7;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀊕 RATE CHANGED               %{public}@ %{public}@ ", (uint8_t *)&v41, 0x3Au);
  }
  double v26 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v27 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    double v28 = [*(id *)(a1 + 40) streamID];
    int v29 = [v3 threadPriority];
    int v41 = 138544386;
    int v42 = v22;
    __int16 v43 = 2114;
    __int16 v44 = v28;
    __int16 v45 = 1024;
    int v46 = v29;
    __int16 v47 = 2114;
    __int16 v48 = v26;
    __int16 v49 = 2048;
    double v50 = v11;
    _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ position: %0.2f", (uint8_t *)&v41, 0x30u);
  }
  if ([*(id *)&v17 length])
  {
    double v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      double v31 = [*(id *)(a1 + 40) streamID];
      int v32 = [v3 threadPriority];
      int v41 = 138544386;
      int v42 = v22;
      __int16 v43 = 2114;
      __int16 v44 = v31;
      __int16 v45 = 1024;
      int v46 = v32;
      __int16 v47 = 2114;
      __int16 v48 = v26;
      __int16 v49 = 2114;
      double v50 = v17;
      _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ reason: %{public}@", (uint8_t *)&v41, 0x30u);
    }
  }
  if ([*(id *)&v19 length])
  {
    int v33 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      double v34 = [*(id *)(a1 + 40) streamID];
      int v35 = [v3 threadPriority];
      int v41 = 138544386;
      int v42 = v22;
      __int16 v43 = 2114;
      __int16 v44 = v34;
      __int16 v45 = 1024;
      int v46 = v35;
      __int16 v47 = 2114;
      __int16 v48 = v26;
      __int16 v49 = 2114;
      double v50 = v19;
      _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ participant: %{public}@", (uint8_t *)&v41, 0x30u);
    }
  }
  uint64_t v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    float v37 = v15;
    id v38 = [*(id *)(a1 + 40) streamID];
    int v39 = [v3 threadPriority];
    int v41 = 138544386;
    int v42 = v22;
    __int16 v43 = 2114;
    __int16 v44 = v38;
    __int16 v45 = 1024;
    int v46 = v39;
    __int16 v47 = 2114;
    __int16 v48 = v26;
    __int16 v49 = 2048;
    double v50 = v37;
    _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ rate: %0.2f", (uint8_t *)&v41, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  void v71[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v51 = a1;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  id v7 = [v5 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v9 = [v5 payload];
  double v10 = [v9 objectForKeyedSubscript:@"queue-item-id"];

  double v11 = [v5 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"event-time-offset"];
  [v12 doubleValue];
  double v14 = v13;

  double v15 = [v5 date];
  double v50 = [v15 dateByAddingTimeInterval:v14];

  uint64_t v53 = 0;
  int v54 = &v53;
  uint64_t v55 = 0x3032000000;
  __int16 v56 = __Block_byref_object_copy__1433;
  __int16 v57 = __Block_byref_object_dispose__1434;
  id v58 = 0;
  v71[0] = @"remote-control-begin";
  v71[1] = @"item-end";
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  void v52[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_110;
  v52[3] = &unk_2643C62C8;
  v52[4] = &v53;
  [v6 enumeratePreviousEventsWithTypes:v16 usingBlock:v52];

  double v17 = [(id)v54[5] type];
  LODWORD(v12) = [v17 isEqualToString:@"remote-control-begin"];

  double v18 = (void *)v54[5];
  if (v12)
  {
    double v19 = [v18 payload];
    double v20 = [v19 objectForKeyedSubscript:@"remote-control-options"];

    double v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F54C68]];
    [v21 doubleValue];
    double v23 = v22;

    if (v23 <= 0.0)
    {
      double v28 = [(id)v54[5] date];
      [v50 timeIntervalSinceDate:v28];
      double v25 = v29;
    }
    else
    {
      [v50 timeIntervalSinceReferenceDate];
      double v25 = v24 - v23;
    }
  }
  else
  {
    double v26 = [v18 type];
    int v27 = [v26 isEqualToString:@"item-end"];

    if (!v27)
    {
      double v25 = NAN;
      goto LABEL_9;
    }
    double v20 = [(id)v54[5] date];
    [v50 timeIntervalSinceDate:v20];
    double v25 = NAN;
  }

LABEL_9:
  double v30 = MSVLogDateFormatter();
  double v31 = [v5 date];
  int v32 = [v30 stringFromDate:v31];

  int v33 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v51 + 32));
  double v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = [*(id *)(v51 + 40) streamID];
    int v36 = [v5 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v60 = v32;
    __int16 v61 = 2114;
    __int16 v62 = v35;
    __int16 v63 = 1024;
    int v64 = v36;
    __int16 v65 = 2114;
    __int16 v66 = v33;
    __int16 v67 = 2114;
    double v68 = *(double *)&v8;
    __int16 v69 = 2114;
    uint64_t v70 = v10;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀀻 FIRST AUDIO FRAME          %{public}@ %{public}@ ", buf, 0x3Au);
  }
  float v37 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v51 + 32));
  id v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v49 = v10;
    int v39 = v8;
    id v40 = v6;
    int v41 = [*(id *)(v51 + 40) streamID];
    int v42 = [v5 threadPriority];
    __int16 v43 = MSVLogDateFormatter();
    __int16 v44 = [v43 stringFromDate:v50];
    *(_DWORD *)buf = 138544386;
    __int16 v60 = v32;
    __int16 v61 = 2114;
    __int16 v62 = v41;
    __int16 v63 = 1024;
    int v64 = v42;
    __int16 v65 = 2114;
    __int16 v66 = v37;
    __int16 v67 = 2114;
    double v68 = *(double *)&v44;
    _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ actual: %{public}@", buf, 0x30u);

    id v6 = v40;
    uint64_t v8 = v39;
    double v10 = v49;
  }
  __int16 v45 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = [*(id *)(v51 + 40) streamID];
    int v47 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    __int16 v60 = v32;
    __int16 v61 = 2114;
    __int16 v62 = v46;
    __int16 v63 = 1024;
    int v64 = v47;
    __int16 v65 = 2114;
    __int16 v66 = v37;
    __int16 v67 = 2048;
    double v68 = v25;
    _os_log_impl(&dword_21BB87000, v45, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ waitTime: %0.2fs", buf, 0x30u);
  }
  _Block_object_dispose(&v53, 8);

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_112(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  id v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"av-player-item-performance-metrics"];

  double v10 = MSVLogDateFormatter();
  double v11 = [v3 date];
  uint64_t v12 = [v10 stringFromDate:v11];

  double v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = [*(id *)(a1 + 40) streamID];
    int v21 = 138544642;
    double v22 = v12;
    __int16 v23 = 2114;
    double v24 = v15;
    __int16 v25 = 1024;
    int v26 = [v3 threadPriority];
    __int16 v27 = 2114;
    double v28 = v13;
    __int16 v29 = 2114;
    double v30 = v5;
    __int16 v31 = 2114;
    int v32 = v7;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍾 ITEM READY FOR METRICS     %{public}@ %{public}@ ", (uint8_t *)&v21, 0x3Au);
  }
  double v16 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = [*(id *)(a1 + 40) streamID];
    int v19 = [v3 threadPriority];
    int v21 = 138544386;
    double v22 = v12;
    __int16 v23 = 2114;
    double v24 = v18;
    __int16 v25 = 1024;
    int v26 = v19;
    __int16 v27 = 2114;
    double v28 = v16;
    __int16 v29 = 2114;
    double v30 = v9;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ accessLog: %{public}@", (uint8_t *)&v21, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_113(uint64_t a1, void *a2, void *a3)
{
  v95[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  uint64_t v8 = [v5 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  double v10 = (void *)v9;
  double v11 = [v5 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"queue-item-id"];

  double v13 = [v5 payload];
  double v14 = [v13 objectForKeyedSubscript:@"item-start-position"];
  [v14 doubleValue];
  double v16 = v15;

  double v17 = [v5 payload];
  double v18 = [v17 objectForKeyedSubscript:@"event-time-offset"];
  [v18 doubleValue];
  double v20 = v19;

  int v21 = [v5 payload];
  double v22 = [v21 objectForKeyedSubscript:@"supports-vocal-attenuation"];
  int v77 = [v22 BOOLValue];

  __int16 v23 = [v5 payload];
  double v24 = [v23 objectForKeyedSubscript:@"vocal-attenuation-available"];
  int v76 = [v24 BOOLValue];

  __int16 v25 = [v5 payload];
  int v26 = [v25 objectForKeyedSubscript:@"vocal-attenuation-enabled"];
  int v75 = [v26 BOOLValue];

  __int16 v27 = [v5 payload];
  double v28 = [v27 objectForKeyedSubscript:@"vocal-attenuation-configured"];
  int v74 = [v28 BOOLValue];

  __int16 v29 = [v5 payload];
  double v30 = [v29 objectForKeyedSubscript:@"vocal-attenuation-processing-delay"];
  [v30 doubleValue];
  uint64_t v32 = v31;

  v94[0] = @"queue-section-id";
  v94[1] = @"queue-item-id";
  v95[0] = v9;
  v95[1] = v12;
  uint64_t v33 = [NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
  double v34 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v33];

  v92[0] = @"queue-section-id";
  v92[1] = @"queue-item-id";
  v93[0] = v9;
  v93[1] = v12;
  int v79 = (void *)v12;
  int v35 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
  int v36 = [v7 findPreviousEventWithType:@"item-update" matchingPayload:v35];

  int v78 = v34;
  float v37 = [v34 payload];
  id v38 = [v37 objectForKeyedSubscript:@"item-metadata"];
  int v39 = [v38 objectForKeyedSubscript:@"item-duration"];
  [v39 doubleValue];
  if (v40 == 0.0)
  {
    int v41 = [v36 payload];
    int v42 = [v41 objectForKeyedSubscript:@"item-metadata"];
    __int16 v43 = [v42 objectForKeyedSubscript:@"item-duration"];
    [v43 doubleValue];
    double v45 = v44;
  }
  else
  {
    double v45 = v40;
  }

  int v46 = [*(id *)(a1 + 32) _playbackBarWithElapsedTime:v16 duration:v45];
  int v47 = MSVLogDateFormatter();
  __int16 v48 = [v5 date];
  __int16 v49 = [v47 stringFromDate:v48];

  double v50 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v51 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    int v52 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    uint64_t v81 = v49;
    __int16 v82 = 2114;
    uint64_t v83 = v52;
    __int16 v84 = 1024;
    int v85 = [v5 threadPriority];
    __int16 v86 = 2114;
    uint32_t v87 = v50;
    __int16 v88 = 2114;
    *(void *)BOOL v89 = v10;
    *(_WORD *)&v89[8] = 2114;
    __int16 v90 = v79;
    *(_WORD *)int v91 = 2114;
    *(void *)&v91[2] = v46;
    _os_log_impl(&dword_21BB87000, v51, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀊕 ITEM RESUME                %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);
  }
  uint64_t v53 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v54 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v55 = [*(id *)(a1 + 40) streamID];
    int v56 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    uint64_t v81 = v49;
    __int16 v82 = 2114;
    uint64_t v83 = v55;
    __int16 v84 = 1024;
    int v85 = v56;
    __int16 v86 = 2114;
    uint32_t v87 = v53;
    __int16 v88 = 2048;
    *(double *)BOOL v89 = v16;
    _os_log_impl(&dword_21BB87000, v54, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f", buf, 0x30u);
  }
  if (fabs(v20) > 0.1)
  {
    __int16 v57 = [v5 date];
    id v58 = [v57 dateByAddingTimeInterval:v20];

    __int16 v59 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    __int16 v60 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v61 = [*(id *)(a1 + 40) streamID];
      uint64_t v71 = v46;
      int v62 = [v5 threadPriority];
      MSVLogDateFormatter();
      v63 = uint64_t v72 = v36;
      [v63 stringFromDate:v58];
      int v64 = v73 = v10;
      *(_DWORD *)buf = 138544386;
      uint64_t v81 = v49;
      __int16 v82 = 2114;
      uint64_t v83 = v61;
      __int16 v84 = 1024;
      int v85 = v62;
      int v46 = v71;
      __int16 v86 = 2114;
      uint32_t v87 = v59;
      __int16 v88 = 2114;
      *(void *)BOOL v89 = v64;
      _os_log_impl(&dword_21BB87000, v60, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲| actual: %{public}@", buf, 0x30u);

      int v36 = v72;
      double v10 = v73;
    }
  }
  __int16 v65 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v66 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) streamID];
    double v68 = v67 = v36;
    int v69 = [v5 threadPriority];
    *(_DWORD *)buf = 138545410;
    uint64_t v81 = v49;
    __int16 v82 = 2114;
    uint64_t v83 = v68;
    __int16 v84 = 1024;
    int v85 = v69;
    __int16 v86 = 2114;
    uint32_t v87 = v65;
    __int16 v88 = 1024;
    *(_DWORD *)BOOL v89 = v77;
    *(_WORD *)&v89[4] = 1024;
    *(_DWORD *)&v89[6] = v74;
    LOWORD(v90) = 1024;
    *(_DWORD *)((char *)&v90 + 2) = v76;
    HIWORD(v90) = 1024;
    *(_DWORD *)int v91 = v75;
    *(_WORD *)&v91[4] = 2048;
    *(void *)&v91[6] = v32;
    _os_log_impl(&dword_21BB87000, v66, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ vocal control supported:%{BOOL}u configured:%{BOOL}u available:%{BOOL}u enabled:%{BOOL}u delay:%.0fms", buf, 0x48u);

    int v36 = v67;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  double v10 = [v8 stringFromDate:v9];

  double v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = [*(id *)(a1 + 40) streamID];
    int v15 = 138544642;
    double v16 = v10;
    __int16 v17 = 2114;
    double v18 = v13;
    __int16 v19 = 1024;
    int v20 = [v3 threadPriority];
    __int16 v21 = 2114;
    double v22 = v11;
    __int16 v23 = 2114;
    double v24 = v5;
    __int16 v25 = 2114;
    int v26 = v7;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀁣 READY TO PLAY              %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-start-position"];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = MSVLogDateFormatter();
  double v13 = [v3 date];
  double v14 = [v12 stringFromDate:v13];

  int v15 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = [*(id *)(a1 + 40) streamID];
    int v23 = 138544642;
    double v24 = v14;
    __int16 v25 = 2114;
    int v26 = v17;
    __int16 v27 = 1024;
    int v28 = [v3 threadPriority];
    __int16 v29 = 2114;
    double v30 = v15;
    __int16 v31 = 2114;
    uint64_t v32 = v5;
    __int16 v33 = 2114;
    double v34 = v7;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀺸 ITEM BUFFER READY          %{public}@ %{public}@", (uint8_t *)&v23, 0x3Au);
  }
  double v18 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v20 = [*(id *)(a1 + 40) streamID];
    int v21 = [v3 threadPriority];
    int v23 = 138544386;
    double v24 = v14;
    __int16 v25 = 2114;
    int v26 = v20;
    __int16 v27 = 1024;
    int v28 = v21;
    __int16 v29 = 2114;
    double v30 = v18;
    __int16 v31 = 2048;
    uint64_t v32 = v11;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f", (uint8_t *)&v23, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_116(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-end-position"];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = MSVLogDateFormatter();
  double v13 = [v3 date];
  double v14 = [v12 stringFromDate:v13];

  int v15 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = [*(id *)(a1 + 40) streamID];
    int v23 = 138544642;
    double v24 = v14;
    __int16 v25 = 2114;
    int v26 = v17;
    __int16 v27 = 1024;
    int v28 = [v3 threadPriority];
    __int16 v29 = 2114;
    double v30 = v15;
    __int16 v31 = 2114;
    uint64_t v32 = v5;
    __int16 v33 = 2114;
    double v34 = v7;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀛪 ITEM BUFFER STALL          %{public}@ %{public}@", (uint8_t *)&v23, 0x3Au);
  }
  double v18 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [*(id *)(a1 + 40) streamID];
    int v21 = [v3 threadPriority];
    int v23 = 138544386;
    double v24 = v14;
    __int16 v25 = 2114;
    int v26 = v20;
    __int16 v27 = 1024;
    int v28 = v21;
    __int16 v29 = 2114;
    double v30 = v18;
    __int16 v31 = 2048;
    uint64_t v32 = v11;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ end: %0.2f", (uint8_t *)&v23, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  double v10 = [v8 stringFromDate:v9];

  double v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = [*(id *)(a1 + 40) streamID];
    int v15 = 138544642;
    double v16 = v10;
    __int16 v17 = 2114;
    double v18 = v13;
    __int16 v19 = 1024;
    int v20 = [v3 threadPriority];
    __int16 v21 = 2114;
    double v22 = v11;
    __int16 v23 = 2114;
    double v24 = v5;
    __int16 v25 = 2114;
    int v26 = v7;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀛨 ITEM BUFFER FINISH         %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  double v10 = [v8 stringFromDate:v9];

  double v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = [*(id *)(a1 + 40) streamID];
    int v21 = 138544642;
    double v22 = v10;
    __int16 v23 = 2114;
    double v24 = v13;
    __int16 v25 = 1024;
    int v26 = [v3 threadPriority];
    __int16 v27 = 2114;
    int v28 = v11;
    __int16 v29 = 2114;
    double v30 = v5;
    __int16 v31 = 2114;
    uint64_t v32 = v7;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀢕 ITEM SECKEY BEGIN          %{public}@ %{public}@", (uint8_t *)&v21, 0x3Au);
  }
  double v14 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = [*(id *)(a1 + 40) streamID];
    int v17 = [v3 threadPriority];
    double v18 = [v3 payload];
    __int16 v19 = [v18 objectForKeyedSubscript:@"asset-skd"];
    int v21 = 138544386;
    double v22 = v10;
    __int16 v23 = 2114;
    double v24 = v16;
    __int16 v25 = 1024;
    int v26 = v17;
    __int16 v27 = 2114;
    int v28 = v14;
    __int16 v29 = 2114;
    double v30 = v19;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ skd: %{public}@", (uint8_t *)&v21, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  v48[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  uint64_t v8 = [v5 payload];
  uint64_t v32 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v9 = [v5 payload];
  double v10 = [v9 objectForKeyedSubscript:@"queue-item-id"];

  v47[0] = @"queue-section-id";
  double v11 = [v5 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"queue-section-id"];
  v47[1] = @"queue-item-id";
  v48[0] = v12;
  double v13 = [v5 payload];
  double v14 = [v13 objectForKeyedSubscript:@"queue-item-id"];
  v48[1] = v14;
  int v15 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  double v16 = [v7 findPreviousEventWithType:@"item-key-request-begin" matchingPayload:v15];

  [v5 durationSinceEvent:v16];
  uint64_t v18 = v17;
  __int16 v19 = MSVLogDateFormatter();
  int v20 = [v5 date];
  int v21 = [v19 stringFromDate:v20];

  double v22 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    double v24 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    double v34 = v21;
    __int16 v35 = 2114;
    int v36 = v24;
    __int16 v37 = 1024;
    int v38 = [v5 threadPriority];
    __int16 v39 = 2114;
    double v40 = v22;
    __int16 v41 = 2114;
    int v42 = v32;
    __int16 v43 = 2114;
    double v44 = v10;
    __int16 v45 = 2048;
    uint64_t v46 = v18;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀢖 ITEM SECKEY END            %{public}@ %{public}@ [%.3fs]", buf, 0x44u);
  }
  __int16 v25 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v27 = [*(id *)(a1 + 40) streamID];
    int v28 = [v5 threadPriority];
    __int16 v29 = [v5 payload];
    double v30 = [v29 objectForKeyedSubscript:@"asset-skd"];
    *(_DWORD *)buf = 138544386;
    double v34 = v21;
    __int16 v35 = 2114;
    int v36 = v27;
    __int16 v37 = 1024;
    int v38 = v28;
    __int16 v39 = 2114;
    double v40 = v25;
    __int16 v41 = 2114;
    int v42 = v30;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ skd: %{public}@", buf, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_120(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-timed-metadata"];

  double v10 = MSVLogDateFormatter();
  double v11 = [v3 date];
  uint64_t v12 = [v10 stringFromDate:v11];

  double v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [*(id *)(a1 + 40) streamID];
    int v21 = 138544642;
    double v22 = v12;
    __int16 v23 = 2114;
    double v24 = v15;
    __int16 v25 = 1024;
    int v26 = [v3 threadPriority];
    __int16 v27 = 2114;
    int v28 = v13;
    __int16 v29 = 2114;
    double v30 = v5;
    __int16 v31 = 2114;
    uint64_t v32 = v7;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀢊 ITEM METADATA PING          %{public}@ %{public}@", (uint8_t *)&v21, 0x3Au);
  }
  double v16 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [*(id *)(a1 + 40) streamID];
    int v19 = [v3 threadPriority];
    int v21 = 138544386;
    double v22 = v12;
    __int16 v23 = 2114;
    double v24 = v18;
    __int16 v25 = 1024;
    int v26 = v19;
    __int16 v27 = 2114;
    int v28 = v16;
    __int16 v29 = 2114;
    double v30 = v9;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ data: %{public}@", (uint8_t *)&v21, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  void v66[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  uint64_t v8 = [v5 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  double v10 = [v5 payload];
  double v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v12 = [v5 payload];
  double v13 = [v12 objectForKeyedSubscript:@"item-end-position"];
  [v13 doubleValue];
  double v15 = v14;

  double v16 = [v5 payload];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"item-did-play-to-end"];
  int v46 = [v17 BOOLValue];

  v65[0] = @"queue-section-id";
  v65[1] = @"queue-item-id";
  v66[0] = v9;
  v66[1] = v11;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
  int v19 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v18];

  v63[0] = @"queue-section-id";
  v63[1] = @"queue-item-id";
  v64[0] = v9;
  v64[1] = v11;
  int v20 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
  int v21 = [v7 findPreviousEventWithType:@"item-update" matchingPayload:v20];

  __int16 v48 = v19;
  double v22 = [v19 payload];
  __int16 v23 = [v22 objectForKeyedSubscript:@"item-metadata"];
  double v24 = [v23 objectForKeyedSubscript:@"item-duration"];
  [v24 doubleValue];
  int v47 = v21;
  if (v25 == 0.0)
  {
    int v26 = [v21 payload];
    __int16 v27 = [v26 objectForKeyedSubscript:@"item-metadata"];
    int v28 = [v27 objectForKeyedSubscript:@"item-duration"];
    [v28 doubleValue];
    double v30 = v29;
  }
  else
  {
    double v30 = v25;
  }

  __int16 v31 = [*(id *)(a1 + 32) _playbackBarWithElapsedTime:v15 duration:v30];
  uint64_t v32 = MSVLogDateFormatter();
  uint64_t v33 = [v5 date];
  double v34 = [v32 stringFromDate:v33];

  __int16 v35 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v37 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    double v50 = v34;
    __int16 v51 = 2114;
    int v52 = v37;
    __int16 v53 = 1024;
    int v54 = [v5 threadPriority];
    __int16 v55 = 2114;
    int v56 = v35;
    __int16 v57 = 2114;
    double v58 = *(double *)&v9;
    __int16 v59 = 2114;
    __int16 v60 = v11;
    __int16 v61 = 2114;
    int v62 = v31;
    _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀀁 ITEM END                   %{public}@ %{public}@                   ║ %{public}@", buf, 0x44u);
  }
  int v38 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    double v40 = [*(id *)(a1 + 40) streamID];
    int v41 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    double v50 = v34;
    __int16 v51 = 2114;
    int v52 = v40;
    __int16 v53 = 1024;
    int v54 = v41;
    __int16 v55 = 2114;
    int v56 = v38;
    __int16 v57 = 2048;
    double v58 = v15;
    _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ end: %0.2f", buf, 0x30u);
  }
  int v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v43 = [*(id *)(a1 + 40) streamID];
    int v44 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    double v50 = v34;
    __int16 v51 = 2114;
    int v52 = v43;
    __int16 v53 = 1024;
    int v54 = v44;
    __int16 v55 = 2114;
    int v56 = v38;
    __int16 v57 = 1024;
    LODWORD(v58) = v46;
    _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ didPlayToEnd: %{BOOL}u", buf, 0x2Cu);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-audio-format-metadata"];

  double v10 = [v9 objectForKeyedSubscript:@"active-format"];
  double v11 = [v9 objectForKeyedSubscript:@"target-format"];
  uint64_t v12 = [v9 objectForKeyedSubscript:@"active-format-justification"];
  uint64_t v13 = [v12 integerValue];

  double v14 = NSStringFromMPCPlayerAudioFormatJustification(v13);
  double v15 = [v9 objectForKeyedSubscript:@"preferred-tiers"];
  unint64_t v16 = [v15 integerValue];

  uint64_t v17 = NSStringComponentsFromMPCPlayerAudioFormatTierPreference(v16);
  uint64_t v18 = objc_msgSend(v17, "msv_compactDescription");

  int v19 = [v9 objectForKeyedSubscript:@"alternate-formats"];
  int v20 = [v9 objectForKeyedSubscript:@"route"];
  if (v10)
  {
    id v59 = v20;
    __int16 v60 = v18;
    __int16 v61 = v14;
    int v62 = v19;
    int v56 = v9;
    int v21 = MSVLogDateFormatter();
    double v22 = [v3 date];
    __int16 v65 = [v21 stringFromDate:v22];

    __int16 v23 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    double v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = [*(id *)(a1 + 40) streamID];
      *(_DWORD *)buf = 138544642;
      unint64_t v73 = v65;
      __int16 v74 = 2114;
      int v75 = v25;
      __int16 v76 = 1024;
      int v77 = [v3 threadPriority];
      __int16 v78 = 2114;
      int v79 = v23;
      __int16 v80 = 2114;
      uint64_t v81 = v5;
      __int16 v82 = 2114;
      uint64_t v83 = v7;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒿 AUDIO CHANGE               %{public}@ %{public}@", buf, 0x3Au);
    }
    double v58 = v5;

    int v64 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    int v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v27 = [*(id *)(a1 + 40) streamID];
      int v28 = [v3 threadPriority];
      double v29 = [v10 humanDescription];
      *(_DWORD *)buf = 138544386;
      unint64_t v73 = v65;
      __int16 v74 = 2114;
      int v75 = v27;
      __int16 v76 = 1024;
      int v77 = v28;
      __int16 v78 = 2114;
      int v79 = v64;
      __int16 v80 = 2114;
      uint64_t v81 = v29;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ activeFormat: %{public}@", buf, 0x30u);
    }
    double v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = [*(id *)(a1 + 40) streamID];
      int v32 = [v3 threadPriority];
      uint64_t v33 = [v11 humanDescription];
      *(_DWORD *)buf = 138544386;
      unint64_t v73 = v65;
      __int16 v74 = 2114;
      int v75 = v31;
      __int16 v76 = 1024;
      int v77 = v32;
      __int16 v78 = 2114;
      int v79 = v64;
      __int16 v80 = 2114;
      uint64_t v81 = v33;
      _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ targetFormat: %{public}@", buf, 0x30u);
    }
    int v54 = v11;
    __int16 v55 = v10;
    __int16 v57 = v7;

    double v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = [*(id *)(a1 + 40) streamID];
      int v36 = [v3 threadPriority];
      *(_DWORD *)buf = 138544642;
      unint64_t v73 = v65;
      __int16 v74 = 2114;
      int v75 = v35;
      __int16 v76 = 1024;
      int v77 = v36;
      __int16 v78 = 2114;
      int v79 = v64;
      __int16 v80 = 2114;
      uint64_t v81 = v61;
      __int16 v82 = 2114;
      uint64_t v83 = v60;
      _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ justification: %{public}@; preferences: %{public}@",
        buf,
        0x3Au);
    }
    uint64_t v63 = a1;

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = v62;
    uint64_t v37 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v68;
      double v40 = "com.apple.amp.mediaplaybackcore";
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v68 != v39) {
            objc_enumerationMutation(obj);
          }
          int v42 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          __int16 v43 = os_log_create(v40, "PlaybackEvents");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            [*(id *)(v63 + 40) streamID];
            v45 = int v44 = v40;
            id v46 = v3;
            int v47 = [v3 threadPriority];
            __int16 v48 = [v42 humanDescription];
            *(_DWORD *)buf = 138544386;
            unint64_t v73 = v65;
            __int16 v74 = 2114;
            int v75 = v45;
            __int16 v76 = 1024;
            int v77 = v47;
            id v3 = v46;
            __int16 v78 = 2114;
            int v79 = v64;
            __int16 v80 = 2114;
            uint64_t v81 = v48;
            _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEBUG, "|%{public}@ %{public}@ %2i %{public}@  │ alternate: %{public}@", buf, 0x30u);

            double v40 = v44;
          }
        }
        uint64_t v38 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      }
      while (v38);
    }

    __int16 v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    double v11 = v54;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      double v50 = [*(id *)(v63 + 40) streamID];
      int v51 = [v3 threadPriority];
      int v52 = [v59 humanDescription];
      *(_DWORD *)buf = 138544386;
      unint64_t v73 = v65;
      __int16 v74 = 2114;
      int v75 = v50;
      __int16 v76 = 1024;
      int v77 = v51;
      __int16 v78 = 2114;
      int v79 = v64;
      __int16 v80 = 2114;
      uint64_t v81 = v52;
      _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ audioRoute: %{public}@", buf, 0x30u);
    }
    id v7 = v57;
    id v5 = v58;
    double v10 = v55;
    uint64_t v9 = v56;
    uint64_t v18 = v60;
    double v14 = v61;
    int v19 = v62;
    int v20 = v59;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_123(uint64_t a1, void *a2)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"asset-load-info"];

  double v10 = [v9 objectForKeyedSubscript:@"item-asset-type"];
  int v11 = [v10 intValue];

  uint64_t v12 = [v9 objectForKeyedSubscript:@"item-asset-endpoint-type"];
  int v13 = [v12 intValue];

  double v14 = [v9 objectForKeyedSubscript:@"item-asset-is-delegated-playback"];
  int v76 = [v14 BOOLValue];

  double v15 = [v9 objectForKeyedSubscript:@"item-asset-source"];
  int v16 = [v15 intValue];

  long long v70 = [v9 objectForKeyedSubscript:@"player-item-identifier"];
  long long v69 = [v9 objectForKeyedSubscript:@"item-asset-url"];
  uint64_t v17 = [v3 payload];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"item-audio-asset-type-selection-metadata"];

  [v18 objectForKeyedSubscript:@"audio-asset-type-selection-explanation"];
  long long v67 = v18;
  long long v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v72 = [v18 objectForKeyedSubscript:@"audio-asset-type-selection-justification"];
  int v19 = MSVLogDateFormatter();
  int v75 = v3;
  int v20 = v3;
  uint64_t v21 = a1;
  double v22 = [v20 date];
  __int16 v74 = [v19 stringFromDate:v22];

  __int16 v23 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v21 + 32));
  double v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    double v25 = [*(id *)(v21 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    uint64_t v84 = v74;
    __int16 v85 = 2114;
    __int16 v86 = v25;
    __int16 v87 = 1024;
    int v88 = [v75 threadPriority];
    __int16 v89 = 2114;
    __int16 v90 = v23;
    __int16 v91 = 2114;
    int v92 = v5;
    __int16 v93 = 2114;
    *(void *)uint32_t v94 = v7;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒿 AUDIO ASSET SELECTION      %{public}@ %{public}@", buf, 0x3Au);
  }
  unint64_t v73 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v21 + 32));
  int v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  uint64_t v71 = v21;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v27 = [*(id *)(v21 + 40) streamID];
    int v28 = [v75 threadPriority];
    if ((unint64_t)(v11 - 1) > 4) {
      double v29 = @"Unspecified";
    }
    else {
      double v29 = off_2643BEEE0[v11 - 1];
    }
    *(_DWORD *)buf = 138544386;
    uint64_t v84 = v74;
    __int16 v85 = 2114;
    __int16 v86 = v27;
    __int16 v87 = 1024;
    int v88 = v28;
    __int16 v89 = 2114;
    __int16 v90 = v73;
    __int16 v91 = 2114;
    int v92 = v29;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", buf, 0x30u);
  }
  double v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v31 = [*(id *)(v21 + 40) streamID];
    int v32 = [v75 threadPriority];
    if ((unint64_t)(v13 - 1) > 2) {
      uint64_t v33 = @"Unknown";
    }
    else {
      uint64_t v33 = off_2643BEF08[v13 - 1];
    }
    if ((unint64_t)(v16 - 1) > 5) {
      double v34 = @"Unknown";
    }
    else {
      double v34 = off_2643BEF20[v16 - 1];
    }
    *(_DWORD *)buf = 138544898;
    uint64_t v84 = v74;
    __int16 v85 = 2114;
    __int16 v86 = v31;
    __int16 v87 = 1024;
    int v88 = v32;
    __int16 v89 = 2114;
    __int16 v90 = v73;
    __int16 v91 = 2114;
    int v92 = v33;
    __int16 v93 = 1024;
    *(_DWORD *)uint32_t v94 = v76;
    *(_WORD *)&v94[4] = 2114;
    *(void *)&v94[6] = v34;
    _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ endpoint: %{public}@; delegated: %{BOOL}u; source: %{public}@",
      buf,
      0x40u);
  }
  __int16 v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = [*(id *)(v21 + 40) streamID];
    int v37 = [v75 threadPriority];
    *(_DWORD *)buf = 138544642;
    uint64_t v84 = v74;
    __int16 v85 = 2114;
    __int16 v86 = v36;
    __int16 v87 = 1024;
    int v88 = v37;
    __int16 v89 = 2114;
    __int16 v90 = v73;
    __int16 v91 = 2114;
    int v92 = v70;
    __int16 v93 = 2114;
    *(void *)uint32_t v94 = v69;
    _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ AVPlayerItem: %{public}@; url: %{public}@",
      buf,
      0x3Au);
  }
  uint64_t v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
  if (v72)
  {
    if (v39)
    {
      double v40 = [*(id *)(v21 + 40) streamID];
      int v41 = [v75 threadPriority];
      *(_DWORD *)buf = 138544386;
      uint64_t v84 = v74;
      __int16 v85 = 2114;
      __int16 v86 = v40;
      __int16 v87 = 1024;
      int v88 = v41;
      __int16 v89 = 2114;
      __int16 v90 = v73;
      __int16 v91 = 2114;
      int v92 = v68;
      _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ explanation: %{public}@", buf, 0x30u);
    }
    int v64 = v9;
    __int16 v65 = v7;
    __int16 v66 = v5;

    int v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v43 = [*(id *)(v21 + 40) streamID];
      int v44 = [v75 threadPriority];
      *(_DWORD *)buf = 138544130;
      uint64_t v84 = v74;
      __int16 v85 = 2114;
      __int16 v86 = v43;
      __int16 v87 = 1024;
      int v88 = v44;
      __int16 v89 = 2114;
      __int16 v90 = v73;
      _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ justification:", buf, 0x26u);
    }
    __int16 v45 = [v72 allKeys];
    id v46 = [v45 sortedArrayUsingComparator:&__block_literal_global_127];

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v38 = v46;
    uint64_t v47 = [v38 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v79;
      double v50 = "com.apple.amp.mediaplaybackcore";
      int v51 = "PlaybackEvents";
      do
      {
        uint64_t v52 = 0;
        uint64_t v77 = v48;
        do
        {
          if (*(void *)v79 != v49) {
            objc_enumerationMutation(v38);
          }
          __int16 v53 = *(__CFString **)(*((void *)&v78 + 1) + 8 * v52);
          int v54 = os_log_create(v50, v51);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v55 = [*(id *)(v21 + 40) streamID];
            int v56 = [v75 threadPriority];
            [v72 objectForKeyedSubscript:v53];
            __int16 v57 = v51;
            uint64_t v58 = v49;
            __int16 v60 = v59 = v50;
            *(_DWORD *)buf = 138544642;
            uint64_t v84 = v74;
            __int16 v85 = 2114;
            __int16 v86 = v55;
            __int16 v87 = 1024;
            int v88 = v56;
            __int16 v89 = 2114;
            __int16 v90 = v73;
            __int16 v91 = 2114;
            int v92 = v53;
            __int16 v93 = 2114;
            *(void *)uint32_t v94 = v60;
            _os_log_impl(&dword_21BB87000, v54, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@", buf, 0x3Au);

            double v50 = v59;
            uint64_t v49 = v58;
            int v51 = v57;
            uint64_t v48 = v77;

            uint64_t v21 = v71;
          }

          ++v52;
        }
        while (v48 != v52);
        uint64_t v48 = [v38 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v48);
    }

    id v7 = v65;
    id v5 = v66;
    uint64_t v9 = v64;
  }
  else if (v39)
  {
    __int16 v61 = [*(id *)(v21 + 40) streamID];
    int v62 = [v75 threadPriority];
    *(_DWORD *)buf = 138544386;
    uint64_t v84 = v74;
    __int16 v85 = 2114;
    __int16 v86 = v61;
    __int16 v87 = 1024;
    int v88 = v62;
    __int16 v89 = 2114;
    __int16 v90 = v73;
    __int16 v91 = 2114;
    int v92 = v68;
    _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ explanation: %{public}@", buf, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_128(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-audio-format-selection-metadata"];

  double v10 = [v9 objectForKeyedSubscript:@"audio-format-selection-format"];
  double v50 = [v9 objectForKeyedSubscript:@"audio-format-selection-explanation"];
  __int16 v53 = [v9 objectForKeyedSubscript:@"audio-format-selection-justification"];
  int v11 = MSVLogDateFormatter();
  __int16 v55 = v3;
  uint64_t v12 = [v3 date];
  int v54 = [v11 stringFromDate:v12];

  int v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v62 = v54;
    __int16 v63 = 2114;
    int v64 = v15;
    __int16 v65 = 1024;
    int v66 = [v55 threadPriority];
    __int16 v67 = 2114;
    long long v68 = v13;
    __int16 v69 = 2114;
    long long v70 = v5;
    __int16 v71 = 2114;
    uint64_t v72 = v7;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒿 AUDIO FORMAT SELECTION     %{public}@ %{public}@", buf, 0x3Au);
  }
  uint64_t v52 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [*(id *)(a1 + 40) streamID];
    int v18 = [v55 threadPriority];
    int v19 = [v10 humanDescription];
    *(_DWORD *)buf = 138544386;
    int v62 = v54;
    __int16 v63 = 2114;
    int v64 = v17;
    __int16 v65 = 1024;
    int v66 = v18;
    __int16 v67 = 2114;
    long long v68 = v52;
    __int16 v69 = 2114;
    long long v70 = v19;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ format: %{public}@", buf, 0x30u);
  }
  int v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v53)
  {
    uint64_t v49 = v5;
    if (v21)
    {
      double v22 = [*(id *)(a1 + 40) streamID];
      int v23 = [v55 threadPriority];
      *(_DWORD *)buf = 138544386;
      int v62 = v54;
      __int16 v63 = 2114;
      int v64 = v22;
      __int16 v65 = 1024;
      int v66 = v23;
      __int16 v67 = 2114;
      long long v68 = v52;
      __int16 v69 = 2114;
      long long v70 = v50;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ explanation: %{public}@", buf, 0x30u);
    }
    id v46 = v10;
    uint64_t v47 = v9;
    uint64_t v48 = v7;

    double v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = [*(id *)(a1 + 40) streamID];
      int v26 = [v55 threadPriority];
      *(_DWORD *)buf = 138544130;
      int v62 = v54;
      __int16 v63 = 2114;
      int v64 = v25;
      __int16 v65 = 1024;
      int v66 = v26;
      __int16 v67 = 2114;
      long long v68 = v52;
      _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ justification:", buf, 0x26u);
    }
    __int16 v27 = [v53 allKeys];
    int v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_131];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    int v20 = v28;
    uint64_t v29 = [v20 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v57;
      int v32 = "com.apple.amp.mediaplaybackcore";
      uint64_t v51 = a1;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(v20);
          }
          double v34 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          __int16 v35 = os_log_create(v32, "PlaybackEvents");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            int v36 = [*(id *)(a1 + 40) streamID];
            int v37 = [v55 threadPriority];
            [v53 objectForKeyedSubscript:v34];
            uint64_t v38 = v30;
            BOOL v39 = v32;
            uint64_t v40 = v31;
            int v42 = v41 = v20;
            *(_DWORD *)buf = 138544642;
            int v62 = v54;
            __int16 v63 = 2114;
            int v64 = v36;
            __int16 v65 = 1024;
            int v66 = v37;
            __int16 v67 = 2114;
            long long v68 = v52;
            __int16 v69 = 2114;
            long long v70 = v34;
            __int16 v71 = 2114;
            uint64_t v72 = v42;
            _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@", buf, 0x3Au);

            int v20 = v41;
            uint64_t v31 = v40;
            int v32 = v39;
            uint64_t v30 = v38;

            a1 = v51;
          }
        }
        uint64_t v30 = [v20 countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v30);
    }

    id v7 = v48;
    id v5 = v49;
    double v10 = v46;
    uint64_t v9 = v47;
  }
  else if (v21)
  {
    __int16 v43 = [*(id *)(a1 + 40) streamID];
    int v44 = [v55 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v62 = v54;
    __int16 v63 = 2114;
    int v64 = v43;
    __int16 v65 = 1024;
    int v66 = v44;
    __int16 v67 = 2114;
    long long v68 = v52;
    __int16 v69 = 2114;
    long long v70 = v50;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ explanation: %{public}@", buf, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_132(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  double v10 = [v8 stringFromDate:v9];

  int v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [*(id *)(a1 + 40) streamID];
    int v15 = 138544642;
    int v16 = v10;
    __int16 v17 = 2114;
    int v18 = v13;
    __int16 v19 = 1024;
    int v20 = [v3 threadPriority];
    __int16 v21 = 2114;
    double v22 = v11;
    __int16 v23 = 2114;
    double v24 = v5;
    __int16 v25 = 2114;
    int v26 = v7;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀌕 ITEM ASSET BEGIN           %{public}@ %{public}@", (uint8_t *)&v15, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  void v57[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  id v7 = [v5 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v9 = [v5 payload];
  double v10 = [v9 objectForKeyedSubscript:@"queue-item-id"];

  v56[0] = @"queue-section-id";
  v56[1] = @"queue-item-id";
  v57[0] = v8;
  v57[1] = v10;
  int v11 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
  uint64_t v12 = [v6 findPreviousEventWithType:@"asset-load-begin" matchingPayload:v11];

  [v5 durationSinceEvent:v12];
  uint64_t v14 = v13;
  int v15 = [v5 payload];
  int v16 = [v15 objectForKeyedSubscript:@"asset-load-error"];

  __int16 v17 = MSVLogDateFormatter();
  int v18 = [v5 date];
  int v41 = [v17 stringFromDate:v18];

  __int16 v19 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    __int16 v43 = v41;
    __int16 v44 = 2114;
    __int16 v45 = v21;
    __int16 v46 = 1024;
    int v47 = [v5 threadPriority];
    __int16 v48 = 2114;
    uint64_t v49 = v19;
    __int16 v50 = 2114;
    uint64_t v51 = v8;
    __int16 v52 = 2114;
    __int16 v53 = v10;
    __int16 v54 = 2048;
    uint64_t v55 = v14;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀌖 ITEM ASSET END             %{public}@ %{public}@ [%.3fs]", buf, 0x44u);
  }
  if (v16)
  {
    uint64_t v38 = v12;
    BOOL v39 = v8;
    id v40 = v6;
    double v22 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    int v37 = v16;
    __int16 v23 = objc_msgSend(v16, "msv_description");
    double v24 = [v23 componentsSeparatedByString:@"\n"];

    if ([v24 count])
    {
      for (unint64_t i = 0; i < [v24 count]; ++i)
      {
        int v26 = [v24 objectAtIndexedSubscript:i];
        if (i)
        {
          uint64_t v27 = [v24 count] - 1;
          int v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
          if (i == v27)
          {
            if (v29)
            {
              uint64_t v30 = [*(id *)(a1 + 40) streamID];
              int v31 = [v5 threadPriority];
              *(_DWORD *)buf = 138544386;
              __int16 v43 = v41;
              __int16 v44 = 2114;
              __int16 v45 = v30;
              __int16 v46 = 1024;
              int v47 = v31;
              __int16 v48 = 2114;
              uint64_t v49 = v22;
              __int16 v50 = 2114;
              uint64_t v51 = v26;
              int v32 = v28;
              uint64_t v33 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);
            }
          }
          else if (v29)
          {
            uint64_t v30 = [*(id *)(a1 + 40) streamID];
            int v35 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            __int16 v43 = v41;
            __int16 v44 = 2114;
            __int16 v45 = v30;
            __int16 v46 = 1024;
            int v47 = v35;
            __int16 v48 = 2114;
            uint64_t v49 = v22;
            __int16 v50 = 2114;
            uint64_t v51 = v26;
            int v32 = v28;
            uint64_t v33 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          int v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = [*(id *)(a1 + 40) streamID];
            int v34 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            __int16 v43 = v41;
            __int16 v44 = 2114;
            __int16 v45 = v30;
            __int16 v46 = 1024;
            int v47 = v34;
            __int16 v48 = 2114;
            uint64_t v49 = v22;
            __int16 v50 = 2114;
            uint64_t v51 = v26;
            int v32 = v28;
            uint64_t v33 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }
      }
    }

    uint64_t v8 = v39;
    id v6 = v40;
    uint64_t v12 = v38;
    int v16 = v37;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  id v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  double v10 = [v8 stringFromDate:v9];

  int v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [*(id *)(a1 + 40) streamID];
    int v15 = 138544642;
    int v16 = v10;
    __int16 v17 = 2114;
    int v18 = v13;
    __int16 v19 = 1024;
    int v20 = [v3 threadPriority];
    __int16 v21 = 2114;
    double v22 = v11;
    __int16 v23 = 2114;
    double v24 = v5;
    __int16 v25 = 2114;
    int v26 = v7;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍺 ITEM CONFIG BEGIN          %{public}@ %{public}@ ", (uint8_t *)&v15, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  v89[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](v6, v5);
  uint64_t v8 = [v5 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  double v10 = [v5 payload];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v12 = [v5 payload];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"item-configured-eq"];
  uint64_t v14 = (int)[v13 intValue];

  uint64_t v73 = [MEMORY[0x263F12170] settingWithPreset:v14];
  int v15 = [v5 payload];
  int v16 = [v15 objectForKeyedSubscript:@"item-configured-sc-vol-normalization"];
  [v16 doubleValue];
  double v18 = v17;

  __int16 v19 = [v5 payload];
  int v20 = [v19 objectForKeyedSubscript:@"item-configured-loudness"];

  __int16 v21 = [v5 payload];
  double v22 = [v21 objectForKeyedSubscript:@"hls-metadata-wait-time"];
  [v22 doubleValue];
  double v24 = v23;

  __int16 v25 = [v5 payload];
  uint64_t v72 = [v25 objectForKeyedSubscript:@"audio-route"];

  v88[0] = @"queue-section-id";
  v88[1] = @"queue-item-id";
  __int16 v74 = (void *)v11;
  int v75 = (void *)v9;
  v89[0] = v9;
  v89[1] = v11;
  int v26 = [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
  uint64_t v27 = [v7 findPreviousEventWithType:@"item-configuration-begin" matchingPayload:v26];

  [v5 durationSinceEvent:v27];
  uint64_t v29 = v28;
  uint64_t v30 = [v5 payload];
  int v31 = [v30 objectForKeyedSubscript:@"supports-vocal-attenuation"];
  int v71 = [v31 BOOLValue];

  int v32 = [v5 payload];
  uint64_t v33 = [v32 objectForKeyedSubscript:@"vocal-attenuation-available"];
  int v70 = [v33 BOOLValue];

  int v34 = [v5 payload];
  int v35 = [v34 objectForKeyedSubscript:@"vocal-attenuation-enabled"];
  HIDWORD(v68) = [v35 BOOLValue];

  int v36 = [v5 payload];
  int v37 = [v36 objectForKeyedSubscript:@"vocal-attenuation-configured"];
  LODWORD(v68) = [v37 BOOLValue];

  uint64_t v38 = MSVLogDateFormatter();
  BOOL v39 = [v5 date];
  id v40 = [v38 stringFromDate:v39];

  int v41 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v43 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    uint64_t v77 = v40;
    __int16 v78 = 2114;
    long long v79 = v43;
    __int16 v80 = 1024;
    int v81 = [v5 threadPriority];
    __int16 v82 = 2114;
    uint64_t v83 = v41;
    __int16 v84 = 2114;
    *(void *)__int16 v85 = v75;
    *(_WORD *)&v85[8] = 2114;
    uint64_t v86 = v11;
    LOWORD(v87[0]) = 2048;
    *(void *)((char *)v87 + 2) = v29;
    _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀪑 ITEM CONFIG END            %{public}@ %{public}@ [%.3fs]", buf, 0x44u);
  }
  __int16 v44 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v45 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v46 = [*(id *)(a1 + 40) streamID];
    int v47 = [v5 threadPriority];
    __int16 v48 = [v73 name];
    *(_DWORD *)buf = 138544386;
    uint64_t v77 = v40;
    __int16 v78 = 2114;
    long long v79 = v46;
    __int16 v80 = 1024;
    int v81 = v47;
    __int16 v82 = 2114;
    uint64_t v83 = v44;
    __int16 v84 = 2114;
    *(void *)__int16 v85 = v48;
    _os_log_impl(&dword_21BB87000, v45, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ EQ: %{public}@", buf, 0x30u);
  }
  if (v18 > 0.0)
  {
    uint64_t v49 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v50 = [*(id *)(a1 + 40) streamID];
      int v51 = [v5 threadPriority];
      *(_DWORD *)buf = 138544386;
      uint64_t v77 = v40;
      __int16 v78 = 2114;
      long long v79 = v50;
      __int16 v80 = 1024;
      int v81 = v51;
      __int16 v82 = 2114;
      uint64_t v83 = v44;
      __int16 v84 = 2048;
      *(double *)__int16 v85 = v18;
      _os_log_impl(&dword_21BB87000, v49, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ soundCheckVolumeNormalization: %.3f", buf, 0x30u);
    }
  }
  if (objc_msgSend(v20, "count", v68))
  {
    __int16 v52 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v53 = [*(id *)(a1 + 40) streamID];
      int v54 = [v5 threadPriority];
      uint64_t v55 = objc_msgSend(v20, "msv_compactDescription");
      *(_DWORD *)buf = 138544386;
      uint64_t v77 = v40;
      __int16 v78 = 2114;
      long long v79 = v53;
      __int16 v80 = 1024;
      int v81 = v54;
      __int16 v82 = 2114;
      uint64_t v83 = v44;
      __int16 v84 = 2114;
      *(void *)__int16 v85 = v55;
      _os_log_impl(&dword_21BB87000, v52, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ loudnessInfo: %{public}@", buf, 0x30u);
    }
  }
  if (v24 > 0.0)
  {
    long long v56 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      long long v57 = [*(id *)(a1 + 40) streamID];
      int v58 = [v5 threadPriority];
      *(_DWORD *)buf = 138544386;
      uint64_t v77 = v40;
      __int16 v78 = 2114;
      long long v79 = v57;
      __int16 v80 = 1024;
      int v81 = v58;
      __int16 v82 = 2114;
      uint64_t v83 = v44;
      __int16 v84 = 2048;
      *(double *)__int16 v85 = v24;
      _os_log_impl(&dword_21BB87000, v56, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ hlsMetadataWaitTime: %0.3fs", buf, 0x30u);
    }
  }
  long long v59 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v60 = [*(id *)(a1 + 40) streamID];
    int v61 = [v5 threadPriority];
    *(_DWORD *)buf = 138545154;
    uint64_t v77 = v40;
    __int16 v78 = 2114;
    long long v79 = v60;
    __int16 v80 = 1024;
    int v81 = v61;
    __int16 v82 = 2114;
    uint64_t v83 = v44;
    __int16 v84 = 1024;
    *(_DWORD *)__int16 v85 = v71;
    *(_WORD *)&v85[4] = 1024;
    *(_DWORD *)&v85[6] = v69;
    LOWORD(v86) = 1024;
    *(_DWORD *)((char *)&v86 + 2) = v70;
    HIWORD(v86) = 1024;
    v87[0] = HIDWORD(v69);
    _os_log_impl(&dword_21BB87000, v59, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ vocal control supported:%{BOOL}u configured:%{BOOL}u available:%{BOOL}u enabled:%{BOOL}u", buf, 0x3Eu);
  }
  int v62 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v63 = [*(id *)(a1 + 40) streamID];
    int v64 = [v5 threadPriority];
    __int16 v65 = [v72 name];
    int v66 = NSStringFromMPCPlayerAudioRouteType([v72 type]);
    *(_DWORD *)buf = 138544642;
    uint64_t v77 = v40;
    __int16 v78 = 2114;
    long long v79 = v63;
    __int16 v80 = 1024;
    int v81 = v64;
    __int16 v82 = 2114;
    uint64_t v83 = v44;
    __int16 v84 = 2114;
    *(void *)__int16 v85 = v65;
    *(_WORD *)&v85[8] = 2114;
    uint64_t v86 = (uint64_t)v66;
    _os_log_impl(&dword_21BB87000, v62, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ route: %{public}@ (%{public}@)", buf, 0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_137(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"asset-load-error"];

  double v10 = MSVLogDateFormatter();
  uint64_t v11 = [v3 date];
  uint64_t v33 = [v10 stringFromDate:v11];

  uint64_t v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v35 = v33;
    __int16 v36 = 2114;
    int v37 = v14;
    __int16 v38 = 1024;
    int v39 = [v3 threadPriority];
    __int16 v40 = 2114;
    int v41 = v12;
    __int16 v42 = 2114;
    __int16 v43 = v5;
    __int16 v44 = 2114;
    __int16 v45 = v7;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀌔 ITEM FAILED                %{public}@ %{public}@", buf, 0x3Au);
  }
  if (v9)
  {
    int v31 = v7;
    int v32 = v5;
    int v15 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    uint64_t v30 = v9;
    int v16 = objc_msgSend(v9, "msv_description");
    double v17 = [v16 componentsSeparatedByString:@"\n"];

    if ([v17 count])
    {
      for (unint64_t i = 0; i < [v17 count]; ++i)
      {
        __int16 v19 = [v17 objectAtIndexedSubscript:i];
        if (i)
        {
          uint64_t v20 = [v17 count] - 1;
          __int16 v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
          if (i == v20)
          {
            if (v22)
            {
              double v23 = [*(id *)(a1 + 40) streamID];
              int v24 = [v3 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v35 = v33;
              __int16 v36 = 2114;
              int v37 = v23;
              __int16 v38 = 1024;
              int v39 = v24;
              __int16 v40 = 2114;
              int v41 = v15;
              __int16 v42 = 2114;
              __int16 v43 = v19;
              __int16 v25 = v21;
              int v26 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_21BB87000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x30u);
            }
          }
          else if (v22)
          {
            double v23 = [*(id *)(a1 + 40) streamID];
            int v28 = [v3 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v35 = v33;
            __int16 v36 = 2114;
            int v37 = v23;
            __int16 v38 = 1024;
            int v39 = v28;
            __int16 v40 = 2114;
            int v41 = v15;
            __int16 v42 = 2114;
            __int16 v43 = v19;
            __int16 v25 = v21;
            int v26 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          __int16 v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            double v23 = [*(id *)(a1 + 40) streamID];
            int v27 = [v3 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v35 = v33;
            __int16 v36 = 2114;
            int v37 = v23;
            __int16 v38 = 1024;
            int v39 = v27;
            __int16 v40 = 2114;
            int v41 = v15;
            __int16 v42 = 2114;
            __int16 v43 = v19;
            __int16 v25 = v21;
            int v26 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }
      }
    }

    id v7 = v31;
    id v5 = v32;
    uint64_t v9 = v30;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_140(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"item-start-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-stream-id"];

  double v10 = MSVLogDateFormatter();
  uint64_t v11 = [v3 date];
  uint64_t v12 = [v10 stringFromDate:v11];

  uint64_t v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    int v28 = v12;
    __int16 v29 = 2114;
    uint64_t v30 = v15;
    __int16 v31 = 1024;
    int v32 = [v3 threadPriority];
    __int16 v33 = 2114;
    int v34 = v13;
    __int16 v35 = 2114;
    __int16 v36 = v5;
    __int16 v37 = 2114;
    __int16 v38 = v7;
    __int16 v39 = 2114;
    __int16 v40 = v9;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒙 HLS BEGIN                  %{public}@ %{public}@ %{public}@", buf, 0x44u);
  }
  int v16 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = [*(id *)(a1 + 40) streamID];
    int v19 = [v3 threadPriority];
    uint64_t v20 = [v3 payload];
    [v20 objectForKeyedSubscript:@"container-indeterminate-duration"];
    int v26 = v9;
    __int16 v21 = v7;
    v23 = BOOL v22 = v5;
    int v24 = [v23 BOOLValue];
    *(_DWORD *)buf = 138544386;
    int v28 = v12;
    __int16 v29 = 2114;
    uint64_t v30 = v18;
    __int16 v31 = 1024;
    int v32 = v19;
    __int16 v33 = 2114;
    int v34 = v16;
    __int16 v35 = 1024;
    LODWORD(v36) = v24;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ hasIndeterminateDuration: %{BOOL}u", buf, 0x2Cu);

    id v5 = v22;
    id v7 = v21;
    uint64_t v9 = v26;
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_141(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"item-end-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-stream-id"];

  double v10 = MSVLogDateFormatter();
  uint64_t v11 = [v3 date];
  uint64_t v12 = [v10 stringFromDate:v11];

  uint64_t v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [*(id *)(a1 + 40) streamID];
    int v17 = 138544898;
    double v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v15;
    __int16 v21 = 1024;
    int v22 = [v3 threadPriority];
    __int16 v23 = 2114;
    int v24 = v13;
    __int16 v25 = 2114;
    int v26 = v5;
    __int16 v27 = 2114;
    int v28 = v7;
    __int16 v29 = 2114;
    uint64_t v30 = v9;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀒚 HLS END                    %{public}@ %{public}@ %{public}@", (uint8_t *)&v17, 0x44u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"item-stream-id"];

  uint64_t v6 = MSVLogDateFormatter();
  id v7 = [v3 date];
  uint64_t v8 = [v6 stringFromDate:v7];

  uint64_t v9 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) streamID];
    int v13 = 138544386;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    int v16 = v11;
    __int16 v17 = 1024;
    int v18 = [v3 threadPriority];
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    int v22 = v5;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀭹 TIMED METADATA BEGIN       %{public}@", (uint8_t *)&v13, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"item-stream-id"];

  uint64_t v6 = MSVLogDateFormatter();
  id v7 = [v3 date];
  uint64_t v8 = [v6 stringFromDate:v7];

  uint64_t v9 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  double v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) streamID];
    int v13 = 138544386;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    int v16 = v11;
    __int16 v17 = 1024;
    int v18 = [v3 threadPriority];
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    int v22 = v5;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀭺 TIMED METADATA END         %{public}@", (uint8_t *)&v13, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"outgoing-item-id"];

  uint64_t v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"incoming-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"transition-type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"transition-parameters"];

  uint64_t v86 = [v12 objectForKeyedSubscript:@"outgoing"];
  __int16 v87 = v12;
  __int16 v85 = [v12 objectForKeyedSubscript:@"incoming"];
  int v13 = @"􀠊  Gapless";
  if (v10 == 1) {
    int v13 = @"􀟧  Crossfade";
  }
  if (v10 == 2) {
    int v13 = @"􀠉  Unmanaged";
  }
  if (*(void *)(a1 + 32)) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  __int16 v84 = v14;
  __int16 v15 = MSVLogDateFormatter();
  __int16 v91 = v3;
  int v16 = [v3 date];
  __int16 v90 = [v15 stringFromDate:v16];

  __int16 v17 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v97 = v90;
    __int16 v98 = 2114;
    id v99 = v19;
    __int16 v100 = 1024;
    int v101 = [v3 threadPriority];
    __int16 v102 = 2114;
    uint64_t v103 = v17;
    __int16 v104 = 2114;
    BOOL v105 = v5;
    __int16 v106 = 2114;
    int v107 = v7;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀉘 ITEM TRANSITION SETUP      %{public}@ => %{public}@", buf, 0x3Au);
  }
  __int16 v89 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = [*(id *)(a1 + 40) streamID];
    int v22 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v97 = v90;
    __int16 v98 = 2114;
    id v99 = v21;
    __int16 v100 = 1024;
    int v101 = v22;
    __int16 v102 = 2114;
    uint64_t v103 = v89;
    __int16 v104 = 2114;
    BOOL v105 = v84;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", buf, 0x30u);
  }
  uint64_t v88 = a1;
  if (v10 != 1)
  {
    int v62 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v63 = [*(id *)(a1 + 40) streamID];
      int v64 = [v3 threadPriority];
      *(_DWORD *)buf = 138544130;
      int v97 = v90;
      __int16 v98 = 2114;
      id v99 = v63;
      __int16 v100 = 1024;
      int v101 = v64;
      __int16 v102 = 2114;
      uint64_t v103 = v89;
      _os_log_impl(&dword_21BB87000, v62, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ parameters:", buf, 0x26u);
    }
    if (![v87 count]) {
      goto LABEL_64;
    }
    __int16 v65 = [v87 allKeys];
    int v61 = [v65 sortedArrayUsingComparator:&__block_literal_global_206];

    if (![v61 count])
    {
LABEL_63:

      goto LABEL_64;
    }
    __int16 v82 = v7;
    uint64_t v83 = v5;
    uint64_t v66 = 0;
    while (1)
    {
      __int16 v67 = [v61 objectAtIndexedSubscript:v66];
      if (!v66)
      {
        uint64_t v69 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          int v76 = [*(id *)(a1 + 40) streamID];
          int v77 = [v3 threadPriority];
          __int16 v78 = [v87 objectForKeyedSubscript:v67];
          *(_DWORD *)buf = 138544642;
          int v97 = v90;
          __int16 v98 = 2114;
          id v99 = v76;
          __int16 v100 = 1024;
          int v101 = v77;
          __int16 v102 = 2114;
          uint64_t v103 = v89;
          __int16 v104 = 2114;
          BOOL v105 = v67;
          __int16 v106 = 2114;
          int v107 = v78;
          _os_log_impl(&dword_21BB87000, v69, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@     ╲╭ %{public}@: %{public}@", buf, 0x3Au);

          a1 = v88;
        }
        goto LABEL_61;
      }
      uint64_t v68 = [v61 count] - 1;
      uint64_t v69 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
      if (v66 == v68)
      {
        if (v70)
        {
          int v71 = [*(id *)(a1 + 40) streamID];
          int v72 = [v3 threadPriority];
          uint64_t v73 = [v87 objectForKeyedSubscript:v67];
          *(_DWORD *)buf = 138544642;
          int v97 = v90;
          __int16 v98 = 2114;
          id v99 = v71;
          __int16 v100 = 1024;
          int v101 = v72;
          a1 = v88;
          __int16 v102 = 2114;
          uint64_t v103 = v89;
          __int16 v104 = 2114;
          BOOL v105 = v67;
          __int16 v106 = 2114;
          int v107 = v73;
          __int16 v74 = v69;
          int v75 = "|%{public}@ %{public}@ %2i %{public}@      ╰ %{public}@: %{public}@";
LABEL_60:
          _os_log_impl(&dword_21BB87000, v74, OS_LOG_TYPE_DEFAULT, v75, buf, 0x3Au);
        }
      }
      else if (v70)
      {
        int v71 = [*(id *)(a1 + 40) streamID];
        int v79 = [v3 threadPriority];
        uint64_t v73 = [v87 objectForKeyedSubscript:v67];
        *(_DWORD *)buf = 138544642;
        int v97 = v90;
        __int16 v98 = 2114;
        id v99 = v71;
        __int16 v100 = 1024;
        int v101 = v79;
        a1 = v88;
        __int16 v102 = 2114;
        uint64_t v103 = v89;
        __int16 v104 = 2114;
        BOOL v105 = v67;
        __int16 v106 = 2114;
        int v107 = v73;
        __int16 v74 = v69;
        int v75 = "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@";
        goto LABEL_60;
      }
LABEL_61:

      if (++v66 >= (unint64_t)[v61 count]) {
        goto LABEL_62;
      }
    }
  }
  if ([v86 count])
  {
    uint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [*(id *)(a1 + 40) streamID];
      int v25 = [v3 threadPriority];
      *(_DWORD *)buf = 138544130;
      int v97 = v90;
      __int16 v98 = 2114;
      id v99 = v24;
      __int16 v100 = 1024;
      int v101 = v25;
      __int16 v102 = 2114;
      uint64_t v103 = v89;
      _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing:", buf, 0x26u);
    }
    if ([v86 count])
    {
      int v81 = v7;
      int v26 = [v86 allKeys];
      v94[0] = MEMORY[0x263EF8330];
      v94[1] = 3221225472;
      void v94[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_202;
      v94[3] = &unk_2643BEE30;
      id v95 = &unk_26CC194D8;
      __int16 v27 = [v26 sortedArrayUsingComparator:v94];

      if ([v27 count])
      {
        for (unint64_t i = 0; i < [v27 count]; ++i)
        {
          __int16 v29 = [v27 objectAtIndexedSubscript:i];
          if (!i)
          {
            uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v38 = [*(id *)(a1 + 40) streamID];
              int v39 = [v91 threadPriority];
              __int16 v40 = [v86 objectForKeyedSubscript:v29];
              *(_DWORD *)buf = 138544642;
              int v97 = v90;
              __int16 v98 = 2114;
              id v99 = v38;
              __int16 v100 = 1024;
              int v101 = v39;
              __int16 v102 = 2114;
              uint64_t v103 = v89;
              __int16 v104 = 2114;
              BOOL v105 = v29;
              __int16 v106 = 2114;
              int v107 = v40;
              _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ %{public}@: %{public}@", buf, 0x3Au);

              a1 = v88;
            }
            goto LABEL_28;
          }
          uint64_t v30 = [v27 count] - 1;
          uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
          if (i == v30)
          {
            if (v32)
            {
              __int16 v33 = [*(id *)(a1 + 40) streamID];
              int v34 = [v91 threadPriority];
              __int16 v35 = [v86 objectForKeyedSubscript:v29];
              *(_DWORD *)buf = 138544642;
              int v97 = v90;
              __int16 v98 = 2114;
              id v99 = v33;
              __int16 v100 = 1024;
              int v101 = v34;
              __int16 v102 = 2114;
              uint64_t v103 = v89;
              __int16 v104 = 2114;
              BOOL v105 = v29;
              __int16 v106 = 2114;
              int v107 = v35;
              __int16 v36 = v31;
              __int16 v37 = "|%{public}@ %{public}@ %2i %{public}@  │   ╰ %{public}@: %{public}@";
LABEL_27:
              _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 0x3Au);

              a1 = v88;
            }
          }
          else if (v32)
          {
            __int16 v33 = [*(id *)(a1 + 40) streamID];
            int v41 = [v91 threadPriority];
            __int16 v35 = [v86 objectForKeyedSubscript:v29];
            *(_DWORD *)buf = 138544642;
            int v97 = v90;
            __int16 v98 = 2114;
            id v99 = v33;
            __int16 v100 = 1024;
            int v101 = v41;
            __int16 v102 = 2114;
            uint64_t v103 = v89;
            __int16 v104 = 2114;
            BOOL v105 = v29;
            __int16 v106 = 2114;
            int v107 = v35;
            __int16 v36 = v31;
            __int16 v37 = "|%{public}@ %{public}@ %2i %{public}@  │   │ %{public}@: %{public}@";
            goto LABEL_27;
          }
LABEL_28:
        }
      }

      id v7 = v81;
    }
  }
  if ([v85 count])
  {
    __int16 v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v43 = [*(id *)(a1 + 40) streamID];
      int v44 = [v91 threadPriority];
      *(_DWORD *)buf = 138544130;
      int v97 = v90;
      __int16 v98 = 2114;
      id v99 = v43;
      __int16 v100 = 1024;
      int v101 = v44;
      __int16 v102 = 2114;
      uint64_t v103 = v89;
      _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming:", buf, 0x26u);
    }
    if ([v85 count])
    {
      __int16 v82 = v7;
      uint64_t v83 = v5;
      __int16 v45 = [v85 allKeys];
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      void v92[2] = __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_203;
      v92[3] = &unk_2643BEE30;
      __int16 v93 = &unk_26CC194D8;
      uint64_t v46 = [v45 sortedArrayUsingComparator:v92];

      if ([v46 count])
      {
        for (unint64_t j = 0; j < [v46 count]; ++j)
        {
          __int16 v48 = [v46 objectAtIndexedSubscript:j];
          if (!j)
          {
            __int16 v50 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              long long v57 = [*(id *)(a1 + 40) streamID];
              int v58 = [v91 threadPriority];
              long long v59 = [v85 objectForKeyedSubscript:v48];
              *(_DWORD *)buf = 138544642;
              int v97 = v90;
              __int16 v98 = 2114;
              id v99 = v57;
              __int16 v100 = 1024;
              int v101 = v58;
              __int16 v102 = 2114;
              uint64_t v103 = v89;
              __int16 v104 = 2114;
              BOOL v105 = v48;
              __int16 v106 = 2114;
              int v107 = v59;
              _os_log_impl(&dword_21BB87000, v50, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@     ╲╭ %{public}@: %{public}@", buf, 0x3Au);

              a1 = v88;
            }
            goto LABEL_45;
          }
          uint64_t v49 = [v46 count] - 1;
          __int16 v50 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
          BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          if (j == v49)
          {
            if (v51)
            {
              __int16 v52 = [*(id *)(a1 + 40) streamID];
              int v53 = [v91 threadPriority];
              int v54 = [v85 objectForKeyedSubscript:v48];
              *(_DWORD *)buf = 138544642;
              int v97 = v90;
              __int16 v98 = 2114;
              id v99 = v52;
              __int16 v100 = 1024;
              int v101 = v53;
              __int16 v102 = 2114;
              uint64_t v103 = v89;
              __int16 v104 = 2114;
              BOOL v105 = v48;
              __int16 v106 = 2114;
              int v107 = v54;
              uint64_t v55 = v50;
              long long v56 = "|%{public}@ %{public}@ %2i %{public}@      ╰ %{public}@: %{public}@";
LABEL_44:
              _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0x3Au);

              a1 = v88;
            }
          }
          else if (v51)
          {
            __int16 v52 = [*(id *)(a1 + 40) streamID];
            int v60 = [v91 threadPriority];
            int v54 = [v85 objectForKeyedSubscript:v48];
            *(_DWORD *)buf = 138544642;
            int v97 = v90;
            __int16 v98 = 2114;
            id v99 = v52;
            __int16 v100 = 1024;
            int v101 = v60;
            __int16 v102 = 2114;
            uint64_t v103 = v89;
            __int16 v104 = 2114;
            BOOL v105 = v48;
            __int16 v106 = 2114;
            int v107 = v54;
            uint64_t v55 = v50;
            long long v56 = "|%{public}@ %{public}@ %2i %{public}@      │ %{public}@: %{public}@";
            goto LABEL_44;
          }
LABEL_45:
        }
      }

      int v61 = v93;
LABEL_62:
      id v7 = v82;
      id v5 = v83;
      goto LABEL_63;
    }
  }
LABEL_64:

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_207(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"outgoing-item-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"incoming-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"transition-type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"transition-cancellation-reason"];

  int v13 = @"􀠊  Gapless";
  if (v10 == 1) {
    int v13 = @"􀟧  Crossfade";
  }
  if (v10 == 2) {
    int v13 = @"􀠉  Unmanaged";
  }
  if (*(void *)(a1 + 32)) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  __int16 v15 = v14;
  int v16 = MSVLogDateFormatter();
  __int16 v17 = [v3 date];
  int v18 = [v16 stringFromDate:v17];

  __int16 v19 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    __int16 v36 = v18;
    __int16 v37 = 2114;
    __int16 v38 = v21;
    __int16 v39 = 1024;
    int v40 = [v3 threadPriority];
    __int16 v41 = 2114;
    __int16 v42 = v19;
    __int16 v43 = 2114;
    int v44 = v5;
    __int16 v45 = 2114;
    uint64_t v46 = v7;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀉘 ITEM TRANSITION CANCELLED  %{public}@ => %{public}@", buf, 0x3Au);
  }
  int v34 = (void *)v7;

  int v22 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = [*(id *)(a1 + 40) streamID];
    int v25 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    __int16 v36 = v18;
    __int16 v37 = 2114;
    __int16 v38 = v24;
    __int16 v39 = 1024;
    int v40 = v25;
    __int16 v41 = 2114;
    __int16 v42 = v22;
    __int16 v43 = 2114;
    int v44 = v15;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", buf, 0x30u);
  }
  int v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v27 = [*(id *)(a1 + 40) streamID];
    int v28 = [v3 threadPriority];
    objc_msgSend(v12, "msv_description");
    __int16 v29 = v15;
    uint64_t v30 = v12;
    uint64_t v31 = v5;
    BOOL v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    __int16 v36 = v18;
    __int16 v37 = 2114;
    __int16 v38 = v27;
    __int16 v39 = 1024;
    int v40 = v28;
    __int16 v41 = 2114;
    __int16 v42 = v22;
    __int16 v43 = 2114;
    int v44 = v32;
    _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ reason: %{public}@", buf, 0x30u);

    id v5 = v31;
    uint64_t v12 = v30;
    __int16 v15 = v29;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_208(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"outgoing-item-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"incoming-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"transition-type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"transition-outgoing-item-source-time"];
  [v12 doubleValue];
  uint64_t v14 = v13;

  __int16 v15 = [v3 payload];
  int v16 = [v15 objectForKeyedSubscript:@"transition-outgoing-item-target-time"];
  [v16 doubleValue];
  int v18 = v17;

  __int16 v19 = [v3 payload];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"transition-incoming-item-source-time"];
  [v20 doubleValue];
  int v22 = v21;

  uint64_t v23 = [v3 payload];
  int v24 = [v23 objectForKeyedSubscript:@"transition-incoming-item-target-time"];
  [v24 doubleValue];
  int v26 = v25;

  __int16 v27 = [v3 payload];
  int v28 = [v27 objectForKeyedSubscript:@"transition-average-rate"];
  [v28 doubleValue];
  uint64_t v30 = v29;

  uint64_t v31 = @"􀠊  Gapless";
  if (v10 == 1) {
    uint64_t v31 = @"􀟧  Crossfade";
  }
  if (v10 == 2) {
    uint64_t v31 = @"􀠉  Unmanaged";
  }
  if (*(void *)(a1 + 32)) {
    BOOL v32 = v31;
  }
  else {
    BOOL v32 = 0;
  }
  __int16 v33 = v32;
  int v34 = MSVLogDateFormatter();
  __int16 v35 = [v3 date];
  __int16 v36 = [v34 stringFromDate:v35];

  __int16 v37 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v39 = [*(id *)(a1 + 40) streamID];
    int v51 = 138544642;
    __int16 v52 = v36;
    __int16 v53 = 2114;
    int v54 = v39;
    __int16 v55 = 1024;
    int v56 = [v3 threadPriority];
    __int16 v57 = 2114;
    int v58 = v37;
    __int16 v59 = 2114;
    int v60 = v5;
    __int16 v61 = 2114;
    int v62 = v7;
    _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀉘 ITEM TRANSITION START      %{public}@ => %{public}@", (uint8_t *)&v51, 0x3Au);
  }
  int v40 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v42 = [*(id *)(a1 + 40) streamID];
    int v43 = [v3 threadPriority];
    int v51 = 138544386;
    __int16 v52 = v36;
    __int16 v53 = 2114;
    int v54 = v42;
    __int16 v55 = 1024;
    int v56 = v43;
    __int16 v57 = 2114;
    int v58 = v40;
    __int16 v59 = 2114;
    int v60 = v33;
    _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v51, 0x30u);
  }
  int v44 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v45 = [*(id *)(a1 + 40) streamID];
    int v46 = [v3 threadPriority];
    int v51 = 138544898;
    __int16 v52 = v36;
    __int16 v53 = 2114;
    int v54 = v45;
    __int16 v55 = 1024;
    int v56 = v46;
    __int16 v57 = 2114;
    int v58 = v40;
    __int16 v59 = 2048;
    int v60 = v18;
    __int16 v61 = 2048;
    int v62 = v14;
    __int16 v63 = 2048;
    uint64_t v64 = v30;
    _os_log_impl(&dword_21BB87000, v44, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f averageRate: %3.2f }",
      (uint8_t *)&v51,
      0x44u);
  }
  uint64_t v47 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v48 = [*(id *)(a1 + 40) streamID];
    int v49 = [v3 threadPriority];
    int v51 = 138544642;
    __int16 v52 = v36;
    __int16 v53 = 2114;
    int v54 = v48;
    __int16 v55 = 1024;
    int v56 = v49;
    __int16 v57 = 2114;
    int v58 = v40;
    __int16 v59 = 2048;
    int v60 = v26;
    __int16 v61 = 2048;
    int v62 = v22;
    _os_log_impl(&dword_21BB87000, v47, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v51,
      0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_209(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"outgoing-item-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"incoming-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"transition-type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"transition-outgoing-item-source-time"];
  [v12 doubleValue];
  uint64_t v14 = v13;

  __int16 v15 = [v3 payload];
  int v16 = [v15 objectForKeyedSubscript:@"transition-outgoing-item-target-time"];
  [v16 doubleValue];
  int v18 = v17;

  __int16 v19 = [v3 payload];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"transition-incoming-item-source-time"];
  [v20 doubleValue];
  int v22 = v21;

  uint64_t v23 = [v3 payload];
  int v24 = [v23 objectForKeyedSubscript:@"transition-incoming-item-target-time"];
  [v24 doubleValue];
  int v26 = v25;

  __int16 v27 = @"􀠊  Gapless";
  if (v10 == 1) {
    __int16 v27 = @"􀟧  Crossfade";
  }
  if (v10 == 2) {
    __int16 v27 = @"􀠉  Unmanaged";
  }
  if (*(void *)(a1 + 32)) {
    int v28 = v27;
  }
  else {
    int v28 = 0;
  }
  uint64_t v29 = v28;
  uint64_t v30 = MSVLogDateFormatter();
  uint64_t v31 = [v3 date];
  BOOL v32 = [v30 stringFromDate:v31];

  __int16 v33 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v35 = [*(id *)(a1 + 40) streamID];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v35;
    __int16 v51 = 1024;
    int v52 = [v3 threadPriority];
    __int16 v53 = 2114;
    int v54 = v33;
    __int16 v55 = 2114;
    int v56 = v5;
    __int16 v57 = 2114;
    int v58 = v7;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀰧 ITEM TRANSITION END      %{public}@ => %{public}@", (uint8_t *)&v47, 0x3Au);
  }
  __int16 v36 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v38 = [*(id *)(a1 + 40) streamID];
    int v39 = [v3 threadPriority];
    int v47 = 138544386;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v38;
    __int16 v51 = 1024;
    int v52 = v39;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2114;
    int v56 = v29;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v47, 0x30u);
  }
  int v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v41 = [*(id *)(a1 + 40) streamID];
    int v42 = [v3 threadPriority];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v41;
    __int16 v51 = 1024;
    int v52 = v42;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2048;
    int v56 = v18;
    __int16 v57 = 2048;
    int v58 = v14;
    _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);
  }
  int v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    int v44 = [*(id *)(a1 + 40) streamID];
    int v45 = [v3 threadPriority];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v44;
    __int16 v51 = 1024;
    int v52 = v45;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2048;
    int v56 = v26;
    __int16 v57 = 2048;
    int v58 = v22;
    _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_210(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"outgoing-item-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"incoming-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"transition-type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"transition-outgoing-item-source-time"];
  [v12 doubleValue];
  uint64_t v14 = v13;

  __int16 v15 = [v3 payload];
  int v16 = [v15 objectForKeyedSubscript:@"transition-outgoing-item-target-time"];
  [v16 doubleValue];
  int v18 = v17;

  __int16 v19 = [v3 payload];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"transition-incoming-item-source-time"];
  [v20 doubleValue];
  int v22 = v21;

  uint64_t v23 = [v3 payload];
  int v24 = [v23 objectForKeyedSubscript:@"transition-incoming-item-target-time"];
  [v24 doubleValue];
  int v26 = v25;

  __int16 v27 = @"􀠊  Gapless";
  if (v10 == 1) {
    __int16 v27 = @"􀟧  Crossfade";
  }
  if (v10 == 2) {
    __int16 v27 = @"􀠉  Unmanaged";
  }
  if (*(void *)(a1 + 32)) {
    int v28 = v27;
  }
  else {
    int v28 = 0;
  }
  uint64_t v29 = v28;
  uint64_t v30 = MSVLogDateFormatter();
  uint64_t v31 = [v3 date];
  BOOL v32 = [v30 stringFromDate:v31];

  __int16 v33 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    __int16 v35 = [*(id *)(a1 + 40) streamID];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v35;
    __int16 v51 = 1024;
    int v52 = [v3 threadPriority];
    __int16 v53 = 2114;
    int v54 = v33;
    __int16 v55 = 2114;
    int v56 = v5;
    __int16 v57 = 2114;
    int v58 = v7;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀯮 OVERLAP START            %{public}@ => %{public}@", (uint8_t *)&v47, 0x3Au);
  }
  __int16 v36 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    __int16 v38 = [*(id *)(a1 + 40) streamID];
    int v39 = [v3 threadPriority];
    int v47 = 138544386;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v38;
    __int16 v51 = 1024;
    int v52 = v39;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2114;
    int v56 = v29;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v47, 0x30u);
  }
  int v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    __int16 v41 = [*(id *)(a1 + 40) streamID];
    int v42 = [v3 threadPriority];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v41;
    __int16 v51 = 1024;
    int v52 = v42;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2048;
    int v56 = v18;
    __int16 v57 = 2048;
    int v58 = v14;
    _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);
  }
  int v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    int v44 = [*(id *)(a1 + 40) streamID];
    int v45 = [v3 threadPriority];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v44;
    __int16 v51 = 1024;
    int v52 = v45;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2048;
    int v56 = v26;
    __int16 v57 = 2048;
    int v58 = v22;
    _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_211(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"outgoing-item-id"];

  uint64_t v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"incoming-item-id"];

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"transition-type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"transition-outgoing-item-source-time"];
  [v12 doubleValue];
  uint64_t v14 = v13;

  __int16 v15 = [v3 payload];
  int v16 = [v15 objectForKeyedSubscript:@"transition-outgoing-item-target-time"];
  [v16 doubleValue];
  int v18 = v17;

  __int16 v19 = [v3 payload];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"transition-incoming-item-source-time"];
  [v20 doubleValue];
  int v22 = v21;

  uint64_t v23 = [v3 payload];
  int v24 = [v23 objectForKeyedSubscript:@"transition-incoming-item-target-time"];
  [v24 doubleValue];
  int v26 = v25;

  __int16 v27 = @"􀠊  Gapless";
  if (v10 == 1) {
    __int16 v27 = @"􀟧  Crossfade";
  }
  if (v10 == 2) {
    __int16 v27 = @"􀠉  Unmanaged";
  }
  if (*(void *)(a1 + 32)) {
    int v28 = v27;
  }
  else {
    int v28 = 0;
  }
  uint64_t v29 = v28;
  uint64_t v30 = MSVLogDateFormatter();
  uint64_t v31 = [v3 date];
  BOOL v32 = [v30 stringFromDate:v31];

  __int16 v33 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    __int16 v35 = [*(id *)(a1 + 40) streamID];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v35;
    __int16 v51 = 1024;
    int v52 = [v3 threadPriority];
    __int16 v53 = 2114;
    int v54 = v33;
    __int16 v55 = 2114;
    int v56 = v5;
    __int16 v57 = 2114;
    int v58 = v7;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@􀯯 OVERLAP END              %{public}@ => %{public}@", (uint8_t *)&v47, 0x3Au);
  }
  __int16 v36 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    __int16 v38 = [*(id *)(a1 + 40) streamID];
    int v39 = [v3 threadPriority];
    int v47 = 138544386;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v38;
    __int16 v51 = 1024;
    int v52 = v39;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2114;
    int v56 = v29;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@", (uint8_t *)&v47, 0x30u);
  }
  int v40 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    __int16 v41 = [*(id *)(a1 + 40) streamID];
    int v42 = [v3 threadPriority];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v41;
    __int16 v51 = 1024;
    int v52 = v42;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2048;
    int v56 = v18;
    __int16 v57 = 2048;
    int v58 = v14;
    _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  │ outgoing: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);
  }
  int v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    int v44 = [*(id *)(a1 + 40) streamID];
    int v45 = [v3 threadPriority];
    int v47 = 138544642;
    __int16 v48 = v32;
    __int16 v49 = 2114;
    __int16 v50 = v44;
    __int16 v51 = 1024;
    int v52 = v45;
    __int16 v53 = 2114;
    int v54 = v36;
    __int16 v55 = 2048;
    int v56 = v26;
    __int16 v57 = 2048;
    int v58 = v22;
    _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_INFO, "|%{public}@ %{public}@ %2i %{public}@  ╰ incoming: { targetTime: %3.2f; sourceTime: %3.2f }",
      (uint8_t *)&v47,
      0x3Au);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_212(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = *(__CFString **)(a1 + 32);
  id v5 = [v3 payload];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"resolution-type"];
  unint64_t v7 = [v6 integerValue];
  if (v4)
  {
    if (v7 > 2) {
      int v4 = @"Unknown";
    }
    else {
      int v4 = off_2643BEF50[v7];
    }
  }

  uint64_t v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"error-for-resolution"];

  uint64_t v10 = [v3 payload];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-section-id"];
  uint64_t v12 = (void *)v11;
  if (v11) {
    int v13 = (__CFString *)v11;
  }
  else {
    int v13 = &stru_26CBCA930;
  }
  uint64_t v14 = v13;

  __int16 v15 = [v3 payload];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"queue-item-id"];
  __int16 v17 = (void *)v16;
  if (v16) {
    int v18 = (__CFString *)v16;
  }
  else {
    int v18 = &stru_26CBCA930;
  }
  __int16 v19 = v18;

  uint64_t v20 = MSVLogDateFormatter();
  __int16 v21 = [v3 date];
  int v43 = [v20 stringFromDate:v21];

  int v22 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v23 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    int v45 = v43;
    __int16 v46 = 2114;
    int v47 = v24;
    __int16 v48 = 1024;
    int v49 = [v3 threadPriority];
    __int16 v50 = 2114;
    __int16 v51 = v22;
    __int16 v52 = 2114;
    __int16 v53 = v14;
    __int16 v54 = 2114;
    __int16 v55 = v19;
    __int16 v56 = 2114;
    __int16 v57 = v4;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘯 ERROR RESOLUTION           %{public}@ %{public}@ %{public}@", buf, 0x44u);
  }
  int v40 = v19;
  __int16 v41 = v14;

  int v25 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v42 = v9;
  int v26 = objc_msgSend(v9, "msv_description");
  __int16 v27 = [v26 componentsSeparatedByString:@"\n"];

  if ([v27 count])
  {
    for (unint64_t i = 0; i < [v27 count]; ++i)
    {
      uint64_t v29 = [v27 objectAtIndexedSubscript:i];
      if (i)
      {
        uint64_t v30 = [v27 count] - 1;
        uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        if (i == v30)
        {
          if (v32)
          {
            __int16 v33 = [*(id *)(a1 + 40) streamID];
            int v34 = [v3 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v45 = v43;
            __int16 v46 = 2114;
            int v47 = v33;
            __int16 v48 = 1024;
            int v49 = v34;
            __int16 v50 = 2114;
            __int16 v51 = v25;
            __int16 v52 = 2114;
            __int16 v53 = v29;
            __int16 v35 = v31;
            __int16 v36 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_23:
            _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_ERROR, v36, buf, 0x30u);
          }
        }
        else if (v32)
        {
          __int16 v33 = [*(id *)(a1 + 40) streamID];
          int v38 = [v3 threadPriority];
          *(_DWORD *)buf = 138544386;
          int v45 = v43;
          __int16 v46 = 2114;
          int v47 = v33;
          __int16 v48 = 1024;
          int v49 = v38;
          __int16 v50 = 2114;
          __int16 v51 = v25;
          __int16 v52 = 2114;
          __int16 v53 = v29;
          __int16 v35 = v31;
          __int16 v36 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = [*(id *)(a1 + 40) streamID];
          int v37 = [v3 threadPriority];
          *(_DWORD *)buf = 138544386;
          int v45 = v43;
          __int16 v46 = 2114;
          int v47 = v33;
          __int16 v48 = 1024;
          int v49 = v37;
          __int16 v50 = 2114;
          __int16 v51 = v25;
          __int16 v52 = 2114;
          __int16 v53 = v29;
          __int16 v35 = v31;
          __int16 v36 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
          goto LABEL_23;
        }
      }
    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_213(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"interrupt-name"];

  uint64_t v6 = MSVLogDateFormatter();
  unint64_t v7 = [v3 date];
  uint64_t v8 = [v6 stringFromDate:v7];

  uint64_t v9 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) streamID];
    int v13 = 138544386;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    __int16 v17 = 1024;
    int v18 = [v3 threadPriority];
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2114;
    int v22 = v5;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘰 INTERRUPT BEGIN            %{public}@", (uint8_t *)&v13, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_214(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"interrupt-name"];

  uint64_t v6 = [v3 payload];
  unint64_t v7 = [v6 objectForKeyedSubscript:@"interrupt-should-resume"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = MSVLogDateFormatter();
  uint64_t v10 = [v3 date];
  uint64_t v11 = [v9 stringFromDate:v10];

  uint64_t v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [*(id *)(a1 + 40) streamID];
    int v20 = 138544386;
    __int16 v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v14;
    __int16 v24 = 1024;
    int v25 = [v3 threadPriority];
    __int16 v26 = 2114;
    __int16 v27 = v12;
    __int16 v28 = 2114;
    uint64_t v29 = v5;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀘯 INTERRUPT END              %{public}@", (uint8_t *)&v20, 0x30u);
  }
  __int16 v15 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = [*(id *)(a1 + 40) streamID];
    int v18 = [v3 threadPriority];
    int v20 = 138544386;
    __int16 v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v17;
    __int16 v24 = 1024;
    int v25 = v18;
    __int16 v26 = 2114;
    __int16 v27 = v15;
    __int16 v28 = 1024;
    LODWORD(v29) = v8;
    _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ resume: %{BOOL}u", (uint8_t *)&v20, 0x2Cu);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_215(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  uint64_t v6 = [v4 stringFromDate:v5];

  unint64_t v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 40) streamID];
    int v11 = 138544130;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v3 threadPriority];
    __int16 v17 = 2114;
    int v18 = v7;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀞠 POLICY BEGIN", (uint8_t *)&v11, 0x26u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_216(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  uint64_t v6 = [v4 stringFromDate:v5];

  unint64_t v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 40) streamID];
    int v11 = 138544130;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 1024;
    int v16 = [v3 threadPriority];
    __int16 v17 = 2114;
    int v18 = v7;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀞟 POLICY END", (uint8_t *)&v11, 0x26u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_217(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"playback-behavior-metadata"];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"shuffle-type"];
  uint64_t v7 = [v6 integerValue];

  int v8 = [v5 objectForKeyedSubscript:@"repeat-type"];
  uint64_t v9 = [v8 integerValue];

  uint64_t v10 = [v5 objectForKeyedSubscript:@"autoplay-mode"];
  int v11 = (void *)[v10 integerValue];

  if (!*(void *)(a1 + 32))
  {
    __int16 v21 = 0;
    int v16 = 0;
    goto LABEL_34;
  }
  uint64_t v12 = MPNSStringFromShuffleType();
  __int16 v13 = v12;
  if ((unint64_t)(v7 - 1) < 2)
  {
    uint64_t v14 = @"􀵊  ";
LABEL_6:
    id v15 = [(__CFString *)v14 stringByAppendingString:v13];
    goto LABEL_8;
  }
  if (!v7)
  {
    uint64_t v14 = @"􀵉  ";
    goto LABEL_6;
  }
  id v15 = v12;
LABEL_8:
  int v16 = v15;

  if (!*(void *)(a1 + 32))
  {
    __int16 v21 = 0;
    goto LABEL_34;
  }
  __int16 v17 = MPNSStringFromRepeatType();
  int v18 = v17;
  switch(v9)
  {
    case 2:
      uint64_t v19 = @"􀵌  ";
      goto LABEL_15;
    case 1:
      uint64_t v19 = @"􀵎  ";
      goto LABEL_15;
    case 0:
      uint64_t v19 = @"􀵋  ";
LABEL_15:
      id v20 = [(__CFString *)v19 stringByAppendingString:v18];
      goto LABEL_17;
  }
  id v20 = v17;
LABEL_17:
  __int16 v21 = v20;

  if (!*(void *)(a1 + 32))
  {
LABEL_34:
    int v11 = 0;
    goto LABEL_24;
  }
  switch((unint64_t)v11)
  {
    case 0uLL:
      __int16 v22 = @"􀕧  ";
      uint64_t v23 = @"Unknown";
      goto LABEL_23;
    case 1uLL:
      __int16 v22 = @"􀵏  ";
      uint64_t v23 = @"Off";
      goto LABEL_23;
    case 2uLL:
      __int16 v22 = @"􀵐  ";
      uint64_t v23 = @"On";
      goto LABEL_23;
    case 3uLL:
      __int16 v22 = @"􀁠  ";
      uint64_t v23 = @"Unsupported";
LABEL_23:
      int v11 = [(__CFString *)v22 stringByAppendingString:v23];
      break;
    default:
      break;
  }
LABEL_24:
  __int16 v24 = MSVLogDateFormatter();
  int v25 = [v3 date];
  __int16 v26 = [v24 stringFromDate:v25];

  __int16 v27 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 40) streamID];
    __int16 v46 = v16;
    v29 = int v47 = v5;
    int v30 = [v3 threadPriority];
    [v3 payload];
    uint64_t v31 = v45 = v21;
    [v31 objectForKeyedSubscript:@"session-id"];
    v33 = BOOL v32 = v11;
    *(_DWORD *)buf = 138544386;
    int v49 = v26;
    __int16 v50 = 2114;
    __int16 v51 = v29;
    __int16 v52 = 1024;
    int v53 = v30;
    __int16 v54 = 2114;
    __int16 v55 = v27;
    __int16 v56 = 2114;
    __int16 v57 = v33;
    _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀵉 BEHAVIOR CHANGED           %{public}@", buf, 0x30u);

    int v11 = v32;
    __int16 v21 = v45;

    int v16 = v46;
    id v5 = v47;
  }

  int v34 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v36 = [*(id *)(a1 + 40) streamID];
    int v37 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v49 = v26;
    __int16 v50 = 2114;
    __int16 v51 = v36;
    __int16 v52 = 1024;
    int v53 = v37;
    __int16 v54 = 2114;
    __int16 v55 = v34;
    __int16 v56 = 2114;
    __int16 v57 = v16;
    _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ shuffle:  %{public}@", buf, 0x30u);
  }
  int v38 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = [*(id *)(a1 + 40) streamID];
    int v40 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v49 = v26;
    __int16 v50 = 2114;
    __int16 v51 = v39;
    __int16 v52 = 1024;
    int v53 = v40;
    __int16 v54 = 2114;
    __int16 v55 = v34;
    __int16 v56 = 2114;
    __int16 v57 = v21;
    _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ repeat:   %{public}@", buf, 0x30u);
  }
  __int16 v41 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    int v42 = [*(id *)(a1 + 40) streamID];
    int v43 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v49 = v26;
    __int16 v50 = 2114;
    __int16 v51 = v42;
    __int16 v52 = 1024;
    int v53 = v43;
    __int16 v54 = 2114;
    __int16 v55 = v34;
    __int16 v56 = 2114;
    __int16 v57 = v11;
    _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ autoplay: %{public}@", buf, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_218(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  uint64_t v6 = [v4 stringFromDate:v5];

  uint64_t v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 40) streamID];
    int v10 = [v3 threadPriority];
    int v11 = [v3 payload];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"session-id"];
    int v14 = 138544386;
    id v15 = v6;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    __int16 v20 = 2114;
    __int16 v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀃯 ❗MEDIASERVICES LOST       %{public}@", (uint8_t *)&v14, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_219(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  uint64_t v6 = [v4 stringFromDate:v5];

  uint64_t v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 40) streamID];
    int v10 = [v3 threadPriority];
    int v11 = [v3 payload];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"session-id"];
    int v14 = 138544386;
    id v15 = v6;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    __int16 v20 = 2114;
    __int16 v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀃮 ❕MEDIASERVICES RESET      %{public}@", (uint8_t *)&v14, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_220(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = MSVLogDateFormatter();
  id v5 = [v3 date];
  uint64_t v6 = [v4 stringFromDate:v5];

  uint64_t v7 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 40) streamID];
    int v10 = [v3 threadPriority];
    int v11 = [v3 payload];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"session-id"];
    int v14 = 138544386;
    id v15 = v6;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    __int16 v20 = 2114;
    __int16 v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀃮 MEDIASERVICES PURGE       %{public}@", (uint8_t *)&v14, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_222(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"audio-rendering-mode"];
  uint64_t v6 = [v5 integerValue];

  if ((unint64_t)(v6 - 1) > 4) {
    uint64_t v7 = @"Unknown";
  }
  else {
    uint64_t v7 = off_2643C4788[v6 - 1];
  }
  int v8 = v7;
  uint64_t v9 = MSVLogDateFormatter();
  int v10 = [v3 date];
  int v11 = [v9 stringFromDate:v10];

  uint64_t v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [*(id *)(a1 + 40) streamID];
    int v16 = 138544386;
    __int16 v17 = v11;
    __int16 v18 = 2114;
    int v19 = v14;
    __int16 v20 = 1024;
    int v21 = [v3 threadPriority];
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    int v25 = v8;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀥑 RENDERING MODE CHANGED     %{public}@", (uint8_t *)&v16, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  void v62[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v5);
  uint64_t v7 = [v5 payload];
  int v8 = [v7 objectForKeyedSubscript:@"time-control-status"];
  uint64_t v9 = [v8 integerValue];

  int v10 = [v5 payload];
  int v43 = [v10 objectForKeyedSubscript:@"time-control-status-reason"];

  if (*(void *)(a1 + 32))
  {
    if ((unint64_t)(v9 + 1) > 3) {
      int v11 = @"Stopped";
    }
    else {
      int v11 = off_2643BEF68[v9 + 1];
    }
    __int16 v41 = v11;
  }
  else
  {
    __int16 v41 = 0;
  }
  v62[0] = @"item-begin";
  v62[1] = @"item-end";
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v62, 2, v41);
  __int16 v13 = [v6 findPreviousEventWithTypes:v12 matchingPayload:0];

  int v14 = [v13 payload];
  int v45 = [v14 objectForKeyedSubscript:@"queue-section-id"];

  id v15 = [v13 payload];
  int v44 = [v15 objectForKeyedSubscript:@"queue-item-id"];

  int v16 = MSVLogDateFormatter();
  __int16 v17 = [v5 date];
  __int16 v18 = [v16 stringFromDate:v17];

  int v19 = [v13 type];
  if (v19 == @"item-end")
  {

    goto LABEL_12;
  }
  __int16 v20 = v19;
  int v21 = [(__CFString *)v19 isEqual:@"item-end"];

  if (v21)
  {
LABEL_12:
    uint64_t v23 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    __int16 v27 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544130;
    int v47 = v18;
    __int16 v48 = 2114;
    int v49 = v27;
    __int16 v50 = 1024;
    int v51 = [v5 threadPriority];
    __int16 v52 = 2114;
    int v53 = v23;
    __int16 v28 = "|%{public}@ %{public}@ %2i %{public}@􁁝 TIME CONTROL CHANGED";
    uint64_t v29 = v26;
    uint32_t v30 = 38;
    goto LABEL_14;
  }
  if (v9 != 2)
  {
    uint64_t v23 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    __int16 v27 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v47 = v18;
    __int16 v48 = 2114;
    int v49 = v27;
    __int16 v50 = 1024;
    int v51 = [v5 threadPriority];
    __int16 v52 = 2114;
    int v53 = v23;
    __int16 v54 = 2114;
    __int16 v55 = v45;
    __int16 v56 = 2114;
    __int16 v57 = v44;
    __int16 v28 = "|%{public}@ %{public}@ %2i %{public}@􁁝 TIME CONTROL CHANGED       %{public}@ %{public}@";
    uint64_t v29 = v26;
    uint32_t v30 = 58;
LABEL_14:
    _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);

    goto LABEL_21;
  }
  int v60 = @"time-control-status";
  __int16 v61 = &unk_26CC18C48;
  __int16 v22 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  uint64_t v23 = [v6 findPreviousEventWithType:@"time-control-status-changed" matchingPayload:v22];

  if (v23)
  {
    [v5 durationSinceEvent:v23];
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v25 = 0;
  }
  uint64_t v26 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v32 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544898;
    int v47 = v18;
    __int16 v48 = 2114;
    int v49 = v32;
    __int16 v50 = 1024;
    int v51 = [v5 threadPriority];
    __int16 v52 = 2114;
    int v53 = v26;
    __int16 v54 = 2114;
    __int16 v55 = v45;
    __int16 v56 = 2114;
    __int16 v57 = v44;
    __int16 v58 = 2048;
    uint64_t v59 = v25;
    _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁁝 TIME CONTROL CHANGED       %{public}@ %{public}@ [%.3fs]", buf, 0x44u);
  }
LABEL_21:

  __int16 v33 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v35 = [*(id *)(a1 + 40) streamID];
    int v36 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v47 = v18;
    __int16 v48 = 2114;
    int v49 = v35;
    __int16 v50 = 1024;
    int v51 = v36;
    __int16 v52 = 2114;
    int v53 = v33;
    __int16 v54 = 2114;
    __int16 v55 = v42;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ status: %{public}@", buf, 0x30u);
  }
  int v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = [*(id *)(a1 + 40) streamID];
    int v39 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v47 = v18;
    __int16 v48 = 2114;
    int v49 = v38;
    __int16 v50 = 1024;
    int v51 = v39;
    __int16 v52 = 2114;
    int v53 = v33;
    __int16 v54 = 2114;
    __int16 v55 = v43;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ reason: %{public}@", buf, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_225(uint64_t a1, void *a2)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  __int16 v50 = v3;
  int v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"network-operation-type"];
  unint64_t v10 = [v9 integerValue];
  if (v10 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedNetworkOperationType-%ld", v10);
    __int16 v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v46 = off_2643BEF88[v10];
  }

  int v11 = [v50 payload];
  int v45 = [v11 objectForKeyedSubscript:@"network-operation-reason"];

  uint64_t v12 = [v50 payload];
  __int16 v13 = [v12 objectForKeyedSubscript:@"blocks-playback"];
  int v43 = [v13 BOOLValue];

  int v14 = [v50 payload];
  int v47 = [v14 objectForKeyedSubscript:@"network-metrics"];

  id v15 = MSVLogDateFormatter();
  int v16 = [v50 date];
  int v49 = [v15 stringFromDate:v16];

  __int16 v17 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [*(id *)(a1 + 40) streamID];
    int v20 = [v50 threadPriority];
    if (v5) {
      int v21 = v5;
    }
    else {
      int v21 = &stru_26CBCA930;
    }
    if (v7) {
      __int16 v22 = (__CFString *)v7;
    }
    else {
      __int16 v22 = &stru_26CBCA930;
    }
    [v47 networkTime];
    *(_DWORD *)buf = 138544898;
    __int16 v58 = v49;
    __int16 v59 = 2114;
    int v60 = v19;
    __int16 v61 = 1024;
    int v62 = v20;
    __int16 v63 = 2114;
    uint64_t v64 = v17;
    __int16 v65 = 2114;
    uint64_t v66 = v21;
    __int16 v67 = 2114;
    uint64_t v68 = v22;
    __int16 v69 = 2048;
    uint64_t v70 = v23;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀤆 NETWORK OPERATION          %{public}@ %{public}@ [%.3fs]", buf, 0x44u);
  }
  int v44 = (void *)v7;

  __int16 v48 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [*(id *)(a1 + 40) streamID];
    int v26 = [v50 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v58 = v49;
    __int16 v59 = 2114;
    int v60 = v25;
    __int16 v61 = 1024;
    int v62 = v26;
    __int16 v63 = 2114;
    uint64_t v64 = v48;
    __int16 v65 = 2114;
    uint64_t v66 = v46;
    __int16 v67 = 2114;
    uint64_t v68 = v45;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@ (%{public}@)", buf, 0x3Au);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obunint64_t j = [v47 urlMetrics];
  uint64_t v27 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v53;
    uint32_t v30 = "com.apple.amp.mediaplaybackcore";
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(obj);
        }
        BOOL v32 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        __int16 v33 = os_log_create(v30, "PlaybackEvents_Oversize");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 40) streamID];
          int v34 = v30;
          int v36 = v35 = a1;
          int v37 = [v50 threadPriority];
          int v38 = [v32 humanDescription];
          *(_DWORD *)buf = 138544386;
          __int16 v58 = v49;
          __int16 v59 = 2114;
          int v60 = v36;
          __int16 v61 = 1024;
          int v62 = v37;
          __int16 v63 = 2114;
          uint64_t v64 = v48;
          __int16 v65 = 2114;
          uint64_t v66 = v38;
          _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ %{public}@", buf, 0x30u);

          a1 = v35;
          uint32_t v30 = v34;
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v28);
  }

  int v39 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = [*(id *)(a1 + 40) streamID];
    int v41 = [v50 threadPriority];
    *(_DWORD *)buf = 138544386;
    __int16 v58 = v49;
    __int16 v59 = 2114;
    int v60 = v40;
    __int16 v61 = 1024;
    int v62 = v41;
    __int16 v63 = 2114;
    uint64_t v64 = v48;
    __int16 v65 = 1024;
    LODWORD(v66) = v43;
    _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ blocks playback: %{BOOL}u", buf, 0x2Cu);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_226(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"player-identifier"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"player-operation"];

  int v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"player-operation-reason"];

  unint64_t v10 = MSVLogDateFormatter();
  int v11 = [v3 date];
  uint64_t v12 = [v10 stringFromDate:v11];

  __int16 v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v14 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [*(id *)(a1 + 40) streamID];
    int v24 = 138544386;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v15;
    __int16 v28 = 1024;
    int v29 = [v3 threadPriority];
    __int16 v30 = 2114;
    uint64_t v31 = v13;
    __int16 v32 = 2114;
    __int16 v33 = v5;
    _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀽍 PLAYER OPERATION BEGIN     %{public}@", (uint8_t *)&v24, 0x30u);
  }
  int v16 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = [*(id *)(a1 + 40) streamID];
    int v19 = [v3 threadPriority];
    int v24 = 138544386;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v18;
    __int16 v28 = 1024;
    int v29 = v19;
    __int16 v30 = 2114;
    uint64_t v31 = v16;
    __int16 v32 = 2114;
    __int16 v33 = v7;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ operation: %{public}@", (uint8_t *)&v24, 0x30u);
  }
  int v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [*(id *)(a1 + 40) streamID];
    int v22 = [v3 threadPriority];
    int v24 = 138544386;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    uint64_t v27 = v21;
    __int16 v28 = 1024;
    int v29 = v22;
    __int16 v30 = 2114;
    uint64_t v31 = v16;
    __int16 v32 = 2114;
    __int16 v33 = v9;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ reason: %{public}@", (uint8_t *)&v24, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  v61[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 payload];
  int v8 = [v7 objectForKeyedSubscript:@"player-identifier"];

  uint64_t v9 = [v5 payload];
  unint64_t v10 = [v9 objectForKeyedSubscript:@"player-items"];

  int v11 = [v5 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"player-operation"];

  int v60 = @"player-identifier";
  v61[0] = v8;
  __int16 v13 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
  int v14 = [v6 findPreviousEventWithType:@"player-operation-begin" matchingPayload:v13];

  [v5 durationSinceEvent:v14];
  uint64_t v16 = v15;
  __int16 v17 = MSVLogDateFormatter();
  __int16 v18 = [v5 date];
  int v47 = [v17 stringFromDate:v18];

  int v19 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v49 = v47;
    __int16 v50 = 2114;
    int v51 = v21;
    __int16 v52 = 1024;
    int v53 = [v5 threadPriority];
    __int16 v54 = 2114;
    long long v55 = v19;
    __int16 v56 = 2114;
    __int16 v57 = v8;
    __int16 v58 = 2048;
    uint64_t v59 = v16;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀽎 PLAYER OPERATION END       %{public}@ [%.3fs]", buf, 0x3Au);
  }
  __int16 v46 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v22 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [*(id *)(a1 + 40) streamID];
    int v24 = [v5 threadPriority];
    *(_DWORD *)buf = 138544386;
    int v49 = v47;
    __int16 v50 = 2114;
    int v51 = v23;
    __int16 v52 = 1024;
    int v53 = v24;
    __int16 v54 = 2114;
    long long v55 = v46;
    __int16 v56 = 2114;
    __int16 v57 = v12;
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ operation: %{public}@", buf, 0x30u);
  }
  if (v10)
  {
    uint64_t v25 = [v10 length];
    __int16 v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      int v43 = v14;
      int v44 = v12;
      id v45 = v6;
      if (v27)
      {
        __int16 v28 = [*(id *)(a1 + 40) streamID];
        int v29 = [v5 threadPriority];
        *(_DWORD *)buf = 138544130;
        int v49 = v47;
        __int16 v50 = 2114;
        int v51 = v28;
        __int16 v52 = 1024;
        int v53 = v29;
        __int16 v54 = 2114;
        long long v55 = v46;
        _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ items: [", buf, 0x26u);
      }
      __int16 v30 = [v10 componentsSeparatedByString:@"\n"];
      if ([v30 count])
      {
        for (unint64_t i = 0; i < [v30 count]; ++i)
        {
          __int16 v32 = [v30 objectAtIndexedSubscript:i];
          if (i)
          {
            uint64_t v33 = [v30 count] - 1;
            uint64_t v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            if (i == v33)
            {
              if (v35) {
                goto LABEL_18;
              }
            }
            else if (v35)
            {
LABEL_18:
              int v36 = [*(id *)(a1 + 40) streamID];
              int v37 = [v5 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v49 = v47;
              __int16 v50 = 2114;
              int v51 = v36;
              __int16 v52 = 1024;
              int v53 = v37;
              __int16 v54 = 2114;
              long long v55 = v46;
              __int16 v56 = 2114;
              __int16 v57 = v32;
              _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@       %{public}@", buf, 0x30u);
            }
          }
          else
          {
            uint64_t v34 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_18;
            }
          }
        }
      }

      __int16 v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = [*(id *)(a1 + 40) streamID];
        int v39 = [v5 threadPriority];
        *(_DWORD *)buf = 138544130;
        int v49 = v47;
        __int16 v50 = 2114;
        int v51 = v38;
        __int16 v52 = 1024;
        int v53 = v39;
        __int16 v54 = 2114;
        long long v55 = v46;
        _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@    ]", buf, 0x26u);
      }
      id v6 = v45;
      uint64_t v12 = v44;
      int v14 = v43;
    }
    else if (v27)
    {
      int v40 = [*(id *)(a1 + 40) streamID];
      int v41 = [v5 threadPriority];
      *(_DWORD *)buf = 138544130;
      int v49 = v47;
      __int16 v50 = 2114;
      int v51 = v40;
      __int16 v52 = 1024;
      int v53 = v41;
      __int16 v54 = 2114;
      long long v55 = v46;
      _os_log_impl(&dword_21BB87000, v26, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ items: []", buf, 0x26u);
    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_228(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"reload-current-item-reason"];
  uint64_t v6 = [v5 integerValue];

  uint64_t v7 = @"Unknown";
  if (v6 == 1) {
    uint64_t v7 = @"ProcessingChanged";
  }
  if (!v6) {
    uint64_t v7 = @"AudioFormatChanged";
  }
  int v8 = v7;
  uint64_t v9 = MSVLogDateFormatter();
  unint64_t v10 = [v3 date];
  int v11 = [v9 stringFromDate:v10];

  uint64_t v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [*(id *)(a1 + 40) streamID];
    int v16 = 138544386;
    __int16 v17 = v11;
    __int16 v18 = 2114;
    int v19 = v14;
    __int16 v20 = 1024;
    int v21 = [v3 threadPriority];
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁹠 RELOAD CURRENT ITEM BEGIN  %{public}@", (uint8_t *)&v16, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_229(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 payload];
  int v8 = [v7 objectForKeyedSubscript:@"reload-current-item-error"];

  uint64_t v9 = [v6 findPreviousEventWithType:@"reload-current-item-begin" matchingPayload:0];
  if (v9)
  {
    [v5 durationSinceEvent:v9];
    uint64_t v11 = v10;
    uint64_t v12 = [v9 payload];
    __int16 v13 = [v12 objectForKeyedSubscript:@"reload-current-item-reason"];
    uint64_t v14 = [v13 integerValue];

    uint64_t v15 = @"Unknown";
    if (v14 == 1) {
      uint64_t v15 = @"ProcessingChanged";
    }
    if (!v14) {
      uint64_t v15 = @"AudioFormatChanged";
    }
    int v16 = v15;
    __int16 v17 = MSVLogDateFormatter();
    __int16 v18 = [v5 date];
    int v40 = [v17 stringFromDate:v18];

    int v19 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    __int16 v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [*(id *)(a1 + 40) streamID];
      *(_DWORD *)buf = 138544642;
      int v42 = v40;
      __int16 v43 = 2114;
      int v44 = v21;
      __int16 v45 = 1024;
      int v46 = [v5 threadPriority];
      __int16 v47 = 2114;
      __int16 v48 = v19;
      __int16 v49 = 2114;
      __int16 v50 = v16;
      __int16 v51 = 2048;
      uint64_t v52 = v11;
      _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁹠 RELOAD CURRENT ITEM END    %{public}@ [%.3fs]", buf, 0x3Au);
    }
    if (v8)
    {
      int v37 = v16;
      int v38 = v9;
      id v39 = v6;
      __int16 v22 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
      uint64_t v23 = objc_msgSend(v8, "msv_description");
      __int16 v24 = [v23 componentsSeparatedByString:@"\n"];

      if ([v24 count])
      {
        for (unint64_t i = 0; i < [v24 count]; ++i)
        {
          objc_msgSend(v24, "objectAtIndexedSubscript:", i, v37, v38);
          uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (i)
          {
            uint64_t v27 = [v24 count] - 1;
            __int16 v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
            BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
            if (i == v27)
            {
              if (v29)
              {
                __int16 v30 = [*(id *)(a1 + 40) streamID];
                int v31 = [v5 threadPriority];
                *(_DWORD *)buf = 138544386;
                int v42 = v40;
                __int16 v43 = 2114;
                int v44 = v30;
                __int16 v45 = 1024;
                int v46 = v31;
                __int16 v47 = 2114;
                __int16 v48 = v22;
                __int16 v49 = 2114;
                __int16 v50 = v26;
                __int16 v32 = v28;
                uint64_t v33 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_19:
                _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);
              }
            }
            else if (v29)
            {
              __int16 v30 = [*(id *)(a1 + 40) streamID];
              int v35 = [v5 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v42 = v40;
              __int16 v43 = 2114;
              int v44 = v30;
              __int16 v45 = 1024;
              int v46 = v35;
              __int16 v47 = 2114;
              __int16 v48 = v22;
              __int16 v49 = 2114;
              __int16 v50 = v26;
              __int16 v32 = v28;
              uint64_t v33 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
              goto LABEL_19;
            }
          }
          else
          {
            __int16 v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              __int16 v30 = [*(id *)(a1 + 40) streamID];
              int v34 = [v5 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v42 = v40;
              __int16 v43 = 2114;
              int v44 = v30;
              __int16 v45 = 1024;
              int v46 = v34;
              __int16 v47 = 2114;
              __int16 v48 = v22;
              __int16 v49 = 2114;
              __int16 v50 = v26;
              __int16 v32 = v28;
              uint64_t v33 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
              goto LABEL_19;
            }
          }
        }
      }

      id v6 = v39;
      int v16 = v37;
      uint64_t v9 = v38;
    }
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_230(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"session-activation-id"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"session-activation-command-id"];

  int v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  uint64_t v10 = [v8 stringFromDate:v9];

  uint64_t v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [*(id *)(a1 + 40) streamID];
    int v19 = 138544386;
    __int16 v20 = v10;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    __int16 v23 = 1024;
    int v24 = [v3 threadPriority];
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    __int16 v27 = 2114;
    __int16 v28 = v5;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀷃 SESSION ACTIVATION BEGIN   %{public}@", (uint8_t *)&v19, 0x30u);
  }
  uint64_t v14 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 40) streamID];
    int v17 = [v3 threadPriority];
    int v19 = 138544386;
    __int16 v20 = v10;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    __int16 v23 = 1024;
    int v24 = v17;
    __int16 v25 = 2114;
    uint64_t v26 = v14;
    __int16 v27 = 2114;
    __int16 v28 = v7;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ commandID: %{public}@", (uint8_t *)&v19, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  v53[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 payload];
  int v8 = [v7 objectForKeyedSubscript:@"session-activation-error"];

  uint64_t v9 = [v5 payload];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"session-activation-id"];

  uint64_t v52 = @"session-activation-id";
  v53[0] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
  uint64_t v12 = [v6 findPreviousEventWithType:@"session-activation-begin" matchingPayload:v11];

  [v5 durationSinceEvent:v12];
  uint64_t v14 = v13;
  uint64_t v15 = MSVLogDateFormatter();
  int v16 = [v5 date];
  id v39 = [v15 stringFromDate:v16];

  uint64_t v38 = a1;
  int v17 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    int v41 = v39;
    __int16 v42 = 2114;
    __int16 v43 = v19;
    __int16 v44 = 1024;
    int v45 = [v5 threadPriority];
    __int16 v46 = 2114;
    __int16 v47 = v17;
    __int16 v48 = 2114;
    __int16 v49 = v10;
    __int16 v50 = 2048;
    uint64_t v51 = v14;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀷄 SESSION ACTIVATION END     %{public}@ [%.3fs]", buf, 0x3Au);
  }
  if (v8)
  {
    int v35 = v12;
    int v36 = v10;
    id v37 = v6;
    __int16 v20 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(v38 + 32));
    __int16 v21 = objc_msgSend(v8, "msv_description");
    __int16 v22 = [v21 componentsSeparatedByString:@"\n"];

    if ([v22 count])
    {
      for (unint64_t i = 0; i < [v22 count]; ++i)
      {
        int v24 = objc_msgSend(v22, "objectAtIndexedSubscript:", i, v35, v36);
        if (i)
        {
          uint64_t v25 = [v22 count] - 1;
          uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          if (i == v25)
          {
            if (v27)
            {
              __int16 v28 = [*(id *)(v38 + 40) streamID];
              int v29 = [v5 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v41 = v39;
              __int16 v42 = 2114;
              __int16 v43 = v28;
              __int16 v44 = 1024;
              int v45 = v29;
              __int16 v46 = 2114;
              __int16 v47 = v20;
              __int16 v48 = 2114;
              __int16 v49 = v24;
              __int16 v30 = v26;
              int v31 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);
            }
          }
          else if (v27)
          {
            __int16 v28 = [*(id *)(v38 + 40) streamID];
            int v33 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v41 = v39;
            __int16 v42 = 2114;
            __int16 v43 = v28;
            __int16 v44 = 1024;
            int v45 = v33;
            __int16 v46 = 2114;
            __int16 v47 = v20;
            __int16 v48 = 2114;
            __int16 v49 = v24;
            __int16 v30 = v26;
            int v31 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v26 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            __int16 v28 = [*(id *)(v38 + 40) streamID];
            int v32 = [v5 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v41 = v39;
            __int16 v42 = 2114;
            __int16 v43 = v28;
            __int16 v44 = 1024;
            int v45 = v32;
            __int16 v46 = 2114;
            __int16 v47 = v20;
            __int16 v48 = 2114;
            __int16 v49 = v24;
            __int16 v30 = v26;
            int v31 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }
      }
    }

    id v6 = v37;
    uint64_t v12 = v35;
    uint64_t v10 = v36;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_232(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"session-id"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"shared-session-id"];

  int v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"shared-session-type"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v3 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"shared-session-event-reason"];

  uint64_t v13 = [v3 payload];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"shared-session-is-reconnect"];
  LODWORD(v11) = [v14 BOOLValue];

  uint64_t v15 = *(__CFString **)(a1 + 32);
  int v40 = (int)v11;
  if (v15)
  {
    switch(v10)
    {
      case 0:
        int v16 = @"Unknown";
        id v39 = @"􀓔";
        goto LABEL_14;
      case 1:
        id v39 = @"􁐅";
        goto LABEL_12;
      case 2:
        id v39 = @"􁓵";
LABEL_13:
        int v16 = @"GroupSession";
        goto LABEL_14;
    }
    uint64_t v15 = @"􀿪";
  }
  id v39 = v15;
  if (v10)
  {
    if (v10 == 2) {
      goto LABEL_13;
    }
    if (v10 == 1)
    {
LABEL_12:
      int v16 = @"LiveLink";
      goto LABEL_14;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedSharedSessionType-%ld", v10);
    int v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v16 = @"Unknown";
  }
LABEL_14:
  int v17 = MSVLogDateFormatter();
  __int16 v18 = [v3 date];
  int v19 = [v17 stringFromDate:v18];

  __int16 v20 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v21 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544386;
    __int16 v42 = v19;
    __int16 v43 = 2114;
    __int16 v44 = v22;
    __int16 v45 = 1024;
    int v46 = [v3 threadPriority];
    __int16 v47 = 2114;
    __int16 v48 = v20;
    __int16 v49 = 2114;
    __int16 v50 = (__CFString *)v5;
    _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁃑 SHARED SESSION BEGIN       %{public}@", buf, 0x30u);
  }
  __int16 v23 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [*(id *)(a1 + 40) streamID];
    int v26 = [v3 threadPriority];
    *(_DWORD *)buf = 138544642;
    __int16 v42 = v19;
    __int16 v43 = 2114;
    __int16 v44 = v25;
    __int16 v45 = 1024;
    int v46 = v26;
    __int16 v47 = 2114;
    __int16 v48 = v23;
    __int16 v49 = 2114;
    __int16 v50 = v39;
    __int16 v51 = 2114;
    uint64_t v52 = v16;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ type: %{public}@  %{public}@", buf, 0x3Au);
  }
  BOOL v27 = v7;
  __int16 v28 = v5;
  if (v5 != v27)
  {
    char v29 = [v5 isEqual:v27];

    if (v29) {
      goto LABEL_23;
    }
    __int16 v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v30 = [*(id *)(a1 + 40) streamID];
      int v31 = [v3 threadPriority];
      *(_DWORD *)buf = 138544386;
      __int16 v42 = v19;
      __int16 v43 = 2114;
      __int16 v44 = v30;
      __int16 v45 = 1024;
      int v46 = v31;
      __int16 v47 = 2114;
      __int16 v48 = v23;
      __int16 v49 = 2114;
      __int16 v50 = v27;
      _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ sharedSessionID: %{public}@", buf, 0x30u);
    }
  }

LABEL_23:
  int v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = [*(id *)(a1 + 40) streamID];
    int v34 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    __int16 v42 = v19;
    __int16 v43 = 2114;
    __int16 v44 = v33;
    __int16 v45 = 1024;
    int v46 = v34;
    __int16 v47 = 2114;
    __int16 v48 = v23;
    __int16 v49 = 2114;
    __int16 v50 = v12;
    _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ reason: %{public}@", buf, 0x30u);
  }
  if (v40)
  {
    int v35 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = [*(id *)(a1 + 40) streamID];
      int v37 = [v3 threadPriority];
      *(_DWORD *)buf = 138544386;
      __int16 v42 = v19;
      __int16 v43 = 2114;
      __int16 v44 = v36;
      __int16 v45 = 1024;
      int v46 = v37;
      __int16 v47 = 2114;
      __int16 v48 = v23;
      __int16 v49 = 1024;
      LODWORD(v50) = 1;
      _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ isReconnect: %{BOOL}u", buf, 0x2Cu);
    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_233(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"session-id"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"shared-session-event-reason"];

  int v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  uint64_t v10 = [v8 stringFromDate:v9];

  uint64_t v11 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [*(id *)(a1 + 40) streamID];
    int v19 = 138544386;
    __int16 v20 = v10;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    __int16 v23 = 1024;
    int v24 = [v3 threadPriority];
    __int16 v25 = 2114;
    int v26 = v11;
    __int16 v27 = 2114;
    __int16 v28 = v5;
    _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􁃑 SHARED SESSION END         %{public}@", (uint8_t *)&v19, 0x30u);
  }
  uint64_t v14 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 40) streamID];
    int v17 = [v3 threadPriority];
    int v19 = 138544386;
    __int16 v20 = v10;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    __int16 v23 = 1024;
    int v24 = v17;
    __int16 v25 = 2114;
    int v26 = v14;
    __int16 v27 = 2114;
    __int16 v28 = v7;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ reason: %{public}@", (uint8_t *)&v19, 0x30u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_234(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"shared-session-id"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"shared-session-event-route-type"];

  int v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"participants"];

  uint64_t v10 = MSVLogDateFormatter();
  uint64_t v38 = v3;
  uint64_t v11 = [v3 date];
  int v37 = [v10 stringFromDate:v11];

  uint64_t v12 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544386;
    int v46 = v37;
    __int16 v47 = 2114;
    __int16 v48 = v14;
    __int16 v49 = 1024;
    int v50 = [v38 threadPriority];
    __int16 v51 = 2114;
    uint64_t v52 = v12;
    __int16 v53 = 2114;
    uint64_t v54 = v5;
    _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀠃 PARTICIPANTS CHANGED       %{public}@", buf, 0x30u);
  }
  int v35 = (void *)v5;

  int v36 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 40) streamID];
    int v17 = [v38 threadPriority];
    uint64_t v18 = [v9 count];
    *(_DWORD *)buf = 138544386;
    int v46 = v37;
    __int16 v47 = 2114;
    __int16 v48 = v16;
    __int16 v49 = 1024;
    int v50 = v17;
    __int16 v51 = 2114;
    uint64_t v52 = v36;
    __int16 v53 = 2048;
    uint64_t v54 = v18;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ participants.count: %ld", buf, 0x30u);
  }
  if (v7)
  {
    int v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = [*(id *)(a1 + 40) streamID];
      int v21 = [v38 threadPriority];
      [v7 intValue];
      __int16 v22 = MRGroupSessionRouteTypeDescription();
      *(_DWORD *)buf = 138544386;
      int v46 = v37;
      __int16 v47 = 2114;
      __int16 v48 = v20;
      __int16 v49 = 1024;
      int v50 = v21;
      __int16 v51 = 2114;
      uint64_t v52 = v36;
      __int16 v53 = 2114;
      uint64_t v54 = (uint64_t)v22;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ routeType: %{public}@", buf, 0x30u);
    }
  }
  int v34 = v7;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obunint64_t j = v9;
  uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        __int16 v28 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "streamID", v34, v35);
          __int16 v30 = v29 = a1;
          int v31 = [v38 threadPriority];
          int v32 = -[MPCSharedSessionParticipant humanDescription](v27);
          *(_DWORD *)buf = 138544386;
          int v46 = v37;
          __int16 v47 = 2114;
          __int16 v48 = v30;
          __int16 v49 = 1024;
          int v50 = v31;
          __int16 v51 = 2114;
          uint64_t v52 = v36;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v32;
          _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │ participant: [ %{public}@ ]", buf, 0x30u);

          a1 = v29;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v24);
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_235(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"shared-session-id"];

  id v6 = MSVLogDateFormatter();
  uint64_t v7 = [v3 date];
  int v8 = [v6 stringFromDate:v7];

  uint64_t v9 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) streamID];
    int v20 = 138544386;
    int v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    __int16 v24 = 1024;
    int v25 = [v3 threadPriority];
    __int16 v26 = 2114;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    uint64_t v29 = v5;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀖊 SHARED SESSION SYNC BEGIN  %{public}@", (uint8_t *)&v20, 0x30u);
  }
  uint64_t v12 = [v3 payload];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"originating-participant"];

  if (v13)
  {
    uint64_t v14 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [*(id *)(a1 + 40) streamID];
      int v17 = [v3 threadPriority];
      uint64_t v18 = -[MPCSharedSessionParticipant humanDescription]((uint64_t)v13);
      int v20 = 138544386;
      int v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      __int16 v28 = 2114;
      uint64_t v29 = v18;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ participant: [ %{public}@ ]", (uint8_t *)&v20, 0x30u);
    }
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_236(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  -[MPCPlaybackEngineLoggingConsumer _updateChartWithEvent:](*(void *)(a1 + 32), v3);
  int v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"shared-session-id"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"shared-sync-error"];

  int v8 = MSVLogDateFormatter();
  uint64_t v9 = [v3 date];
  uint64_t v30 = [v8 stringFromDate:v9];

  uint64_t v10 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544386;
    int v32 = v30;
    __int16 v33 = 2114;
    int v34 = v12;
    __int16 v35 = 1024;
    int v36 = [v3 threadPriority];
    __int16 v37 = 2114;
    uint64_t v38 = v10;
    __int16 v39 = 2114;
    long long v40 = v5;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀖋 SHARED SESSION SYNC END    %{public}@", buf, 0x30u);
  }
  if (v7)
  {
    uint64_t v29 = v5;
    uint64_t v13 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
    __int16 v28 = v7;
    uint64_t v14 = objc_msgSend(v7, "msv_description");
    uint64_t v15 = [v14 componentsSeparatedByString:@"\n"];

    if ([v15 count])
    {
      for (unint64_t i = 0; i < [v15 count]; ++i)
      {
        int v17 = [v15 objectAtIndexedSubscript:i];
        if (i)
        {
          uint64_t v18 = [v15 count] - 1;
          int v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
          if (i == v18)
          {
            if (v20)
            {
              int v21 = [*(id *)(a1 + 40) streamID];
              int v22 = [v3 threadPriority];
              *(_DWORD *)buf = 138544386;
              int v32 = v30;
              __int16 v33 = 2114;
              int v34 = v21;
              __int16 v35 = 1024;
              int v36 = v22;
              __int16 v37 = 2114;
              uint64_t v38 = v13;
              __int16 v39 = 2114;
              long long v40 = v17;
              uint64_t v23 = v19;
              __int16 v24 = "|%{public}@ %{public}@ %2i %{public}@  ╰           %{public}@";
LABEL_14:
              _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x30u);
            }
          }
          else if (v20)
          {
            int v21 = [*(id *)(a1 + 40) streamID];
            int v26 = [v3 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v32 = v30;
            __int16 v33 = 2114;
            int v34 = v21;
            __int16 v35 = 1024;
            int v36 = v26;
            __int16 v37 = 2114;
            uint64_t v38 = v13;
            __int16 v39 = 2114;
            long long v40 = v17;
            uint64_t v23 = v19;
            __int16 v24 = "|%{public}@ %{public}@ %2i %{public}@  │           %{public}@";
            goto LABEL_14;
          }
        }
        else
        {
          int v19 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents_Oversize");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            int v21 = [*(id *)(a1 + 40) streamID];
            int v25 = [v3 threadPriority];
            *(_DWORD *)buf = 138544386;
            int v32 = v30;
            __int16 v33 = 2114;
            int v34 = v21;
            __int16 v35 = 1024;
            int v36 = v25;
            __int16 v37 = 2114;
            uint64_t v38 = v13;
            __int16 v39 = 2114;
            long long v40 = v17;
            uint64_t v23 = v19;
            __int16 v24 = "|%{public}@ %{public}@ %2i %{public}@ ╲╭ error: ❌ %{public}@";
            goto LABEL_14;
          }
        }
      }
    }

    uint64_t v7 = v28;
    uint64_t v5 = v29;
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_237(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  id v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  int v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"item-start-position"];
  [v9 doubleValue];
  uint64_t v11 = v10;

  uint64_t v12 = [v3 payload];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"supports-vocal-attenuation"];
  int v42 = [v13 BOOLValue];

  uint64_t v14 = [v3 payload];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"vocal-attenuation-available"];
  int v41 = [v15 BOOLValue];

  int v16 = [v3 payload];
  int v17 = [v16 objectForKeyedSubscript:@"vocal-attenuation-enabled"];
  int v18 = [v17 BOOLValue];

  int v19 = [v3 payload];
  BOOL v20 = [v19 objectForKeyedSubscript:@"vocal-attenuation-configured"];
  int v21 = [v20 BOOLValue];

  int v22 = [v3 payload];
  uint64_t v23 = [v22 objectForKeyedSubscript:@"vocal-attenuation-processing-delay"];
  [v23 doubleValue];
  uint64_t v25 = v24;

  int v26 = MSVLogDateFormatter();
  uint64_t v27 = [v3 date];
  __int16 v28 = [v26 stringFromDate:v27];

  uint64_t v29 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    __int16 v44 = v28;
    __int16 v45 = 2114;
    int v46 = v31;
    __int16 v47 = 1024;
    int v48 = [v3 threadPriority];
    __int16 v49 = 2114;
    int v50 = v29;
    __int16 v51 = 2114;
    *(void *)uint64_t v52 = v5;
    *(_WORD *)&v52[8] = 2114;
    __int16 v53 = v7;
    _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@𝄢 ITEM VOCAL CHANGED         %{public}@ %{public}@ ", buf, 0x3Au);
  }
  int v32 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v33 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = [*(id *)(a1 + 40) streamID];
    int v35 = [v3 threadPriority];
    *(_DWORD *)buf = 138544386;
    __int16 v44 = v28;
    __int16 v45 = 2114;
    int v46 = v34;
    __int16 v47 = 1024;
    int v48 = v35;
    __int16 v49 = 2114;
    int v50 = v32;
    __int16 v51 = 2048;
    *(void *)uint64_t v52 = v11;
    _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ start: %0.2f", buf, 0x30u);
  }
  int v36 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  __int16 v37 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = [*(id *)(a1 + 40) streamID];
    int v39 = [v3 threadPriority];
    *(_DWORD *)buf = 138545410;
    __int16 v44 = v28;
    __int16 v45 = 2114;
    int v46 = v38;
    __int16 v47 = 1024;
    int v48 = v39;
    __int16 v49 = 2114;
    int v50 = v36;
    __int16 v51 = 1024;
    *(_DWORD *)uint64_t v52 = v42;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v21;
    LOWORD(v53) = 1024;
    *(_DWORD *)((char *)&v53 + 2) = v41;
    HIWORD(v53) = 1024;
    int v54 = v18;
    __int16 v55 = 2048;
    uint64_t v56 = v25;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ vocal control supported:%{BOOL}u configured:%{BOOL}u available:%{BOOL}u enabled:%{BOOL}u delay:%.0fms", buf, 0x48u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_238(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"vocal-attenuation-statistics-mean"];
  [v5 floatValue];
  float v7 = v6;

  int v8 = [v3 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"vocal-attenuation-statistics-max"];
  [v9 floatValue];
  float v11 = v10;

  uint64_t v12 = [v3 payload];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"vocal-attenuation-statistics-stdev"];
  [v13 floatValue];
  float v15 = v14;

  int v16 = [v3 payload];
  int v17 = [v16 objectForKeyedSubscript:@"vocal-attenuation-statistics-glitches"];
  *(double *)&uint64_t v18 = COERCE_DOUBLE([v17 integerValue]);

  int v19 = [v3 payload];
  BOOL v20 = [v19 objectForKeyedSubscript:@"vocal-attenuation-statistics-samples"];
  *(double *)&uint64_t v21 = COERCE_DOUBLE([v20 integerValue]);

  int v22 = [v3 payload];
  uint64_t v23 = [v22 objectForKeyedSubscript:@"vocal-attenuation-statistics-thermal"];
  *(double *)&uint64_t v24 = COERCE_DOUBLE([v23 integerValue]);

  uint64_t v25 = MSVLogDateFormatter();
  int v26 = [v3 date];
  uint64_t v27 = [v25 stringFromDate:v26];

  __int16 v28 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  uint64_t v29 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [*(id *)(a1 + 40) streamID];
    int v40 = 138544130;
    int v41 = v27;
    __int16 v42 = 2114;
    long long v43 = v30;
    __int16 v44 = 1024;
    int v45 = [v3 threadPriority];
    __int16 v46 = 2114;
    __int16 v47 = v28;
    _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀣉 VOCAL STATS", (uint8_t *)&v40, 0x26u);
  }
  int v31 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v32 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v33 = [*(id *)(a1 + 40) streamID];
    int v34 = [v3 threadPriority];
    int v40 = 138544898;
    int v41 = v27;
    __int16 v42 = 2114;
    long long v43 = v33;
    __int16 v44 = 1024;
    int v45 = v34;
    __int16 v46 = 2114;
    __int16 v47 = v31;
    __int16 v48 = 2048;
    double v49 = *(double *)&v21;
    __int16 v50 = 2048;
    double v51 = *(double *)&v18;
    __int16 v52 = 2048;
    double v53 = *(double *)&v24;
    _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ samples: %ld; glitches: %ld; thermalLevel: %ld",
      (uint8_t *)&v40,
      0x44u);
  }
  int v35 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v36 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v37 = [*(id *)(a1 + 40) streamID];
    int v38 = [v3 threadPriority];
    int v40 = 138544898;
    int v41 = v27;
    __int16 v42 = 2114;
    long long v43 = v37;
    __int16 v44 = 1024;
    int v45 = v38;
    __int16 v46 = 2114;
    __int16 v47 = v35;
    __int16 v48 = 2048;
    double v49 = v7;
    __int16 v50 = 2048;
    double v51 = v11;
    __int16 v52 = 2048;
    double v53 = v15;
    _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ mean: %0.1fms; max: %0.1fms; std: %0.1fms",
      (uint8_t *)&v40,
      0x44u);
  }
  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_239(uint64_t a1, void *a2)
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 payload];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"perf-metrics"];

  float v6 = [v3 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"queue-section-id"];
  int v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_26CBCA930;
  }
  uint64_t v71 = v9;

  float v10 = [v3 payload];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_26CBCA930;
  }
  uint64_t v70 = v13;

  float v14 = MSVLogDateFormatter();
  __int16 v85 = v3;
  float v15 = [v3 date];
  __int16 v84 = [v14 stringFromDate:v15];

  int v16 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  int v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [*(id *)(a1 + 40) streamID];
    *(_DWORD *)buf = 138544642;
    uint64_t v103 = v84;
    __int16 v104 = 2114;
    BOOL v105 = v18;
    __int16 v106 = 1024;
    int v107 = [v85 threadPriority];
    __int16 v108 = 2114;
    long long v109 = v16;
    __int16 v110 = 2114;
    double v111 = *(double *)&v71;
    __int16 v112 = 2114;
    long long v113 = v70;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@􀍾 PERFORMANCE REPORT         %{public}@ %{public}@", buf, 0x3Au);
  }
  uint64_t v83 = -[MPCPlaybackEngineLoggingConsumer _chartWithLevel:type:](*(void **)(a1 + 32));
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  __int16 v69 = v5;
  obuint64_t j = [v5 objectForKeyedSubscript:@"metrics"];
  uint64_t v74 = [obj countByEnumeratingWithState:&v97 objects:v117 count:16];
  if (v74)
  {
    int v19 = "com.apple.amp.mediaplaybackcore";
    BOOL v20 = "PlaybackEvents";
    uint64_t v73 = *(void *)v98;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v98 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v21;
        int v22 = *(void **)(*((void *)&v97 + 1) + 8 * v21);
        uint64_t v23 = os_log_create(v19, v20);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [*(id *)(a1 + 40) streamID];
          int v86 = [v85 threadPriority];
          uint64_t v25 = [v22 objectForKeyedSubscript:@"name"];
          int v26 = [v22 objectForKeyedSubscript:@"tags"];
          uint64_t v27 = [v26 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138544642;
          uint64_t v103 = v84;
          __int16 v104 = 2114;
          BOOL v105 = v24;
          __int16 v106 = 1024;
          int v107 = v86;
          __int16 v108 = 2114;
          long long v109 = v83;
          __int16 v110 = 2114;
          double v111 = *(double *)&v25;
          __int16 v112 = 2112;
          long long v113 = v27;
          _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@ ╲╭ metric: %{public}@ (%@)", buf, 0x3Au);
        }
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v76 = [v22 objectForKeyedSubscript:@"segments"];
        uint64_t v78 = [v76 countByEnumeratingWithState:&v93 objects:v116 count:16];
        if (v78)
        {
          uint64_t v77 = *(void *)v94;
          double v28 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v78; ++i)
            {
              if (*(void *)v94 != v77) {
                objc_enumerationMutation(v76);
              }
              uint64_t v30 = *(void **)(*((void *)&v93 + 1) + 8 * i);
              int v31 = [v30 objectForKeyedSubscript:@"duration"];
              [v31 doubleValue];
              double v33 = v32;

              int v34 = os_log_create(v19, v20);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                int v35 = [*(id *)(a1 + 40) streamID];
                int v87 = [v85 threadPriority];
                int v36 = [v30 objectForKeyedSubscript:@"component"];
                __int16 v37 = [v30 objectForKeyedSubscript:@"subcomponent"];
                *(_DWORD *)buf = 138544898;
                uint64_t v103 = v84;
                __int16 v104 = 2114;
                BOOL v105 = v35;
                __int16 v106 = 1024;
                int v107 = v87;
                __int16 v108 = 2114;
                long long v109 = v83;
                __int16 v110 = 2114;
                double v111 = *(double *)&v36;
                __int16 v112 = 2114;
                long long v113 = v37;
                __int16 v114 = 2048;
                double v115 = v33;
                _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ├╴ %{public}@: %{public}-25@ [%0.3f]", buf, 0x44u);
              }
              int v38 = [v30 objectForKeyedSubscript:@"complexities"];
              int v39 = [v30 objectForKeyedSubscript:@"optimizations"];
              int v40 = [v30 objectForKeyedSubscript:@"steps"];
              if ([v38 count] || objc_msgSend(v39, "count") || objc_msgSend(v40, "count"))
              {
                __int16 v80 = v39;
                uint64_t v82 = i;
                int v41 = os_log_create(v19, v20);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  [*(id *)(a1 + 40) streamID];
                  v43 = __int16 v42 = v40;
                  int v44 = [v85 threadPriority];
                  int v45 = objc_msgSend(v38, "msv_compactDescription");
                  *(_DWORD *)buf = 138544386;
                  uint64_t v103 = v84;
                  __int16 v104 = 2114;
                  BOOL v105 = v43;
                  __int16 v106 = 1024;
                  int v107 = v44;
                  __int16 v108 = 2114;
                  long long v109 = v83;
                  __int16 v110 = 2114;
                  double v111 = *(double *)&v45;
                  _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │  ╲╭ complexities: [%{public}@]", buf, 0x30u);

                  int v40 = v42;
                }
                int v81 = v38;

                long long v91 = 0u;
                long long v92 = 0u;
                long long v89 = 0u;
                long long v90 = 0u;
                int v79 = v40;
                id v88 = v40;
                uint64_t v46 = [v88 countByEnumeratingWithState:&v89 objects:v101 count:16];
                if (v46)
                {
                  uint64_t v47 = v46;
                  uint64_t v48 = *(void *)v90;
                  do
                  {
                    for (uint64_t j = 0; j != v47; ++j)
                    {
                      if (*(void *)v90 != v48) {
                        objc_enumerationMutation(v88);
                      }
                      __int16 v50 = *(void **)(*((void *)&v89 + 1) + 8 * j);
                      double v51 = [v50 objectForKeyedSubscript:@"duration"];
                      [v51 doubleValue];
                      double v53 = v52;

                      uint64_t v54 = os_log_create(v19, v20);
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                      {
                        __int16 v55 = [*(id *)(a1 + 40) streamID];
                        uint64_t v56 = v20;
                        uint64_t v57 = v19;
                        uint64_t v58 = a1;
                        int v59 = [v85 threadPriority];
                        int v60 = [v50 objectForKeyedSubscript:@"name"];
                        *(_DWORD *)buf = 138544642;
                        uint64_t v103 = v84;
                        __int16 v104 = 2114;
                        BOOL v105 = v55;
                        __int16 v106 = 1024;
                        int v107 = v59;
                        a1 = v58;
                        int v19 = v57;
                        BOOL v20 = v56;
                        __int16 v108 = 2114;
                        long long v109 = v83;
                        __int16 v110 = 2114;
                        double v111 = *(double *)&v60;
                        __int16 v112 = 2048;
                        long long v113 = v53;
                        _os_log_impl(&dword_21BB87000, v54, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │   │ step: %{public}-28@ [%0.3f]", buf, 0x3Au);
                      }
                    }
                    uint64_t v47 = [v88 countByEnumeratingWithState:&v89 objects:v101 count:16];
                  }
                  while (v47);
                }

                __int16 v61 = os_log_create(v19, v20);
                int v39 = v80;
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  int v62 = [*(id *)(a1 + 40) streamID];
                  int v63 = [v85 threadPriority];
                  uint64_t v64 = objc_msgSend(v80, "msv_compactDescription");
                  *(_DWORD *)buf = 138544386;
                  uint64_t v103 = v84;
                  __int16 v104 = 2114;
                  BOOL v105 = v62;
                  __int16 v106 = 1024;
                  int v107 = v63;
                  __int16 v108 = 2114;
                  long long v109 = v83;
                  __int16 v110 = 2114;
                  double v111 = *(double *)&v64;
                  _os_log_impl(&dword_21BB87000, v61, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  │   ╰ optimizations: %{public}@", buf, 0x30u);
                }
                int v38 = v81;
                uint64_t i = v82;
                int v40 = v79;
              }
              double v28 = v28 + v33;
            }
            uint64_t v78 = [v76 countByEnumeratingWithState:&v93 objects:v116 count:16];
          }
          while (v78);
        }
        else
        {
          double v28 = 0.0;
        }

        __int16 v65 = os_log_create(v19, v20);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v66 = [*(id *)(a1 + 40) streamID];
          int v67 = [v85 threadPriority];
          *(_DWORD *)buf = 138544386;
          uint64_t v103 = v84;
          __int16 v104 = 2114;
          BOOL v105 = v66;
          __int16 v106 = 1024;
          int v107 = v67;
          __int16 v108 = 2114;
          long long v109 = v83;
          __int16 v110 = 2048;
          double v111 = v28;
          _os_log_impl(&dword_21BB87000, v65, OS_LOG_TYPE_DEFAULT, "|%{public}@ %{public}@ %2i %{public}@  ╰ totalTime: %0.3f", buf, 0x30u);
        }
        uint64_t v21 = v75 + 1;
      }
      while (v75 + 1 != v74);
      uint64_t v74 = [obj countByEnumeratingWithState:&v97 objects:v117 count:16];
    }
    while (v74);
  }

  return 1;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_202(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) indexOfObject:v5];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];
  if (v7 >= v8)
  {
    if (v7 > v8) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [v5 compare:v6];
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_203(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) indexOfObject:v5];
  unint64_t v8 = [*(id *)(a1 + 32) indexOfObject:v6];
  if (v7 >= v8)
  {
    if (v7 > v8) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [v5 compare:v6];
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_204(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x263EFFA68];
  unint64_t v7 = [MEMORY[0x263EFFA68] indexOfObject:v4];
  unint64_t v8 = [v6 indexOfObject:v5];
  if (v7 >= v8)
  {
    if (v7 > v8) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [v4 compare:v5];
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_129(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_124(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __59__MPCPlaybackEngineLoggingConsumer_subscribeToEventStream___block_invoke_110(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v6 = [v10 type];
  if (([v6 isEqualToString:@"item-end"] & 1) == 0)
  {

    goto LABEL_5;
  }
  unint64_t v7 = [v10 payload];
  unint64_t v8 = [v7 objectForKeyedSubscript:@"item-did-play-to-end"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
LABEL_5:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (__CFString)_symbolForCommand:(__CFString *)result
{
  if (result)
  {
    result = @"▶️";
    switch(a2)
    {
      case 0:
        return result;
      case 1:
        result = @"⏸";
        break;
      case 2:
        result = @"⏯";
        break;
      case 3:
        result = @"⏹";
        break;
      case 4:
        result = @"⏭";
        break;
      case 5:
        result = @"⏮";
        break;
      case 6:
      case 26:
LABEL_6:
        result = @"🔀";
        break;
      case 7:
      case 25:
        result = @"🔁";
        break;
      case 8:
      case 9:
        result = @"⏩";
        break;
      case 10:
      case 11:
        result = @"⏪";
        break;
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 23:
      case 24:
LABEL_17:
        result = @"✴️";
        break;
      case 21:
        result = @"👍🏻";
        break;
      case 22:
        result = @"👎🏻";
        break;
      default:
        switch(a2)
        {
          case 122:
            result = @"🔤";
            break;
          case 125:
            result = @"🆕";
            break;
          case 129:
            result = @"🚮";
            break;
          case 130:
            result = @"#️⃣";
            break;
          case 131:
            result = @"🈁";
            break;
          case 132:
            result = @"🆙";
            break;
          case 133:
            result = @"🔠";
            break;
          case 134:
            goto LABEL_6;
          case 135:
            result = @"🔃";
            break;
          case 139:
            result = @"⏏️";
            break;
          case 140:
            result = @"ℹ️";
            break;
          case 142:
          case 143:
            result = @"🎤";
            break;
          case 144:
            result = @"🧽";
            break;
          default:
            goto LABEL_17;
        }
        break;
    }
  }
  return result;
}

@end