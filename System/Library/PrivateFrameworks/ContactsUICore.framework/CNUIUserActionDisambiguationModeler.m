@interface CNUIUserActionDisambiguationModeler
+ (id)descriptorForRequiredKeys;
- (BOOL)hasDefaultAppForActionType:(id)a3;
- (CNUIDefaultUserActionFetcher)defaultActionFetcher;
- (CNUIUserActionDisambiguationModeler)init;
- (CNUIUserActionDisambiguationModeler)initWithDiscoveringEnvironment:(id)a3;
- (CNUIUserActionDisambiguationModeler)initWithTargetDiscoveringHelper:(id)a3 rankingHelper:(id)a4 defaultActionFetcher:(id)a5 discoveringEnvironment:(id)a6;
- (CNUIUserActionDiscoveringEnvironment)discoveringEnvironment;
- (CNUIUserActionRanking)rankingHelper;
- (CNUIUserActionTargetDiscovering)targetDiscoveringHelper;
- (id)_discoverActionsForContact:(id)a3 actionType:(id)a4;
- (id)defaultActionChangedObservable;
- (id)defaultActionFromActions:(id)a3;
- (id)defaultAppsScorerForActionType:(id)a3;
- (id)discoverActionsForContact:(id)a3 actionType:(id)a4;
- (id)modelsWithActionType:(id)a3 defaultAction:(id)a4 actions:(id)a5 recentActions:(id)a6 sorts:(BOOL)a7 throttles:(BOOL)a8;
- (id)modelsWithContact:(id)a3 actionType:(id)a4 defaultActionItem:(id)a5;
- (id)recentActionsFromActions:(id)a3;
- (id)schedulerProvider;
- (id)sortActionsOnModel:(id)a3 actionType:(id)a4;
- (id)targetsChangedObservableForActionType:(id)a3;
- (id)thirdPartyActionsForContactProperty:(id)a3;
- (id)thirdPartyTargetsForActionTypes:(id)a3;
- (void)emptyDefaultAppsCaches;
- (void)setContactStore:(id)a3;
- (void)setDefaultActionFetcher:(id)a3;
- (void)setDiscoveringEnvironment:(id)a3;
- (void)setRankingHelper:(id)a3;
- (void)setTargetDiscoveringHelper:(id)a3;
@end

@implementation CNUIUserActionDisambiguationModeler

+ (id)descriptorForRequiredKeys
{
  return +[CNUIUserActionTarget descriptorForRequiredKeysForActionDiscovering];
}

- (CNUIUserActionDisambiguationModeler)init
{
  v3 = objc_alloc_init(CNUIUserActionDiscoveringEnvironment);
  v4 = [(CNUIUserActionDisambiguationModeler *)self initWithDiscoveringEnvironment:v3];

  return v4;
}

- (CNUIUserActionDisambiguationModeler)initWithDiscoveringEnvironment:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNUIUserActionRanking);
  v6 = [v4 targetDiscoveringHelper];
  v7 = [v4 defaultUserActionFetcher];
  v8 = [(CNUIUserActionDisambiguationModeler *)self initWithTargetDiscoveringHelper:v6 rankingHelper:v5 defaultActionFetcher:v7 discoveringEnvironment:v4];

  return v8;
}

- (CNUIUserActionDisambiguationModeler)initWithTargetDiscoveringHelper:(id)a3 rankingHelper:(id)a4 defaultActionFetcher:(id)a5 discoveringEnvironment:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNUIUserActionDisambiguationModeler;
  v15 = [(CNUIUserActionDisambiguationModeler *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_targetDiscoveringHelper, a3);
    objc_storeStrong((id *)&v16->_rankingHelper, a4);
    objc_storeStrong((id *)&v16->_defaultActionFetcher, a5);
    objc_storeStrong((id *)&v16->_discoveringEnvironment, a6);
    v17 = v16;
  }

  return v16;
}

- (void)setContactStore:(id)a3
{
  id v4 = a3;
  id v7 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  v5 = [(CNUIUserActionDisambiguationModeler *)self schedulerProvider];
  v6 = (void *)[v7 copyWithContactStore:v4 schedulerProvider:v5];

  [(CNUIUserActionDisambiguationModeler *)self setDiscoveringEnvironment:v6];
}

- (id)schedulerProvider
{
  v2 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  v3 = [v2 schedulerProvider];

  return v3;
}

- (id)modelsWithContact:(id)a3 actionType:(id)a4 defaultActionItem:(id)a5
{
  v70[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CNUIUserActionDisambiguationModeler *)self schedulerProvider];
  id v12 = [(CNUIUserActionDisambiguationModeler *)self discoverActionsForContact:v8 actionType:v9];
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke;
  v67[3] = &unk_264018EF8;
  id v53 = v8;
  id v68 = v53;
  id v13 = v9;
  id v69 = v13;
  id v14 = [v12 doOnNext:v67];

  v15 = [v11 backgroundScheduler];
  v52 = v14;
  v16 = [v14 subscribeOn:v15];

  v17 = [(CNReplaySubject *)[CNDiscoveredUserActionReplaySubject alloc] initWithCapacity:1 schedulerProvider:v11];
  v50 = [v16 subscribe:v17];
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334D0] + 16))())
  {
    v18 = [(CNUIUserActionDisambiguationModeler *)self defaultActionFromActions:v17];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9;
    v65[3] = &unk_264018F20;
    id v66 = v13;
    v47 = [v18 doOnNext:v65];
  }
  else
  {
    v47 = [MEMORY[0x263F33608] observableWithResult:v10];
  }
  objc_super v19 = [(CNUIUserActionDisambiguationModeler *)self recentActionsFromActions:v17];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_12;
  v63[3] = &unk_264018738;
  id v20 = v13;
  id v64 = v20;
  v21 = [v19 doOnNext:v63];

  v22 = [MEMORY[0x263F33608] observableWithResult:v10];
  [MEMORY[0x263F33608] observableWithResult:MEMORY[0x263EFFA68]];
  v23 = v51 = v10;
  v24 = [(CNUIUserActionDisambiguationModeler *)self modelsWithActionType:v20 defaultAction:v22 actions:v17 recentActions:v23 sorts:0 throttles:0];
  v49 = [v24 take:1];

  v25 = [(CNReplaySubject *)[CNFirstRawActionsModelReplaySubject alloc] initWithCapacity:1 schedulerProvider:v11];
  v26 = [v11 backgroundScheduler];
  v27 = [v49 subscribeOn:v26];
  v28 = [v27 subscribe:v25];

  v29 = (void *)MEMORY[0x263F33608];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_14;
  v57[3] = &unk_264018F98;
  v57[4] = self;
  id v58 = v20;
  id v59 = v47;
  v60 = v17;
  id v61 = v21;
  id v30 = v28;
  id v62 = v30;
  id v46 = v21;
  v45 = v17;
  id v44 = v47;
  id v48 = v20;
  v31 = [v29 observableWithBlock:v57];
  v32 = (void *)MEMORY[0x263F33608];
  v33 = +[CNUIUserActionListModel emptyModel];
  v34 = [v32 observableWithResult:v33];

  v35 = (void *)MEMORY[0x263F33608];
  v70[0] = v34;
  v70[1] = v25;
  v70[2] = v31;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:3];
  v37 = [v35 merge:v36 schedulerProvider:v11];

  v38 = [v11 backgroundScheduler];
  v39 = [v37 subscribeOn:v38];

  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_4;
  v54[3] = &unk_264018368;
  id v55 = v50;
  id v56 = v30;
  id v40 = v30;
  id v41 = v50;
  v42 = [v39 doOnCancel:v54];

  return v42;
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_cold_1();
  }
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9_cold_1();
  }
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_12_cold_1();
  }
}

id __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) discoveringEnvironment];
  v5 = [v4 highLatencySchedulerProvider];
  v6 = [v5 backgroundScheduler];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_2;
  v11[3] = &unk_264018F70;
  id v7 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  id v17 = v3;
  id v8 = v3;
  id v9 = [v6 performCancelableBlock:v11 qualityOfService:2];

  return v9;
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = a2;
  id v9 = [v3 modelsWithActionType:v4 defaultAction:v5 actions:v6 recentActions:v7 sorts:1 throttles:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_3;
  v12[3] = &unk_264018F48;
  id v13 = *(id *)(a1 + 72);
  id v10 = [v9 doOnNext:v12];
  id v11 = [v10 subscribe:*(void *)(a1 + 80)];

  [v8 addCancelable:v11];
}

uint64_t __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  id v2 = *(void **)(a1 + 40);
  return [v2 cancel];
}

- (id)targetsChangedObservableForActionType:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  uint64_t v6 = [v5 highLatencySchedulerProvider];

  uint64_t v7 = [(CNUIUserActionDisambiguationModeler *)self targetDiscoveringHelper];
  id v8 = [v7 observableForTargetsChangedForActionType:v4 schedulerProvider:v6];
  id v9 = [v6 backgroundScheduler];
  id v10 = [v8 subscribeOn:v9];

  id v11 = [v10 throttle:v6 schedulerProvider:0.5];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke;
  v18[3] = &unk_264018B40;
  id v19 = v4;
  id v12 = v4;
  id v13 = [v11 doOnNext:v18];

  id v14 = [MEMORY[0x263EFF9D0] null];
  v20[0] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  id v16 = [v13 startWith:v15];

  return v16;
}

void __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke(uint64_t a1)
{
  id v2 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke_cold_1(a1, v2);
  }
}

- (id)discoverActionsForContact:(id)a3 actionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x210538660]();
  id v9 = [(CNUIUserActionDisambiguationModeler *)self _discoverActionsForContact:v6 actionType:v7];

  return v9;
}

- (id)_discoverActionsForContact:(id)a3 actionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNUIUserActionDisambiguationModeler *)self schedulerProvider];
  id v9 = [(CNUIUserActionDisambiguationModeler *)self targetDiscoveringHelper];
  id v10 = [v9 targetsForActionType:v7];
  uint64_t v11 = MEMORY[0x263EFFA68];
  id v12 = [v10 scan:&__block_literal_global_59 seed:MEMORY[0x263EFFA68]];

  id v13 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2;
  v26[3] = &unk_264019008;
  id v14 = v7;
  id v27 = v14;
  id v28 = v6;
  id v29 = v13;
  id v30 = v8;
  id v15 = v8;
  id v16 = v13;
  id v17 = v6;
  v18 = [v12 switchMap:v26 schedulerProvider:v15];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_29;
  v24[3] = &unk_264018738;
  id v25 = v14;
  id v19 = v14;
  id v20 = [v18 doOnNext:v24];

  v21 = [MEMORY[0x263F33608] observableWithResult:v11];
  v22 = [v20 onEmpty:v21];

  return v22;
}

uint64_t __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "arrayByAddingObject:");
}

id __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_cold_1();
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_24;
  v12[3] = &unk_264018FE0;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  uint64_t v5 = objc_msgSend(v3, "_cn_map:", v12);
  id v6 = [MEMORY[0x263F33608] combineLatest:v5 schedulerProvider:*(void *)(a1 + 56)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_27;
  v10[3] = &unk_264018B40;
  id v11 = *(id *)(a1 + 40);
  id v7 = [v6 doOnNext:v10];

  id v8 = [v7 map:*MEMORY[0x263F33478]];

  return v8;
}

id __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 actionsForContact:*(void *)(a1 + 32) discoveringEnvironment:*(void *)(a1 + 40)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_25;
  v8[3] = &unk_264018EF8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v5 = v3;
  id v6 = [v4 doOnNext:v8];

  return v6;
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_25_cold_1(a1);
  }
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_27_cold_1(a1);
  }
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_29_cold_1();
  }
}

- (id)defaultActionChangedObservable
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  id v4 = [v3 highLatencySchedulerProvider];

  id v5 = [(CNUIUserActionDisambiguationModeler *)self defaultActionFetcher];
  id v6 = [v5 observableForDefaultActionsChanged];
  id v7 = [v4 backgroundScheduler];
  id v8 = [v6 subscribeOn:v7];

  id v9 = [v8 doOnNext:&__block_literal_global_31_0];

  id v10 = [MEMORY[0x263EFF9D0] null];
  v14[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = [v9 startWith:v11];

  return v12;
}

void __69__CNUIUserActionDisambiguationModeler_defaultActionChangedObservable__block_invoke()
{
  v0 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __69__CNUIUserActionDisambiguationModeler_defaultActionChangedObservable__block_invoke_cold_1(v0);
  }
}

- (id)defaultActionFromActions:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CNUIUserActionDisambiguationModeler *)self defaultActionFetcher];
  id v6 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  id v7 = [v6 highLatencySchedulerProvider];
  id v8 = [v5 defaultActionItemForActionItems:v4 schedulerProvider:v7];

  id v9 = [MEMORY[0x263EFF9D0] null];
  v14[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v11 = [v8 startWith:v10];

  id v12 = [v11 onErrorHandler:&__block_literal_global_34_0];

  return v12;
}

id __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_2((uint64_t)v2, v3);
  }

  id v4 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_1(v4);
  }

  id v5 = [MEMORY[0x263F33608] emptyObservable];

  return v5;
}

- (id)recentActionsFromActions:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIUserActionDisambiguationModeler *)self rankingHelper];
  id v6 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  id v7 = [v6 highLatencySchedulerProvider];
  id v8 = [v5 selectRecentActionItems:v4 schedulerProvider:v7];

  id v9 = [v8 doOnNext:&__block_literal_global_36];

  return v9;
}

void __64__CNUIUserActionDisambiguationModeler_recentActionsFromActions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __64__CNUIUserActionDisambiguationModeler_recentActionsFromActions___block_invoke_cold_1(v2);
  }
}

- (id)modelsWithActionType:(id)a3 defaultAction:(id)a4 actions:(id)a5 recentActions:(id)a6 sorts:(BOOL)a7 throttles:(BOOL)a8
{
  BOOL v9 = a7;
  v33[3] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (void *)MEMORY[0x263F33608];
  v33[0] = v15;
  v33[1] = v16;
  v33[2] = v17;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
  id v20 = [(CNUIUserActionDisambiguationModeler *)self schedulerProvider];
  v21 = [v18 combineLatest:v19 schedulerProvider:v20];

  if (a8)
  {
    v22 = [(CNUIUserActionDisambiguationModeler *)self schedulerProvider];
    id v23 = [v21 throttle:v22 schedulerProvider:0.1];
  }
  else
  {
    id v23 = v21;
  }
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __112__CNUIUserActionDisambiguationModeler_modelsWithActionType_defaultAction_actions_recentActions_sorts_throttles___block_invoke;
  v31[3] = &unk_264019050;
  v31[4] = self;
  id v24 = v14;
  id v32 = v24;
  id v25 = [v23 map:v31];
  if (v9)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    id v30 = v24;
    v26 = [(CNUIUserActionDisambiguationModeler *)self schedulerProvider];
    uint64_t v27 = [v25 switchMap:&v29 schedulerProvider:v26];

    id v25 = (void *)v27;
  }

  return v25;
}

id __112__CNUIUserActionDisambiguationModeler_modelsWithActionType_defaultAction_actions_recentActions_sorts_throttles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x263F33508];
  id v4 = a2;
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  id v7 = [v4 objectAtIndexedSubscript:1];
  id v8 = [v4 objectAtIndexedSubscript:2];

  uint64_t v9 = [*(id *)(a1 + 32) hasDefaultAppForActionType:*(void *)(a1 + 40)];
  id v10 = +[CNUIUserActionDisambiguationModelFinalizer modelWithDefaultAction:v6 actions:v7 recentActions:v8 directoryServiceActions:MEMORY[0x263EFFA68] foundOnDeviceActions:MEMORY[0x263EFFA68] hasDefaultApp:v9];

  return v10;
}

uint64_t __112__CNUIUserActionDisambiguationModeler_modelsWithActionType_defaultAction_actions_recentActions_sorts_throttles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sortActionsOnModel:a2 actionType:*(void *)(a1 + 40)];
}

- (id)sortActionsOnModel:(id)a3 actionType:(id)a4
{
  id v6 = a3;
  id v7 = [(CNUIUserActionDisambiguationModeler *)self defaultAppsScorerForActionType:a4];
  id v8 = [(CNUIUserActionDisambiguationModeler *)self rankingHelper];
  uint64_t v9 = [v6 actions];
  id v10 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  id v11 = [v10 highLatencySchedulerProvider];
  id v12 = [v8 sortActionItems:v9 schedulerProvider:v11 defaultAppsScorer:v7];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __69__CNUIUserActionDisambiguationModeler_sortActionsOnModel_actionType___block_invoke;
  v24[3] = &unk_264018678;
  id v13 = v6;
  id v25 = v13;
  id v14 = [v12 flatMap:v24];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __69__CNUIUserActionDisambiguationModeler_sortActionsOnModel_actionType___block_invoke_2;
  v22 = &unk_264018EA8;
  id v23 = v13;
  id v15 = v13;
  id v16 = [v14 recover:&v19];

  id v17 = objc_msgSend(MEMORY[0x263F33608], "observableWithFuture:", v16, v19, v20, v21, v22);

  return v17;
}

id __69__CNUIUserActionDisambiguationModeler_sortActionsOnModel_actionType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[CNUIUserActionListModel alloc] initWithModel:*(void *)(a1 + 32) actions:v3];

  id v5 = [MEMORY[0x263F335E0] futureWithResult:v4];

  return v5;
}

uint64_t __69__CNUIUserActionDisambiguationModeler_sortActionsOnModel_actionType___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_Disambiguation_12.isa, a2);
  NSLog(&cfstr_Disambiguation_13.isa);
  id v3 = (void *)MEMORY[0x263F335E0];
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 futureWithResult:v4];
}

- (BOOL)hasDefaultAppForActionType:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x263EFDEF8]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    id v5 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
    id v6 = [v5 callProviderManager];
    char v7 = [v6 hasDefaultCallProvider];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)defaultAppsScorerForActionType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263EFDF18]])
  {
    id v5 = [(CNUIUserActionDisambiguationModeler *)self targetDiscoveringHelper];
    id v6 = [v5 defaultMessagingAppsBundleIdentifierScorer];
LABEL_8:

    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263EFDEF8]])
  {
    id v5 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
    char v7 = [v5 callProviderManager];
    uint64_t v8 = [v7 defaultCallingAppsBundleIdentifierScorer];
LABEL_7:
    id v6 = (void *)v8;

    goto LABEL_8;
  }
  if ([v4 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    id v5 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
    char v7 = [v5 callProviderManager];
    uint64_t v8 = [v7 defaultVideoAppsBundleIdentifierScorer];
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIUserActionDisambiguationModeler *)self targetDiscoveringHelper];
  id v6 = [v5 thirdPartyTargetsForActionTypes:v4];

  return v6;
}

- (id)thirdPartyActionsForContactProperty:(id)a3
{
  id v4 = a3;
  if (thirdPartyActionsForContactProperty__cn_once_token_13 != -1) {
    dispatch_once(&thirdPartyActionsForContactProperty__cn_once_token_13, &__block_literal_global_48);
  }
  id v5 = (id)thirdPartyActionsForContactProperty__cn_once_object_13;
  id v6 = [v4 key];
  char v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__3;
    v26 = __Block_byref_object_dispose__3;
    id v27 = 0;
    uint64_t v8 = [v4 value];
    uint64_t v9 = [v8 bundleIdentifiers];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_49;
    v21[3] = &unk_2640190A0;
    v21[4] = self;
    v21[5] = &v22;
    [v9 enumerateObjectsUsingBlock:v21];

    id v10 = (void *)v23[5];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_2;
    v18 = &unk_2640190C8;
    id v19 = v4;
    uint64_t v20 = self;
    id v11 = objc_msgSend(v10, "_cn_flatMap:", &v15);
    if (v11) {
      id v12 = v11;
    }
    else {
      id v12 = (void *)MEMORY[0x263EFFA68];
    }
    id v13 = objc_msgSend(MEMORY[0x263F335E0], "futureWithResult:", v12, v15, v16, v17, v18);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v13 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }

  return v13;
}

void __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFE010];
  v4[0] = *MEMORY[0x263EFE110];
  v4[1] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)thirdPartyActionsForContactProperty__cn_once_object_13;
  thirdPartyActionsForContactProperty__cn_once_object_13 = v2;
}

void __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_49(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 targetDiscoveringHelper];
  uint64_t v9 = [v8 thirdPartyTargetsForBundleIdentifier:v7];

  id v15 = 0;
  uint64_t v10 = [v9 result:&v15];
  id v11 = v15;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  *a4 = v14 != 0;
}

id __75__CNUIUserActionDisambiguationModeler_thirdPartyActionsForContactProperty___block_invoke_2(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263EFEAD0]);
  id v5 = [*(id *)(a1 + 32) identifier];
  id v6 = [*(id *)(a1 + 32) label];
  id v7 = [*(id *)(a1 + 32) value];
  uint64_t v8 = (void *)[v4 initWithIdentifier:v5 label:v6 value:v7];

  uint64_t v9 = [*(id *)(a1 + 32) key];
  uint64_t v10 = *MEMORY[0x263EFE110];
  if (v9 | *MEMORY[0x263EFE110]
    && (id v11 = (void *)v9,
        [*(id *)(a1 + 32) key],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEqual:v10],
        v12,
        v11,
        !v13))
  {
    uint64_t v20 = v8;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    id v15 = [*(id *)(a1 + 32) contact];
    uint64_t v16 = [*(id *)(a1 + 40) discoveringEnvironment];
    uint64_t v17 = [v3 actionsForInstantMessageAddresses:v14 contact:v15 discoveringEnvironment:v16];
  }
  else
  {
    v21[0] = v8;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    id v15 = [*(id *)(a1 + 32) contact];
    uint64_t v16 = [*(id *)(a1 + 40) discoveringEnvironment];
    uint64_t v17 = [v3 actionsForSocialProfiles:v14 contact:v15 discoveringEnvironment:v16];
  }
  v18 = (void *)v17;

  return v18;
}

- (void)emptyDefaultAppsCaches
{
  id v3 = [(CNUIUserActionDisambiguationModeler *)self targetDiscoveringHelper];
  [v3 emptyDefaultAppsCaches];

  id v5 = [(CNUIUserActionDisambiguationModeler *)self discoveringEnvironment];
  id v4 = [v5 callProviderManager];
  [v4 emptyDefaultAppsCaches];
}

- (CNUIUserActionTargetDiscovering)targetDiscoveringHelper
{
  return self->_targetDiscoveringHelper;
}

- (void)setTargetDiscoveringHelper:(id)a3
{
}

- (CNUIUserActionRanking)rankingHelper
{
  return self->_rankingHelper;
}

- (void)setRankingHelper:(id)a3
{
}

- (CNUIDefaultUserActionFetcher)defaultActionFetcher
{
  return self->_defaultActionFetcher;
}

- (void)setDefaultActionFetcher:(id)a3
{
}

- (CNUIUserActionDiscoveringEnvironment)discoveringEnvironment
{
  return self->_discoveringEnvironment;
}

- (void)setDiscoveringEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveringEnvironment, 0);
  objc_storeStrong((id *)&self->_defaultActionFetcher, 0);
  objc_storeStrong((id *)&self->_rankingHelper, 0);
  objc_storeStrong((id *)&self->_targetDiscoveringHelper, 0);
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  v1 = [*(id *)(v0 + 32) shortDebugDescription];
  OUTLINED_FUNCTION_0_3(&dword_20B704000, v2, v3, "[Disambiguation Modeler] discovered actions for contact: %@\n%@\nType:%{public}@", v4, v5, v6, v7, 2u);
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "[Disambiguation Modeler] default action for %{public}@: %@");
}

void __86__CNUIUserActionDisambiguationModeler_modelsWithContact_actionType_defaultActionItem___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_20B704000, v0, v1, "[Disambiguation Modeler] recent actions for %{public}@: %@");
}

void __77__CNUIUserActionDisambiguationModeler_targetsChangedObservableForActionType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[Disambiguation Modeler] targets changed for %{public}@", (uint8_t *)&v3, 0xCu);
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  [v0 count];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_20B704000, v1, v2, "[Disambiguation Modeler] found %ld target(s) for %{public}@: %@", v3, v4, v5, v6, v7);
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_2_25_cold_1(uint64_t a1)
{
  uint8_t v7 = [*(id *)(a1 + 40) shortDebugDescription];
  OUTLINED_FUNCTION_0_3(&dword_20B704000, v1, v2, "[Disambiguation Modeler] target %@ found actions for contact %@\n%@", v3, v4, v5, v6, 2u);
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_27_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) shortDebugDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "[Disambiguation Modeler] CombineLatest for contact %@\nEmitted: %@", v4, v5, v6, v7, v8);
}

void __77__CNUIUserActionDisambiguationModeler__discoverActionsForContact_actionType___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  [v0 count];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_3(&dword_20B704000, v1, v2, "[Disambiguation Modeler] found %ld actions for %{public}@: %@", v3, v4, v5, v6, v7);
}

void __69__CNUIUserActionDisambiguationModeler_defaultActionChangedObservable__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20B704000, log, OS_LOG_TYPE_DEBUG, "[Disambiguation Modeler] default actions changed", v1, 2u);
}

void __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20B704000, log, OS_LOG_TYPE_DEBUG, "[Disambiguation Modeler] Continuing with no default action", v1, 2u);
}

void __64__CNUIUserActionDisambiguationModeler_defaultActionFromActions___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[Disambiguation Modeler] Error identifying default action: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __64__CNUIUserActionDisambiguationModeler_recentActionsFromActions___block_invoke_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v1, v2, "[Disambiguation Modeler] recent actions (%ld): %@", v3, v4, v5, v6, v7);
}

@end