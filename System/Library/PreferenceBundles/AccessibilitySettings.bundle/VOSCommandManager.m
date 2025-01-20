@interface VOSCommandManager
- (id)_actualPresentationControllerForController:(id)a3;
- (void)applyAction:(int64_t)a3 toCommand:(id)a4 withGesture:(id)a5 keyboardShortcut:(id)a6 resolver:(id)a7 presentationController:(id)a8 completion:(id)a9;
@end

@implementation VOSCommandManager

- (void)applyAction:(int64_t)a3 toCommand:(id)a4 withGesture:(id)a5 keyboardShortcut:(id)a6 resolver:(id)a7 presentationController:(id)a8 completion:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__4;
  v89 = __Block_byref_object_dispose__4;
  id v90 = 0;
  if ((unint64_t)(a3 - 3) < 3)
  {
    if (!v17)
    {
      uint64_t v21 = +[NSError ax_errorWithDomain:@"VoiceOverCommands" description:@"No keychord provided for action add/remove"];
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if ((unint64_t)a3 > 2)
  {
    id v57 = v15;
LABEL_11:
    id v31 = 0;
    v32 = 0;
    v28 = 0;
LABEL_26:

    id v15 = v57;
    goto LABEL_27;
  }
  if (v16)
  {
LABEL_6:
    id v57 = v15;
    v55 = v18;
    v56 = v19;
    switch(a3)
    {
      case 0:
        v22 = v18;
        v23 = (id *)v84;
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke;
        v84[3] = &unk_20BF00;
        v84[4] = self;
        id v24 = v16;
        v84[5] = v24;
        id v25 = v15;
        v84[6] = v25;
        id v26 = v22;
        v84[7] = v26;
        v84[8] = v20;
        v27 = objc_retainBlock(v84);
        v28 = (void (**)(void))[v27 copy];

        uint64_t v29 = [(VOSCommandManager *)self validateCanAddGesture:v24 toCommand:v25 withResolver:v26];
        goto LABEL_17;
      case 1:
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_2_282;
        v76[3] = &unk_20BF00;
        v76[4] = self;
        id v33 = v16;
        id v77 = v33;
        id v34 = v15;
        id v78 = v34;
        id v35 = v18;
        id v79 = v35;
        id v36 = v20;
        id v80 = v36;
        v37 = objc_retainBlock(v76);
        v32 = (void (**)(void))[v37 copy];

        id v31 = [(VOSCommandManager *)self validateCanRemoveGesture:v33 fromCommand:v34 withResolver:v35];

        if (!v31 || ([v31 isSuccessful] & 1) != 0) {
          goto LABEL_22;
        }
        v38 = +[VoiceOverCommandProfileValidationPresenter presenterWithValidation:v31];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_6_299;
        v61[3] = &unk_20BF78;
        v62[1] = &v85;
        id v39 = v36;
        v62[0] = v39;
        [v38 setUserAcceptedValidationResolutionBlock:v61];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_7_303;
        v58[3] = &unk_20BF78;
        v60 = &v85;
        id v59 = v39;
        [v38 setUserRejectedValidationResolutionBlock:v58];
        v40 = [(VOSCommandManager *)self _actualPresentationControllerForController:v56];
        [v38 presentWithController:v40];
        v41 = v38;
        v42 = (id *)v62;

        v28 = 0;
        goto LABEL_24;
      case 2:
        v43 = (id *)v75;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_5_285;
        v75[3] = &unk_20BF00;
        v75[4] = self;
        v75[5] = v16;
        v75[6] = v15;
        v75[7] = v18;
        v75[8] = v20;
        v44 = objc_retainBlock(v75);
        v45 = (void (**)(void))[v44 copy];
        goto LABEL_21;
      case 3:
        v46 = v18;
        v23 = (id *)v83;
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_4;
        v83[3] = &unk_20BF00;
        v83[4] = self;
        id v47 = v17;
        v83[5] = v47;
        id v48 = v15;
        v83[6] = v48;
        id v49 = v46;
        v83[7] = v49;
        v83[8] = v20;
        v50 = objc_retainBlock(v83);
        v28 = (void (**)(void))[v50 copy];

        uint64_t v29 = [(VOSCommandManager *)self validateCanAddKeyChord:v47 toCommand:v48 withResolver:v49];
LABEL_17:
        id v31 = (id)v29;

        if ([v31 isSuccessful])
        {
          v28[2](v28);
          v32 = 0;
        }
        else
        {
          v51 = +[VoiceOverCommandProfileValidationPresenter presenterWithValidation:v31];
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_2_289;
          v66[3] = &unk_20BF50;
          id v31 = v31;
          v67[0] = v31;
          v67[1] = self;
          id v68 = v16;
          id v69 = v55;
          id v52 = v56;
          id v70 = v52;
          v28 = v28;
          id v72 = v28;
          id v53 = v20;
          id v73 = v53;
          id v71 = v17;
          v74 = &v85;
          [v51 setUserAcceptedValidationResolutionBlock:v66];
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_5_295;
          v63[3] = &unk_20BF78;
          v65 = &v85;
          id v64 = v53;
          [v51 setUserRejectedValidationResolutionBlock:v63];
          v54 = [(VOSCommandManager *)self _actualPresentationControllerForController:v52];
          [v51 presentWithController:v54];
          v41 = v51;
          v42 = (id *)v67;

          v32 = 0;
LABEL_24:
        }
        break;
      case 4:
        v43 = (id *)v82;
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_7;
        v82[3] = &unk_20BF00;
        v82[4] = self;
        v82[5] = v17;
        v82[6] = v15;
        v82[7] = v18;
        v82[8] = v20;
        v44 = objc_retainBlock(v82);
        v45 = (void (**)(void))[v44 copy];
        goto LABEL_21;
      case 5:
        v43 = (id *)v81;
        v81[0] = _NSConcreteStackBlock;
        v81[1] = 3221225472;
        v81[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_10;
        v81[3] = &unk_20BF00;
        v81[4] = self;
        v81[5] = v17;
        v81[6] = v15;
        v81[7] = v18;
        v81[8] = v20;
        v44 = objc_retainBlock(v81);
        v45 = (void (**)(void))[v44 copy];
LABEL_21:
        v32 = v45;

        id v31 = 0;
LABEL_22:
        v32[2](v32);
        v28 = 0;
        break;
      default:
        goto LABEL_11;
    }
    id v18 = v55;
    id v19 = v56;
    goto LABEL_26;
  }
  uint64_t v21 = +[NSError ax_errorWithDomain:@"VoiceOverCommands" description:@"No gesture provided for action add/remove"];
LABEL_9:
  v30 = (void *)v86[5];
  v86[5] = v21;

  (*((void (**)(id, uint64_t))v20 + 2))(v20, v86[5]);
LABEL_27:
  _Block_object_dispose(&v85, 8);
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_2;
  v5[3] = &unk_20BEB0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_3;
  v3[3] = &unk_20BED8;
  id v4 = *(id *)(a1 + 64);
  [v2 batchUpdateActiveProfile:v5 saveIfSuccessful:1 completion:v3];
}

id __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addGesture:*(void *)(a1 + 40) toCommand:*(void *)(a1 + 48) withResolver:*(void *)(a1 + 56)];
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_5;
  v5[3] = &unk_20BEB0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_6;
  v3[3] = &unk_20BED8;
  id v4 = *(id *)(a1 + 64);
  [v2 batchUpdateActiveProfile:v5 saveIfSuccessful:1 completion:v3];
}

id __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) addKeyChord:*(void *)(a1 + 40) toCommand:*(void *)(a1 + 48) withResolver:*(void *)(a1 + 56)];
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_7(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_8;
  v5[3] = &unk_20BEB0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_9;
  v3[3] = &unk_20BED8;
  id v4 = *(id *)(a1 + 64);
  [v2 batchUpdateActiveProfile:v5 saveIfSuccessful:1 completion:v3];
}

id __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeKeyChord:*(void *)(a1 + 40) fromCommand:*(void *)(a1 + 48) withResolver:*(void *)(a1 + 56)];
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_10(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_11;
  v5[3] = &unk_20BEB0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_281;
  v3[3] = &unk_20BED8;
  id v4 = *(id *)(a1 + 64);
  [v2 batchUpdateActiveProfile:v5 saveIfSuccessful:1 completion:v3];
}

id __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_11(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) removeKeyChord:*(void *)(a1 + 40) fromCommand:*(void *)(a1 + 48) withResolver:*(void *)(a1 + 56)];
  id v3 = [objc_alloc((Class)VOSCommandManager) initWithSystemProfile];
  id v4 = [v3 commandForKeyChord:*(void *)(a1 + 40) withResolver:*(void *)(a1 + 56)];

  v5 = VOTLogCommands();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138412546;
    v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Got default command %@ for %@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [*(id *)(a1 + 32) addKeyChord:*(void *)(a1 + 40) toCommand:v4 withResolver:*(void *)(a1 + 56)];

  return v7;
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_2_282(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_3_283;
  v5[3] = &unk_20BEB0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_4_284;
  v3[3] = &unk_20BED8;
  id v4 = *(id *)(a1 + 64);
  [v2 batchUpdateActiveProfile:v5 saveIfSuccessful:1 completion:v3];
}

id __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_3_283(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeGesture:*(void *)(a1 + 40) fromCommand:*(void *)(a1 + 48) withResolver:*(void *)(a1 + 56)];
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_4_284(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_5_285(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_6_286;
  v5[3] = &unk_20BEB0;
  v5[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_287;
  v3[3] = &unk_20BED8;
  id v4 = *(id *)(a1 + 64);
  [v2 batchUpdateActiveProfile:v5 saveIfSuccessful:1 completion:v3];
}

id __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_6_286(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) removeGesture:*(void *)(a1 + 40) fromCommand:*(void *)(a1 + 48) withResolver:*(void *)(a1 + 56)];
  id v3 = [objc_alloc((Class)VOSCommandManager) initWithSystemProfile];
  id v4 = [v3 commandForTouchGesture:*(void *)(a1 + 40) withResolver:*(void *)(a1 + 56)];

  v5 = VOTLogCommands();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Got default gesture %@ for %@", (uint8_t *)&v9, 0x16u);
  }

  id v7 = [*(id *)(a1 + 32) addGesture:*(void *)(a1 + 40) toCommand:v4 withResolver:*(void *)(a1 + 56)];

  return v7;
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_2_289(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isGestureAssignedToOtherCommand])
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) previouslyBoundCommand];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_3_290;
    v20[3] = &unk_20BF28;
    id v21 = *(id *)(a1 + 80);
    id v22 = *(id *)(a1 + 88);
    [v2 applyAction:1 toCommand:v3 withGesture:v4 keyboardShortcut:0 resolver:v5 presentationController:v6 completion:v20];

    id v7 = v21;
LABEL_5:

    return;
  }
  if ([*(id *)(a1 + 32) isKeyboardShortcutAssignedToOtherCommand])
  {
    id v8 = *(void **)(a1 + 40);
    int v9 = [*(id *)(a1 + 32) previouslyBoundCommand];
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 56);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_4_291;
    v17[3] = &unk_20BF28;
    id v18 = *(id *)(a1 + 80);
    id v19 = *(id *)(a1 + 88);
    [v8 applyAction:4 toCommand:v9 withGesture:0 keyboardShortcut:v10 resolver:v12 presentationController:v11 completion:v17];

    id v7 = v18;
    goto LABEL_5;
  }
  uint64_t v13 = +[NSError ax_errorWithDomain:@"VoiceOverCommands", @"Unexpected validation: %@", *(void *)(a1 + 32) description];
  uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  id v16 = *(void (**)(void))(*(void *)(a1 + 88) + 16);

  v16();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_3_290(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_4_291(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_5_295(uint64_t a1)
{
  uint64_t v2 = +[NSError ax_errorWithDomain:@"VoiceOverCommands" description:@"User rejected validation resolution"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_6_299(uint64_t a1)
{
  uint64_t v2 = +[NSError ax_errorWithDomain:@"VoiceOverCommands" description:@"User accepted validation resolution"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

uint64_t __146__VOSCommandManager_VoiceOverCustomCommandsExtras__applyAction_toCommand_withGesture_keyboardShortcut_resolver_presentationController_completion___block_invoke_7_303(uint64_t a1)
{
  uint64_t v2 = +[NSError ax_errorWithDomain:@"VoiceOverCommands" description:@"User rejected validation resolution"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

- (id)_actualPresentationControllerForController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      id v5 = [v3 presentedViewController];

      uint64_t v6 = [v5 presentedViewController];

      id v3 = v5;
    }
    while (v6);
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

@end