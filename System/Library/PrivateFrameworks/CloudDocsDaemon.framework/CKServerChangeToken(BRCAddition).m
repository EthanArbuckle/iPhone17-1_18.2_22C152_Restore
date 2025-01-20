@interface CKServerChangeToken(BRCAddition)
+ (uint64_t)newFromSqliteStatement:()BRCAddition atIndex:;
+ (uint64_t)newFromSqliteValue:()BRCAddition;
- (id)descriptionWithContext:()BRCAddition;
- (void)sqliteBind:()BRCAddition index:;
@end

@implementation CKServerChangeToken(BRCAddition)

- (id)descriptionWithContext:()BRCAddition
{
  id v4 = a3;
  v5 = [a1 data];
  if ([v5 length] == 33)
  {
    id v6 = v5;
    v7 = (char *)[v6 bytes];
    uint64_t v8 = *v7;
    if (v8 == 1)
    {
      unint64_t v9 = bswap64(*(void *)(v7 + 1));
      unint64_t v10 = *(void *)(v7 + 9);
      if (v10 == -129)
      {
        v11 = @"current";
      }
      else
      {
        v23 = [NSNumber numberWithUnsignedLongLong:bswap64(v10)];
        v24 = [v23 stringValue];
        id v25 = +[BRCDumpContext highlightedString:v24 type:1 context:v4];

        v11 = 0;
      }
      v26 = [NSNumber numberWithUnsignedLongLong:v9];
      v27 = [v26 stringValue];
      v19 = +[BRCDumpContext highlightedString:v27 type:1 context:v4];

      v22 = NSString;
      uint64_t v31 = (uint64_t)v19;
      v32 = v11;
      v20 = @"<%@,%@>";
      goto LABEL_14;
    }
  }
  else
  {
    if ([v5 length] != 17)
    {
      v18 = NSString;
      uint64_t v21 = [v5 length];
      v19 = [v5 base64EncodedStringWithOptions:0];
      uint64_t v31 = v21;
      v32 = v19;
      v20 = @"unkown-token-size:%lu (%@)";
      goto LABEL_11;
    }
    id v6 = v5;
    v12 = (char *)[v6 bytes];
    uint64_t v8 = *v12;
    if (v8 == 101)
    {
      unint64_t v13 = *(void *)(v12 + 1);
      unint64_t v14 = *(void *)(v12 + 9);
      if (v13 == -1)
      {
        v17 = @"beginning";
      }
      else
      {
        v15 = [NSNumber numberWithUnsignedLongLong:bswap64(v13)];
        v16 = [v15 stringValue];
        v17 = +[BRCDumpContext highlightedString:v16 type:1 context:v4];
      }
      if (v14 == -1)
      {
        v19 = @"beginning";
      }
      else
      {
        v30 = [NSNumber numberWithUnsignedLongLong:bswap64(v14)];
        v19 = [v30 stringValue];
      }
      v28 = [NSString stringWithFormat:@"<%@,%@>", v17, v19];

      goto LABEL_15;
    }
  }
  v18 = NSString;
  v19 = [v6 base64EncodedStringWithOptions:0];
  uint64_t v31 = v8;
  v32 = v19;
  v20 = @"unkown-token-version:%d (%@)";
LABEL_11:
  v22 = v18;
LABEL_14:
  v28 = objc_msgSend(v22, "stringWithFormat:", v20, v31, v32);
LABEL_15:

  return v28;
}

- (void)sqliteBind:()BRCAddition index:
{
  id v6 = [a1 data];
  [v6 sqliteBind:a3 index:a4];
}

+ (uint64_t)newFromSqliteValue:()BRCAddition
{
  v0 = objc_msgSend(MEMORY[0x1E4F1C9B8], "newFromSqliteValue:");
  if (v0) {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1A388]) initWithData:v0];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

+ (uint64_t)newFromSqliteStatement:()BRCAddition atIndex:
{
  v0 = objc_msgSend(MEMORY[0x1E4F1C9B8], "newFromSqliteStatement:atIndex:");
  if (v0) {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1A388]) initWithData:v0];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

@end