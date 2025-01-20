@interface TDRenditionsDistiller
- (TDLogger)logger;
- (TDRenditionsDistiller)initWithDocument:(id)a3 shouldCompressCSIDataFlag:(BOOL)a4;
- (id)_nextObjectFromInQueue;
- (id)nextCSIDataInfoFromQueue;
- (void)_distill:(id)a3;
- (void)_enqueueDistillingAbortedInfo;
- (void)_enqueueLastCSIDataInfoFlag;
- (void)_enqueueOnInQueueTheObject:(id)a3;
- (void)_enqueueOnOutQueueTheObject:(id)a3;
- (void)_enqueueOnQueue:(id)a3 withQueueLock:(id)a4 object:(id)a5;
- (void)dealloc;
- (void)detachDistillationThread;
- (void)enqueueAbortFlag;
- (void)enqueueLastRenditionFlag;
- (void)enqueueRenditionSpec:(id)a3;
- (void)setLogger:(id)a3;
- (void)waitUntilFinished;
@end

@implementation TDRenditionsDistiller

- (TDRenditionsDistiller)initWithDocument:(id)a3 shouldCompressCSIDataFlag:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TDRenditionsDistiller;
  v6 = [(TDRenditionsDistiller *)&v8 init];
  if (v6)
  {
    v6->document = (CoreThemeDocument *)a3;
    v6->shouldCompressCSIDataFlag = a4;
    v6->renditionInQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v6->csiDataInfoOutQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v6->inQueueLock = (NSConditionLock *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    v6->outQueueLock = (NSConditionLock *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
    v6->_group = (OS_dispatch_group *)dispatch_group_create();
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_group);
  [(TDRenditionsDistiller *)self setLogger:0];
  v3.receiver = self;
  v3.super_class = (Class)TDRenditionsDistiller;
  [(TDRenditionsDistiller *)&v3 dealloc];
}

- (void)_enqueueOnQueue:(id)a3 withQueueLock:(id)a4 object:(id)a5
{
  [a4 lock];
  [a3 addObject:a5];

  [a4 unlockWithCondition:1];
}

- (void)_enqueueOnInQueueTheObject:(id)a3
{
}

- (void)_enqueueOnOutQueueTheObject:(id)a3
{
}

- (void)_enqueueLastCSIDataInfoFlag
{
  uint64_t v3 = [NSNumber numberWithInteger:0];

  [(TDRenditionsDistiller *)self _enqueueOnOutQueueTheObject:v3];
}

- (void)_enqueueDistillingAbortedInfo
{
  [(NSConditionLock *)self->outQueueLock lock];
  -[NSMutableArray insertObject:atIndex:](self->csiDataInfoOutQueue, "insertObject:atIndex:", objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"DistillingAborted"), 0);
  outQueueLock = self->outQueueLock;

  [(NSConditionLock *)outQueueLock unlockWithCondition:1];
}

- (id)_nextObjectFromInQueue
{
  if (self->noMoreRenditions) {
    return 0;
  }
  [(NSConditionLock *)self->inQueueLock lockWhenCondition:1];
  uint64_t v5 = [(NSMutableArray *)self->renditionInQueue count];
  if (!v5)
  {
    [(NSConditionLock *)self->inQueueLock unlockWithCondition:0];
    return 0;
  }
  uint64_t v6 = v5;
  id v2 = (id)[(NSMutableArray *)self->renditionInQueue objectAtIndex:0];
  [(NSMutableArray *)self->renditionInQueue removeObjectAtIndex:0];
  [(NSConditionLock *)self->inQueueLock unlockWithCondition:v6 != 1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v2 integerValue])
    {
      if ([v2 integerValue] != 1) {
        return v2;
      }
    }
    else
    {
      id v2 = 0;
    }
    self->noMoreRenditions = 1;
  }
  return v2;
}

- (void)_distill:(id)a3
{
  context = (void *)MEMORY[0x237DD6000](self, a2, a3);
  v4 = [(TDRenditionsDistiller *)self logger];
  *(_WORD *)&self->noMoreCSIDataInfo = 0;
  int v5 = 5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  do
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
    objc_msgSend(v7, "setPersistentStoreCoordinator:", objc_msgSend((id)objc_msgSend(-[CoreThemeDocument mocOrganizer](self->document, "mocOrganizer"), "mainMOC"), "persistentStoreCoordinator"));
    [v7 setUndoManager:0];
    [v6 addObject:v7];

    --v5;
  }
  while (v5);
  id v8 = [(TDRenditionsDistiller *)self _nextObjectFromInQueue];
  if (v8)
  {
    id v9 = v8;
    unint64_t v10 = 1;
    do
    {
      v11 = (void *)MEMORY[0x237DD6000]();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v9 integerValue] == 1)
        {
          [(TDRenditionsDistiller *)self _enqueueDistillingAbortedInfo];
          break;
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDRenditionsDistiller.m", 196, @"TDRenditionsDistiller unrecognized flag in renditionsInQueue.");
      }
      v12 = (void *)[v6 objectAtIndex:v10 % 5];
      dispatch_group_enter((dispatch_group_t)self->_group);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __34__TDRenditionsDistiller__distill___block_invoke;
      v15[3] = &unk_264C44FE8;
      v15[4] = v12;
      v15[5] = v9;
      v15[6] = self;
      v15[7] = v4;
      [v12 performBlock:v15];
      id v9 = [(TDRenditionsDistiller *)self _nextObjectFromInQueue];
      ++v10;
    }
    while (v9);
  }
  [(TDRenditionsDistiller *)self waitUntilFinished];
  [(TDRenditionsDistiller *)self _enqueueLastCSIDataInfoFlag];
}

void __34__TDRenditionsDistiller__distill___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) objectWithID:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 48) + 8) updateRenditionSpec:v2];
  uint64_t v3 = objc_msgSend(v2, "createCSIRepresentationWithCompression:colorSpaceID:document:", *(unsigned __int8 *)(*(void *)(a1 + 48) + 48), objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "colorSpaceID"), *(void *)(*(void *)(a1 + 48) + 8));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "_enqueueCSIDataInfo:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v3, @"CSIData", *(void *)(a1 + 40), @"RenditionSpec", 0));
    [*(id *)(a1 + 32) reset];
  }
  else
  {
    [*(id *)(a1 + 56) logErrorWithFormat:@"ERROR: CSI Data was nil for rendition spec %@", v2];
    [*(id *)(a1 + 48) _enqueueDistillingAbortedInfo];
  }
  v4 = *(NSObject **)(*(void *)(a1 + 48) + 56);

  dispatch_group_leave(v4);
}

- (void)waitUntilFinished
{
}

- (void)detachDistillationThread
{
}

- (void)enqueueLastRenditionFlag
{
  uint64_t v3 = [NSNumber numberWithInteger:0];

  [(TDRenditionsDistiller *)self _enqueueOnInQueueTheObject:v3];
}

- (void)enqueueAbortFlag
{
  [(NSConditionLock *)self->inQueueLock lock];
  -[NSMutableArray insertObject:atIndex:](self->renditionInQueue, "insertObject:atIndex:", [NSNumber numberWithInteger:1], 0);
  inQueueLock = self->inQueueLock;

  [(NSConditionLock *)inQueueLock unlockWithCondition:1];
}

- (void)enqueueRenditionSpec:(id)a3
{
  uint64_t v4 = [a3 objectID];

  [(TDRenditionsDistiller *)self _enqueueOnInQueueTheObject:v4];
}

- (id)nextCSIDataInfoFromQueue
{
  if (!self->noMoreCSIDataInfo)
  {
    [(NSConditionLock *)self->outQueueLock lockWhenCondition:1];
    uint64_t v6 = [(NSMutableArray *)self->csiDataInfoOutQueue count];
    if (v6)
    {
      uint64_t v7 = v6;
      id v2 = (id)[(NSMutableArray *)self->csiDataInfoOutQueue objectAtIndex:0];
      [(NSMutableArray *)self->csiDataInfoOutQueue removeObjectAtIndex:0];
      [(NSConditionLock *)self->outQueueLock unlockWithCondition:v7 != 1];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v2;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![v2 integerValue])
      {
        id v2 = 0;
        self->noMoreCSIDataInfo = 1;
        return v2;
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDRenditionsDistiller.m", 290, @"TDRenditionsDistiller found unexpected object in outQueue");
    }
    else
    {
      [(NSConditionLock *)self->outQueueLock unlockWithCondition:0];
    }
  }
  return 0;
}

- (TDLogger)logger
{
  return (TDLogger *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLogger:(id)a3
{
}

@end