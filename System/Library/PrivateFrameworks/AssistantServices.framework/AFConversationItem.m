@interface AFConversationItem
- (AFConversationItem)initWithDelegateItem:(id)a3;
- (AFConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 persistentAcrossInvocations:(BOOL)a14 associatedDataStore:(id)a15;
- (AFConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 persistentAcrossInvocations:(BOOL)a12 associatedDataStore:(id)a13;
- (BOOL)isImmersiveExperience;
- (BOOL)isPersistentAcrossInvocations;
- (BOOL)isSupplemental;
- (BOOL)isTransient;
- (BOOL)isVirgin;
- (NSString)description;
- (id)aceCommandIdentifier;
- (id)aceObject;
- (id)associatedDataStore;
- (id)dialogPhase;
- (id)identifier;
- (id)revisionIdentifier;
- (int64_t)presentationState;
- (int64_t)type;
@end

@implementation AFConversationItem

- (void).cxx_destruct
{
}

- (id)associatedDataStore
{
  return [(AFMutableConversationItem *)self->_delegateItem associatedDataStore];
}

- (BOOL)isPersistentAcrossInvocations
{
  return [(AFMutableConversationItem *)self->_delegateItem isPersistentAcrossInvocations];
}

- (BOOL)isImmersiveExperience
{
  return [(AFMutableConversationItem *)self->_delegateItem isImmersiveExperience];
}

- (BOOL)isSupplemental
{
  return [(AFMutableConversationItem *)self->_delegateItem isSupplemental];
}

- (BOOL)isTransient
{
  return [(AFMutableConversationItem *)self->_delegateItem isTransient];
}

- (BOOL)isVirgin
{
  return [(AFMutableConversationItem *)self->_delegateItem isVirgin];
}

- (int64_t)presentationState
{
  return [(AFMutableConversationItem *)self->_delegateItem presentationState];
}

- (id)aceCommandIdentifier
{
  return [(AFMutableConversationItem *)self->_delegateItem aceCommandIdentifier];
}

- (id)dialogPhase
{
  return [(AFMutableConversationItem *)self->_delegateItem dialogPhase];
}

- (id)aceObject
{
  return [(AFMutableConversationItem *)self->_delegateItem aceObject];
}

- (int64_t)type
{
  return [(AFMutableConversationItem *)self->_delegateItem type];
}

- (id)revisionIdentifier
{
  return [(AFMutableConversationItem *)self->_delegateItem revisionIdentifier];
}

- (id)identifier
{
  return [(AFMutableConversationItem *)self->_delegateItem identifier];
}

- (NSString)description
{
  return [(AFMutableConversationItem *)self->_delegateItem description];
}

- (AFConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 persistentAcrossInvocations:(BOOL)a12 associatedDataStore:(id)a13
{
  v16 = (objc_class *)MEMORY[0x1E4F29128];
  id v17 = a13;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = objc_alloc_init(v16);
  id v22 = objc_alloc_init(MEMORY[0x1E4F29128]);
  BYTE4(v25) = a12;
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  v23 = -[AFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v21, v22, a3, v20, v19, a6, v18, v25, v17);

  return v23;
}

- (AFConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 persistentAcrossInvocations:(BOOL)a14 associatedDataStore:(id)a15
{
  id v19 = a15;
  id v20 = a9;
  id v21 = a7;
  id v22 = a6;
  id v23 = a4;
  id v24 = a3;
  BYTE4(v28) = a14;
  BYTE3(v28) = a13;
  *(_WORD *)((char *)&v28 + 1) = __PAIR16__(a12, a11);
  LOBYTE(v28) = a10;
  uint64_t v25 = -[AFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:]([AFMutableConversationItem alloc], "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v24, v23, a5, v22, v21, a8, v20, v28, v19);

  v26 = [(AFConversationItem *)self initWithDelegateItem:v25];
  return v26;
}

- (AFConversationItem)initWithDelegateItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFConversationItem;
  v6 = [(AFConversationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegateItem, a3);
  }

  return v7;
}

@end