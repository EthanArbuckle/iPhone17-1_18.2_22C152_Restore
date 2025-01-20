@interface BMStreamDatastoreReader
- (BMStreamDatastore)inner;
- (BMStreamDatastoreReader)initWithStream:(id)a3 config:(id)a4;
- (BMStreamDatastoreReader)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5 useCase:(id)a6;
- (BOOL)isDataAccessible;
- (Class)eventBodyClass;
- (id)fetchEventsFrom:(double)a3 to:(double)a4;
- (id)fetchEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5;
- (id)newEnumeratorFromBookmark:(id)a3;
- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4;
- (id)newEnumeratorFromBookmarkEnumerator:(id)a3 error:(id *)a4;
- (id)newEnumeratorFromStartTime:(double)a3;
- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 options:(unint64_t)a7;
- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 options:(unint64_t)a6;
- (id)newEnumeratorFromStartTime:(double)a3 options:(unint64_t)a4;
- (id)streamIdentifier;
@end

@implementation BMStreamDatastoreReader

- (BOOL)isDataAccessible
{
  return [(BMStreamDatastore *)self->_inner isDataAccessible];
}

- (id)newEnumeratorFromBookmark:(id)a3
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromBookmark:a3 options:0];
}

- (void).cxx_destruct
{
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 options:(unint64_t)a7
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromStartTime:a5 endTime:a6 maxEvents:a7 lastN:a3 options:a4];
}

- (BMStreamDatastoreReader)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5 useCase:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMStreamDatastoreReader;
  v13 = [(BMStreamDatastoreReader *)&v17 init];
  if (v13)
  {
    v14 = [[BMStreamDatastore alloc] initWithStream:v10 streamPath:0 permission:0 config:v11 eventDataClass:a5 useCase:v12];
    inner = v13->_inner;
    v13->_inner = v14;
  }
  return v13;
}

- (BMStreamDatastoreReader)initWithStream:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMStreamDatastoreReader;
  v8 = [(BMStreamDatastoreReader *)&v12 init];
  if (v8)
  {
    v9 = [[BMStreamDatastore alloc] initWithStream:v6 permission:0 config:v7 includeTombstones:0];
    inner = v8->_inner;
    v8->_inner = v9;
  }
  return v8;
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4
{
  return [(BMStreamDatastore *)self->_inner fetchEventsFrom:0 to:a3 options:a4];
}

- (id)fetchEventsFrom:(double)a3 to:(double)a4 options:(unint64_t)a5
{
  return [(BMStreamDatastore *)self->_inner fetchEventsFrom:a5 to:a3 options:a4];
}

- (id)newEnumeratorFromStartTime:(double)a3
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromStartTime:0 options:a3];
}

- (id)newEnumeratorFromStartTime:(double)a3 options:(unint64_t)a4
{
  inner = self->_inner;
  id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v7 timeIntervalSinceReferenceDate];
  id v9 = [(BMStreamDatastore *)inner newEnumeratorFromStartTime:a4 endTime:a3 options:v8];

  return v9;
}

- (id)newEnumeratorFromStartTime:(double)a3 endTime:(double)a4 maxEvents:(unint64_t)a5 options:(unint64_t)a6
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromStartTime:a5 endTime:a6 maxEvents:a3 options:a4];
}

- (id)newEnumeratorFromBookmarkEnumerator:(id)a3 error:(id *)a4
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromBookmarkEnumerator:a3 error:a4];
}

- (id)newEnumeratorFromBookmark:(id)a3 options:(unint64_t)a4
{
  return [(BMStreamDatastore *)self->_inner newEnumeratorFromBookmark:a3 options:a4];
}

- (Class)eventBodyClass
{
  return [(BMStreamDatastore *)self->_inner eventBodyClass];
}

- (id)streamIdentifier
{
  return [(BMStreamDatastore *)self->_inner streamId];
}

- (BMStreamDatastore)inner
{
  return self->_inner;
}

@end