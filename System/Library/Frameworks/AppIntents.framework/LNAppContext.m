@interface LNAppContext
+ ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken;
+ (void)cancelTimeout;
+ (void)extendTimeout;
- (LNAppContext)init;
- (void)createAsyncIteratorForSequence:(LNAsyncSequenceReference *)a3 options:(id)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6;
- (void)exportTransientEntities:(NSArray *)a3 withConfiguration:(LNExportedContentConfiguration *)a4 connectionIdentifier:(NSNumber *)a5 completionHandler:(id)a6;
- (void)fetchActionAppContextForAction:(id)a3 completionHandler:(id)a4;
- (void)fetchActionForAppShortcutIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchActionForAutoShortcutPhrase:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchActionListenerEndpoint:(LNAction *)a3 auditToken:(id *)a4 connectionIdentifier:(int64_t)a5 completionHandler:(id)a6;
- (void)fetchActionOutputValueForConnection:(NSXPCConnection *)a3 withIdentifier:(NSUUID *)a4 completionHandler:(id)a5;
- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3;
- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4;
- (void)fetchDisplayRepresentationForActions:(NSArray *)a3 completionHandler:(id)a4;
- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4;
- (void)fetchOptionsDefaultValuesForAction:(id)a3 connectionIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 connectionIdentifier:(id)a9 completionHandler:(id)a10;
- (void)fetchParameterOptionDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(NSString *)a5 connectionIdentifier:(id)a6 completionHandler:(id)a7;
- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4;
- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3;
- (void)fetchSuggestedActionsWithSiriLanguageCode:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5;
- (void)fetchURLForEnumWithIdentifier:(NSString *)a3 caseIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)fetchURLsForEnumWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchValueForPropertyWithIdentifier:(NSString *)a3 entity:(id)a4 auditToken:(id *)a5 connectionIdentifier:(int64_t)a6 completionHandler:(id)a7;
- (void)fetchViewActionsWithCompletionHandler:(id)a3;
- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4;
- (void)nextAsyncIteratorResults:(LNAsyncIteratorReference *)a3 connectionIdentifier:(id)a4 completionHandler:(id)a5;
- (void)performAction:(id)a3 options:(id)a4 reportingProgress:(NSProgress *)a5 delegate:(LNPerformActionExecutorDelegate *)a6 auditToken:(id *)a7 completionHandler:(id)a8;
- (void)performAllEntitiesQueryWithEntityMangledTypeName:(NSString *)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6;
- (void)performConfigurableQuery:(LNConfigurableQueryRequest *)a3 auditToken:(id *)a4 connectionIdentifier:(NSNumber *)a5 completionHandler:(id)a6;
- (void)performQuery:(id)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6;
- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(NSString *)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6;
- (void)performSuggestedResultsQueryWithEntityType:(id)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6;
- (void)releaseAsyncSequence:(LNAsyncSequenceReference *)a3 connectionIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeAllDeferredOutputsFor:(id)a3;
- (void)removeContextForConnection:(id)a3;
- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3;
- (void)updateContextForConnection:(NSXPCConnection *)a3 context:(id)a4 completionHandler:(id)a5;
- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5;
@end

@implementation LNAppContext

- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v10 = self;

  sub_236569A04((uint64_t)&unk_26885C548, (uint64_t)v9);
}

- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;

  sub_236569A04((uint64_t)&unk_26885CC78, (uint64_t)v7);
}

- (void)fetchViewActionsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_236569A04((uint64_t)&unk_26885CC68, v5);
}

- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  v10 = self;

  sub_236569A04((uint64_t)&unk_26885CC58, (uint64_t)v9);
}

- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;

  sub_236569A04((uint64_t)&unk_26885D0D8, v5);
}

- (void)updateContextForConnection:(NSXPCConnection *)a3 context:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;

  sub_236569A04((uint64_t)&unk_26885D908, (uint64_t)v9);
}

- (void)removeContextForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AppContext.removeContext(connection:)((NSXPCConnection)v4);
}

- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_23666A880();
  _Block_copy(v5);
  v7 = self;
  sub_23631C680(v6, (uint64_t)v7, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)createAsyncIteratorForSequence:(LNAsyncSequenceReference *)a3 options:(id)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = self;

  sub_236569A04((uint64_t)&unk_26885E9E0, (uint64_t)v11);
}

- (void)nextAsyncIteratorResults:(LNAsyncIteratorReference *)a3 connectionIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)releaseAsyncSequence:(LNAsyncSequenceReference *)a3 connectionIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;

  sub_236569A04((uint64_t)&unk_26885F278, v5);
}

- (void)fetchSuggestedActionsWithSiriLanguageCode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_236569A04((uint64_t)&unk_26885F268, (uint64_t)v7);
}

- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;

  sub_236569A04((uint64_t)&unk_26885F258, (uint64_t)v7);
}

- (void)fetchActionForAutoShortcutPhrase:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)fetchActionForAppShortcutIdentifier:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)performAction:(id)a3 options:(id)a4 reportingProgress:(NSProgress *)a5 delegate:(LNPerformActionExecutorDelegate *)a6 auditToken:(id *)a7 completionHandler:(id)a8
{
  long long v17 = *(_OWORD *)&a7->var0[4];
  long long v18 = *(_OWORD *)a7->var0;
  v13 = _Block_copy(a8);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = a4;
  *(void *)(v14 + 32) = a5;
  *(void *)(v14 + 40) = a6;
  *(_OWORD *)(v14 + 48) = v18;
  *(_OWORD *)(v14 + 64) = v17;
  *(void *)(v14 + 80) = v13;
  *(void *)(v14 + 88) = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = a5;
  swift_unknownObjectRetain();
  v16 = self;

  sub_236569A04((uint64_t)&unk_268860070, v14);
}

- (void)performQuery:(id)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
  long long v12 = *(_OWORD *)&a4->var0[4];
  long long v13 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v13;
  *(_OWORD *)(v10 + 40) = v12;
  *(void *)(v10 + 56) = a5;
  *(void *)(v10 + 64) = v9;
  *(void *)(v10 + 72) = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;

  sub_236569A04((uint64_t)&unk_268860248, v10);
}

- (void)performSuggestedResultsQueryWithEntityType:(id)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
  long long v12 = *(_OWORD *)&a4->var0[4];
  long long v13 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v13;
  *(_OWORD *)(v10 + 40) = v12;
  *(void *)(v10 + 56) = a5;
  *(void *)(v10 + 64) = v9;
  *(void *)(v10 + 72) = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;

  sub_236569A04((uint64_t)&unk_268860238, v10);
}

- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(NSString *)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
}

- (void)performAllEntitiesQueryWithEntityMangledTypeName:(NSString *)a3 auditToken:(id *)a4 connectionIdentifier:(id)a5 completionHandler:(id)a6
{
}

- (void)performConfigurableQuery:(LNConfigurableQueryRequest *)a3 auditToken:(id *)a4 connectionIdentifier:(NSNumber *)a5 completionHandler:(id)a6
{
  long long v14 = *(_OWORD *)&a4->var0[4];
  long long v15 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v15;
  *(_OWORD *)(v10 + 40) = v14;
  *(void *)(v10 + 56) = a5;
  *(void *)(v10 + 64) = v9;
  *(void *)(v10 + 72) = self;
  v11 = a3;
  long long v12 = a5;
  long long v13 = self;

  sub_236569A04((uint64_t)&unk_268860208, v10);
}

- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v10 = self;

  sub_236569A04((uint64_t)&unk_268860950, (uint64_t)v9);
}

- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;

  sub_236569A04((uint64_t)&unk_268862D38, (uint64_t)v7);
}

- (void)fetchActionListenerEndpoint:(LNAction *)a3 auditToken:(id *)a4 connectionIdentifier:(int64_t)a5 completionHandler:(id)a6
{
  long long v13 = *(_OWORD *)&a4->var0[4];
  long long v14 = *(_OWORD *)a4->var0;
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(_OWORD *)(v10 + 24) = v14;
  *(_OWORD *)(v10 + 40) = v13;
  *(void *)(v10 + 56) = a5;
  *(void *)(v10 + 64) = v9;
  *(void *)(v10 + 72) = self;
  v11 = a3;
  long long v12 = self;

  sub_236569A04((uint64_t)&unk_268863650, v10);
}

- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;

  sub_236569A04((uint64_t)&unk_268863AB0, (uint64_t)v7);
}

- (void)fetchURLForEnumWithIdentifier:(NSString *)a3 caseIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  uint64_t v10 = a3;
  v11 = a4;
  long long v12 = self;

  sub_236569A04((uint64_t)&unk_268863D28, (uint64_t)v9);
}

- (void)fetchURLsForEnumWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_236569A04((uint64_t)&unk_268863D18, (uint64_t)v7);
}

- (void)fetchDisplayRepresentationForActions:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;

  sub_236569A04((uint64_t)&unk_268863D68, (uint64_t)v7);
}

- (void)fetchActionAppContextForAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;

  sub_236569A04((uint64_t)&unk_268864330, (uint64_t)v7);
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken
{
  return ($115C4C562B26FF47E01F9F4EA65B5887 *)static AppContext.currentAuditToken()();
}

+ (void)cancelTimeout
{
}

+ (void)extendTimeout
{
}

- (LNAppContext)init
{
  return (LNAppContext *)AppContext.init()();
}

- (void)fetchActionOutputValueForConnection:(NSXPCConnection *)a3 withIdentifier:(NSUUID *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  uint64_t v10 = a3;
  v11 = a4;
  long long v12 = self;

  sub_236569A04((uint64_t)&unk_2688646F0, (uint64_t)v9);
}

- (void)removeAllDeferredOutputsFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AppContext.removeAllDeferredOutputs(for:)((NSXPCConnection)v4);
}

- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;

  sub_236569A04((uint64_t)&unk_2688659A0, v5);
}

- (void)fetchValueForPropertyWithIdentifier:(NSString *)a3 entity:(id)a4 auditToken:(id *)a5 connectionIdentifier:(int64_t)a6 completionHandler:(id)a7
{
  long long v15 = *(_OWORD *)&a5->var0[4];
  long long v16 = *(_OWORD *)a5->var0;
  v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  *(_OWORD *)(v12 + 32) = v16;
  *(_OWORD *)(v12 + 48) = v15;
  *(void *)(v12 + 64) = a6;
  *(void *)(v12 + 72) = v11;
  *(void *)(v12 + 80) = self;
  long long v13 = a3;
  swift_unknownObjectRetain();
  long long v14 = self;

  sub_236569A04((uint64_t)&unk_2688659C8, v12);
}

- (void)exportTransientEntities:(NSArray *)a3 withConfiguration:(LNExportedContentConfiguration *)a4 connectionIdentifier:(NSNumber *)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  uint64_t v12 = a3;
  long long v13 = a4;
  long long v14 = a5;
  long long v15 = self;

  sub_236569A04((uint64_t)&unk_2688659F8, (uint64_t)v11);
}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 connectionIdentifier:(id)a9 completionHandler:(id)a10
{
  long long v17 = _Block_copy(a10);
  long long v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = a7;
  v18[7] = a8;
  v18[8] = a9;
  v18[9] = v17;
  v18[10] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v19 = self;

  sub_236569A04((uint64_t)&unk_2688663A0, (uint64_t)v18);
}

- (void)fetchOptionsDefaultValuesForAction:(id)a3 connectionIdentifier:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v10 = self;

  sub_236569A04((uint64_t)&unk_268866390, (uint64_t)v9);
}

- (void)fetchParameterOptionDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(NSString *)a5 connectionIdentifier:(id)a6 completionHandler:(id)a7
{
  uint64_t v12 = _Block_copy(a7);
  long long v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  long long v14 = a5;
  swift_unknownObjectRetain();
  long long v15 = self;

  sub_236569A04((uint64_t)&unk_268866350, (uint64_t)v13);
}

@end