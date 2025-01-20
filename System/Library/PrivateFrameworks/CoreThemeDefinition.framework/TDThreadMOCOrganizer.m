@interface TDThreadMOCOrganizer
- (TDThreadMOCOrganizer)init;
- (TDThreadMOCOrganizer)initWithDocument:(id)a3 mainThread:(id)a4;
- (id)document;
- (id)mainMOC;
- (id)mainThread;
- (id)threadMOC;
- (void)setThreadMOC:(id)a3;
@end

@implementation TDThreadMOCOrganizer

- (void)setThreadMOC:(id)a3
{
  if (!self->mainThread) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDThreadMOCOrganizer.m", 18, @"Must set mainThread before using -[TDThreadMOCOrganizer setThreadMOC:]");
  }
  v5 = (void *)[MEMORY[0x263F08B88] currentThread];
  if (!a3 || v5 == [(TDThreadMOCOrganizer *)self mainThread])
  {
    v7 = (void *)[v5 threadDictionary];
    [v7 removeObjectForKey:@"TDThreadMOC"];
  }
  else
  {
    v6 = (void *)[v5 threadDictionary];
    [v6 setObject:a3 forKey:@"TDThreadMOC"];
  }
}

- (id)mainThread
{
  id result = self->mainThread;
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDThreadMOCOrganizer.m", 29, @"-[TDThreadMOCOrganizer mainThread] called with mainThread not set");
    return self->mainThread;
  }
  return result;
}

- (id)document
{
  return self->document;
}

- (id)mainMOC
{
  id v2 = [(TDThreadMOCOrganizer *)self document];

  return (id)[v2 managedObjectContext];
}

- (id)threadMOC
{
  v3 = (void *)[MEMORY[0x263F08B88] currentThread];
  if (v3 == [(TDThreadMOCOrganizer *)self mainThread])
  {
    return [(TDThreadMOCOrganizer *)self mainMOC];
  }
  else
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "threadDictionary"), "objectForKey:", @"TDThreadMOC");
    if (!v4)
    {
      v4 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
      objc_msgSend(v4, "setPersistentStoreCoordinator:", objc_msgSend(-[TDThreadMOCOrganizer mainMOC](self, "mainMOC"), "persistentStoreCoordinator"));
      [v4 setUndoManager:0];
      [(TDThreadMOCOrganizer *)self setThreadMOC:v4];
    }
    return v4;
  }
}

- (TDThreadMOCOrganizer)init
{
  return 0;
}

- (TDThreadMOCOrganizer)initWithDocument:(id)a3 mainThread:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TDThreadMOCOrganizer;
  v7 = [(TDThreadMOCOrganizer *)&v9 init];
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"TDThreadMOCOrganizer.m", 71, @"-[TDThreadMOCOrganizer initWithDocument:mainThread:] called with nil document");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"TDThreadMOCOrganizer.m", 72, @"-[TDThreadMOCOrganizer initWithDocument:mainThread:] called with nil thread");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v7->mainThread = (NSThread *)a4;
  v7->document = (CoreThemeDocument *)a3;
  return v7;
}

@end