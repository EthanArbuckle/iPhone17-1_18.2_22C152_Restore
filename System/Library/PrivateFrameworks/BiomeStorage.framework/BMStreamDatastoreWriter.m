@interface BMStreamDatastoreWriter
+ (id)outOfProcessWriterForStream:(id)a3 user:(unsigned int)a4 eventDataClass:(Class)a5;
- (BMStreamDatastoreWriter)initWithStream:(id)a3 config:(id)a4;
- (BMStreamDatastoreWriter)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5;
- (BOOL)_writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5 outBookmark:(id *)a6;
- (BOOL)isDataAccessible;
- (BOOL)writeEventBodyClass:(Class)a3;
- (BOOL)writeEventWithEventBody:(id)a3;
- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4;
- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5;
- (Class)eventBodyClass;
- (id)streamIdentifier;
- (void)syncMappedFiles;
@end

@implementation BMStreamDatastoreWriter

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5
{
  return [(BMStreamDatastore *)self->_inner writeEventWithEventBody:a3 timestamp:a5 outEventSize:a4];
}

- (BOOL)isDataAccessible
{
  return [(BMStreamDatastore *)self->_inner isDataAccessible];
}

- (BMStreamDatastoreWriter)initWithStream:(id)a3 config:(id)a4 eventDataClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BMStreamDatastoreWriter;
  v10 = [(BMStreamDatastoreWriter *)&v15 init];
  if (v10)
  {
    v11 = [BMStreamDatastore alloc];
    uint64_t v12 = [(BMStreamDatastore *)v11 initWithStream:v8 permission:1 config:v9 includeTombstones:0 eventDataClass:a5 useCase:*MEMORY[0x1E4F4FB20]];
    inner = v10->_inner;
    v10->_inner = (BMStreamDatastore *)v12;
  }
  return v10;
}

- (void).cxx_destruct
{
}

- (BOOL)writeEventWithEventBody:(id)a3
{
  return [(BMStreamDatastore *)self->_inner writeEventWithEventBody:a3];
}

- (Class)eventBodyClass
{
  return [(BMStreamDatastore *)self->_inner eventBodyClass];
}

- (BOOL)writeEventBodyClass:(Class)a3
{
  return [(BMStreamDatastore *)self->_inner updateMetadata:a3];
}

- (BMStreamDatastoreWriter)initWithStream:(id)a3 config:(id)a4
{
  return [(BMStreamDatastoreWriter *)self initWithStream:a3 config:a4 eventDataClass:0];
}

- (BOOL)_writeEventData:(id)a3 dataVersion:(unsigned int)a4 timestamp:(double)a5 outBookmark:(id *)a6
{
  return [(BMStreamDatastore *)self->_inner writeEventData:a3 dataVersion:*(void *)&a4 timestamp:a6 outBookmark:a5];
}

- (id)streamIdentifier
{
  return [(BMStreamDatastore *)self->_inner streamId];
}

- (void)syncMappedFiles
{
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4
{
  return [(BMStreamDatastore *)self->_inner writeEventWithEventBody:a3 timestamp:0 outEventSize:a4];
}

+ (id)outOfProcessWriterForStream:(id)a3 user:(unsigned int)a4 eventDataClass:(Class)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = [[BMStreamDatastoreOutOfProcessWriter alloc] initWithStream:v7 user:v6 eventDataClass:a5];

  return v8;
}

@end