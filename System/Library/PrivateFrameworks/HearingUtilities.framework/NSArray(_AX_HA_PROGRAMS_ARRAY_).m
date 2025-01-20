@interface NSArray(_AX_HA_PROGRAMS_ARRAY_)
- (id)programThatMatchesProgram:()_AX_HA_PROGRAMS_ARRAY_;
- (void)setProgram:()_AX_HA_PROGRAMS_ARRAY_ withOtherSidePrograms:selected:;
@end

@implementation NSArray(_AX_HA_PROGRAMS_ARRAY_)

- (void)setProgram:()_AX_HA_PROGRAMS_ARRAY_ withOtherSidePrograms:selected:
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 programThatMatchesProgram:v8];
  HAInitializeLogging();
  v11 = [NSString stringWithFormat:@"Selecting program %@ - %@", v8, v10];
  v12 = [NSString stringWithFormat:@"%s:%d %@", "-[NSArray(_AX_HA_PROGRAMS_ARRAY_) setProgram:withOtherSidePrograms:selected:]", 554, v11];
  v13 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    v15 = v13;
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = [v14 UTF8String];
    _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__6;
  v70 = __Block_byref_object_dispose__6;
  id v71 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__6;
  v65 = __Block_byref_object_dispose__6;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__6;
  v59 = __Block_byref_object_dispose__6;
  id v60 = 0;
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke;
  v54[3] = &unk_2640FE978;
  v54[4] = &v55;
  v54[5] = &buf;
  v54[6] = &v61;
  [v9 enumerateObjectsUsingBlock:v54];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__6;
  v52 = __Block_byref_object_dispose__6;
  id v53 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__6;
  v46 = __Block_byref_object_dispose__6;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__6;
  v40 = __Block_byref_object_dispose__6;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  id v35 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke_2;
  v24[3] = &unk_2640FE9A0;
  v26 = &v30;
  id v16 = v10;
  id v25 = v16;
  v27 = &v36;
  v28 = &v48;
  v29 = &v42;
  [a1 enumerateObjectsUsingBlock:v24];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    if ([v16 isStreamOrMixingStream])
    {
      if ([*(id *)(*((void *)&buf + 1) + 40) isStreamOrMixingStream])
      {
        int v17 = [*(id *)(*((void *)&buf + 1) + 40) index];
        if (v17 != [v16 index])
        {
          [*(id *)(*((void *)&buf + 1) + 40) setIsSelected:0];
          if (!v62[5]) {
            [(id)v56[5] setIsSelected:1];
          }
        }
      }
    }
  }
  if (!v43[5] && !v49[5]) {
    goto LABEL_26;
  }
  if ([v16 isMixingStream])
  {
    v18 = (void *)v49[5];
    if (v18)
    {
      [v18 setIsSelected:0];
      v19 = (void *)v31[5];
      if (v19)
      {
        [v19 setIsSelected:1];
        v20 = v16;
LABEL_28:
        [v20 setIsSelected:a5];
        goto LABEL_29;
      }
    }
LABEL_27:
    v20 = v16;
    goto LABEL_28;
  }
  if (([v16 isMixingStream] & 1) == 0 && objc_msgSend(v16, "isStream"))
  {
    v21 = (void *)v49[5];
    if (v21) {
      [v21 setIsSelected:0];
    }
    v22 = (void *)v43[5];
    if (!v22) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (!v37[5])
  {
    v22 = (void *)v49[5];
    if (!v22)
    {
      if (!v43[5]) {
        goto LABEL_29;
      }
      [v16 setIsSelected:1];
      a5 = 0;
      v20 = (void *)v43[5];
      goto LABEL_28;
    }
LABEL_25:
    [v22 setIsSelected:0];
LABEL_26:
    a5 = 1;
    goto LABEL_27;
  }
  [v16 setIsSelected:1];
  v23 = (void *)v43[5];
  if (v23) {
    [v23 setIsSelected:0];
  }
LABEL_29:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)programThatMatchesProgram:()_AX_HA_PROGRAMS_ARRAY_
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__NSArray__AX_HA_PROGRAMS_ARRAY___programThatMatchesProgram___block_invoke;
  v8[3] = &unk_2640FE9C8;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [a1 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

@end