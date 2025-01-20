@interface XRXMLInt64ElementParser
- (void)_handleCompletion;
@end

@implementation XRXMLInt64ElementParser

- (void)_handleCompletion
{
  uint64_t v23 = 0;
  v6 = [self stringValueWithFormat:a2, v2, v3, v4];
  int LongLong = [v6 _getLongLong:v7 withLongLong:v8 withLongLong:v9];

  if (LongLong)
  {
    parent = self->super.super.parent;
    v15 = [NSNumber numberWithLongLong:v11];
    v20 = [self elementName:v16 withValue:v17 forKey:v18];
    [parent setValue:v21 forElementName:(uint64_t)v15];
  }
}

@end