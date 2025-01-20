@interface CNPRUISIncomingCallSnapshotDefinition
+ (id)compositeSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4;
+ (id)contentsAndObscurableContentSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4;
+ (id)contentsAndOverlayContentSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4;
+ (id)contentsOnlySnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4;
- (CNPRUISIncomingCallSnapshotDefinition)initWithWrappedDefinition:(id)a3;
- (PRUISIncomingCallSnapshotDefinition)wrappedDefinition;
- (id)levelSets;
@end

@implementation CNPRUISIncomingCallSnapshotDefinition

- (void).cxx_destruct
{
}

- (PRUISIncomingCallSnapshotDefinition)wrappedDefinition
{
  return self->_wrappedDefinition;
}

- (id)levelSets
{
  v2 = [(PRUISIncomingCallSnapshotDefinition *)self->_wrappedDefinition levelSets];
  v3 = objc_msgSend(v2, "_cn_map:", &__block_literal_global_316);

  return v3;
}

CNPRPosterLevelSet *__50__CNPRUISIncomingCallSnapshotDefinition_levelSets__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CNPRPosterLevelSet alloc] initWithWrappedLevelSet:v2];

  return v3;
}

- (CNPRUISIncomingCallSnapshotDefinition)initWithWrappedDefinition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRUISIncomingCallSnapshotDefinition;
  v6 = [(CNPRUISIncomingCallSnapshotDefinition *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedDefinition, a3);
  }

  return v7;
}

+ (id)contentsOnlySnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  v6 = (Class (__cdecl *)())getPRUISIncomingCallSnapshotDefinitionClass[0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc(v6());
  v10 = getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly[0]();
  v11 = [v8 wrappedIncomingCallPosterContext];

  v12 = (void *)[v9 initWithBaseIdentifier:v10 context:v11 attachmentUniqueIdentifiers:v7];
  v13 = (void *)[objc_alloc((Class)a1) initWithWrappedDefinition:v12];

  return v13;
}

+ (id)contentsAndOverlayContentSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  v6 = getPRUISIncomingCallSnapshotDefinitionClass[0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)v6());
  v10 = getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay[0]();
  v11 = [v8 wrappedIncomingCallPosterContext];

  v12 = (void *)[v9 initWithBaseIdentifier:v10 context:v11 attachmentUniqueIdentifiers:v7];
  v13 = (void *)[objc_alloc((Class)a1) initWithWrappedDefinition:v12];

  return v13;
}

+ (id)contentsAndObscurableContentSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  v6 = getPRUISIncomingCallSnapshotDefinitionClass[0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)v6());
  v10 = getPRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView[0]();
  v11 = [v8 wrappedIncomingCallPosterContext];

  v12 = (void *)[v9 initWithBaseIdentifier:v10 context:v11 attachmentUniqueIdentifiers:v7];
  v13 = (void *)[objc_alloc((Class)a1) initWithWrappedDefinition:v12];

  return v13;
}

+ (id)compositeSnapshotDefinitionWithContext:(id)a3 attachmentIdentifiers:(id)a4
{
  v6 = getPRUISIncomingCallSnapshotDefinitionClass[0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)v6());
  v10 = getPRPosterSnapshotDefinitionIdentifierIncomingCallComposite[0]();
  v11 = [v8 wrappedIncomingCallPosterContext];

  v12 = (void *)[v9 initWithBaseIdentifier:v10 context:v11 attachmentUniqueIdentifiers:v7];
  v13 = (void *)[objc_alloc((Class)a1) initWithWrappedDefinition:v12];

  return v13;
}

@end