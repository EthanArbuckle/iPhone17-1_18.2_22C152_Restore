@interface ASFAsn1SetToken
- (id)description;
- (id)nextToken;
@end

@implementation ASFAsn1SetToken

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SET Token. (length:%ld)", -[NSData length](self->super.mData, "length"));
}

- (id)nextToken
{
  if (a1 && [*(id *)(a1 + 32) length])
  {
    uint64_t v9 = 0;
    v2 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, *(void **)(a1 + 32), &v9);
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = v9;
    uint64_t v5 = [v3 length];
    uint64_t v6 = objc_msgSend(v3, "subdataWithRange:", v4, v5 - v9);
    v7 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v6;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end