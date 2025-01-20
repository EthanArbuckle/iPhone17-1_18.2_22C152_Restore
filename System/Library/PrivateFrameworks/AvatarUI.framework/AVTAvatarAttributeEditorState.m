@interface AVTAvatarAttributeEditorState
+ (id)buildStateFromCoreModel:(id)a3 avatarConfiguration:(id)a4;
- (AVTAvatarAttributeEditorState)init;
- (AVTAvatarAttributeEditorState)initWithPairedStates:(id)a3 multicolorEnabledStates:(id)a4 multicolorSelectedStates:(id)a5;
- (BOOL)isCategoryPaired:(int64_t)a3;
- (NSMutableDictionary)multicolorEnabledStates;
- (NSMutableDictionary)multicolorSelectedStates;
- (NSMutableDictionary)pairedStates;
- (int64_t)enabledMulticolorSubpickersIndexForMulticolorPickerIdentifier:(id)a3;
- (int64_t)selectedMulticolorSubpickersIndexForMulticolorPickerIdentifier:(id)a3;
- (void)setCategory:(int64_t)a3 inPairedState:(BOOL)a4;
- (void)setEnabledMulticolorSubpickersIndex:(int64_t)a3 forMulticolorPickerIdentifier:(id)a4;
- (void)setMulticolorEnabledStates:(id)a3;
- (void)setMulticolorSelectedStates:(id)a3;
- (void)setPairedStates:(id)a3;
- (void)setSelectedMulticolorSubpickersIndex:(int64_t)a3 forMulticolorPickerIdentifier:(id)a4;
@end

@implementation AVTAvatarAttributeEditorState

+ (id)buildStateFromCoreModel:(id)a3 avatarConfiguration:(id)a4
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v61 = [MEMORY[0x263EFF9A0] dictionary];
  v68 = [MEMORY[0x263EFF9A0] dictionary];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v56 = v5;
  id obj = [v5 groups];
  uint64_t v59 = [obj countByEnumeratingWithState:&v92 objects:v99 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v93;
    id v73 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v93 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v7;
        v8 = *(void **)(*((void *)&v92 + 1) + 8 * v7);
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v62 = [v8 categories];
        uint64_t v64 = [v62 countByEnumeratingWithState:&v88 objects:v98 count:16];
        if (v64)
        {
          uint64_t v63 = *(void *)v89;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v89 != v63) {
                objc_enumerationMutation(v62);
              }
              uint64_t v65 = v9;
              v10 = *(void **)(*((void *)&v88 + 1) + 8 * v9);
              v11 = [v10 pairing];

              if (v11)
              {
                v12 = objc_msgSend(v6, "presetForCategory:", objc_msgSend(v10, "presetCategory"));
                [v10 pairing];
                v14 = v13 = v6;
                v15 = objc_msgSend(v13, "presetForCategory:", objc_msgSend(v14, "pairedCategory"));

                v16 = [v12 identifier];
                v17 = [v15 identifier];
                int v18 = [v16 isEqualToString:v17];

                if (v18)
                {
                  v19 = NSNumber;
                  v20 = [v10 pairing];
                  v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "pairedCategory"));
                  [v61 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v21];
                }
                id v6 = v73;
              }
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              id v69 = [v10 pickers];
              uint64_t v22 = [v69 countByEnumeratingWithState:&v84 objects:v97 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v85;
                uint64_t v66 = *(void *)v85;
                do
                {
                  uint64_t v25 = 0;
                  uint64_t v67 = v23;
                  do
                  {
                    if (*(void *)v85 != v24) {
                      objc_enumerationMutation(v69);
                    }
                    v26 = *(void **)(*((void *)&v84 + 1) + 8 * v25);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v27 = v26;
                      long long v80 = 0u;
                      long long v81 = 0u;
                      long long v82 = 0u;
                      long long v83 = 0u;
                      v28 = [v27 subpickers];
                      uint64_t v29 = [v28 countByEnumeratingWithState:&v80 objects:v96 count:16];
                      if (v29)
                      {
                        id v70 = v27;
                        uint64_t v71 = v25;
                        v30 = 0;
                        uint64_t v31 = 0;
                        uint64_t v32 = *(void *)v81;
                        uint64_t v33 = -1;
                        v74 = v28;
                        uint64_t v75 = *(void *)v81;
                        do
                        {
                          uint64_t v34 = 0;
                          uint64_t v72 = v31 + v29;
                          v35 = v30;
                          uint64_t v36 = v33;
                          uint64_t v78 = v31;
                          uint64_t v79 = v29;
                          do
                          {
                            if (*(void *)v81 != v32) {
                              objc_enumerationMutation(v28);
                            }
                            uint64_t v33 = v31 + v34;
                            v37 = *(void **)(*((void *)&v80 + 1) + 8 * v34);
                            v30 = objc_msgSend(v6, "colorPresetForSettingKind:", objc_msgSend(v37, "destination"), objc_msgSend(v37, "colorCategory"));
                            BOOL v38 = [v37 destination] != 1 || v35 == 0;
                            if (v38)
                            {
                              if (!v30)
                              {
                                v30 = v35;
                                uint64_t v33 = v36;
                                goto LABEL_41;
                              }
                            }
                            else
                            {
                              uint64_t v77 = v33;
                              v76 = [v35 colorPreset];
                              v39 = [v76 name];
                              v40 = [v30 colorPreset];
                              v41 = [v40 name];
                              if ([v39 isEqualToString:v41])
                              {
                                v43 = [v35 colorPreset];
                                [v43 variation];
                                float v45 = v44;
                                v46 = [v30 colorPreset];
                                [v46 variation];
                                BOOL v48 = v45 == v47;

                                v28 = v74;
                                id v6 = v73;
                              }
                              else
                              {
                                BOOL v48 = 0;
                              }

                              BOOL v38 = !v48;
                              uint64_t v33 = v77;
                              if (!v38) {
                                uint64_t v33 = v36;
                              }
                              uint64_t v32 = v75;
                            }

                            ++v34;
                            v35 = v30;
                            uint64_t v36 = v33;
                            uint64_t v31 = v78;
                          }
                          while (v79 != v34);
                          uint64_t v29 = [v28 countByEnumeratingWithState:&v80 objects:v96 count:16];
                          uint64_t v31 = v72;
                        }
                        while (v29);
LABEL_41:

                        uint64_t v24 = v66;
                        uint64_t v23 = v67;
                        id v27 = v70;
                        uint64_t v25 = v71;
                      }
                      else
                      {
                        uint64_t v33 = -1;
                      }

                      uint64_t v49 = [v27 initialState];
                      if (v49 <= v33) {
                        uint64_t v50 = v33;
                      }
                      else {
                        uint64_t v50 = v49;
                      }
                      v51 = [NSNumber numberWithInteger:v50];
                      v52 = [v27 identifier];
                      [v68 setObject:v51 forKeyedSubscript:v52];
                    }
                    ++v25;
                  }
                  while (v25 != v23);
                  uint64_t v23 = [v69 countByEnumeratingWithState:&v84 objects:v97 count:16];
                }
                while (v23);
              }

              uint64_t v9 = v65 + 1;
            }
            while (v65 + 1 != v64);
            uint64_t v64 = [v62 countByEnumeratingWithState:&v88 objects:v98 count:16];
          }
          while (v64);
        }

        uint64_t v7 = v60 + 1;
      }
      while (v60 + 1 != v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v92 objects:v99 count:16];
    }
    while (v59);
  }

  v53 = [AVTAvatarAttributeEditorState alloc];
  v54 = [(AVTAvatarAttributeEditorState *)v53 initWithPairedStates:v61 multicolorEnabledStates:v68 multicolorSelectedStates:MEMORY[0x263EFFA78]];

  return v54;
}

- (AVTAvatarAttributeEditorState)init
{
  return [(AVTAvatarAttributeEditorState *)self initWithPairedStates:MEMORY[0x263EFFA78] multicolorEnabledStates:MEMORY[0x263EFFA78] multicolorSelectedStates:MEMORY[0x263EFFA78]];
}

- (AVTAvatarAttributeEditorState)initWithPairedStates:(id)a3 multicolorEnabledStates:(id)a4 multicolorSelectedStates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarAttributeEditorState;
  v11 = [(AVTAvatarAttributeEditorState *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 mutableCopy];
    pairedStates = v11->_pairedStates;
    v11->_pairedStates = (NSMutableDictionary *)v12;

    uint64_t v14 = [v9 mutableCopy];
    multicolorEnabledStates = v11->_multicolorEnabledStates;
    v11->_multicolorEnabledStates = (NSMutableDictionary *)v14;

    uint64_t v16 = [v10 mutableCopy];
    multicolorSelectedStates = v11->_multicolorSelectedStates;
    v11->_multicolorSelectedStates = (NSMutableDictionary *)v16;
  }
  return v11;
}

- (BOOL)isCategoryPaired:(int64_t)a3
{
  v4 = [(AVTAvatarAttributeEditorState *)self pairedStates];
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setCategory:(int64_t)a3 inPairedState:(BOOL)a4
{
  id v8 = [NSNumber numberWithBool:a4];
  id v6 = [(AVTAvatarAttributeEditorState *)self pairedStates];
  char v7 = [NSNumber numberWithInteger:a3];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (int64_t)enabledMulticolorSubpickersIndexForMulticolorPickerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarAttributeEditorState *)self multicolorEnabledStates];
  id v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (void)setEnabledMulticolorSubpickersIndex:(int64_t)a3 forMulticolorPickerIdentifier:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v9 = [v6 numberWithInteger:a3];
  id v8 = [(AVTAvatarAttributeEditorState *)self multicolorEnabledStates];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (int64_t)selectedMulticolorSubpickersIndexForMulticolorPickerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarAttributeEditorState *)self multicolorSelectedStates];
  id v6 = [v5 objectForKeyedSubscript:v4];

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (void)setSelectedMulticolorSubpickersIndex:(int64_t)a3 forMulticolorPickerIdentifier:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v9 = [v6 numberWithInteger:a3];
  id v8 = [(AVTAvatarAttributeEditorState *)self multicolorSelectedStates];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (NSMutableDictionary)pairedStates
{
  return self->_pairedStates;
}

- (void)setPairedStates:(id)a3
{
}

- (NSMutableDictionary)multicolorEnabledStates
{
  return self->_multicolorEnabledStates;
}

- (void)setMulticolorEnabledStates:(id)a3
{
}

- (NSMutableDictionary)multicolorSelectedStates
{
  return self->_multicolorSelectedStates;
}

- (void)setMulticolorSelectedStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multicolorSelectedStates, 0);
  objc_storeStrong((id *)&self->_multicolorEnabledStates, 0);
  objc_storeStrong((id *)&self->_pairedStates, 0);
}

@end