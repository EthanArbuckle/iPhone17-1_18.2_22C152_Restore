@interface NLTokenIDConverter
- (id)stringForTokenID:(unsigned int)a3;
- (id)stringForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4;
- (unsigned)tokenIDForString:(id)a3;
@end

@implementation NLTokenIDConverter

- (unsigned)tokenIDForString:(id)a3
{
  return 0;
}

- (id)stringForTokenID:(unsigned int)a3
{
  return 0;
}

- (id)stringForTokenIDs:(const unsigned int *)a3 length:(unint64_t)a4
{
  return 0;
}

@end