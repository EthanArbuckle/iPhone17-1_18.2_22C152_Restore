@interface NSNumber
- (id)dbgStringForType:(id)a3 error:(id *)a4;
@end

@implementation NSNumber

- (id)dbgStringForType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isEqualToString:@"b"])
  {
    uint64_t v18 = [(NSNumber *)self BOOLValue];
LABEL_3:
    v7 = @"%d";
LABEL_9:
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v18);
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"CGf"]) {
    goto LABEL_8;
  }
  if ([v6 isEqualToString:@"f"])
  {
    [(NSNumber *)self floatValue];
    +[NSString stringWithFormat:@"%a", v8];
LABEL_10:
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if ([v6 isEqualToString:@"d"])
  {
LABEL_8:
    [(NSNumber *)self doubleValue];
    uint64_t v18 = v9;
    v7 = @"%la";
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"integer"])
  {
    uint64_t v11 = [(NSNumber *)self integerValue];
LABEL_16:
    +[NSString stringWithFormat:@"%ld", v11];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"uinteger"])
  {
    unint64_t v12 = [(NSNumber *)self unsignedIntegerValue];
LABEL_19:
    +[NSString stringWithFormat:@"%lx", v12];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"i"])
  {
    uint64_t v18 = [(NSNumber *)self intValue];
    goto LABEL_3;
  }
  if ([v6 isEqualToString:@"ui"])
  {
    +[NSString stringWithFormat:@"%u", [(NSNumber *)self unsignedIntValue]];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"l"])
  {
    uint64_t v11 = [(NSNumber *)self longValue];
    goto LABEL_16;
  }
  if ([v6 isEqualToString:@"ul"])
  {
    unint64_t v12 = [(NSNumber *)self unsignedLongValue];
    goto LABEL_19;
  }
  if ([v6 isEqualToString:@"ll"])
  {
    uint64_t v13 = [(NSNumber *)self longLongValue];
LABEL_32:
    +[NSString stringWithFormat:@"%llx", v13];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"ull"])
  {
    uint64_t v13 = [(NSNumber *)self unsignedLongLongValue];
    goto LABEL_32;
  }
  if (a4)
  {
    v14 = +[NSString stringWithFormat:@"Unknown type specifier: %@", v6];
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    v20 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v16 = +[NSError errorWithDomain:@"DebugHierarchyNumberStringEncodingErrorDomain" code:1 userInfo:v15];

    id v17 = v16;
    *a4 = v17;

    a4 = 0;
  }
LABEL_11:

  return a4;
}

@end