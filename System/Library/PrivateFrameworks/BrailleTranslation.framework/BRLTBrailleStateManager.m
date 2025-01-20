@interface BRLTBrailleStateManager
- (BOOL)_deleteBrailleCharSilently:(BOOL)a3;
- (BOOL)_forwardDeleteBrailleCharSilently:(BOOL)a3;
- (BOOL)_generateBrailleBuffer:(BOOL)a3;
- (BOOL)_generateBrailleBufferForDelete;
- (BOOL)_selectionIsValidForDelete;
- (BOOL)_selectionIsValidForInsert;
- (BOOL)_setBrailleSelection:(_NSRange)a3 newScriptLocation:(unint64_t *)a4;
- (BOOL)deleteBrailleChar;
- (BOOL)deleteBrailleCharSilently;
- (BOOL)editable;
- (BOOL)forwardDeleteBrailleChar;
- (BOOL)forwardDeleteBrailleCharSilently;
- (BOOL)isTerminalOutput;
- (BRLTBrailleBuffer)brailleBuffer;
- (BRLTBrailleStateManager)initWithDelegate:(id)a3 translationDelegate:(id)a4;
- (_NSRange)_brailleRangeForTextRange:(_NSRange)a3 textPositions:(id)a4 brailleLength:(unint64_t)a5;
- (_NSRange)_textRangeForBrailleRange:(_NSRange)a3 textPositions:(id)a4 scriptLength:(int64_t)a5;
- (_NSRange)backwardEditingAtomForScriptString:(id)a3;
- (_NSRange)brailleFocus;
- (_NSRange)brailleRangeForScriptRange:(_NSRange)a3;
- (_NSRange)brailleSelection;
- (_NSRange)brailleSuggestion;
- (_NSRange)deleteMergeAtomForScriptString:(id)a3;
- (_NSRange)forwardEditingAtomForScriptString:(id)a3;
- (_NSRange)scriptEditingRange;
- (_NSRange)scriptRangeForBrailleRange:(_NSRange)a3;
- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:(unint64_t)a3;
- (id)brailleDisplayString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)outputScriptString;
- (id)translationDelegate;
- (unint64_t)brailleLocationForScriptLocation:(unint64_t)a3;
- (unint64_t)inputTranslationMode;
- (unint64_t)outputTranslationMode;
- (unint64_t)scriptLocationForBrailleLocation:(unint64_t)a3;
- (void)_generateBrailleBufferForInsert;
- (void)_translate:(BOOL)a3;
- (void)insertBrailleChar:(id)a3;
- (void)insertBrailleChar:(id)a3 modifiers:(id)a4;
- (void)insertBrailleChar:(id)a3 modifiers:(id)a4 silently:(BOOL)a5;
- (void)insertBrailleChar:(id)a3 silently:(BOOL)a4;
- (void)setBrailleSelection:(_NSRange)a3;
- (void)setBrailleSelection:(_NSRange)a3 needsForwardToScreenReader:(BOOL *)a4 newScriptLocation:(unint64_t *)a5;
- (void)setDelegate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setInputTranslationMode:(unint64_t)a3;
- (void)setIsTerminalOutput:(BOOL)a3;
- (void)setOutputTranslationMode:(unint64_t)a3;
- (void)setScriptString:(id)a3;
- (void)setTranslationDelegate:(id)a3;
- (void)translate;
- (void)translateForced:(BOOL)a3;
@end

@implementation BRLTBrailleStateManager

- (BRLTBrailleStateManager)initWithDelegate:(id)a3 translationDelegate:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)BRLTBrailleStateManager;
  id v5 = a4;
  id v6 = a3;
  v7 = [(BRLTBrailleStateManager *)&v15 init];
  v8 = objc_alloc_init(BRLTBrailleBuffer);
  v9 = (void *)*((void *)v7 + 2);
  *((void *)v7 + 2) = v8;

  objc_storeWeak((id *)v7 + 27, v6);
  objc_storeWeak((id *)v7 + 28, v5);

  *((_OWORD *)v7 + 10) = xmmword_21C58CB40;
  *((_OWORD *)v7 + 11) = xmmword_21C58CB40;
  *((_OWORD *)v7 + 12) = xmmword_21C58CB40;
  *(_OWORD *)(v7 + 232) = xmmword_21C58CB40;
  id v10 = objc_alloc_init(MEMORY[0x263F08AE0]);
  v11 = (void *)*((void *)v7 + 31);
  *((void *)v7 + 31) = v10;

  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "array", v15.receiver, v15.super_class);
  v13 = (void *)*((void *)v7 + 32);
  *((void *)v7 + 32) = v12;

  return (BRLTBrailleStateManager *)v7;
}

- (void)setDelegate:(id)a3
{
  apiLock = self->_apiLock;
  id v5 = a3;
  [(NSRecursiveLock *)apiLock lock];
  objc_storeWeak((id *)&self->_delegate, v5);

  id v6 = self->_apiLock;
  [(NSRecursiveLock *)v6 unlock];
}

- (void)setTranslationDelegate:(id)a3
{
  apiLock = self->_apiLock;
  id v5 = a3;
  [(NSRecursiveLock *)apiLock lock];
  objc_storeWeak((id *)&self->_translationDelegate, v5);

  id v6 = self->_apiLock;
  [(NSRecursiveLock *)v6 unlock];
}

- (id)translationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  return WeakRetained;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  p_translationDelegate = &self->_translationDelegate;
  id v8 = objc_loadWeakRetained((id *)&self->_translationDelegate);
  uint64_t v9 = [v5 initWithDelegate:WeakRetained translationDelegate:v8];

  objc_storeStrong((id *)(v9 + 8), self->_scriptString);
  id v10 = [(BRLTBrailleBuffer *)self->_brailleBuffer copyWithZone:a3];
  v11 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v10;

  objc_storeStrong((id *)(v9 + 24), self->_staticBrailleString);
  *(_NSRange *)(v9 + 32) = self->_scriptForwardEditingRegion;
  *(_NSRange *)(v9 + 48) = self->_scriptBackwardEditingRegion;
  *(_NSRange *)(v9 + 64) = self->_scriptMergeEditingRegion;
  *(_NSRange *)(v9 + 80) = self->_brailleForwardEditingRegion;
  *(_NSRange *)(v9 + 96) = self->_brailleBackwardEditingRegion;
  *(_NSRange *)(v9 + 112) = self->_brailleMergeEditingRegion;
  *(_NSRange *)(v9 + 128) = self->_activeScriptEditingRegion;
  *(_NSRange *)(v9 + 144) = self->_activeBrailleEditingRegion;
  *(_NSRange *)(v9 + 160) = self->_brailleSelection;
  *(_NSRange *)(v9 + 176) = self->_brailleFocus;
  *(_NSRange *)(v9 + 160) = self->_brailleSelection;
  *(unsigned char *)(v9 + 208) = self->_brailleDirty;
  *(unsigned char *)(v9 + 209) = self->_scriptDirty;
  *(void *)(v9 + 280) = self->_inputTranslationMode;
  *(void *)(v9 + 288) = self->_outputTranslationMode;
  id v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak((id *)(v9 + 216), v12);

  id v13 = objc_loadWeakRetained((id *)p_translationDelegate);
  objc_storeWeak((id *)(v9 + 224), v13);

  return (id)v9;
}

- (BRLTBrailleBuffer)brailleBuffer
{
  return self->_brailleBuffer;
}

- (void)setScriptString:(id)a3
{
  id v5 = a3;
  [(NSRecursiveLock *)self->_apiLock lock];
  id v6 = [v5 string];
  p_scriptString = &self->_scriptString;
  id v8 = [(BRLTScriptString *)self->_scriptString string];
  if ([v6 isEqual:v8])
  {
    uint64_t v9 = [v5 selection];
    uint64_t v11 = v10;
    BOOL v14 = v9 != [(BRLTScriptString *)*p_scriptString selection] || v11 != v12;
  }
  else
  {
    BOOL v14 = 1;
  }

  BOOL v15 = self->_pendingScriptSelection.location != 0x7FFFFFFFFFFFFFFFLL
     && ([v5 selection] != self->_pendingScriptSelection.location
      || v16 != self->_pendingScriptSelection.length);
  if (!v14 && !v15 && !self->_scriptDirty)
  {
    v27 = BRLTLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C554000, v27, OS_LOG_TYPE_INFO, "setScriptString: not processing the input since it is identical to the current script string.", buf, 2u);
    }

    v28 = (BRLTScriptString *)[v5 copy];
    scriptString = self->_scriptString;
    self->_scriptString = v28;

    [(NSMutableArray *)self->_runningScriptStringHistory removeAllObjects];
    goto LABEL_34;
  }
  if (self->_brailleDirty) {
    goto LABEL_34;
  }
  if (CFAbsoluteTimeGetCurrent() - self->_lastScriptStringOutputTime >= 5.0)
  {
LABEL_23:
    v19 = [v5 string];
    v20 = [(BRLTScriptString *)*p_scriptString string];
    if ([v19 isEqualToString:v20]
      && [v5 selection] == self->_pendingScriptSelection.location
      && v21 == self->_pendingScriptSelection.length)
    {
      v22 = [v5 textFormattingRanges];
      uint64_t v23 = [(BRLTScriptString *)*p_scriptString textFormattingRanges];
      if (v22 == (void *)v23)
      {

        goto LABEL_34;
      }
      v24 = (void *)v23;
      v25 = [v5 textFormattingRanges];
      v26 = [(BRLTScriptString *)*p_scriptString textFormattingRanges];
      char v31 = [v25 isEqual:v26];

      if (v31) {
        goto LABEL_34;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_scriptString, a3);
    self->_scriptDirty = 1;
    self->_pendingScriptSelection = (_NSRange)xmmword_21C58CB40;
    [(BRLTBrailleStateManager *)self translate];
LABEL_34:
    [(NSRecursiveLock *)self->_apiLock unlock];
    goto LABEL_35;
  }
  *(void *)buf = 0;
  v37 = buf;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  runningScriptStringHistory = self->_runningScriptStringHistory;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __43__BRLTBrailleStateManager_setScriptString___block_invoke;
  v33[3] = &unk_26440BD10;
  v33[4] = self;
  id v34 = v5;
  v35 = buf;
  [(NSMutableArray *)runningScriptStringHistory enumerateObjectsUsingBlock:v33];
  if (*((void *)v37 + 3) == 0x7FFFFFFFFFFFFFFFLL)
  {

    _Block_object_dispose(buf, 8);
    goto LABEL_23;
  }
  v30 = BRLTLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_21C554000, v30, OS_LOG_TYPE_INFO, "setScriptString: not processing the input since it is found in the running history of script strings.", v32, 2u);
  }

  [(NSRecursiveLock *)self->_apiLock unlock];
  -[NSMutableArray removeObjectsInRange:](self->_runningScriptStringHistory, "removeObjectsInRange:", 0, *((void *)v37 + 3) + 1);

  _Block_object_dispose(buf, 8);
LABEL_35:
}

void __43__BRLTBrailleStateManager_setScriptString___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([*(id *)(a1[4] + 256) count] - 1 != a3)
  {
    if (![v7 isEqual:a1[5]]) {
      goto LABEL_5;
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
  }
  *a4 = 1;
LABEL_5:
}

- (void)insertBrailleChar:(id)a3
{
}

- (void)insertBrailleChar:(id)a3 modifiers:(id)a4
{
  apiLock = self->_apiLock;
  id v7 = a4;
  id v8 = a3;
  [(NSRecursiveLock *)apiLock lock];
  [(BRLTBrailleStateManager *)self insertBrailleChar:v8 modifiers:v7 silently:0];

  uint64_t v9 = self->_apiLock;
  [(NSRecursiveLock *)v9 unlock];
}

- (void)insertBrailleChar:(id)a3 silently:(BOOL)a4
{
}

- (void)insertBrailleChar:(id)a3 modifiers:(id)a4 silently:(BOOL)a5
{
  id v16 = a3;
  id v8 = a4;
  [(NSRecursiveLock *)self->_apiLock lock];
  [(BRLTBrailleStateManager *)self _generateBrailleBufferForInsert];
  [(BRLTBrailleBuffer *)self->_brailleBuffer insertBrailleChar:v16 modifiers:v8 inputMode:self->_inputTranslationMode];
  NSUInteger location = self->_brailleSelection.location;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = self->_brailleSelection.length;
    BOOL v11 = length == 0;
    if (length) {
      NSUInteger location = self->_brailleSelection.length;
    }
    uint64_t v12 = 168;
    if (v11) {
      uint64_t v12 = 160;
    }
    *(Class *)((char *)&self->super.isa + v12) = (Class)(location + 1);
  }
  self->_brailleDirty = 1;
  if (!a5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained brailleDisplayInsertedCharacter:v16 modifiers:v8];
  }
  id v14 = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v15 = [(BRLTBrailleStateManager *)self brailleDisplayString];
  objc_msgSend(v14, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v15, self->_brailleSelection.location, self->_brailleSelection.length, v8);

  [(NSRecursiveLock *)self->_apiLock unlock];
}

- (void)_generateBrailleBufferForInsert
{
}

- (BOOL)_generateBrailleBufferForDelete
{
  return [(BRLTBrailleStateManager *)self _generateBrailleBuffer:1];
}

- (_NSRange)forwardEditingAtomForScriptString:(id)a3
{
  if (self->_inputTranslationMode == 2) {
    NSUInteger v3 = [a3 selection];
  }
  else {
    NSUInteger v3 = [a3 forwardEditingAtom];
  }
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (_NSRange)backwardEditingAtomForScriptString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_inputTranslationMode == 2)
  {
    if ([v4 selection])
    {
      [v5 selection];
      if (!v6)
      {
        uint64_t v9 = [v5 selection] - 1;
        uint64_t v10 = 1;
        goto LABEL_7;
      }
    }
    uint64_t v7 = [v5 selection];
  }
  else
  {
    uint64_t v7 = [v4 backwardEditingAtom];
  }
  uint64_t v9 = v7;
  uint64_t v10 = v8;
LABEL_7:

  NSUInteger v11 = v9;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (_NSRange)deleteMergeAtomForScriptString:(id)a3
{
  if (self->_inputTranslationMode == 2) {
    NSUInteger v3 = [(BRLTBrailleStateManager *)self backwardEditingAtomForScriptString:a3];
  }
  else {
    NSUInteger v3 = [a3 deleteMergeAtom];
  }
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (BOOL)_selectionIsValidForDelete
{
  NSUInteger v3 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    NSUInteger location = self->_activeBrailleEditingRegion.location;
    uint64_t v6 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
    uint64_t v7 = [v6 length];

    NSUInteger v8 = self->_brailleSelection.location;
    if (location != 0x7FFFFFFFFFFFFFFELL && location + 1 <= v8) {
      return v7 + location >= v8;
    }
    return 0;
  }
  NSUInteger v11 = self->_brailleBackwardEditingRegion.location;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger v12 = self->_brailleSelection.location;
  NSUInteger length = self->_brailleBackwardEditingRegion.length;
  if (!length) {
    return v11 == v12;
  }
  BOOL v14 = length + v11 >= v12;
  return v11 < v12 && v14;
}

- (BOOL)_selectionIsValidForInsert
{
  NSUInteger v3 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    NSUInteger location = self->_brailleSelection.location;
    NSUInteger v11 = self->_brailleForwardEditingRegion.location;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v11 > location) {
      return 0;
    }
    NSUInteger v10 = self->_brailleForwardEditingRegion.length + v11;
    return v10 >= location;
  }
  NSUInteger v5 = self->_activeBrailleEditingRegion.location;
  uint64_t v6 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  uint64_t v7 = [v6 length];

  BOOL result = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger location = self->_brailleSelection.location;
    if (v5 <= location)
    {
      NSUInteger v10 = v7 + v5;
      return v10 >= location;
    }
  }
  return result;
}

- (BOOL)_generateBrailleBuffer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  NSUInteger v5 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  uint64_t v6 = [v5 length];
  uint64_t v7 = v6;
  if (v3)
  {
    if (v6 && [(BRLTBrailleBuffer *)self->_brailleBuffer cursor])
    {
      NSUInteger length = self->_brailleSelection.length;

      if (!length) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v10 = 96;
    if (self->_brailleBackwardEditingRegion.length == 1) {
      uint64_t v10 = 112;
    }
    uint64_t v9 = 48;
    if (self->_brailleBackwardEditingRegion.length == 1) {
      uint64_t v9 = 64;
    }
  }
  else
  {

    if (v7) {
      return 0;
    }
    uint64_t v9 = 32;
    uint64_t v10 = 80;
  }
  _NSRange v11 = *(_NSRange *)((char *)&self->super.isa + v10);
  self->_activeScriptEditingRegion = *(_NSRange *)((char *)&self->super.isa + v9);
  self->_activeBrailleEditingRegion = v11;
  if (!self->_activeBrailleEditingRegion.length) {
    return 0;
  }
  if (self->_activeBrailleEditingRegion.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger v12 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  uint64_t v13 = [v12 length];

  if (v13) {
    return 0;
  }
  if (self->_inputTranslationMode == self->_outputTranslationMode)
  {
    BOOL v15 = [(BRLTBrailleString *)self->_staticBrailleString brailleChars];
    id v16 = objc_msgSend(v15, "subarrayWithRange:", self->_activeBrailleEditingRegion.location, self->_activeBrailleEditingRegion.length);
  }
  else
  {
    v17 = [(BRLTScriptString *)self->_scriptString string];
    BOOL v15 = objc_msgSend(v17, "substringWithRange:", self->_activeScriptEditingRegion.location, self->_activeScriptEditingRegion.length);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
    v19 = objc_msgSend(WeakRetained, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v15, 0, self->_inputTranslationMode, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);

    v20 = [[BRLTBrailleString alloc] initWithUnicode:v19];
    id v16 = [(BRLTBrailleString *)v20 brailleChars];
  }
  NSUInteger location = self->_activeBrailleEditingRegion.location;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = v16;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = 0;
    uint64_t v26 = *(void *)v36;
    do
    {
      uint64_t v27 = 0;
      uint64_t v28 = v25;
      do
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v22);
        }
        v41.NSUInteger location = location + v27;
        uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8 * v27);
        uint64_t v25 = 1;
        v41.NSUInteger length = 1;
        if (!NSIntersectionRange((NSRange)self[160], v41).length)
        {
          [(BRLTBrailleBuffer *)self->_brailleBuffer insertBrailleChar:v29 modifiers:0 inputMode:self->_inputTranslationMode];
          uint64_t v25 = v28;
        }
        ++v27;
        uint64_t v28 = v25;
      }
      while (v24 != v27);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
      location += v27;
    }
    while (v24);
  }
  else
  {
    LOBYTE(v25) = 0;
  }

  brailleBuffer = self->_brailleBuffer;
  NSUInteger v31 = self->_brailleSelection.location - self->_activeBrailleEditingRegion.location;
  v32 = [(BRLTBrailleBuffer *)brailleBuffer brailleString];
  unint64_t v33 = [v32 length];

  if (v31 >= v33) {
    unint64_t v34 = v33;
  }
  else {
    unint64_t v34 = v31;
  }
  [(BRLTBrailleBuffer *)brailleBuffer setCursor:v34];

  return v25 & 1;
}

- (BOOL)deleteBrailleChar
{
  [(NSRecursiveLock *)self->_apiLock lock];
  BOOL v3 = [(BRLTBrailleStateManager *)self _deleteBrailleCharSilently:0];
  [(NSRecursiveLock *)self->_apiLock unlock];
  return v3;
}

- (BOOL)deleteBrailleCharSilently
{
  [(NSRecursiveLock *)self->_apiLock lock];
  BOOL v3 = [(BRLTBrailleStateManager *)self _deleteBrailleCharSilently:1];
  [(NSRecursiveLock *)self->_apiLock unlock];
  return v3;
}

- (BOOL)_deleteBrailleCharSilently:(BOOL)a3
{
  NSUInteger v5 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  if ([v5 length])
  {

    goto LABEL_4;
  }
  unint64_t v6 = [(BRLTBrailleString *)self->_staticBrailleString length];

  if (v6)
  {
LABEL_4:
    [(BRLTScriptString *)self->_scriptString selection];
    if (v7) {
      return 0;
    }
    if (![(BRLTBrailleStateManager *)self _selectionIsValidForDelete]) {
      [(BRLTBrailleStateManager *)self translate];
    }
    if ([(BRLTBrailleStateManager *)self _generateBrailleBufferForDelete])
    {
      self->_brailleDirty = 1;
LABEL_15:
      BOOL v15 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
      uint64_t v16 = [v15 length];

      if (!v16) {
        [(BRLTBrailleStateManager *)self translate];
      }
      BOOL v8 = 1;
      goto LABEL_20;
    }
    uint64_t v9 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
    if ([v9 length])
    {
      unint64_t v10 = [(BRLTBrailleBuffer *)self->_brailleBuffer cursor];

      if (v10)
      {
        _NSRange v11 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
        NSUInteger v12 = [v11 brailleChars];
        uint64_t v13 = objc_msgSend(v12, "objectAtIndex:", -[BRLTBrailleBuffer cursor](self->_brailleBuffer, "cursor") - 1);

        [(BRLTBrailleBuffer *)self->_brailleBuffer deleteBrailleChar];
        --self->_brailleSelection.location;
        self->_brailleDirty = 1;
        if (!a3)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained brailleDisplayDeletedCharacter:v13];
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    BOOL v8 = 0;
LABEL_20:
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = [(BRLTBrailleStateManager *)self brailleDisplayString];
    objc_msgSend(v17, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v18, self->_brailleSelection.location, self->_brailleSelection.length, 0);

    return v8;
  }
  return 0;
}

- (BOOL)forwardDeleteBrailleChar
{
  [(NSRecursiveLock *)self->_apiLock lock];
  BOOL v3 = [(BRLTBrailleStateManager *)self _forwardDeleteBrailleCharSilently:0];
  [(NSRecursiveLock *)self->_apiLock unlock];
  return v3;
}

- (BOOL)forwardDeleteBrailleCharSilently
{
  [(NSRecursiveLock *)self->_apiLock lock];
  BOOL v3 = [(BRLTBrailleStateManager *)self _forwardDeleteBrailleCharSilently:1];
  [(NSRecursiveLock *)self->_apiLock unlock];
  return v3;
}

- (BOOL)_forwardDeleteBrailleCharSilently:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BRLTBrailleStateManager *)self brailleSelection] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v5 = [(BRLTBrailleStateManager *)self brailleSelection];
  unint64_t v6 = [(BRLTBrailleStateManager *)self brailleDisplayString];
  unint64_t v7 = [v6 length];

  if (v5 >= v7) {
    return 0;
  }
  -[BRLTBrailleStateManager setBrailleSelection:](self, "setBrailleSelection:", [(BRLTBrailleStateManager *)self brailleSelection] + 1, 0);
  return [(BRLTBrailleStateManager *)self _deleteBrailleCharSilently:v3];
}

- (void)setBrailleSelection:(_NSRange)a3 needsForwardToScreenReader:(BOOL *)a4 newScriptLocation:(unint64_t *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(NSRecursiveLock *)self->_apiLock lock];
  BOOL v10 = -[BRLTBrailleStateManager _setBrailleSelection:newScriptLocation:](self, "_setBrailleSelection:newScriptLocation:", location, length, a5);
  if (a4) {
    *a4 = v10;
  }
  apiLock = self->_apiLock;
  [(NSRecursiveLock *)apiLock unlock];
}

- (void)setBrailleSelection:(_NSRange)a3
{
}

- (BOOL)_setBrailleSelection:(_NSRange)a3 newScriptLocation:(unint64_t *)a4
{
  NSUInteger length = a3.length;
  unint64_t location = a3.location;
  BOOL v8 = [(BRLTBrailleStateManager *)self brailleDisplayString];
  unint64_t v9 = [v8 length];

  if (location > v9)
  {
    BOOL v10 = [(BRLTBrailleStateManager *)self brailleDisplayString];
    unint64_t location = [v10 length];
  }
  self->_brailleSelection.unint64_t location = location;
  self->_brailleSelection.NSUInteger length = length;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  NSUInteger v12 = [(BRLTBrailleStateManager *)self brailleDisplayString];
  uint64_t v13 = [v12 unicode];
  unint64_t outputTranslationMode = self->_outputTranslationMode;
  id v47 = 0;
  BOOL v15 = [WeakRetained textForPrintBraille:v13 language:0 mode:outputTranslationMode locations:&v47];
  id v16 = v47;

  NSUInteger v17 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", self->_brailleSelection.location, self->_brailleSelection.length, v16, [v15 length]);
  NSUInteger v19 = v18;
  if ([(BRLTBrailleStateManager *)self _selectionIsValidForInsert]
    && [(BRLTBrailleStateManager *)self _selectionIsValidForDelete])
  {
    v20 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      [(BRLTBrailleBuffer *)self->_brailleBuffer setCursor:self->_brailleSelection.location - self->_activeBrailleEditingRegion.location];
LABEL_9:
      BOOL v22 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    if (self->_brailleDirty)
    {
      [(BRLTBrailleStateManager *)self translate];
      goto LABEL_9;
    }
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v23 = [BRLTScriptString alloc];
      uint64_t v24 = [(BRLTScriptString *)self->_scriptString string];
      uint64_t v25 = -[BRLTScriptString initWithString:selection:](v23, "initWithString:selection:", v24, v17, v19);

      uint64_t v26 = [(BRLTScriptString *)self->_scriptString string];
      uint64_t v45 = [v26 length];

      id v27 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      uint64_t v28 = [(BRLTScriptString *)self->_scriptString string];
      unint64_t v29 = self->_outputTranslationMode;
      id v46 = 0;
      v30 = objc_msgSend(v27, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v28, 0, v29, 0, v45, &v46, 0);
      id v44 = v46;

      self->_scriptForwardEditingRegion.unint64_t location = [(BRLTBrailleStateManager *)self forwardEditingAtomForScriptString:v25];
      self->_scriptForwardEditingRegion.NSUInteger length = v31;
      self->_scriptBackwardEditingRegion.unint64_t location = [(BRLTBrailleStateManager *)self backwardEditingAtomForScriptString:v25];
      self->_scriptBackwardEditingRegion.NSUInteger length = v32;
      self->_scriptMergeEditingRegion.unint64_t location = [(BRLTBrailleStateManager *)self deleteMergeAtomForScriptString:v25];
      self->_scriptMergeEditingRegion.NSUInteger length = v33;
      self->_brailleForwardEditingRegion.unint64_t location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptForwardEditingRegion.location, self->_scriptForwardEditingRegion.length, v44, [v30 length]);
      self->_brailleForwardEditingRegion.NSUInteger length = v34;
      self->_brailleBackwardEditingRegion.unint64_t location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptBackwardEditingRegion.location, self->_scriptBackwardEditingRegion.length, v44, [v30 length]);
      self->_brailleBackwardEditingRegion.NSUInteger length = v35;
      self->_brailleMergeEditingRegion.unint64_t location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptMergeEditingRegion.location, self->_scriptMergeEditingRegion.length, v44, [v30 length]);
      self->_brailleMergeEditingRegion.NSUInteger length = v36;
      self->_activeScriptEditingRegion = (_NSRange)xmmword_21C58CB40;
      self->_activeBrailleEditingRegion = (_NSRange)xmmword_21C58CB40;
      long long v37 = objc_alloc_init(BRLTBrailleBuffer);
      brailleBuffer = self->_brailleBuffer;
      self->_brailleBuffer = v37;

      id v39 = objc_loadWeakRetained((id *)&self->_delegate);
      LOBYTE(v28) = objc_opt_respondsToSelector();

      if (v28)
      {
        id v40 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v40, "scriptSelectionDidChange:", v17, v19);
      }
    }
  }
  BOOL v22 = 1;
LABEL_15:
  self->_pendingScriptSelection.unint64_t location = v17;
  self->_pendingScriptSelection.NSUInteger length = v19;
  if (a4) {
    *a4 = v17;
  }
  id v41 = objc_loadWeakRetained((id *)&self->_delegate);
  v42 = [(BRLTBrailleStateManager *)self brailleDisplayString];
  objc_msgSend(v41, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v42, self->_brailleSelection.location, self->_brailleSelection.length, 0);

  return v22;
}

- (_NSRange)_textRangeForBrailleRange:(_NSRange)a3 textPositions:(id)a4 scriptLength:(int64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = [v8 length];
  int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 < 8) {
    goto LABEL_15;
  }
  int64_t v12 = 0;
  NSUInteger v13 = location + length;
  int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    NSUInteger v15 = *(void *)(v9 + 8 * v12);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v15 >= location) {
      int64_t v14 = v12;
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL && v15 >= v13) {
      int64_t v11 = v12;
    }
    ++v12;
  }
  while (v10 >> 3 != v12);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_15:
  }
    int64_t v14 = a5;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v11 = a5;
  }
  NSUInteger v18 = v11 - v14;

  NSUInteger v19 = v14;
  NSUInteger v20 = v18;
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (_NSRange)_brailleRangeForTextRange:(_NSRange)a3 textPositions:(id)a4 brailleLength:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v8 = a4;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = [v8 length];
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 < 8) {
    goto LABEL_15;
  }
  unint64_t v12 = 0;
  NSUInteger v13 = location + length;
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    NSUInteger v15 = *(void *)(v9 + 8 * v12);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v15 >= location) {
      unint64_t v14 = v12;
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL && v15 >= v13) {
      unint64_t v11 = v12;
    }
    ++v12;
  }
  while (v10 >> 3 != v12);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_15:
  }
    unint64_t v14 = a5;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v11 = a5;
  }
  NSUInteger v18 = v11 - v14;

  NSUInteger v19 = v14;
  NSUInteger v20 = v18;
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (void)translate
{
  [(NSRecursiveLock *)self->_apiLock lock];
  [(BRLTBrailleStateManager *)self _translate:0];
  apiLock = self->_apiLock;
  [(NSRecursiveLock *)apiLock unlock];
}

- (void)translateForced:(BOOL)a3
{
  if (a3) {
    self->_scriptDirty = 1;
  }
  [(BRLTBrailleStateManager *)self translate];
}

- (void)_translate:(BOOL)a3
{
  if (!self->_scriptDirty)
  {
    if (!self->_brailleDirty) {
      goto LABEL_78;
    }
LABEL_7:
    if (self->_editable)
    {
      p_activeScriptEditingRegion = &self->_activeScriptEditingRegion;
      if (self->_activeScriptEditingRegion.location == 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_activeBrailleEditingRegion = self->_brailleMergeEditingRegion;
        _NSRange *p_activeScriptEditingRegion = self->_scriptMergeEditingRegion;
      }
      unint64_t v7 = [(BRLTBrailleBuffer *)self->_brailleBuffer cursor];
      id v8 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        unint64_t v10 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
        unint64_t v11 = [v10 unicode];

        if ((unint64_t)[v11 length] >= 2
          && objc_msgSend(v11, "characterAtIndex:", objc_msgSend(v11, "length") - 1) == 10240
          && self->_inputTranslationMode != 2)
        {
          uint64_t v134 = objc_msgSend(v11, "substringWithRange:", 0, objc_msgSend(v11, "length") - 1);

          int v12 = 1;
          unint64_t v11 = (void *)v134;
        }
        else
        {
          int v12 = 0;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
        unint64_t inputTranslationMode = self->_inputTranslationMode;
        id v140 = 0;
        NSUInteger v15 = [WeakRetained textForPrintBraille:v11 language:0 mode:inputTranslationMode locations:&v140];
        id v16 = v140;

        if (v12)
        {
          uint64_t v17 = [v16 length];
          uint64_t v18 = [v15 stringByAppendingString:@" "];

          if (v17)
          {
            int64_t v19 = (unint64_t)[v16 length] >> 3;
            id v20 = v16;
            uint64_t v21 = [v20 bytes];
            if (v19 <= 1) {
              uint64_t v22 = 1;
            }
            else {
              uint64_t v22 = v19;
            }
            uint64_t v139 = *(void *)(v21 + 8 * v22 - 8) + 1;
            uint64_t v23 = [MEMORY[0x263EFF8F8] dataWithBytes:&v139 length:8];
            id v16 = (id)[v20 mutableCopy];

            [v16 appendData:v23];
          }
          else
          {
            uint64_t v139 = 1;
            uint64_t v40 = [MEMORY[0x263EFF8F8] dataWithBytes:&v139 length:8];

            id v16 = (id)v40;
          }
        }
        else
        {
          uint64_t v18 = (uint64_t)v15;
        }
      }
      else
      {
        v30 = [(BRLTBrailleString *)self->_staticBrailleString unicode];
        unint64_t v11 = objc_msgSend(v30, "substringWithRange:", self->_brailleMergeEditingRegion.location, self->_activeBrailleEditingRegion.location - self->_brailleMergeEditingRegion.location);

        NSUInteger v31 = [(BRLTBrailleString *)self->_staticBrailleString unicode];
        NSUInteger v32 = objc_msgSend(v31, "substringWithRange:");

        NSUInteger v33 = [v11 stringByAppendingString:v32];
        self->_activeBrailleEditingRegion = self->_brailleMergeEditingRegion;
        _NSRange *p_activeScriptEditingRegion = self->_scriptMergeEditingRegion;
        id v34 = objc_loadWeakRetained((id *)&self->_translationDelegate);
        unint64_t outputTranslationMode = self->_outputTranslationMode;
        id v138 = 0;
        uint64_t v18 = [v34 textForPrintBraille:v33 language:0 mode:outputTranslationMode locations:&v138];
        id v16 = v138;

        v7 += [v11 length];
      }

      if (v18) {
        id v41 = (__CFString *)v18;
      }
      else {
        id v41 = &stru_26CCBD108;
      }
      v42 = [(BRLTScriptString *)self->_scriptString string];
      uint64_t v43 = [v42 substringToIndex:self->_activeScriptEditingRegion.location];
      id v44 = (void *)v43;
      if (v43) {
        uint64_t v45 = (__CFString *)v43;
      }
      else {
        uint64_t v45 = &stru_26CCBD108;
      }
      id v46 = v45;

      id v47 = [(BRLTScriptString *)self->_scriptString string];
      uint64_t v48 = [v47 substringFromIndex:self->_activeScriptEditingRegion.length + self->_activeScriptEditingRegion.location];
      v49 = (void *)v48;
      if (v48) {
        v50 = (__CFString *)v48;
      }
      else {
        v50 = &stru_26CCBD108;
      }
      v135 = v50;

      NSUInteger location = self->_activeBrailleEditingRegion.location;
      v52 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
      uint64_t v53 = [v52 length];

      if (location == 0x7FFFFFFFFFFFFFFFLL
        || (NSUInteger v54 = self->_brailleSelection.location, location > v54)
        || v53 + location < v54)
      {
        id v57 = objc_loadWeakRetained((id *)&self->_translationDelegate);
        v58 = [(BRLTBrailleStateManager *)self brailleDisplayString];
        v59 = [v58 unicode];
        unint64_t v60 = self->_outputTranslationMode;
        id v137 = v16;
        v61 = [v57 textForPrintBraille:v59 language:0 mode:v60 locations:&v137];
        id v62 = v137;

        unint64_t v56 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", self->_brailleSelection.location, self->_brailleSelection.length, v62, [v61 length]);
        id v16 = v62;
      }
      else
      {
        uint64_t v55 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", v7, 0, v16, [(__CFString *)v41 length]);
        unint64_t v56 = v55 + [(__CFString *)v46 length];
      }
      v63 = [(__CFString *)v46 stringByAppendingString:v41];
      v64 = [v63 stringByAppendingString:v135];

      v65 = -[BRLTScriptString initWithString:selection:]([BRLTScriptString alloc], "initWithString:selection:", v64, v56, 0);
      scriptString = self->_scriptString;
      self->_scriptString = v65;

      self->_scriptDirty = 1;
      if ([(__CFString *)v46 length] <= v56) {
        uint64_t v67 = v56 - [(__CFString *)v46 length];
      }
      else {
        uint64_t v67 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v68 = -[BRLTScriptString initWithString:selection:]([BRLTScriptString alloc], "initWithString:selection:", v41, v67, 0);
      id v69 = objc_loadWeakRetained((id *)&self->_delegate);
      char v70 = objc_opt_respondsToSelector();

      if (v70)
      {
        if ((unint64_t)[(NSMutableArray *)self->_runningScriptStringHistory count] >= 6) {
          [(NSMutableArray *)self->_runningScriptStringHistory removeObjectAtIndex:0];
        }
        [(NSMutableArray *)self->_runningScriptStringHistory addObject:self->_scriptString];
        self->_lastScriptStringOutputTime = CFAbsoluteTimeGetCurrent();
        id v71 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v71, "replaceScriptStringRange:withScriptString:cursorLocation:", self->_activeScriptEditingRegion.location, self->_activeScriptEditingRegion.length, v68, v56);
      }
    }
    else
    {
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      char v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0)
      {
LABEL_52:
        v72 = objc_alloc_init(BRLTBrailleBuffer);
        brailleBuffer = self->_brailleBuffer;
        self->_brailleBuffer = v72;

        *(_WORD *)&self->_brailleDirty = 256;
LABEL_80:
        [(BRLTBrailleStateManager *)self _translate:1];
        return;
      }
      id v26 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      id v27 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
      uint64_t v28 = [v27 unicode];
      id v16 = [v26 textForPrintBraille:v28 language:0 mode:self->_inputTranslationMode locations:0];

      if ([v16 length])
      {
        id v29 = objc_loadWeakRetained((id *)&self->_delegate);
        [v29 didInsertScriptString:v16];
      }
    }

    goto LABEL_52;
  }
  if (self->_brailleDirty) {
    goto LABEL_7;
  }
  BOOL v4 = a3;
  if ([(BRLTScriptString *)self->_scriptString selection] == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_scriptForwardEditingRegion = (_NSRange)xmmword_21C58CB40;
    self->_scriptBackwardEditingRegion = (_NSRange)xmmword_21C58CB40;
    self->_brailleForwardEditingRegion = (_NSRange)xmmword_21C58CB40;
    self->_brailleBackwardEditingRegion = (_NSRange)xmmword_21C58CB40;
    self->_activeScriptEditingRegion = (_NSRange)xmmword_21C58CB40;
    self->_activeBrailleEditingRegion = (_NSRange)xmmword_21C58CB40;
    if (self->_editable)
    {
      unint64_t v5 = 0;
    }
    else
    {
      unint64_t v5 = [(BRLTScriptString *)self->_scriptString textFormattingRanges];
    }
    if ([(BRLTScriptString *)self->_scriptString focus] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v74 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      v75 = [(BRLTScriptString *)self->_scriptString string];
      objc_msgSend(v74, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v75, 0, self->_outputTranslationMode, 0x7FFFFFFFFFFFFFFFLL, 0, 0, v5);
      id v76 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v77 = [(BRLTScriptString *)self->_scriptString string];
      uint64_t v78 = [v77 length];

      id v79 = objc_loadWeakRetained((id *)&self->_translationDelegate);
      v80 = [(BRLTScriptString *)self->_scriptString string];
      unint64_t v81 = self->_outputTranslationMode;
      id v142 = 0;
      objc_msgSend(v79, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v80, 0, v81, 0, v78, &v142, v5);
      id v76 = (id)objc_claimAutoreleasedReturnValue();
      id v74 = v142;

      uint64_t v82 = [(BRLTScriptString *)self->_scriptString focus];
      self->_brailleFocus.NSUInteger location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v82, v83, v74, [v76 length]);
      self->_brailleFocus.NSUInteger length = v84;
    }

    v85 = [[BRLTBrailleString alloc] initWithUnicode:v76];
    staticBrailleString = self->_staticBrailleString;
    self->_staticBrailleString = v85;
  }
  else
  {
    NSUInteger v36 = [(BRLTScriptString *)self->_scriptString string];
    uint64_t v37 = [v36 length];

    NSUInteger v39 = self->_brailleSelection.location;
    NSUInteger length = self->_brailleSelection.length;
    if (self->_editable)
    {
      unint64_t v5 = 0;
    }
    else
    {
      unint64_t v5 = [(BRLTScriptString *)self->_scriptString textFormattingRanges];
    }
    id v87 = objc_loadWeakRetained((id *)&self->_translationDelegate);
    v88 = [(BRLTScriptString *)self->_scriptString string];
    unint64_t v89 = self->_outputTranslationMode;
    id v144 = 0;
    staticBrailleString = objc_msgSend(v87, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v88, 0, v89, 0, v37, &v144, v5);
    id v76 = v144;

    v90 = [[BRLTBrailleString alloc] initWithUnicode:staticBrailleString];
    v91 = self->_staticBrailleString;
    self->_staticBrailleString = v90;

    self->_scriptForwardEditingRegion.NSUInteger location = [(BRLTBrailleStateManager *)self forwardEditingAtomForScriptString:self->_scriptString];
    self->_scriptForwardEditingRegion.NSUInteger length = v92;
    self->_scriptBackwardEditingRegion.NSUInteger location = [(BRLTBrailleStateManager *)self backwardEditingAtomForScriptString:self->_scriptString];
    self->_scriptBackwardEditingRegion.NSUInteger length = v93;
    self->_scriptMergeEditingRegion.NSUInteger location = [(BRLTBrailleStateManager *)self deleteMergeAtomForScriptString:self->_scriptString];
    self->_scriptMergeEditingRegion.NSUInteger length = v94;
    uint64_t v95 = [(BRLTScriptString *)self->_scriptString selection];
    self->_brailleSelection.NSUInteger location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v95, v96, v76, [staticBrailleString length]);
    self->_brailleSelection.NSUInteger length = v97;
    uint64_t v98 = [(BRLTScriptString *)self->_scriptString focus];
    self->_brailleFocus.NSUInteger location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v98, v99, v76, [staticBrailleString length]);
    self->_brailleFocus.NSUInteger length = v100;
    self->_brailleForwardEditingRegion.NSUInteger location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptForwardEditingRegion.location, self->_scriptForwardEditingRegion.length, v76, [staticBrailleString length]);
    self->_brailleForwardEditingRegion.NSUInteger length = v101;
    self->_brailleBackwardEditingRegion.NSUInteger location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptBackwardEditingRegion.location, self->_scriptBackwardEditingRegion.length, v76, [staticBrailleString length]);
    self->_brailleBackwardEditingRegion.NSUInteger length = v102;
    self->_brailleMergeEditingRegion.NSUInteger location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", self->_scriptMergeEditingRegion.location, self->_scriptMergeEditingRegion.length, v76, [staticBrailleString length]);
    self->_brailleMergeEditingRegion.NSUInteger length = v103;
    if (v4)
    {
      BOOL v104 = self->_brailleSelection.location == v39 && self->_brailleSelection.length == length;
      BOOL v105 = v104;
      if (v39 != 0x7FFFFFFFFFFFFFFFLL && !v105)
      {
        id v106 = objc_loadWeakRetained((id *)&self->_translationDelegate);
        v107 = [(BRLTBrailleStateManager *)self brailleDisplayString];
        [v107 unicode];
        v109 = NSUInteger v108 = v39;
        unint64_t v110 = self->_outputTranslationMode;
        id v143 = 0;
        v111 = [v106 textForPrintBraille:v109 language:0 mode:v110 locations:&v143];
        id v136 = v143;

        uint64_t v112 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", v108, length, v136, [v111 length]);
        uint64_t v114 = v113;
        if (v112 == [(BRLTScriptString *)self->_scriptString selection] && v114 == v115)
        {
          NSUInteger v116 = self->_brailleSelection.location;
          if (v116 < [(BRLTBrailleString *)self->_staticBrailleString length])
          {
            self->_brailleSelection.NSUInteger location = v108;
            self->_brailleSelection.NSUInteger length = length;
          }
        }
      }
    }
  }

  uint64_t v117 = [(BRLTScriptString *)self->_scriptString suggestionRange];
  NSUInteger v119 = v118;
  if (v117 == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_brailleSuggestion.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    self->_brailleSuggestion.NSUInteger length = v118;
  }
  else
  {
    uint64_t v120 = v117;
    v121 = [(BRLTScriptString *)self->_scriptString string];
    uint64_t v122 = [v121 length];

    id v123 = objc_loadWeakRetained((id *)&self->_translationDelegate);
    v124 = [(BRLTScriptString *)self->_scriptString string];
    unint64_t v125 = self->_outputTranslationMode;
    id v141 = 0;
    v126 = [(BRLTScriptString *)self->_scriptString textFormattingRanges];
    v127 = objc_msgSend(v123, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v124, 0, v125, 0, v122, &v141, v126);
    id v128 = v141;

    self->_brailleSuggestion.NSUInteger location = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", v120, v119, v128, [v127 length]);
    self->_brailleSuggestion.NSUInteger length = v129;
  }
  self->_scriptDirty = 0;
  id v130 = objc_loadWeakRetained((id *)&self->_delegate);
  char v131 = objc_opt_respondsToSelector();

  if (v131)
  {
    id v132 = objc_loadWeakRetained((id *)&self->_delegate);
    v133 = [(BRLTBrailleStateManager *)self brailleDisplayString];
    objc_msgSend(v132, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v133, self->_brailleSelection.location, self->_brailleSelection.length, 0);
  }
LABEL_78:
  if (self->_scriptDirty || self->_brailleDirty) {
    goto LABEL_80;
  }
}

- (id)brailleDisplayString
{
  [(NSRecursiveLock *)self->_apiLock lock];
  if (!self->_brailleDirty)
  {
    BOOL v3 = self->_staticBrailleString;
    goto LABEL_6;
  }
  if (!self->_editable || self->_activeBrailleEditingRegion.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
LABEL_6:
    BOOL v4 = v3;
    goto LABEL_8;
  }
  unint64_t v5 = [(BRLTBrailleString *)self->_staticBrailleString brailleChars];
  unint64_t v6 = (void *)[v5 mutableCopy];

  unint64_t v7 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  id v8 = [v7 brailleChars];
  objc_msgSend(v6, "replaceObjectsInRange:withObjectsFromArray:", self->_activeBrailleEditingRegion.location, self->_activeBrailleEditingRegion.length, v8);

  BOOL v4 = [[BRLTBrailleString alloc] initWithBrailleChars:v6];
LABEL_8:
  if (self->_isTerminalOutput)
  {
    uint64_t v9 = [(BRLTBrailleString *)v4 unicode];
    unint64_t v10 = [@"⠿⠀" stringByAppendingString:v9];
    unint64_t v11 = [v10 stringByAppendingString:@"⠀⠿"];

    int v12 = [[BRLTBrailleString alloc] initWithUnicode:v11];
    BOOL v4 = v12;
  }
  [(NSRecursiveLock *)self->_apiLock unlock];
  return v4;
}

- (_NSRange)brailleSelection
{
  NSUInteger length = self->_brailleSelection.length;
  NSUInteger location = self->_brailleSelection.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)brailleFocus
{
  NSUInteger length = self->_brailleFocus.length;
  NSUInteger location = self->_brailleFocus.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)brailleSuggestion
{
  NSUInteger length = self->_brailleSuggestion.length;
  NSUInteger location = self->_brailleSuggestion.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)outputScriptString
{
  [(NSRecursiveLock *)self->_apiLock lock];
  BOOL v3 = (void *)[(BRLTScriptString *)self->_scriptString copy];
  [(NSRecursiveLock *)self->_apiLock unlock];
  return v3;
}

- (_NSRange)scriptEditingRange
{
  [(NSRecursiveLock *)self->_apiLock lock];
  BOOL v3 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    NSUInteger location = self->_activeScriptEditingRegion.location;
    NSUInteger length = self->_activeScriptEditingRegion.length;
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(NSRecursiveLock *)self->_apiLock unlock];
  NSUInteger v7 = location;
  NSUInteger v8 = length;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (unint64_t)scriptLocationForBrailleLocation:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_apiLock lock];
  if (self->_editable
    && (NSUInteger length = self->_activeBrailleEditingRegion.length) != 0
    && ((location = self->_activeBrailleEditingRegion.location, BOOL v8 = a3 >= location, v7 = a3 - location, v8)
      ? (BOOL v8 = v7 >= length)
      : (BOOL v8 = 1),
        !v8))
  {
    [(NSRecursiveLock *)self->_apiLock unlock];
    return self->_activeBrailleEditingRegion.location;
  }
  else if (self->_brailleDirty)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
    unint64_t v10 = [(BRLTBrailleStateManager *)self brailleDisplayString];
    unint64_t v11 = [v10 unicode];
    unint64_t outputTranslationMode = self->_outputTranslationMode;
    id v26 = 0;
    NSUInteger v13 = [WeakRetained textForPrintBraille:v11 language:0 mode:outputTranslationMode locations:&v26];
    id v14 = v26;

    unint64_t v23 = -[BRLTBrailleStateManager _textRangeForBrailleRange:textPositions:scriptLength:](self, "_textRangeForBrailleRange:textPositions:scriptLength:", a3, 0, v14, [v13 length]);
    [(NSRecursiveLock *)self->_apiLock unlock];
  }
  else
  {
    NSUInteger v15 = [(BRLTScriptString *)self->_scriptString string];
    uint64_t v16 = [v15 length];

    id v17 = objc_loadWeakRetained((id *)&self->_translationDelegate);
    uint64_t v18 = [(BRLTScriptString *)self->_scriptString string];
    unint64_t v19 = self->_outputTranslationMode;
    id v27 = 0;
    id v20 = (id)objc_msgSend(v17, "printBrailleForText:language:mode:textPositionsRange:locations:textFormattingRanges:", v18, 0, v19, 0, v16, &v27, 0);
    id v21 = v27;

    if (a3 >= (unint64_t)[v21 length] >> 3)
    {
      [(NSRecursiveLock *)self->_apiLock unlock];
      id v24 = [(BRLTScriptString *)self->_scriptString string];
      unint64_t v23 = [v24 length];
    }
    else
    {
      uint64_t v22 = [v21 bytes];
      [(NSRecursiveLock *)self->_apiLock unlock];
      unint64_t v23 = *(void *)(v22 + 8 * a3);
    }
  }
  return v23;
}

- (unint64_t)brailleLocationForScriptLocation:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_apiLock lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  unint64_t v6 = [(BRLTBrailleString *)self->_staticBrailleString unicode];
  unint64_t outputTranslationMode = self->_outputTranslationMode;
  id v14 = 0;
  id v8 = (id)[WeakRetained textForPrintBraille:v6 language:0 mode:outputTranslationMode locations:&v14];
  id v9 = v14;

  unint64_t v10 = [(BRLTBrailleStateManager *)self brailleDisplayString];
  unint64_t v11 = [v10 unicode];
  unint64_t v12 = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", a3, 0, v9, [v11 length]);

  [(NSRecursiveLock *)self->_apiLock unlock];
  return v12;
}

- (_NSRange)brailleRangeForScriptRange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  [(NSRecursiveLock *)self->_apiLock lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  unint64_t v6 = [(BRLTBrailleString *)self->_staticBrailleString unicode];
  unint64_t outputTranslationMode = self->_outputTranslationMode;
  id v18 = 0;
  id v8 = (id)[WeakRetained textForPrintBraille:v6 language:0 mode:outputTranslationMode locations:&v18];
  id v9 = v18;

  unint64_t v10 = [(BRLTBrailleStateManager *)self brailleDisplayString];
  unint64_t v11 = [v10 unicode];
  NSUInteger v12 = -[BRLTBrailleStateManager _brailleRangeForTextRange:textPositions:brailleLength:](self, "_brailleRangeForTextRange:textPositions:brailleLength:", location, 0, v9, [v11 length]);
  NSUInteger v14 = v13;

  if (self->_editable)
  {
    v15.NSUInteger length = self->_activeBrailleEditingRegion.length;
    if (v15.length)
    {
      v15.NSUInteger location = self->_activeBrailleEditingRegion.location;
      v19.NSUInteger location = v12;
      v19.NSUInteger length = v14;
      if (NSIntersectionRange(v19, v15).location != 0x7FFFFFFFFFFFFFFFLL) {
        v14 += self->_activeBrailleEditingRegion.length;
      }
    }
  }
  [(NSRecursiveLock *)self->_apiLock unlock];

  NSUInteger v16 = v12;
  NSUInteger v17 = v14;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

- (_NSRange)scriptRangeForBrailleRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(NSRecursiveLock *)self->_apiLock lock];
  unint64_t v6 = [(BRLTBrailleStateManager *)self scriptLocationForBrailleLocation:location];
  unint64_t v7 = [(BRLTBrailleStateManager *)self scriptLocationForBrailleLocation:location + length];
  [(NSRecursiveLock *)self->_apiLock unlock];
  NSUInteger v8 = v7 - v6;
  NSUInteger v9 = v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)scriptRangeOfBrailleCellRepresentingCharacterAtScriptIndex:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_apiLock lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_translationDelegate);
  unint64_t v6 = [(BRLTBrailleString *)self->_staticBrailleString unicode];
  unint64_t outputTranslationMode = self->_outputTranslationMode;
  id v22 = 0;
  id v8 = (id)[WeakRetained textForPrintBraille:v6 language:0 mode:outputTranslationMode locations:&v22];
  id v9 = v22;

  id v10 = v9;
  uint64_t v11 = [v10 bytes];
  unint64_t v12 = (unint64_t)[v10 length] >> 3;
  if (v12 <= a3)
  {
    [(NSRecursiveLock *)self->_apiLock unlock];
    uint64_t v19 = 0;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)(v11 + 8 * a3);
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v17 = *(void *)(v11 + 8 * v13);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v17 == v14) {
          uint64_t v16 = v13;
        }
        else {
          uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v17 == v14) {
          uint64_t v18 = v13;
        }
        else {
          uint64_t v18 = v15;
        }
      }
      else
      {
        uint64_t v18 = v13;
        if (v17 != v14) {
          break;
        }
      }
      ++v13;
      uint64_t v15 = v18;
    }
    while (v12 != v13);
    [(NSRecursiveLock *)self->_apiLock unlock];
    uint64_t v19 = v15 - v16 + 1;
  }

  NSUInteger v20 = v16;
  NSUInteger v21 = v19;
  result.NSUInteger length = v21;
  result.NSUInteger location = v20;
  return result;
}

- (void)setOutputTranslationMode:(unint64_t)a3
{
  if (self->_outputTranslationMode != a3)
  {
    self->_unint64_t outputTranslationMode = a3;
    self->_scriptDirty = 1;
  }
}

- (void)setInputTranslationMode:(unint64_t)a3
{
  if (self->_inputTranslationMode != a3)
  {
    self->_unint64_t inputTranslationMode = a3;
    uint64_t v4 = [(BRLTBrailleBuffer *)self->_brailleBuffer brailleString];
    uint64_t v5 = [v4 length];

    if (v5) {
      self->_brailleDirty = 1;
    }
  }
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)isTerminalOutput
{
  return self->_isTerminalOutput;
}

- (void)setIsTerminalOutput:(BOOL)a3
{
  self->_isTerminalOutput = a3;
}

- (unint64_t)inputTranslationMode
{
  return self->_inputTranslationMode;
}

- (unint64_t)outputTranslationMode
{
  return self->_outputTranslationMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningScriptStringHistory, 0);
  objc_storeStrong((id *)&self->_apiLock, 0);
  objc_destroyWeak((id *)&self->_translationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_staticBrailleString, 0);
  objc_storeStrong((id *)&self->_brailleBuffer, 0);
  objc_storeStrong((id *)&self->_scriptString, 0);
}

@end