@interface BMStreamDatastorePruner
- (BMStreamDatastorePruner)initWithStream:(id)a3 config:(id)a4;
- (BMStreamDatastorePruner)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5;
- (BMStreamDatastorePruningDelegate)delegate;
- (BOOL)deleteEventAtBookmark:(id)a3 outTombstoneBookmark:(id *)a4;
- (BOOL)isDataAccessible;
- (Class)eventBodyClass;
- (id)fetchEventsFrom:(double)a3 to:(double)a4;
- (id)newEnumeratorFromBookmark:(id)a3;
- (id)newEnumeratorFromStartTime:(double)a3;
- (id)streamIdentifier;
- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 shouldDeleteUsingBlock:(id)a7;
- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 shouldDeleteUsingBlock:(id)a6;
- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 usingBlock:(id)a6;
- (void)setDelegate:(id)a3;
- (void)syncMappedFiles;
@end

@implementation BMStreamDatastorePruner

- (BMStreamDatastorePruner)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BMStreamDatastorePruner;
  v10 = [(BMStreamDatastorePruner *)&v15 init];
  if (v10)
  {
    v11 = [BMStreamDatastore alloc];
    uint64_t v12 = [(BMStreamDatastore *)v11 initWithStream:v8 permission:2 config:v9 includeTombstones:1 eventDataClass:a5 useCase:*MEMORY[0x1E4F4FB10]];
    inner = v10->_inner;
    v10->_inner = (BMStreamDatastore *)v12;
  }
  return v10;
}

- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 policyID:(id)a6 shouldDeleteUsingBlock:(id)a7
{
  id v16 = a6;
  id v12 = a7;
  v13 = [MEMORY[0x1E4F4FB88] streamIdentifiers];
  v14 = [(BMStreamDatastore *)self->_inner streamId];
  int v15 = [v13 containsObject:v14];

  if (v15) {
    [(BMStreamDatastore *)self->_inner pruneStreamToMaxStreamSizeInBytes:52428800];
  }
  [(BMStreamDatastore *)self->_inner removeEventsFrom:a5 to:v16 reason:v12 policyID:a3 shouldDeleteUsingBlock:a4];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDataAccessible
{
  return [(BMStreamDatastore *)self->_inner isDataAccessible];
}

- (void).cxx_destruct
{
}

- (BMStreamDatastorePruner)initWithStream:(id)a3 config:(id)a4
{
  return [(BMStreamDatastorePruner *)self initWithStream:a3 config:a4 eventDataClass:0];
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4
{
  return [(BMStreamDatastore *)self->_inner fetchEventsFrom:a3 to:a4];
}

- (void)removeEventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 usingBlock:(id)a6
{
  id v13 = a6;
  v10 = [MEMORY[0x1E4F4FB88] streamIdentifiers];
  v11 = [(BMStreamDatastore *)self->_inner streamId];
  int v12 = [v10 containsObject:v11];

  if (v12) {
    [(BMStreamDatastore *)self->_inner pruneStreamToMaxStreamSizeInBytes:52428800];
  }
  [(BMStreamDatastore *)self->_inner removeEventsFrom:a5 to:1 reason:v13 pruneFutureEvents:a3 usingBlock:a4];
}

- (BOOL)deleteEventAtBookmark:(id)a3 outTombstoneBookmark:(id *)a4
{
  return [(BMStreamDatastore *)self->_inner deleteEventAtBookmark:a3 outTombstoneBookmark:a4];
}

- (void)eventsFrom:(double)a3 to:(double)a4 reason:(unint64_t)a5 shouldDeleteUsingBlock:(id)a6
{
}

- (id)newEnumeratorFromStartTime:(double)a3
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromStartTime:a3];
}

- (id)newEnumeratorFromBookmark:(id)a3
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromBookmark:a3];
}

- (void)syncMappedFiles
{
}

- (Class)eventBodyClass
{
  return [(BMStreamDatastore *)self->_inner eventBodyClass];
}

- (id)streamIdentifier
{
  return [(BMStreamDatastore *)self->_inner streamId];
}

- (BMStreamDatastorePruningDelegate)delegate
{
  return [(BMStreamDatastore *)self->_inner delegate];
}

@end