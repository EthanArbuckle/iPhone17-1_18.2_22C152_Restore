@interface DDTextKitOperation
- (BOOL)_rangeValidForContainer;
- (BOOL)doURLificationOnDocument;
- (BOOL)needsToStartOver;
- (DDTextKitOperation)initWithContainer:(id)a3;
- (_NSRange)_addResultToAttributes:(id)a3 inStorage:(id)a4 editing:(BOOL)a5;
- (_NSRange)_addResultsToAttributesInStorage:(id)a3;
- (_NSRange)range;
- (__DDScanQuery)_createScanQueryForBackend;
- (id)newOperationForContinuation;
- (id)newOperationForStartingOver;
- (void)_createScanQueryForBackend;
- (void)_updateGenerationNumber;
- (void)cleanup;
- (void)dispatchContainerModificationBlock:(id)a3;
- (void)newOperationForContinuation;
- (void)setRange:(_NSRange)a3;
- (void)textDidChange:(id)a3;
@end

@implementation DDTextKitOperation

uint64_t __63__DDTextKitOperation__addResultToAttributes_inStorage_editing___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (_NSRange)_addResultsToAttributesInStorage:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v4 = [(DDOperation *)self scannerResults];

  if (v4) {
    [(DDOperation *)self scannerResults];
  }
  else {
  v5 = [(DDOperation *)self results];
  }
  if ([v5 count])
  {
    v6 = +[DDOperation shouldUrlifyBlockForTypes:[(DDOperation *)self detectionTypes]];
    v28 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    v7 = [(DDOperation *)self context];
    v8 = [v7 objectForKey:@"ReferenceDate"];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v23 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v9)
    {
      NSUInteger range1 = 0;
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_24;
    }
    uint64_t v10 = v9;
    NSUInteger range1 = 0;
    v25 = self;
    uint64_t v11 = *(void *)v30;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (v4)
        {
          id v15 = v14;
          v14 = (void *)[v15 coreResult];
          if (!v15) {
            goto LABEL_19;
          }
        }
        else
        {
          id v15 = [MEMORY[0x1E4F5F150] resultFromCoreResult:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          if (!v15) {
            goto LABEL_19;
          }
        }
        if (((unsigned int (**)(void, void *, void *, void *))v6)[2](v6, v14, v8, v28))
        {
          NSUInteger v16 = [(DDTextKitOperation *)v25 _addResultToAttributes:v15 inStorage:v26 editing:location != 0x7FFFFFFFFFFFFFFFLL];
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v18.NSUInteger location = v16;
            v18.length = v17;
            if (location == 0x7FFFFFFFFFFFFFFFLL)
            {
              NSUInteger range1 = v17;
              NSUInteger location = v16;
            }
            else
            {
              v35.NSUInteger location = location;
              v35.length = range1;
              NSRange v19 = NSUnionRange(v35, v18);
              NSUInteger location = v19.location;
              NSUInteger range1 = v19.length;
            }
          }
        }
LABEL_19:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v10)
      {
LABEL_24:

        v5 = v23;
        NSUInteger v20 = range1;
        goto LABEL_25;
      }
    }
  }
  NSUInteger v20 = 0;
  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
LABEL_25:

  NSUInteger v21 = location;
  NSUInteger v22 = v20;
  result.length = v22;
  result.NSUInteger location = v21;
  return result;
}

- (_NSRange)_addResultToAttributes:(id)a3 inStorage:(id)a4 editing:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 coreResult];
  uint64_t RangeForURLification = DDResultGetRangeForURLification();
  NSUInteger v11 = v10;
  uint64_t v16 = 0;
  NSUInteger v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = *MEMORY[0x1E4F42530];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__DDTextKitOperation__addResultToAttributes_inStorage_editing___block_invoke;
  v15[3] = &unk_1E5A85E18;
  v15[4] = &v16;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v12, RangeForURLification, v10, 0, v15);
  if (*((unsigned char *)v17 + 24))
  {
    NSUInteger v11 = 0;
    uint64_t RangeForURLification = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (!a5) {
      [v8 beginEditing];
    }
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4F5F118], v7, RangeForURLification, v11);
  }
  _Block_object_dispose(&v16, 8);

  NSUInteger v13 = RangeForURLification;
  NSUInteger v14 = v11;
  result.length = v14;
  result.NSUInteger location = v13;
  return result;
}

uint64_t __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)textDidChange:(id)a3
{
}

- (DDTextKitOperation)initWithContainer:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDTextKitOperation;
  v5 = [(DDOperation *)&v11 initWithContainer:v4];
  v6 = v5;
  if (v5)
  {
    v5->_range = (_NSRange)xmmword_1A175CCF0;
    v5->_editCount = 1;
    if (v4)
    {
      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v8 = *MEMORY[0x1E4F425A8];
      uint64_t v9 = [v4 textStorage];
      [v7 addObserver:v6 selector:sel_textDidChange_ name:v8 object:v9];
    }
  }

  return v6;
}

- (BOOL)doURLificationOnDocument
{
  v3 = [(DDOperation *)self container];
  id v4 = [v3 textStorage];
  if (v4
    && (uint64_t v5 = [(DDTextKitOperation *)self _addResultsToAttributesInStorage:v4],
        v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    unint64_t v10 = [(DDOperation *)self detectionTypes];
    objc_super v11 = [(DDOperation *)self context];
    objc_msgSend(v4, "dd_makeLinksForResultsInAttributesOfType:context:range:", v10, v11, v8, v9);

    [v4 endEditing];
    uint64_t v12 = [v3 _containerView];
    [v12 setNeedsDisplay];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)cleanup
{
  [(DDOperation *)self setResults:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DDTextKitOperation;
  [(DDOperation *)&v4 cleanup];
}

- (__DDScanQuery)_createScanQueryForBackend
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDTextKitOperation _createScanQueryForBackend]((uint64_t)self);
  }
  v3 = [(DDOperation *)self container];
  objc_super v4 = [v3 textStorage];
  uint64_t v5 = [v4 string];
  uint64_t v6 = (void *)[v5 copy];

  if (!v6)
  {
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t length = [v6 length];
    p_range->NSUInteger location = 0;
    self->_range.unint64_t length = length;
LABEL_9:
    NSUInteger v11 = 20000;
    goto LABEL_10;
  }
  unint64_t length = self->_range.length;
  if (!location) {
    goto LABEL_9;
  }
  NSUInteger v11 = 100000;
LABEL_10:
  if (length > v11)
  {
    self->_range.unint64_t length = v11;
    p_range->NSUInteger location = objc_msgSend(v6, "lineRangeForRange:");
    self->_range.unint64_t length = v12;
    [(DDOperation *)self setNeedContinuation:1];
  }
  unint64_t v10 = (__DDScanQuery *)DDScanQueryCreateFromString();
LABEL_13:

  return v10;
}

void __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) container];
  v3 = [v2 textStorage];

  if (v3)
  {
    objc_super v4 = [v2 textStorage];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke_2;
    v5[3] = &unk_1E5A86030;
    id v6 = *(id *)(a1 + 40);
    [v4 coordinateAccess:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)needsToStartOver
{
  int editCount = self->_editCount;
  return editCount > [(DDOperation *)self generationNumber];
}

- (void)_updateGenerationNumber
{
}

- (BOOL)_rangeValidForContainer
{
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  unint64_t v4 = self->_range.length + location;
  uint64_t v5 = [(DDOperation *)self container];
  id v6 = [v5 textStorage];
  BOOL v3 = v4 <= [v6 length];

  return v3;
}

- (void)dispatchContainerModificationBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__DDTextKitOperation_dispatchContainerModificationBlock___block_invoke;
  v6[3] = &unk_1E5A857E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (id)newOperationForStartingOver
{
  v7.receiver = self;
  v7.super_class = (Class)DDTextKitOperation;
  id v3 = [(DDOperation *)&v7 newOperationForStartingOver];
  id v4 = [(DDOperation *)self container];
  id v5 = [v4 textStorage];
  objc_msgSend(v3, "setRange:", 0, objc_msgSend(v5, "length"));

  return v3;
}

- (id)newOperationForContinuation
{
  v13.receiver = self;
  v13.super_class = (Class)DDTextKitOperation;
  id v3 = [(DDOperation *)&v13 newOperationForContinuation];
  uint64_t v4 = [(DDTextKitOperation *)self range];
  uint64_t v6 = v4 + v5;
  objc_super v7 = [(DDOperation *)self container];
  uint64_t v8 = [v7 textStorage];
  uint64_t v9 = [v8 length];
  uint64_t v10 = [(DDTextKitOperation *)self range];
  objc_msgSend(v3, "setRange:", v6, v9 - (v11 + v10));

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[DDTextKitOperation newOperationForContinuation](v3);
  }
  return v3;
}

- (_NSRange)range
{
  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.unint64_t length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (void)_createScanQueryForBackend
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "operation %p", (uint8_t *)&v1, 0xCu);
}

- (void)newOperationForContinuation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v8.NSUInteger location = [a1 range];
  uint64_t v2 = NSStringFromRange(v8);
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Creating continuation %@. The new range is %@", (uint8_t *)&v3, 0x16u);
}

@end