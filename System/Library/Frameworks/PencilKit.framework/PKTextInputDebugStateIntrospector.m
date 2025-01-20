@interface PKTextInputDebugStateIntrospector
+ (id)_knownInstances;
+ (id)debugStateLineDescriptionForIntrospectable:(id)a3;
+ (void)debugStateDidChange;
- (BOOL)debugStateCanShowDetailsForStateKey:(id)a3;
- (PKTextInputDebugStateIntrospector)initWithInteraction:(id)a3;
- (PKTextInputDebugStateIntrospectorDelegate)delegate;
- (PKTextInputInteraction)interaction;
- (id)_introspectableForStateKey:(id)a3;
- (id)debugStateDescriptionForStateKey:(id)a3;
- (id)debugStateDetailViewControllerForStateKey:(id)a3;
- (id)debugStateKeys;
- (id)debugStateTitleForStateKey:(id)a3;
- (id)fullDebugStateDescription;
- (void)_debugStateDidChange;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation PKTextInputDebugStateIntrospector

- (PKTextInputDebugStateIntrospector)initWithInteraction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputDebugStateIntrospector;
  v5 = [(PKTextInputDebugStateIntrospector *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interaction, v4);
    v7 = [(id)objc_opt_class() _knownInstances];
    [v7 addObject:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(id)objc_opt_class() _knownInstances];
  [v3 removeObject:self];

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputDebugStateIntrospector;
  [(PKTextInputDebugStateIntrospector *)&v4 dealloc];
}

+ (id)_knownInstances
{
  if (qword_1EB3C6220 != -1) {
    dispatch_once(&qword_1EB3C6220, &__block_literal_global_75);
  }
  v2 = (void *)_MergedGlobals_155;

  return v2;
}

void __52__PKTextInputDebugStateIntrospector__knownInstances__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] hashTableWithWeakObjects];
  v1 = (void *)_MergedGlobals_155;
  _MergedGlobals_155 = v0;
}

+ (id)debugStateLineDescriptionForIntrospectable:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKTextInputDebugStateIntrospector_debugStateLineDescriptionForIntrospectable___block_invoke;
  v9[3] = &unk_1E64CA4E0;
  id v10 = v5;
  id v6 = v5;
  [v4 reportDebugStateDescription:v9];

  v7 = [v6 componentsJoinedByString:@", "];

  return v7;
}

void __80__PKTextInputDebugStateIntrospector_debugStateLineDescriptionForIntrospectable___block_invoke(uint64_t a1, uint64_t a2, __CFString *a3)
{
  id v4 = @"(nil)";
  if (a3) {
    id v4 = a3;
  }
  id v5 = [NSString stringWithFormat:@"%@: %@", a2, v4];
  [*(id *)(a1 + 32) addObject:v5];
}

- (id)fullDebugStateDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(PKTextInputDebugStateIntrospector *)self debugStateKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [(PKTextInputDebugStateIntrospector *)self debugStateTitleForStateKey:v9];
        v11 = [(PKTextInputDebugStateIntrospector *)self debugStateDescriptionForStateKey:v9];
        v12 = [v11 string];
        [v3 appendFormat:@"== %@ ==\n%@\n\n", v10, v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (void)debugStateDidChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(a1, "_knownInstances", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _debugStateDidChange];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_debugStateDidChange
{
  id v3 = [(PKTextInputDebugStateIntrospector *)self delegate];
  [v3 debugStateIntrospectorContentDidChange:self];
}

- (id)debugStateKeys
{
  if (qword_1EB3C6230 != -1) {
    dispatch_once(&qword_1EB3C6230, &__block_literal_global_18);
  }
  v2 = (void *)qword_1EB3C6228;

  return v2;
}

void __51__PKTextInputDebugStateIntrospector_debugStateKeys__block_invoke()
{
  uint64_t v0 = (void *)qword_1EB3C6228;
  qword_1EB3C6228 = (uint64_t)&unk_1F200EF88;
}

- (id)debugStateTitleForStateKey:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)debugStateDetailViewControllerForStateKey:(id)a3
{
  id v3 = [(PKTextInputDebugStateIntrospector *)self _introspectableForStateKey:a3];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 debugStateDetailViewController];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)debugStateCanShowDetailsForStateKey:(id)a3
{
  id v3 = [(PKTextInputDebugStateIntrospector *)self _introspectableForStateKey:a3];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 debugStateCanDisplayDetails];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)debugStateDescriptionForStateKey:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKTextInputDebugStateIntrospector *)self _introspectableForStateKey:a3];
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  char v4 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
  v16[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PKTextInputDebugStateIntrospector_debugStateDescriptionForStateKey___block_invoke;
  v12[3] = &unk_1E64CA508;
  id v13 = v5;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  [v3 reportDebugStateDescription:v12];
  if ((unint64_t)[v7 length] >= 2) {
    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 1, 1);
  }
  long long v9 = v14;
  id v10 = v7;

  return v10;
}

void __70__PKTextInputDebugStateIntrospector_debugStateDescriptionForStateKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  long long v9 = [NSString stringWithFormat:@"%@: ", v7];

  id v15 = (id)[v8 initWithString:v9 attributes:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) appendAttributedString:v15];
  id v10 = *(void **)(a1 + 40);
  id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v12 = @"(nil)";
  if (v6) {
    uint64_t v12 = v6;
  }
  id v13 = [NSString stringWithFormat:@"%@\n", v12];

  id v14 = (void *)[v11 initWithString:v13 attributes:0];
  [v10 appendAttributedString:v14];
}

- (id)_introspectableForStateKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Interaction Controller"])
  {
    uint64_t v5 = [(PKTextInputDebugStateIntrospector *)self interaction];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Actions Logging"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    uint64_t v7 = [v6 debugLogController];
LABEL_11:
    uint64_t v5 = (void *)v7;
LABEL_12:

    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"Canvas Controller"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    uint64_t v7 = [v6 canvasController];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Gesture Recognizer"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    uint64_t v7 = [v6 drawingGestureRecognizer];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Handwriting Controller"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    uint64_t v7 = [v6 handwritingController];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Active Input Target"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    long long v9 = [v6 handwritingController];
    uint64_t v10 = [v9 debugActiveInputTargetState];
LABEL_20:
    uint64_t v5 = (void *)v10;

    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Recognition Manager"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    long long v9 = [v6 handwritingController];
    uint64_t v10 = [v9 debugRecognitionManager];
    goto LABEL_20;
  }
  if ([v4 isEqualToString:@"Cursor Controller"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    uint64_t v7 = [v6 cursorController];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Reserve Space Controller"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    uint64_t v7 = [v6 reserveSpaceController];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Elements Controller"])
  {
    id v6 = [(PKTextInputDebugStateIntrospector *)self interaction];
    uint64_t v7 = [v6 elementsController];
    goto LABEL_11;
  }
  uint64_t v5 = 0;
LABEL_13:

  return v5;
}

- (PKTextInputInteraction)interaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);

  return (PKTextInputInteraction *)WeakRetained;
}

- (PKTextInputDebugStateIntrospectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputDebugStateIntrospectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_interaction);
}

@end