@interface NSDocumentDeserializer
- (id)deserializeNewData;
- (id)deserializeNewPList;
- (void)fixupDirInfo:(id)a3;
@end

@implementation NSDocumentDeserializer

- (id)deserializeNewData
{
  v3 = +[NSData allocWithZone:[(NSDocumentDeserializer *)self zone]];

  return [(NSAKDeserializer *)self deserializeData:v3];
}

- (void)fixupDirInfo:(id)a3
{
  uint64_t v4 = [(NSDocumentDeserializer *)self zone];
  v5 = (void *)[a3 objectForKey:@"."];
  if (v5)
  {
    id v8 = (id)[v5 deserializer];
    id v6 = [(NSAKDeserializer *)+[NSDirInfoDeserializer allocWithZone:v4] initForDeserializerStream:v8];
    v7 = objc_msgSend(v6, "deserializePList:", +[NSDirInfo allocWithZone:](NSDirInfo, "allocWithZone:", v4));
    [a3 setObject:v7 forKey:@"."];
  }
}

- (id)deserializeNewPList
{
  id v3 = [(NSAKDeserializer *)self deserializePList:+[NSRTFD allocWithZone:[(NSDocumentDeserializer *)self zone]]];
  [(NSDocumentDeserializer *)self fixupDirInfo:v3];
  return v3;
}

@end