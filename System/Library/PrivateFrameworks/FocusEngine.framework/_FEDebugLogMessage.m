@interface _FEDebugLogMessage
+ (id)messageWithFormat:(id)a3;
+ (id)messageWithNewline;
+ (id)messageWithPrefix:(id)a3 string:(id)a4;
+ (id)messageWithString:(id)a3;
+ (id)messageWithStyle:(unint64_t)a3 string:(id)a4;
- (BOOL)_isNode;
- (BOOL)_isTransparent;
- (_FEDebugLogMessage)initWithString:(id)a3;
- (id)_stringRepresentation;
@end

@implementation _FEDebugLogMessage

- (_FEDebugLogMessage)initWithString:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_FEDebugLogTree.m", 67, @"Invalid parameter not satisfying: %@", @"string != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_FEDebugLogMessage;
  v7 = [(_FEDebugLogMessage *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_string, a3);
  }

  return v8;
}

+ (id)messageWithNewline
{
  v2 = (void *)[objc_alloc((Class)a1) initWithString:&stru_2700CBC00];
  return v2;
}

+ (id)messageWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"_FEDebugLogTree.m", 82, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];
  }
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  v7 = (void *)[objc_alloc((Class)a1) initWithString:v6];
  return v7;
}

+ (id)messageWithFormat:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"_FEDebugLogTree.m", 91, @"Invalid parameter not satisfying: %@", @"format" object file lineNumber description];
  }
  id v6 = (void *)[[NSString alloc] initWithFormat:v5 arguments:&v11];
  v7 = [a1 messageWithString:v6];

  return v7;
}

+ (id)messageWithPrefix:(id)a3 string:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"_FEDebugLogTree.m", 103, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"_FEDebugLogTree.m", 104, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];

LABEL_3:
  v10 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

  if ([v10 length])
  {
    uint64_t v11 = [v9 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    id v12 = objc_alloc((Class)a1);
    v13 = [NSString stringWithFormat:@"(%@) %@", v10, v11];
    v14 = (void *)[v12 initWithString:v13];

    v9 = (void *)v11;
  }
  else
  {
    v14 = [a1 messageWithString:v9];
  }

  return v14;
}

+ (id)messageWithStyle:(unint64_t)a3 string:(id)a4
{
  id v6 = [a4 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  id v7 = v6;
  switch(a3)
  {
    case 0uLL:
      id v8 = v6;
      goto LABEL_9;
    case 1uLL:
      id v8 = [v6 uppercaseString];
      goto LABEL_9;
    case 2uLL:
      [NSString stringWithFormat:@"(info) %@", v6];
      goto LABEL_8;
    case 3uLL:
      [NSString stringWithFormat:@"(warning) %@", v6];
      goto LABEL_8;
    case 4uLL:
      [NSString stringWithFormat:@"(error) %@", v6];
LABEL_8:
      id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v8;
      break;
    default:
      v9 = 0;
      break;
  }
  v10 = (void *)[objc_alloc((Class)a1) initWithString:v9];

  return v10;
}

- (BOOL)_isNode
{
  return 0;
}

- (BOOL)_isTransparent
{
  return 0;
}

- (id)_stringRepresentation
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end