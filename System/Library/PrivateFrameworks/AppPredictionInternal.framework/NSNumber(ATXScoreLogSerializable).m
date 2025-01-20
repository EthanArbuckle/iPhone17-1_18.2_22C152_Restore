@interface NSNumber(ATXScoreLogSerializable)
- (uint64_t)needsQuotes;
- (void)atx_writeToFile:()ATXScoreLogSerializable;
@end

@implementation NSNumber(ATXScoreLogSerializable)

- (uint64_t)needsQuotes
{
  int v2 = [a1 isEqualToNumber:&unk_1F27F3C18];
  int v3 = v2 | [a1 isEqualToNumber:&unk_1F27F3C28];
  return v3 | [a1 isEqualToNumber:&unk_1F27F3C38];
}

- (void)atx_writeToFile:()ATXScoreLogSerializable
{
  id v4 = a1;
  int v5 = *(char *)[v4 objCType];
  switch(v5)
  {
    case 'd':
      if ([v4 needsQuotes]) {
        v8 = "\"%0.16g\"";
      }
      else {
        v8 = "%0.16g";
      }
      [v4 doubleValue];
      goto LABEL_16;
    case 'f':
      if ([v4 needsQuotes]) {
        v8 = "\"%0.7g\"";
      }
      else {
        v8 = "%0.7g";
      }
      [v4 floatValue];
      double v9 = v10;
LABEL_16:
      fprintf(a3, v8, *(void *)&v9);
      return;
    case 'i':
      uint64_t v6 = [v4 intValue];
      if ([v4 needsQuotes]) {
        v7 = "\"%d\"";
      }
      else {
        v7 = "%d";
      }
      fprintf(a3, v7, v6);
      break;
    default:
      printStringRepresentation(a3, v4);
      break;
  }
}

@end