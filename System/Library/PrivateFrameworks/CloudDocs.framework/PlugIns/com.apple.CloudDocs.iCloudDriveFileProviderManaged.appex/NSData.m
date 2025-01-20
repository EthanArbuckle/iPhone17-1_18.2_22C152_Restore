@interface NSData
+ (id)br_changeTokenFromRank:(unint64_t)a3 uuid:(unsigned __int8)a4[16];
+ (id)br_pageTokenFromSortOrder:(unsigned __int8)a3 gatherBatch:(unint64_t)a4;
+ (id)br_pageTokenFromSortOrder:(unsigned __int8)a3 offset:(unint64_t)a4;
- (BOOL)br_pageTokenCompletedInitialEnumeration;
- (int64_t)br_changeTokenRankWithUUID:(unsigned __int8)a3[16];
- (unint64_t)br_pageTokenOffset;
- (unsigned)br_pageTokenSortOrder;
@end

@implementation NSData

- (unsigned)br_pageTokenSortOrder
{
  if ([(NSData *)self isEqualToData:NSFileProviderInitialPageSortedByDate]) {
    return 1;
  }
  if ([(NSData *)self isEqualToData:NSFileProviderInitialPageSortedByName]) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  [(NSData *)self getBytes:&v4 length:16];
  return v5;
}

- (unint64_t)br_pageTokenOffset
{
  if ([(NSData *)self isEqualToData:NSFileProviderInitialPageSortedByDate]
    || [(NSData *)self isEqualToData:NSFileProviderInitialPageSortedByName])
  {
    return 0;
  }
  v4[0] = 0;
  v4[1] = 0;
  [(NSData *)self getBytes:v4 length:16];
  return v4[0];
}

- (BOOL)br_pageTokenCompletedInitialEnumeration
{
  if ([(NSData *)self isEqualToData:NSFileProviderInitialPageSortedByDate]
    || [(NSData *)self isEqualToData:NSFileProviderInitialPageSortedByName])
  {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  [(NSData *)self getBytes:&v4 length:16];
  return BYTE1(v5) != 0;
}

+ (id)br_pageTokenFromSortOrder:(unsigned __int8)a3 offset:(unint64_t)a4
{
  if (a4)
  {
    v7[0] = a4;
    v7[1] = a3;
    uint64_t v5 = +[NSData dataWithBytes:v7 length:16];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

+ (id)br_pageTokenFromSortOrder:(unsigned __int8)a3 gatherBatch:(unint64_t)a4
{
  unint64_t v6 = a4;
  uint64_t v7 = a3;
  BYTE1(v7) = 1;
  uint64_t v4 = +[NSData dataWithBytes:&v6 length:16];

  return v4;
}

- (int64_t)br_changeTokenRankWithUUID:(unsigned __int8)a3[16]
{
  int64_t v5 = 0;
  v6[0] = 0;
  v6[1] = 0;
  [(NSData *)self getBytes:&v5 length:24];
  if (uuid_compare((const unsigned __int8 *)v6, a3)) {
    return -1;
  }
  else {
    return v5;
  }
}

+ (id)br_changeTokenFromRank:(unint64_t)a3 uuid:(unsigned __int8)a4[16]
{
  v8[0] = 0;
  v8[1] = 0;
  uuid_copy((unsigned __int8 *)v8, a4);
  unint64_t v7 = a3;
  int64_t v5 = +[NSData dataWithBytes:&v7 length:24];

  return v5;
}

@end