@interface NSDirInfo
- (NSDirInfo)init;
- (NSDirInfo)initWithCapacity:(unint64_t)a3;
- (NSDirInfo)initWithContentsOfFile:(id)a3;
- (NSDirInfo)initWithDictionary:(id)a3;
- (NSDirInfo)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
- (NSDirInfo)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (id)serializeToData;
- (unint64_t)count;
- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7;
- (void)dealloc;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NSDirInfo

- (NSDirInfo)init
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
  return self;
}

- (NSDirInfo)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithObjects:a3 forKeys:a4 count:a5];
  return self;
}

- (NSDirInfo)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithDictionary:a3 copyItems:a4];
  return self;
}

- (NSDirInfo)initWithDictionary:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithDictionary:a3];
  return self;
}

- (NSDirInfo)initWithContentsOfFile:(id)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:a3];
  return self;
}

- (NSDirInfo)initWithCapacity:(unint64_t)a3
{
  self->dict = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSDirInfo;
  [(NSDirInfo *)&v3 dealloc];
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->dict count];
}

- (id)objectForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->dict objectForKey:a3];
}

- (id)keyEnumerator
{
  return (id)[(NSMutableDictionary *)self->dict keyEnumerator];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (unint64_t)writePath:(id)a3 docInfo:(id)a4 errorHandler:(id)a5 remapContents:(BOOL)a6 hardLinkPath:(id)a7
{
  return 0;
}

- (id)serializeToData
{
  uint64_t v3 = [(NSDirInfo *)self zone];
  uint64_t v4 = [+[NSAKSerializerStream allocWithZone:v3] init];
  id v5 = [(NSAKSerializer *)+[NSDirInfoSerializer allocWithZone:v3] initForSerializerStream:v4];
  id v6 = -[NSPageData initFromSerializerStream:length:](+[NSData allocWithZone:](NSPageData, "allocWithZone:", v3), "initFromSerializerStream:length:", v4, [v5 serializePropertyList:self]);

  return v6;
}

@end