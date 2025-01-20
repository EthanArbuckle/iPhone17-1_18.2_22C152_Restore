@interface AFMutableConversationItem
- (AFDataStore)associatedDataStore;
- (AFDialogPhase)dialogPhase;
- (AFMutableConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 persistentAcrossInvocations:(BOOL)a14 associatedDataStore:(id)a15;
- (AFMutableConversationItem)initWithIdentifier:(id)a3 type:(int64_t)a4 aceObject:(id)a5 dialogPhase:(id)a6 presentationState:(int64_t)a7 aceCommandIdentifier:(id)a8 virgin:(BOOL)a9 transient:(BOOL)a10 supplemental:(BOOL)a11 immersiveExperience:(BOOL)a12 persistentAcrossInvocations:(BOOL)a13 associatedDataStore:(id)a14;
- (AFMutableConversationItem)initWithPropertyListRepresentation:(id)a3;
- (AFMutableConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 persistentAcrossInvocations:(BOOL)a12 associatedDataStore:(id)a13;
- (AceObject)aceObject;
- (BOOL)_shouldRedactSpeakableText;
- (BOOL)isImmersiveExperience;
- (BOOL)isPersistentAcrossInvocations;
- (BOOL)isSupplemental;
- (BOOL)isTransient;
- (BOOL)isVirgin;
- (NSString)aceCommandIdentifier;
- (NSString)description;
- (NSUUID)identifier;
- (NSUUID)revisionIdentifier;
- (id)_propertyListStringForPresentationState;
- (id)_propertyListStringForType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertyListRepresentation;
- (int64_t)_presentationStateForPropertyListString:(id)a3;
- (int64_t)_typeForPropertyListString:(id)a3;
- (int64_t)presentationState;
- (int64_t)type;
- (void)_didMutate;
- (void)setAceCommandIdentifier:(id)a3;
- (void)setAceObject:(id)a3;
- (void)setDialogPhase:(id)a3;
- (void)setImmersiveExperience:(BOOL)a3;
- (void)setPersistentAcrossInvocations:(BOOL)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setSupplemental:(BOOL)a3;
- (void)setTransient:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setVirgin:(BOOL)a3;
@end

@implementation AFMutableConversationItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedDataStore, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
  objc_storeStrong((id *)&self->_revisionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (AFDataStore)associatedDataStore
{
  return self->_associatedDataStore;
}

- (void)setPersistentAcrossInvocations:(BOOL)a3
{
  self->_persistentAcrossInvocations = a3;
}

- (BOOL)isPersistentAcrossInvocations
{
  return self->_persistentAcrossInvocations;
}

- (void)setImmersiveExperience:(BOOL)a3
{
  self->_immersiveExperience = a3;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (void)setSupplemental:(BOOL)a3
{
  self->_supplemental = a3;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setAceCommandIdentifier:(id)a3
{
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (AFDialogPhase)dialogPhase
{
  return self->_dialogPhase;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)revisionIdentifier
{
  return self->_revisionIdentifier;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (AFMutableConversationItem)initWithPropertyListRepresentation:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(AFDictionarySchema);
  v6 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v6 forKey:@"Version"];

  v7 = +[AFCoercion stringToUUIDCoercion];
  [(AFDictionarySchema *)v5 setObjectCoercion:v7 forKey:@"Identifier"];

  v8 = +[AFCoercion stringToUUIDCoercion];
  [(AFDictionarySchema *)v5 setObjectCoercion:v8 forKey:@"RevisionIdentifier"];

  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke;
  v70[3] = &unk_1E5924F00;
  v9 = self;
  v71 = v9;
  v10 = +[AFCoercion coercionWithBlock:v70];
  [(AFDictionarySchema *)v5 setObjectCoercion:v10 forKey:@"Type"];

  v11 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v11 forKey:@"AceObject"];

  v12 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v12 forKey:@"AceDialogPhase"];

  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2;
  v68[3] = &unk_1E5924F00;
  v13 = v9;
  v69 = v13;
  v14 = +[AFCoercion coercionWithBlock:v68];
  [(AFDictionarySchema *)v5 setObjectCoercion:v14 forKey:@"PresentationState"];

  v15 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v15 forKey:@"AceCommandIdentifier"];

  v16 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v16 forKey:@"Transient"];

  v17 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v17 forKey:@"Supplemental"];

  v18 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v18 forKey:@"ImmersiveExperience"];

  v19 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  [(AFDictionarySchema *)v5 setObjectCoercion:v19 forKey:@"PersistentAcrossInvocations"];

  id v67 = 0;
  v20 = [(AFDictionarySchema *)v5 coerceObject:v4 error:&v67];
  id v21 = v67;
  if (!v20)
  {
    uint64_t v31 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      v36 = 0;
      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315650;
    v73 = "-[AFMutableConversationItem initWithPropertyListRepresentation:]";
    __int16 v74 = 2114;
    uint64_t v75 = (uint64_t)v21;
    __int16 v76 = 2112;
    id v77 = v4;
    v32 = "%s returning nil; passed invalid property list (%{public}@): %@";
    v33 = v31;
    uint32_t v34 = 32;
LABEL_20:
    _os_log_error_impl(&dword_19CF1D000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
    goto LABEL_10;
  }
  v22 = [v20 objectForKey:@"Version"];
  uint64_t v23 = [v22 integerValue];

  if (v23 != 1)
  {
    uint64_t v35 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315394;
    v73 = "-[AFMutableConversationItem initWithPropertyListRepresentation:]";
    __int16 v74 = 2050;
    uint64_t v75 = v23;
    v32 = "%s unable to deserialize property list with version %{public}ld; returning nil";
    v33 = v35;
    uint32_t v34 = 22;
    goto LABEL_20;
  }
  id v65 = v4;
  uint64_t v62 = [v20 objectForKey:@"Identifier"];
  id v24 = [v20 objectForKey:@"RevisionIdentifier"];
  if (!v24) {
    id v24 = objc_alloc_init(MEMORY[0x1E4F29128]);
  }
  id v61 = v24;
  v25 = [v20 objectForKey:@"Type"];
  uint64_t v26 = [v25 integerValue];

  v27 = (void *)MEMORY[0x1E4F96508];
  v28 = [v20 objectForKey:@"AceObject"];
  uint64_t v29 = [v27 aceObjectWithDictionary:v28];

  uint64_t v30 = [v20 objectForKey:@"AceDialogPhase"];
  id v63 = v21;
  v64 = (void *)v30;
  v60 = (void *)v29;
  v66 = v13;
  if (v30) {
    +[AFDialogPhase dialogPhaseForAceDialogPhase:v30];
  }
  else {
  uint64_t v59 = +[AFDialogPhase userRequestDialogPhase];
  }
  v37 = [v20 objectForKey:@"PresentationState"];
  uint64_t v58 = [v37 integerValue];

  v38 = [v20 objectForKey:@"AceCommandIdentifier"];
  v39 = [v20 objectForKey:@"Transient"];
  char v40 = [v39 BOOLValue];

  v41 = [v20 objectForKey:@"Supplemental"];
  char v42 = [v41 BOOLValue];

  v43 = [v20 objectForKey:@"ImmersiveExperience"];
  char v44 = [v43 BOOLValue];

  v45 = [v20 objectForKey:@"PersistentAcrossInvocations"];
  char v46 = [v45 BOOLValue];

  v47 = [AFDataStore alloc];
  v48 = [v20 objectForKey:@"AssociatedDataStore"];
  v49 = [(AFDataStore *)v47 initWithPropertyListRepresentation:v48];

  if (v49)
  {
    BYTE4(v57) = v46;
    BYTE3(v57) = v44;
    BYTE2(v57) = v42;
    BYTE1(v57) = v40;
    LOBYTE(v57) = 0;
    v51 = v61;
    v50 = (void *)v62;
    uint64_t v52 = v26;
    v54 = (void *)v59;
    v53 = v60;
    v36 = -[AFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](v66, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v62, v61, v52, v60, v59, v58, v38, v57, v49);
    v66 = v36;
    id v21 = v63;
  }
  else
  {
    v55 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v73 = "-[AFMutableConversationItem initWithPropertyListRepresentation:]";
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v65;
      _os_log_error_impl(&dword_19CF1D000, v55, OS_LOG_TYPE_ERROR, "%s returning nil; unable co create associated data store from property list %@",
        buf,
        0x16u);
    }
    v36 = 0;
    v50 = (void *)v62;
    id v21 = v63;
    v53 = v60;
    v51 = v61;
    v54 = (void *)v59;
  }

  id v4 = v65;
  v13 = v66;
LABEL_18:

  return v36;
}

id __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  v7 = [v6 coerceObject:v5 error:a3];

  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_typeForPropertyListString:", v7));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __64__AFMutableConversationItem_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = +[AFCoercion typeAssertionWithClass:objc_opt_class()];
  v7 = [v6 coerceObject:v5 error:a3];

  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "_presentationStateForPropertyListString:", v7));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)propertyListRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:&unk_1EEE966B0 forKey:@"Version"];
  id v4 = [(AFMutableConversationItem *)self identifier];
  id v5 = [v4 UUIDString];
  [v3 setObject:v5 forKey:@"Identifier"];

  v6 = [(AFMutableConversationItem *)self revisionIdentifier];
  v7 = [v6 UUIDString];
  [v3 setObject:v7 forKey:@"RevisionIdentifier"];

  v8 = [(AFMutableConversationItem *)self _propertyListStringForType];
  [v3 setObject:v8 forKey:@"Type"];

  v9 = [(AFMutableConversationItem *)self aceObject];
  v10 = [v9 dictionary];
  [v3 setObject:v10 forKey:@"AceObject"];

  v11 = [(AFMutableConversationItem *)self dialogPhase];
  v12 = [v11 aceDialogPhaseValue];

  if (v12) {
    [v3 setObject:v12 forKey:@"AceDialogPhase"];
  }
  v13 = [(AFMutableConversationItem *)self _propertyListStringForPresentationState];
  [v3 setObject:v13 forKey:@"PresentationState"];

  v14 = [(AFMutableConversationItem *)self aceCommandIdentifier];
  if (v14) {
    [v3 setObject:v14 forKey:@"AceCommandIdentifier"];
  }
  v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFMutableConversationItem isTransient](self, "isTransient"));
  [v3 setObject:v15 forKey:@"Transient"];

  v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFMutableConversationItem isSupplemental](self, "isSupplemental"));
  [v3 setObject:v16 forKey:@"Supplemental"];

  v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFMutableConversationItem isImmersiveExperience](self, "isImmersiveExperience"));
  [v3 setObject:v17 forKey:@"ImmersiveExperience"];

  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFMutableConversationItem isPersistentAcrossInvocations](self, "isPersistentAcrossInvocations"));
  [v3 setObject:v18 forKey:@"PersistentAcrossInvocations"];

  v19 = [(AFMutableConversationItem *)self associatedDataStore];
  v20 = [v19 propertyListRepresentation];

  [v3 setObject:v20 forKey:@"AssociatedDataStore"];
  return v3;
}

- (int64_t)_presentationStateForPropertyListString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Committed"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Provisional"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cancelled"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_propertyListStringForPresentationState
{
  int64_t v2 = [(AFMutableConversationItem *)self presentationState];
  if ((unint64_t)(v2 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5924F98[v2 - 1];
  }
}

- (int64_t)_typeForPropertyListString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"RecognizedSpeech"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"View"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"PartialSpeechResult"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Help"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"AcousticID Spinner"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_propertyListStringForType
{
  int64_t v2 = [(AFMutableConversationItem *)self type];
  if ((unint64_t)(v2 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5924F70[v2 - 1];
  }
}

- (BOOL)_shouldRedactSpeakableText
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(AFMutableConversationItem *)self aceObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v3) = [v2 canUseServerTTS] ^ 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v3 = objc_msgSend(v2, "views", 0);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v10;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v3);
            }
            if (![*(id *)(*((void *)&v9 + 1) + 8 * i) canUseServerTTS])
            {

              LOBYTE(v3) = 1;
              goto LABEL_5;
            }
          }
          uint64_t v6 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
    LOBYTE(v3) = 0;
  }
LABEL_5:

  return (char)v3;
}

- (void)setDialogPhase:(id)a3
{
  objc_storeStrong((id *)&self->_dialogPhase, a3);
  [(AFMutableConversationItem *)self _didMutate];
}

- (void)setAceObject:(id)a3
{
  objc_storeStrong((id *)&self->_aceObject, a3);
  [(AFMutableConversationItem *)self _didMutate];
}

- (void)_didMutate
{
  id v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
  revisionIdentifier = self->_revisionIdentifier;
  self->_revisionIdentifier = v3;
}

- (NSString)description
{
  unint64_t v3 = [(AFMutableConversationItem *)self type];
  if (v3 > 5) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = off_1E5924F20[v3];
  }
  unint64_t v5 = [(AFMutableConversationItem *)self presentationState];
  if (v5 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E5924F50[v5];
  }
  uint64_t v7 = [(AFMutableConversationItem *)self aceObject];
  uint64_t v8 = objc_msgSend(v7, "af_dialogIdentifier");

  if (v8)
  {
    [NSString stringWithFormat:@", dialogIdentifier=%@", v8];
    uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v26 = &stru_1EEE35D28;
  }
  if ([(AFMutableConversationItem *)self _shouldRedactSpeakableText])
  {
    long long v9 = @"<private>";
    long long v10 = @"<private>";
LABEL_13:
    [NSString stringWithFormat:@", dialogText=\"%@\"", v9];
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  long long v11 = [(AFMutableConversationItem *)self aceObject];
  objc_msgSend(v11, "af_text");
  long long v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  long long v12 = [(AFMutableConversationItem *)self aceObject];
  objc_msgSend(v12, "af_speakableText");
  long long v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    goto LABEL_13;
  }
  v13 = &stru_1EEE35D28;
LABEL_15:
  v33 = v4;
  uint32_t v34 = (void *)v8;
  v32 = v6;
  if (v10)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%@, speakableText=\"%@\"", v13, v10];

    v25 = (void *)v14;
  }
  else
  {
    v25 = v13;
  }
  uint64_t v29 = NSString;
  uint64_t v31 = [(AFMutableConversationItem *)self identifier];
  v28 = [v31 UUIDString];
  uint64_t v30 = [(AFMutableConversationItem *)self revisionIdentifier];
  v15 = [v30 UUIDString];
  v16 = [(AFMutableConversationItem *)self aceObject];
  uint64_t v27 = objc_opt_class();
  v17 = [(AFMutableConversationItem *)self dialogPhase];
  v18 = [(AFMutableConversationItem *)self aceCommandIdentifier];
  if ([(AFMutableConversationItem *)self isTransient]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  if ([(AFMutableConversationItem *)self isSupplemental]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  if ([(AFMutableConversationItem *)self isImmersiveExperience]) {
    id v21 = @"YES";
  }
  else {
    id v21 = @"NO";
  }
  if ([(AFMutableConversationItem *)self isPersistentAcrossInvocations]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  objc_msgSend(v29, "stringWithFormat:", @"<ConversationItem %p; %@ (revision %@): type=%@, aceObject=%@, dialogPhase=%@, presentationState=%@, aceCommandIdentifier=%@%@%@, transient=%@, supplemental=%@, immersiveExperience=%@, persistentAcrossInvocations=%@>",
    self,
    v28,
    v15,
    v33,
    v27,
    v17,
    v32,
    v18,
    v26,
    v25,
    v19,
    v20,
    v21,
  uint64_t v23 = v22);

  return (NSString *)v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20 = [AFConversationItem alloc];
  v19 = [(AFMutableConversationItem *)self identifier];
  v18 = [(AFMutableConversationItem *)self revisionIdentifier];
  int64_t v17 = [(AFMutableConversationItem *)self type];
  int64_t v4 = [(AFMutableConversationItem *)self aceObject];
  unint64_t v5 = [(AFMutableConversationItem *)self dialogPhase];
  int64_t v6 = [(AFMutableConversationItem *)self presentationState];
  uint64_t v7 = [(AFMutableConversationItem *)self aceCommandIdentifier];
  BOOL v8 = [(AFMutableConversationItem *)self isVirgin];
  BOOL v9 = [(AFMutableConversationItem *)self isTransient];
  BOOL v10 = [(AFMutableConversationItem *)self isSupplemental];
  BOOL v11 = [(AFMutableConversationItem *)self isImmersiveExperience];
  BOOL v12 = [(AFMutableConversationItem *)self isPersistentAcrossInvocations];
  v13 = [(AFMutableConversationItem *)self associatedDataStore];
  BYTE4(v16) = v12;
  BYTE3(v16) = v11;
  BYTE2(v16) = v10;
  BYTE1(v16) = v9;
  LOBYTE(v16) = v8;
  uint64_t v14 = -[AFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](v20, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v19, v18, v17, v4, v5, v6, v7, v16, v13);

  return v14;
}

- (AFMutableConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 persistentAcrossInvocations:(BOOL)a12 associatedDataStore:(id)a13
{
  int64_t v17 = (objc_class *)MEMORY[0x1E4F29128];
  id v18 = a13;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v22 = objc_alloc_init(v17);
  BYTE4(v25) = a12;
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  uint64_t v23 = -[AFMutableConversationItem initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](self, "initWithIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v22, a3, v21, v20, a6, v19, v25, v18);

  return v23;
}

- (AFMutableConversationItem)initWithIdentifier:(id)a3 type:(int64_t)a4 aceObject:(id)a5 dialogPhase:(id)a6 presentationState:(int64_t)a7 aceCommandIdentifier:(id)a8 virgin:(BOOL)a9 transient:(BOOL)a10 supplemental:(BOOL)a11 immersiveExperience:(BOOL)a12 persistentAcrossInvocations:(BOOL)a13 associatedDataStore:(id)a14
{
  id v18 = (objc_class *)MEMORY[0x1E4F29128];
  id v19 = a14;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  id v23 = a3;
  id v24 = objc_alloc_init(v18);
  BYTE4(v27) = a13;
  BYTE3(v27) = a12;
  BYTE2(v27) = a11;
  LOWORD(v27) = __PAIR16__(a10, a9);
  uint64_t v25 = -[AFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:persistentAcrossInvocations:associatedDataStore:", v23, v24, a4, v22, v21, a7, v20, v27, v19);

  return v25;
}

- (AFMutableConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 persistentAcrossInvocations:(BOOL)a14 associatedDataStore:(id)a15
{
  id v34 = a3;
  id v20 = a4;
  id v21 = a6;
  id v22 = a7;
  id v23 = a9;
  id v24 = a15;
  v35.receiver = self;
  v35.super_class = (Class)AFMutableConversationItem;
  uint64_t v25 = [(AFMutableConversationItem *)&v35 init];
  if (v25)
  {
    uint64_t v26 = [v34 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSUUID *)v26;

    uint64_t v28 = [v20 copy];
    revisionIdentifier = v25->_revisionIdentifier;
    v25->_revisionIdentifier = (NSUUID *)v28;

    v25->_type = a5;
    objc_storeStrong((id *)&v25->_aceObject, a6);
    objc_storeStrong((id *)&v25->_dialogPhase, a7);
    v25->_presentationState = a8;
    uint64_t v30 = [v23 copy];
    aceCommandIdentifier = v25->_aceCommandIdentifier;
    v25->_aceCommandIdentifier = (NSString *)v30;

    v25->_virgin = a10;
    v25->_transient = a11;
    v25->_supplemental = a12;
    v25->_immersiveExperience = a13;
    v25->_persistentAcrossInvocations = a14;
    objc_storeStrong((id *)&v25->_associatedDataStore, a15);
  }

  return v25;
}

@end