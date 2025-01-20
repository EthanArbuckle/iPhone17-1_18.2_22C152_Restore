@interface MPCMusicPlaybackIntentDataSource
- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4;
- (void)getArchiveFromIntent:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5;
- (void)getRepresentativeObjectFromIntent:(id)a3 properties:(id)a4 completion:(id)a5;
@end

@implementation MPCMusicPlaybackIntentDataSource

- (void)getRepresentativeObjectFromIntent:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke;
  v13[3] = &unk_2643C3D10;
  id v16 = v10;
  SEL v17 = a2;
  id v14 = v9;
  v15 = self;
  id v11 = v9;
  id v12 = v10;
  [(MPCMusicPlaybackIntentDataSource *)self _getPlaybackContextForIntent:a3 withCompletion:v13];
}

void __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if ([v5 shuffleType] == 1000)
    {
      v7 = [MEMORY[0x263F12178] standardUserDefaults];
      objc_msgSend(v6, "setShuffleType:", objc_msgSend(v7, "musicShuffleType"));
    }
    id v8 = objc_alloc_init((Class)[v6 queueFeederClass]);
    uint64_t v9 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2;
    v14[3] = &unk_2643C3CE8;
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v17 = v10;
    uint64_t v18 = v11;
    id v12 = *(void **)(a1 + 32);
    v14[4] = *(void *)(a1 + 40);
    id v15 = v8;
    id v16 = v12;
    id v13 = v8;
    [v13 getRepresentativeMetadataForPlaybackContext:v6 properties:v9 completion:v14];
  }
}

void __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2(void *a1, void *a2, void *a3, void *a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (!v7)
    {
      id v17 = [MEMORY[0x263F08690] currentHandler];
      [v17 handleFailureInMethod:a1[8], a1[4], @"MPCMusicPlaybackIntentDataSource.m", 254, @"%@ did not produce representative model object or error", a1[5] object file lineNumber description];
    }
    id v10 = [v7 flattenedGenericObject];
    uint64_t v11 = (void *)[v10 copyWithPropertySet:a1[6]];

    uint64_t v12 = [v11 type];
    uint64_t v13 = a1[7];
    if (v12)
    {
      (*(void (**)(uint64_t, void *, id, void))(v13 + 16))(v13, v11, v8, 0);
    }
    else
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = @"modelObject";
      v19[0] = v7;
      id v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v16 = objc_msgSend(v14, "msv_errorWithDomain:code:userInfo:debugDescription:", @"MPCError", 1, v15, @"No matching properties for reprentative object: %@", v11);
      (*(void (**)(uint64_t, void, id, void *))(v13 + 16))(v13, 0, v8, v16);
    }
  }
}

- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 actionAfterQueueLoad];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke;
  v13[3] = &unk_2643C3CC0;
  id v15 = v9;
  int64_t v16 = a4;
  id v14 = v8;
  BOOL v17 = v10 == 20;
  id v11 = v9;
  id v12 = v8;
  [(MPCMusicPlaybackIntentDataSource *)self _getPlaybackContextForIntent:v12 withCompletion:v13];
}

void __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) privateListeningOverride];
  [v3 setPrivateListeningOverride:v4];

  switch(*(void *)(a1 + 48))
  {
    case 0:
      uint64_t v5 = *(void *)(a1 + 40);
      v6 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 1, @"Cannot get remote playback queue: Destination is unknown");
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
      goto LABEL_6;
    case 1:
      v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
      [v6 setObject:v3 forKeyedSubscript:@"playbackContext"];
      id v7 = [v3 siriReferenceIdentifier];
      [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F54CA0]];

      id v8 = [v3 privateListeningOverride];
      [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F54D40]];

      id v9 = objc_alloc(MEMORY[0x263F11D80]);
      uint64_t v10 = [MEMORY[0x263EFF8F8] data];
      id v11 = (void *)[v9 initWithIdentifier:@"InProcess-com.apple.mediaplayer.playbackcontext" data:v10 options:v6];

      uint64_t v12 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v13 = v11;
      goto LABEL_5;
    case 2:
      v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F11D80]) initWithIdentifier:@"com.apple.mediaplayer.playbackcontext" data:v6];
      id v11 = v13;
      uint64_t v12 = *(unsigned __int8 *)(a1 + 56);
LABEL_5:
      [v13 setRequestingImmediatePlayback:v12];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_6:
      break;
    case 3:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke_2;
      v14[3] = &unk_2643C3C98;
      char v16 = *(unsigned char *)(a1 + 56);
      id v15 = *(id *)(a1 + 40);
      [v3 getRemotePlaybackQueueRepresentationWithCompletion:v14];

      break;
    default:
      break;
  }
}

void __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  [v7 setRequestingImmediatePlayback:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getArchiveFromIntent:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v8;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | intent=%{public}@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke;
  v15[3] = &unk_2643C3C70;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [(MPCMusicPlaybackIntentDataSource *)self _getPlaybackContextForIntent:v14 withCompletion:v15];
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v187 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | returning nil [getPlaybackContext failed] error=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) privateListeningOverride];
    [v5 setPrivateListeningOverride:v9];

    id v10 = (objc_class *)[v5 queueFeederClass];
    if (v10 == (objc_class *)objc_opt_class()) {
      id v10 = (objc_class *)objc_opt_class();
    }
    id v122 = objc_alloc_init(v10);
    [v5 setShuffleType:0];
    id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | validating context [] playbackContext=%{public}@", buf, 0x16u);
    }
    v123 = v5;

    id v13 = *(void **)(a1 + 32);
    uint64_t v121 = a1;
    if (v13)
    {
      id v119 = objc_alloc(MEMORY[0x263F12180]);
      v169[0] = *MEMORY[0x263F11A18];
      id v14 = objc_alloc(MEMORY[0x263F12180]);
      uint64_t v15 = *MEMORY[0x263F117F8];
      v168[0] = *MEMORY[0x263F11880];
      v168[1] = v15;
      v116 = [MEMORY[0x263EFF8C0] arrayWithObjects:v168 count:2];
      uint64_t v166 = *MEMORY[0x263F11AA0];
      id v16 = (void *)MEMORY[0x263F12180];
      uint64_t v165 = *MEMORY[0x263F114F0];
      uint64_t v17 = v165;
      v118 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v165 count:1];
      v117 = [v16 propertySetWithProperties:v118];
      v167 = v117;
      v115 = [NSDictionary dictionaryWithObjects:&v167 forKeys:&v166 count:1];
      v114 = (void *)[v14 initWithProperties:v116 relationships:v115];
      *(void *)buf = v114;
      v169[1] = *MEMORY[0x263F11998];
      id v18 = objc_alloc(MEMORY[0x263F12180]);
      uint64_t v19 = *MEMORY[0x263F114A0];
      v164[0] = *MEMORY[0x263F114C0];
      v164[1] = v19;
      v111 = [MEMORY[0x263EFF8C0] arrayWithObjects:v164 count:2];
      uint64_t v162 = *MEMORY[0x263F11990];
      id v20 = (void *)MEMORY[0x263F12180];
      uint64_t v161 = v17;
      v113 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v161 count:1];
      v112 = [v20 propertySetWithProperties:v113];
      v163 = v112;
      v110 = [NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];
      v109 = (void *)[v18 initWithProperties:v111 relationships:v110];
      *(void *)&buf[8] = v109;
      v169[2] = *MEMORY[0x263F119A0];
      __int16 v21 = (void *)MEMORY[0x263F12180];
      uint64_t v22 = *MEMORY[0x263F114E8];
      v160[0] = v17;
      v160[1] = v22;
      v108 = [MEMORY[0x263EFF8C0] arrayWithObjects:v160 count:2];
      v107 = [v21 propertySetWithProperties:v108];
      *(void *)&buf[16] = v107;
      v169[3] = *MEMORY[0x263F119D8];
      uint64_t v23 = (void *)MEMORY[0x263F12180];
      uint64_t v24 = *MEMORY[0x263F11638];
      v159[0] = *MEMORY[0x263F11670];
      v159[1] = v24;
      v159[2] = *MEMORY[0x263F11678];
      v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:3];
      v105 = [v23 propertySetWithProperties:v106];
      v171 = v105;
      v169[4] = *MEMORY[0x263F11A20];
      id v25 = objc_alloc(MEMORY[0x263F12180]);
      uint64_t v26 = *MEMORY[0x263F11900];
      v158[0] = *MEMORY[0x263F11958];
      v158[1] = v26;
      v102 = [MEMORY[0x263EFF8C0] arrayWithObjects:v158 count:2];
      uint64_t v156 = *MEMORY[0x263F11AF8];
      v27 = (void *)MEMORY[0x263F12180];
      uint64_t v155 = *MEMORY[0x263F11988];
      uint64_t v28 = v155;
      v104 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v155 count:1];
      v103 = [v27 propertySetWithProperties:v104];
      v157 = v103;
      v101 = [NSDictionary dictionaryWithObjects:&v157 forKeys:&v156 count:1];
      v100 = (void *)[v25 initWithProperties:v102 relationships:v101];
      v172 = v100;
      v169[5] = *MEMORY[0x263F11A28];
      id v29 = objc_alloc(MEMORY[0x263F12180]);
      uint64_t v30 = *MEMORY[0x263F11960];
      v154[0] = *MEMORY[0x263F11970];
      v154[1] = v30;
      v97 = [MEMORY[0x263EFF8C0] arrayWithObjects:v154 count:2];
      uint64_t v152 = *MEMORY[0x263F11B08];
      v31 = (void *)MEMORY[0x263F12180];
      uint64_t v151 = v28;
      v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v151 count:1];
      v98 = [v31 propertySetWithProperties:v99];
      v153 = v98;
      v96 = [NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
      v95 = (void *)[v29 initWithProperties:v97 relationships:v96];
      v173 = v95;
      v169[6] = *MEMORY[0x263F11A30];
      v32 = (void *)MEMORY[0x263F12180];
      uint64_t v33 = *MEMORY[0x263F11978];
      v150[0] = v28;
      v150[1] = v33;
      v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:v150 count:2];
      v93 = [v32 propertySetWithProperties:v94];
      v174 = v93;
      v169[7] = *MEMORY[0x263F119D0];
      v34 = (void *)MEMORY[0x263F12180];
      uint64_t v35 = *MEMORY[0x263F115B0];
      v149[0] = *MEMORY[0x263F115F0];
      v149[1] = v35;
      v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:2];
      v91 = [v34 propertySetWithProperties:v92];
      v175 = v91;
      v169[8] = *MEMORY[0x263F119C8];
      v36 = (void *)MEMORY[0x263F12180];
      uint64_t v37 = *MEMORY[0x263F115A0];
      v148[0] = *MEMORY[0x263F115A8];
      v148[1] = v37;
      v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:v148 count:2];
      v89 = [v36 propertySetWithProperties:v90];
      v176 = v89;
      v169[9] = *MEMORY[0x263F119E8];
      id v38 = objc_alloc(MEMORY[0x263F12180]);
      uint64_t v40 = *MEMORY[0x263F11698];
      v147[0] = *MEMORY[0x263F11708];
      uint64_t v39 = v147[0];
      v147[1] = v40;
      v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v147 count:2];
      uint64_t v145 = *MEMORY[0x263F11A80];
      v41 = (void *)MEMORY[0x263F12180];
      uint64_t v144 = *MEMORY[0x263F116A0];
      v88 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v144 count:1];
      v87 = [v41 propertySetWithProperties:v88];
      v146 = v87;
      v85 = [NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      v84 = (void *)[v38 initWithProperties:v86 relationships:v85];
      v177 = v84;
      v169[10] = *MEMORY[0x263F119F0];
      id v42 = objc_alloc(MEMORY[0x263F12180]);
      uint64_t v43 = *MEMORY[0x263F116A8];
      v143[0] = *MEMORY[0x263F116D8];
      v143[1] = v43;
      v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v143 count:2];
      uint64_t v141 = *MEMORY[0x263F11A90];
      v44 = (void *)MEMORY[0x263F12180];
      uint64_t v140 = v39;
      v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v140 count:1];
      v82 = [v44 propertySetWithProperties:v83];
      v142 = v82;
      v80 = [NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];
      v79 = (void *)[v42 initWithProperties:v81 relationships:v80];
      v178 = v79;
      v169[11] = *MEMORY[0x263F119F8];
      v45 = (void *)MEMORY[0x263F12180];
      uint64_t v46 = *MEMORY[0x263F11718];
      v139[0] = *MEMORY[0x263F11770];
      v139[1] = v46;
      v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:2];
      v77 = [v45 propertySetWithProperties:v78];
      v179 = v77;
      v169[12] = *MEMORY[0x263F11A00];
      v47 = (void *)MEMORY[0x263F12180];
      uint64_t v48 = *MEMORY[0x263F11738];
      v138[0] = *MEMORY[0x263F11760];
      v138[1] = v48;
      v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
      v75 = [v47 propertySetWithProperties:v76];
      v180 = v75;
      v169[13] = *MEMORY[0x263F119A8];
      v49 = (void *)MEMORY[0x263F12180];
      uint64_t v137 = *MEMORY[0x263F114F8];
      v74 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
      v73 = [v49 propertySetWithProperties:v74];
      v181 = v73;
      v169[14] = *MEMORY[0x263F119B8];
      v50 = (void *)MEMORY[0x263F12180];
      uint64_t v51 = *MEMORY[0x263F11558];
      v136[0] = *MEMORY[0x263F11560];
      v136[1] = v51;
      v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v136 count:2];
      v52 = [v50 propertySetWithProperties:v72];
      v182 = v52;
      v169[15] = *MEMORY[0x263F119B0];
      v53 = (void *)MEMORY[0x263F12180];
      uint64_t v54 = *MEMORY[0x263F11500];
      v135[0] = *MEMORY[0x263F11508];
      v135[1] = v54;
      v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:2];
      v56 = [v53 propertySetWithProperties:v55];
      v183 = v56;
      v169[16] = *MEMORY[0x263F11A10];
      v57 = (void *)MEMORY[0x263F12180];
      uint64_t v58 = *MEMORY[0x263F117B8];
      v134[0] = *MEMORY[0x263F117E0];
      v134[1] = v58;
      v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:2];
      v60 = [v57 propertySetWithProperties:v59];
      v184 = v60;
      v169[17] = *MEMORY[0x263F11A08];
      v61 = (void *)MEMORY[0x263F12180];
      uint64_t v62 = *MEMORY[0x263F117A8];
      v133[0] = *MEMORY[0x263F117B0];
      v133[1] = v62;
      v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:v133 count:2];
      v64 = [v61 propertySetWithProperties:v63];
      v185 = v64;
      v169[18] = *MEMORY[0x263F119C0];
      v65 = (void *)MEMORY[0x263F12180];
      uint64_t v132 = *MEMORY[0x263F11580];
      v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v132 count:1];
      v67 = [v65 propertySetWithProperties:v66];
      v186 = v67;
      v68 = [NSDictionary dictionaryWithObjects:buf forKeys:v169 count:19];
      v120 = (void *)[v119 initWithProperties:MEMORY[0x263EFFA68] relationships:v68];

      uint64_t v69 = v121;
      id v13 = *(void **)(v121 + 32);
    }
    else
    {
      v120 = 0;
      uint64_t v69 = a1;
    }
    v124[0] = MEMORY[0x263EF8330];
    v124[1] = 3221225472;
    v124[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_13;
    v124[3] = &unk_2643C3C48;
    id v125 = v13;
    id v131 = *(id *)(v69 + 48);
    id v126 = v122;
    id v127 = v120;
    id v128 = *(id *)(v69 + 40);
    id v5 = v123;
    id v129 = v123;
    id v130 = 0;
    id v70 = v120;
    id v71 = v122;
    [v71 getRepresentativeMetadataForPlaybackContext:v129 properties:v70 completion:v124];

    id v6 = 0;
  }
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v88 = a2;
  id v87 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v9 = v8;
  v89 = v7;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | returning nil [getRepresentativeMetadata failed] error=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v88 identifiers];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | using playback context [valid representative metadata] modelObject.identifiers=%{public}@", buf, 0x16u);
    }
    id v13 = [*(id *)(a1 + 40) firstModelPlayEvent];
    uint64_t v14 = [v13 genericObjectRepresentation];
    uint64_t v15 = (void *)v14;
    id v16 = v88;
    if (v14) {
      id v16 = (void *)v14;
    }
    id v85 = v16;

    uint64_t v17 = [v85 flattenedGenericObject];
    id v18 = (void *)[v17 copyWithPropertySet:*(void *)(a1 + 48)];

    uint64_t v19 = [v18 identifiers];
    v83 = [v19 preferredStoreStringIdentifierForPersonID:0];

    uint64_t v20 = *(void *)(a1 + 32);
    id v21 = v18;
    if (v20)
    {
      id v22 = objc_alloc_init(MEMORY[0x263F120F8]);
      switch([v21 type])
      {
        case 0:
          uint64_t v23 = [MEMORY[0x263F08690] currentHandler];
          [v23 handleFailureInMethod:sel_generateNowPlayingContentItemWithMetadataObject_ object:v20 file:@"MPCPlaybackIntent.m" lineNumber:392 description:@"Cannot handle unknown generic object metadata."];

          goto LABEL_17;
        case 1:
          uint64_t v24 = [v21 song];
          id v25 = [v24 title];
          [v22 setTitle:v25];

          uint64_t v26 = [v21 song];
          v27 = [v26 artist];
          uint64_t v28 = [v27 name];
          [v22 setSubtitle:v28];

          goto LABEL_34;
        case 2:
          id v29 = [v21 album];
          uint64_t v30 = [v29 title];
          [v22 setTitle:v30];

          uint64_t v26 = [v21 album];
          v27 = [v26 artist];
          v31 = [v27 name];
          [v22 setSubtitle:v31];

          goto LABEL_34;
        case 3:
          uint64_t v26 = [v21 artist];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 4:
          uint64_t v26 = [v21 playlist];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 5:
          v32 = [MEMORY[0x263F08690] currentHandler];
          [v32 handleFailureInMethod:sel_generateNowPlayingContentItemWithMetadataObject_ object:v20 file:@"MPCPlaybackIntent.m" lineNumber:395 description:@"Expected a flattened generic object."];

LABEL_17:
          id v33 = 0;
          goto LABEL_36;
        case 6:
          v34 = [v21 tvEpisode];
          uint64_t v35 = [v34 title];
          [v22 setTitle:v35];

          uint64_t v26 = [v21 tvEpisode];
          v27 = [v26 show];
          v36 = [v27 title];
          [v22 setSubtitle:v36];

          goto LABEL_34;
        case 7:
          uint64_t v37 = [v21 season];
          id v38 = [v37 show];
          uint64_t v39 = [v38 title];
          [v22 setTitle:v39];

          uint64_t v40 = NSString;
          uint64_t v26 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MediaPlayer"];
          v27 = [v26 localizedStringForKey:@"SEASON_DISPLAY_FORMAT_%@" value:&stru_26CBCA930 table:@"MediaPlayer"];
          v41 = NSNumber;
          id v42 = [v21 season];
          uint64_t v43 = objc_msgSend(v41, "numberWithInteger:", objc_msgSend(v42, "number"));
          v44 = [v43 stringValue];
          v45 = objc_msgSend(v40, "stringWithFormat:", v27, v44, v83);
          [v22 setSubtitle:v45];

          goto LABEL_34;
        case 8:
          uint64_t v26 = [v21 show];
          v27 = [v26 title];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 9:
          uint64_t v26 = [v21 movie];
          v27 = [v26 title];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 10:
          uint64_t v26 = [v21 mediaClip];
          v27 = [v26 title];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 11:
          uint64_t v46 = [v21 podcast];
          v47 = [v46 title];
          [v22 setTitle:v47];

          uint64_t v26 = [v21 podcast];
          v27 = [v26 author];
          uint64_t v48 = [v27 name];
          [v22 setSubtitle:v48];

          goto LABEL_34;
        case 12:
          v49 = [v21 podcastEpisode];
          v50 = [v49 title];
          [v22 setTitle:v50];

          uint64_t v26 = [v21 podcastEpisode];
          v27 = [v26 podcast];
          uint64_t v51 = [v27 title];
          [v22 setSubtitle:v51];

          goto LABEL_34;
        case 13:
          uint64_t v26 = [v21 radioStation];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 14:
          uint64_t v26 = [v21 composer];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 15:
          uint64_t v26 = [v21 genre];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 16:
          uint64_t v26 = [v21 curator];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 17:
          uint64_t v26 = [v21 socialPerson];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 18:
          uint64_t v26 = [v21 radioStationEvent];
          v27 = [v26 title];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 19:
          uint64_t v26 = [v21 recordLabel];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 20:
          uint64_t v26 = [v21 creditsArtist];
          v27 = [v26 name];
          [v22 setTitle:v27];
          goto LABEL_34;
        case 21:
          uint64_t v26 = [v21 group];
          v27 = [v26 title];
          [v22 setTitle:v27];
LABEL_34:

          break;
        default:
          break;
      }
      id v33 = v22;
LABEL_36:
    }
    else
    {
      id v33 = 0;
    }

    uint64_t v52 = *(void *)(a1 + 32);
    id v53 = v21;
    v86 = v53;
    if (v52)
    {
      id v54 = 0;
      switch([v53 type])
      {
        case 0:
          v55 = [MEMORY[0x263F08690] currentHandler];
          [v55 handleFailureInMethod:sel_artworkCatalogForMetadataModelObject_ object:v52 file:@"MPCPlaybackIntent.m" lineNumber:521 description:@"Cannot handle unknown generic object metadata."];
LABEL_40:
          id v54 = 0;
          goto LABEL_63;
        case 1:
          v55 = [v86 song];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 2:
          v55 = [v86 album];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 3:
          v55 = [v86 artist];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 4:
          v55 = [v86 playlist];
          v57 = [v55 artworkCatalog];
          uint64_t v58 = v57;
          if (v57)
          {
            id v54 = v57;
          }
          else
          {
            v80 = [v86 playlist];
            id v54 = [v80 tracksTiledArtworkCatalogWithRows:2 columns:2];
          }
          goto LABEL_63;
        case 5:
          v59 = [v86 playlistEntry];
          uint64_t v60 = [v59 type];

          switch(v60)
          {
            case 0:
              v55 = [MEMORY[0x263F08690] currentHandler];
              [v55 handleFailureInMethod:sel_artworkCatalogForMetadataModelObject_ object:v52 file:@"MPCPlaybackIntent.m" lineNumber:540 description:@"Cannot handle unknown playlist entry when capturing metadata."];
              goto LABEL_40;
            case 1:
              v55 = [v86 playlistEntry];
              v81 = [v55 song];
              id v54 = [v81 artworkCatalog];

              goto LABEL_63;
            case 2:
              v55 = [v86 playlistEntry];
              v82 = [v55 tvEpisode];
              id v54 = [v82 artworkCatalog];

              goto LABEL_63;
            case 3:
              goto LABEL_51;
            default:
              goto LABEL_82;
          }
        case 6:
          v55 = [v86 tvEpisode];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 7:
          v55 = [v86 season];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 8:
          v55 = [v86 show];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 9:
LABEL_51:
          v55 = [v86 movie];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 10:
          v55 = [v86 mediaClip];
          uint64_t v56 = [v55 previewArtworkCatalog];
          goto LABEL_62;
        case 11:
          v55 = [v86 podcast];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 12:
          v55 = [v86 podcastEpisode];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 13:
          v55 = [v86 radioStation];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 15:
          v55 = [v86 genre];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 16:
          v55 = [v86 curator];
          uint64_t v56 = [v55 editorialArtworkCatalog];
          goto LABEL_62;
        case 17:
          v55 = [v86 socialPerson];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 18:
          v55 = [v86 radioStationEvent];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 19:
          v55 = [v86 recordLabel];
          uint64_t v56 = [v55 artworkCatalog];
          goto LABEL_62;
        case 20:
          v55 = [v86 creditsArtist];
          uint64_t v56 = [v55 artworkCatalog];
LABEL_62:
          id v54 = (id)v56;
LABEL_63:

          break;
        default:
          break;
      }
    }
    else
    {
LABEL_82:
      id v54 = 0;
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v122 = __Block_byref_object_copy__23590;
    v123 = __Block_byref_object_dispose__23591;
    id v124 = 0;
    v115[0] = 0;
    v115[1] = v115;
    v115[2] = 0x3032000000;
    v115[3] = __Block_byref_object_copy__23590;
    v115[4] = __Block_byref_object_dispose__23591;
    id v116 = 0;
    v61 = dispatch_group_create();
    uint64_t v62 = v61;
    if (v54)
    {
      dispatch_group_enter(v61);
      v63 = *(void **)(a1 + 56);
      if (v63)
      {
        [v63 preferredArtworkSize];
        objc_msgSend(v54, "setFittingSize:");
      }
      v64 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v65 = *(void *)(a1 + 32);
        int v66 = [v54 hasExportableArtworkProperties];
        *(_DWORD *)v117 = 134218240;
        uint64_t v118 = v65;
        __int16 v119 = 1024;
        LODWORD(v120) = v66;
        _os_log_impl(&dword_21BB87000, v64, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | hasExportableArtworkProperties=%d", v117, 0x12u);
      }

      if ([v54 hasExportableArtworkProperties])
      {
        dispatch_group_enter(v62);
        v111[0] = MEMORY[0x263EF8330];
        v111[1] = 3221225472;
        v111[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_14;
        v111[3] = &unk_2643C3B30;
        id v112 = *(id *)(a1 + 32);
        v114 = v115;
        v113 = v62;
        [v54 requestExportableArtworkPropertiesWithCompletion:v111];
      }
      v108[0] = MEMORY[0x263EF8330];
      v108[1] = 3221225472;
      v108[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_17;
      v108[3] = &unk_2643C3B58;
      v110 = buf;
      v109 = v62;
      [v54 requestImageWithCompletion:v108];
    }
    v67 = MSVNanoIDCreateTaggedPointer();
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2;
    aBlock[3] = &unk_2643C3BF8;
    id v98 = *(id *)(a1 + 32);
    id v105 = *(id *)(a1 + 80);
    id v99 = *(id *)(a1 + 40);
    id v100 = *(id *)(a1 + 64);
    v68 = v62;
    v101 = v68;
    id v69 = v67;
    id v102 = v69;
    id v84 = v83;
    id v103 = v84;
    id v70 = v33;
    id v104 = v70;
    v106 = buf;
    v107 = v115;
    id v71 = _Block_copy(aBlock);
    v72 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
    [v72 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"original"];
    [v72 setObject:v69 forKeyedSubscript:@"sessionID"];
    if ([*(id *)(a1 + 40) supplementalPlaybackContextBehavior] == 1
      && ([*(id *)(a1 + 40) supplementalPlaybackContextWithReason:3],
          v73 = objc_claimAutoreleasedReturnValue(),
          (v74 = v73) != 0))
    {
      [v73 setShuffleType:0];
      objc_msgSend(v74, "setActionAfterQueueLoad:", objc_msgSend(*(id *)(a1 + 64), "actionAfterQueueLoad"));
      v75 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v76 = *(void *)(a1 + 32);
        *(_DWORD *)v117 = 134218242;
        uint64_t v118 = v76;
        __int16 v119 = 2114;
        v120 = v74;
        _os_log_impl(&dword_21BB87000, v75, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | validating supplemental context [] supplementalContext=%{public}@", v117, 0x16u);
      }

      id v77 = objc_alloc_init((Class)[v74 queueFeederClass]);
      uint64_t v78 = *(void *)(a1 + 48);
      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_137;
      v90[3] = &unk_2643C3C20;
      id v91 = *(id *)(a1 + 32);
      id v92 = *(id *)(a1 + 72);
      id v93 = v88;
      id v94 = v72;
      id v79 = v74;
      id v95 = v79;
      id v96 = v71;
      [v77 getRepresentativeMetadataForPlaybackContext:v79 properties:v78 completion:v90];
    }
    else
    {
      (*((void (**)(void *, void *))v71 + 2))(v71, v72);
    }

    _Block_object_dispose(v115, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6
    || ([v5 resolvedURLString], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v17 = 134218242;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | could not resolve artworkImageURL, error=%{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v5 resolvedURLString];
      int v17 = 134218242;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v12;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | resolved artworkImageURL=%{public}@", (uint8_t *)&v17, 0x16u);
    }
    id v13 = NSURL;
    id v7 = [v5 resolvedURLString];
    uint64_t v14 = [v13 URLWithString:v7];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_17(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x21D49CBE0](a2, *MEMORY[0x263F54E98]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v27 = v5;
    __int16 v28 = 2114;
    id v29 = v3;
    _os_log_impl(&dword_21BB87000, v4, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | creating archive [] payload=%{public}@", buf, 0x16u);
  }

  id v25 = 0;
  id v6 = [MEMORY[0x263F54F08] encodedDataWithRootObject:v3 error:&v25];
  id v7 = v25;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    if ([*(id *)(a1 + 40) conformsToProtocol:&unk_26CC286C8])
    {
      id v8 = *(id *)(a1 + 40);
      if ([v8 section:@"<ARCHIVE LOADER>" supportsShuffleType:1]) {
        uint64_t v9 = 6;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = objc_opt_class();

      if ([v10 supportsAutoPlay]) {
        uint64_t v11 = v9 | 8;
      }
      else {
        uint64_t v11 = v9;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_118;
    block[3] = &unk_2643C3BD0;
    uint64_t v12 = *(NSObject **)(a1 + 56);
    id v18 = *(id *)(a1 + 64);
    id v19 = v6;
    uint64_t v24 = v11;
    id v20 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 80);
    uint64_t v14 = *(void *)(a1 + 104);
    id v21 = v13;
    uint64_t v23 = v14;
    long long v16 = *(_OWORD *)(a1 + 88);
    id v15 = (id)v16;
    long long v22 = v16;
    dispatch_group_notify(v12, MEMORY[0x263EF83A0], block);
  }
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_137(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v7 || v9)
  {
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = *(void **)(a1 + 40);
      int v22 = 134218242;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      id v25 = v18;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | ignoring supplemental context [getRepresentativeMetadata failed] error=%{public}@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_11;
  }
  uint64_t v11 = [*(id *)(a1 + 48) identifiers];
  uint64_t v12 = [v7 identifiers];
  int v13 = [v11 intersectsSet:v12];

  uint64_t v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  id v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = [*(id *)(a1 + 48) identifiers];
      id v21 = [v7 identifiers];
      int v22 = 134218498;
      uint64_t v23 = v19;
      __int16 v24 = 2114;
      id v25 = v20;
      __int16 v26 = 2114;
      uint64_t v27 = v21;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | ignoring supplemental context [identifiers do not match] modelObject.identifiers=%{public}@ supplementalModelObject.identifiers=%{public}@", (uint8_t *)&v22, 0x20u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    int v22 = 134217984;
    uint64_t v23 = v16;
    _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | using supplemental context [identifiers match]", (uint8_t *)&v22, 0xCu);
  }

  [*(id *)(a1 + 56) setObject:*(void *)(a1 + 64) forKeyedSubscript:@"supplemental"];
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_118(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F12158]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2_120;
  v6[3] = &unk_2643C3BA8;
  id v7 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 88);
  id v8 = v3;
  uint64_t v12 = v4;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  long long v11 = *(_OWORD *)(a1 + 72);
  uint64_t v5 = (void *)[v2 initWithBlock:v6];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2_120(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:1];
  [v3 setSessionIdentifier:*(void *)(a1 + 32) type:@"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack" data:*(void *)(a1 + 40)];
  uint64_t v4 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  [v3 setBundleIdentifier:v5];

  [v3 setSupportedOptions:*(void *)(a1 + 80)];
  [v3 setFallbackStoreIdentifier:*(void *)(a1 + 48)];
  id v6 = objc_alloc(MEMORY[0x263F12160]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_3;
  v8[3] = &unk_2643C3B80;
  id v9 = *(id *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 64);
  id v7 = (void *)[v6 initWithBlock:v8];
  [v3 setDisplayProperties:v7];
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v10 = a2;
  uint64_t v4 = [v3 title];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26CBCA930;
  }
  [v10 setTitle:v6];

  uint64_t v7 = [*(id *)(a1 + 32) subtitle];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = &stru_26CBCA930;
  }
  [v10 setSubtitle:v9];

  [v10 setArtworkImageData:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v10 setArtworkImageURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v6 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"MPCMusicPlaybackIntentDataSource.m", 28, @"Subclass %@ must implement -%@ defined in %@.", v8, v9, @"[MPCMusicPlaybackIntentDataSource class]" object file lineNumber description];
  }
}

@end