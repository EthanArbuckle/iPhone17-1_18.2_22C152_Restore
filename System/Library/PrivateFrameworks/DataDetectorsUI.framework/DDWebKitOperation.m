@interface DDWebKitOperation
- (BOOL)_containerReadyForDetection;
- (BOOL)_rangeValidForContainer;
- (BOOL)containerIsReady;
- (BOOL)doURLificationOnDocument;
- (BOOL)needsToStartOver;
- (DOMNode)endNode;
- (DOMNode)startNode;
- (__DDScanQuery)_createScanQueryForBackend;
- (id)newOperationForContinuation;
- (id)newOperationForStartingOver;
- (int)endOffset;
- (int)startOffset;
- (void)_applyContainerRestrictionsToTypes;
- (void)_createScanQueryForBackend;
- (void)_rangeValidForContainer;
- (void)_updateGenerationNumber;
- (void)cleanup;
- (void)dispatchContainerModificationBlock:(id)a3;
- (void)newOperationForContinuation;
- (void)setEndNode:(id)a3;
- (void)setEndOffset:(int)a3;
- (void)setStartNode:(id)a3;
- (void)setStartOffset:(int)a3;
@end

@implementation DDWebKitOperation

- (void)cleanup
{
}

uint64_t __28__DDWebKitOperation_cleanup__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)DDWebKitOperation;
  objc_msgSendSuper2(&v3, sel_cleanup);
  [*(id *)(a1 + 32) setStartNode:0];
  [*(id *)(a1 + 32) setEndNode:0];
  return [*(id *)(a1 + 32) setResults:0];
}

- (BOOL)_containerReadyForDetection
{
  v2 = [(DDOperation *)self container];
  char v3 = [v2 needsLayout] ^ 1;

  return v3;
}

- (void)_applyContainerRestrictionsToTypes
{
  char v3 = [(DDOperation *)self container];
  char v4 = [v3 isTelephoneNumberParsingAllowed];

  if ((v4 & 1) == 0) {
    [(DDOperation *)self setDetectionTypes:[(DDOperation *)self detectionTypes] & 0x7FFFFFFE];
  }
  v5.receiver = self;
  v5.super_class = (Class)DDWebKitOperation;
  [(DDOperation *)&v5 _applyContainerRestrictionsToTypes];
}

- (BOOL)_rangeValidForContainer
{
  char v3 = [(DDOperation *)self container];
  char v4 = [v3 DOMDocument];

  objc_super v5 = [(DDWebKitOperation *)self startNode];
  v6 = [v5 ownerDocument];

  if (v6) {
    BOOL v7 = v6 == v4;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = v7;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(DDWebKitOperation *)(uint64_t)v6 _rangeValidForContainer];
  }

  return v8;
}

- (void)_updateGenerationNumber
{
  id v3 = [(DDOperation *)self container];
  -[DDOperation setGenerationNumber:](self, "setGenerationNumber:", [v3 layoutCount]);
}

- (__DDScanQuery)_createScanQueryForBackend
{
  id v3 = [(DDOperation *)self container];
  char v4 = [v3 DOMDocument];

  objc_super v5 = [v4 body];
  if (!v5)
  {
    v6 = 0;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v6 = [v4 createRange];
  [v6 selectNode:v5];
  BOOL v7 = [(DDWebKitOperation *)self startNode];

  if (v7)
  {
    BOOL v8 = [(DDWebKitOperation *)self startNode];
    objc_msgSend(v6, "setStart:offset:", v8, -[DDWebKitOperation startOffset](self, "startOffset"));
  }
  if (!v6 || ([v6 collapsed] & 1) != 0) {
    goto LABEL_10;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F46738]) initWithRange:v6];
  id v16 = 0;
  v10 = (__DDScanQuery *)objc_msgSend(v9, "dd_newQueryStopRange:", &v16);
  id v11 = v16;
  v12 = [v6 startContainer];
  [(DDWebKitOperation *)self setStartNode:v12];

  -[DDWebKitOperation setStartOffset:](self, "setStartOffset:", [v6 startOffset]);
  if (v11)
  {
    v13 = [v11 endContainer];
    [(DDWebKitOperation *)self setEndNode:v13];

    -[DDWebKitOperation setEndOffset:](self, "setEndOffset:", [v11 endOffset]);
    [(DDOperation *)self setNeedContinuation:1];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[DDWebKitOperation _createScanQueryForBackend](self);
    }
  }
  else
  {
    v15 = [v6 endContainer];
    [(DDWebKitOperation *)self setEndNode:v15];

    -[DDWebKitOperation setEndOffset:](self, "setEndOffset:", [v6 endOffset]);
    [(DDOperation *)self setNeedContinuation:0];
  }

LABEL_11:
  return v10;
}

- (BOOL)doURLificationOnDocument
{
  char v14 = 0;
  id v3 = [(DDOperation *)self container];
  char v4 = [v3 DOMDocument];

  objc_super v5 = [v4 createRange];
  [v5 setStart:self->_startNode offset:self->_startOffset];
  [v5 setEnd:self->_endNode offset:self->_endOffset];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F46738]) initWithRange:v5];
  BOOL v7 = [(DDOperation *)self context];

  if (v7)
  {
    BOOL v8 = [(DDOperation *)self context];
    BOOL v7 = [v8 objectForKey:@"ReferenceDate"];
  }
  v9 = [(DDOperation *)self scanQuery];
  v10 = [(DDOperation *)self results];
  id v11 = objc_msgSend((id)objc_opt_class(), "urlificationBlockForTypes:", -[DDOperation detectionTypes](self, "detectionTypes"));
  id v12 = (id)objc_msgSend(v6, "dd_doUrlificationForQuery:forResults:referenceDate:document:DOMWasModified:relevantResults:URLificationBlock:", v9, v10, v7, v4, &v14, 0, v11);

  LOBYTE(v11) = v14;
  return (char)v11;
}

- (BOOL)containerIsReady
{
  v2 = [(DDOperation *)self container];
  BOOL v3 = (int)[v2 layoutCount] > 0;

  return v3;
}

- (BOOL)needsToStartOver
{
  BOOL v3 = [(DDOperation *)self container];
  int v4 = [v3 layoutCount];
  if (v4 == [(DDOperation *)self generationNumber])
  {
    objc_super v5 = [(DDOperation *)self container];
    char v6 = [v5 needsLayout];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (id)newOperationForStartingOver
{
  v4.receiver = self;
  v4.super_class = (Class)DDWebKitOperation;
  id v2 = [(DDOperation *)&v4 newOperationForStartingOver];
  [v2 setStartNode:0];
  [v2 setStartOffset:0];
  return v2;
}

- (id)newOperationForContinuation
{
  v6.receiver = self;
  v6.super_class = (Class)DDWebKitOperation;
  id v3 = [(DDOperation *)&v6 newOperationForContinuation];
  objc_super v4 = [(DDWebKitOperation *)self endNode];
  [v3 setStartNode:v4];

  objc_msgSend(v3, "setStartOffset:", -[DDWebKitOperation endOffset](self, "endOffset"));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    [(DDWebKitOperation *)(uint64_t)v3 newOperationForContinuation];
  }
  return v3;
}

- (void)dispatchContainerModificationBlock:(id)a3
{
  dispatch_block_t block = a3;
  if (WebThreadIsEnabled()) {
    WebThreadRun();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (DOMNode)startNode
{
  return self->_startNode;
}

- (void)setStartNode:(id)a3
{
}

- (int)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(int)a3
{
  self->_startOffset = a3;
}

- (DOMNode)endNode
{
  return self->_endNode;
}

- (void)setEndNode:(id)a3
{
}

- (int)endOffset
{
  return self->_endOffset;
}

- (void)setEndOffset:(int)a3
{
  self->_endOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endNode, 0);
  objc_storeStrong((id *)&self->_startNode, 0);
}

- (void)_rangeValidForContainer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The DOMDocument changed under our feet: %p != %p", (uint8_t *)&v2, 0x16u);
}

- (void)_createScanQueryForBackend
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [a1 container];
  uint64_t v3 = [a1 endNode];
  OUTLINED_FUNCTION_0_3();
  BOOL v7 = a1;
  __int16 v8 = v4;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Will need to register a continuation for frame %@ (once I, %@, am done; I'll stop at %@)",
    v6,
    0x20u);
}

- (void)newOperationForContinuation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 endNode];
  [a2 endOffset];
  OUTLINED_FUNCTION_0_3();
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_debug_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Creating continuation %@. The new start node is %@, the start offset is %d", v5, 0x1Cu);
}

@end