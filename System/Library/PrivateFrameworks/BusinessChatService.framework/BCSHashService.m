@interface BCSHashService
+ (BOOL)isValidFullHash:(id)a3;
+ (id)SHA256HashForInputString:(id)a3;
+ (id)_SHA256DataForInputString:(uint64_t)a1;
+ (int64_t)SHA256TruncatedHashForInputString:(id)a3 includedBytes:(unint64_t)a4;
+ (int64_t)truncatedHashForFullHash:(id)a3 includedBytes:(unint64_t)a4;
+ (uint64_t)_truncatedHashForFullHashData:(unint64_t)a3 includedBytes:;
@end

@implementation BCSHashService

+ (int64_t)SHA256TruncatedHashForInputString:(id)a3 includedBytes:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    v7 = +[BCSHashService _SHA256DataForInputString:]((uint64_t)a1, v6);
    int64_t v8 = +[BCSHashService _truncatedHashForFullHashData:includedBytes:]((uint64_t)BCSHashService, v7, a4);
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

+ (id)_SHA256DataForInputString:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (v2)
  {
    v3 = (const char *)[v2 cStringUsingEncoding:4];
    v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v3 length:strlen(v3)];
    v5 = [MEMORY[0x263EFF990] dataWithLength:32];
    id v6 = v4;
    v7 = (const void *)[v6 bytes];
    CC_LONG v8 = [v6 length];
    id v9 = v5;
    CC_SHA256(v7, v8, (unsigned __int8 *)[v9 mutableBytes]);
    v10 = (void *)[v9 copy];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (uint64_t)_truncatedHashForFullHashData:(unint64_t)a3 includedBytes:
{
  id v4 = a2;
  self;
  if ([v4 length])
  {
    uint64_t v8 = 0;
    if (a3 >= 8) {
      uint64_t v5 = 8;
    }
    else {
      uint64_t v5 = a3;
    }
    [v4 getBytes:&v8 length:v5];
    if (v8 >= 0) {
      uint64_t v6 = v8;
    }
    else {
      uint64_t v6 = -v8;
    }
  }
  else
  {
    uint64_t v6 = -1;
  }

  return v6;
}

+ (int64_t)truncatedHashForFullHash:(id)a3 includedBytes:(unint64_t)a4
{
  uint64_t v5 = +[NSData bcs_dataWithHexString:](MEMORY[0x263EFF8F8], a3);
  if (v5) {
    int64_t v6 = +[BCSHashService _truncatedHashForFullHashData:includedBytes:]((uint64_t)BCSHashService, v5, a4);
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

+ (id)SHA256HashForInputString:(id)a3
{
  +[BCSHashService _SHA256DataForInputString:]((uint64_t)a1, a3);
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (unsigned __int8 *)[v3 bytes];
  uint64_t v5 = [v3 length];
  for (i = [MEMORY[0x263F089D8] stringWithCapacity:2 * v5];
  {
    unsigned int v7 = *v4++;
    objc_msgSend(i, "appendFormat:", @"%02x", v7);
  }
  uint64_t v8 = (void *)[i copy];

  return v8;
}

+ (BOOL)isValidFullHash:(id)a3
{
  id v3 = +[NSData bcs_dataWithHexString:](MEMORY[0x263EFF8F8], a3);
  BOOL v4 = v3 != 0;

  return v4;
}

@end