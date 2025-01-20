@interface GKRequestIdentifier
+ (id)requestIdentifierForInvocation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (GKRequestIdentifier)initWithInvocation:(id)a3;
- (NSArray)arguments;
- (SEL)selector;
- (id)_argumentsForInvocation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)savedHash;
- (void)setArguments:(id)a3;
- (void)setSavedHash:(unint64_t)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation GKRequestIdentifier

- (void).cxx_destruct
{
}

- (id)_argumentsForInvocation:(id)a3
{
  id v3 = a3;
  v4 = [v3 methodSignature];
  uint64_t v5 = [v4 numberOfArguments];
  unint64_t v6 = v5 - [v3 _gkHasReplyBlock];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  if (v6 >= 3)
  {
    for (uint64_t i = 2; i != v6; ++i)
    {
      int v9 = *(char *)[v4 getArgumentTypeAtIndex:i];
      if (v9 > 80)
      {
        switch(v9)
        {
          case 'c':
LABEL_9:
            LOBYTE(v14) = 0;
            [v3 getArgument:&v14 atIndex:i];
            uint64_t v10 = [NSNumber numberWithUnsignedChar:v14];
            goto LABEL_21;
          case 'd':
            id v14 = 0;
            [v3 getArgument:&v14 atIndex:i];
            uint64_t v10 = [NSNumber numberWithDouble:*(double *)&v14];
            goto LABEL_21;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_18;
          case 'f':
            LODWORD(v14) = 0;
            [v3 getArgument:&v14 atIndex:i];
            LODWORD(v11) = v14;
            uint64_t v10 = [NSNumber numberWithFloat:v11];
            goto LABEL_21;
          case 'i':
          case 'l':
LABEL_12:
            LODWORD(v14) = 0;
            [v3 getArgument:&v14 atIndex:i];
            uint64_t v10 = [NSNumber numberWithInt:v14];
            goto LABEL_21;
          case 'q':
            goto LABEL_16;
          case 's':
            goto LABEL_15;
          default:
            if (v9 == 81)
            {
LABEL_16:
              id v14 = 0;
              [v3 getArgument:&v14 atIndex:i];
              uint64_t v10 = [NSNumber numberWithLongLong:v14];
            }
            else
            {
              if (v9 != 83)
              {
LABEL_18:

                v7 = 0;
                continue;
              }
LABEL_15:
              LOWORD(v14) = 0;
              [v3 getArgument:&v14 atIndex:i];
              uint64_t v10 = [NSNumber numberWithShort:(__int16)v14];
            }
LABEL_21:
            v12 = (void *)v10;
            [v7 addObject:v10];

            break;
        }
      }
      else
      {
        switch(v9)
        {
          case '@':
            id v14 = 0;
            [v3 getArgument:&v14 atIndex:i];
            if (!v14) {
              id v14 = (id)[MEMORY[0x1E4F1CA98] null];
            }
            objc_msgSend(v7, "addObject:");
            break;
          case 'A':
          case 'D':
          case 'E':
          case 'F':
          case 'G':
          case 'H':
            goto LABEL_18;
          case 'B':
            LOBYTE(v14) = 0;
            [v3 getArgument:&v14 atIndex:i];
            uint64_t v10 = [NSNumber numberWithBool:v14];
            goto LABEL_21;
          case 'C':
            goto LABEL_9;
          case 'I':
            goto LABEL_12;
          default:
            if (v9 == 33 || v9 == 76) {
              goto LABEL_12;
            }
            goto LABEL_18;
        }
      }
    }
  }

  return v7;
}

+ (id)requestIdentifierForInvocation:(id)a3
{
  id v3 = a3;
  v4 = [[GKRequestIdentifier alloc] initWithInvocation:v3];

  return v4;
}

- (GKRequestIdentifier)initWithInvocation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKRequestIdentifier;
  uint64_t v5 = [(GKRequestIdentifier *)&v13 init];
  unint64_t v6 = v5;
  if (v5)
  {
    p_selector = &v5->_selector;
    v8 = (const char *)[v4 selector];
    if (v8) {
      SEL *p_selector = v8;
    }
    else {
      SEL *p_selector = 0;
    }
    int v9 = NSStringFromSelector(v8);
    v6->_savedHash = [v9 hash];

    uint64_t v10 = [(GKRequestIdentifier *)v6 _argumentsForInvocation:v4];
    arguments = v6->_arguments;
    v6->_arguments = (NSArray *)v10;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v4;
    unint64_t v6 = [(GKRequestIdentifier *)self hash];
    if (v6 == [v5 hash]
      && (!self->_selector ? (selector = 0) : (selector = self->_selector),
          !v5[2] ? (int v9 = 0) : (int v9 = (const char *)v5[2]),
          sel_isEqual(selector, v9)))
    {
      char v8 = [(NSArray *)self->_arguments isEqual:v5[3]];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_savedHash;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[GKRequestIdentifier allocWithZone:a3] init];
  SEL selector = self->_selector;
  v4->_savedHash = self->_savedHash;
  v4->_SEL selector = selector;
  objc_storeStrong((id *)&v4->_arguments, self->_arguments);
  return v4;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)GKRequestIdentifier;
  id v4 = [(GKRequestIdentifier *)&v9 description];
  if (self->_selector) {
    SEL selector = self->_selector;
  }
  else {
    SEL selector = 0;
  }
  unint64_t v6 = NSStringFromSelector(selector);
  v7 = [v3 stringWithFormat:@"%@ - %@ %@", v4, v6, self->_arguments];

  return v7;
}

- (unint64_t)savedHash
{
  return self->_savedHash;
}

- (void)setSavedHash:(unint64_t)a3
{
  self->_savedHash = a3;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_SEL selector = v3;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

@end