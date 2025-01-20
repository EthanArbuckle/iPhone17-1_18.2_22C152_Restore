@interface JavaUtilStringTokenizer
+ (const)__metadata;
- (BOOL)hasMoreTokens;
- (JavaUtilStringTokenizer)initWithNSString:(id)a3;
- (JavaUtilStringTokenizer)initWithNSString:(id)a3 withNSString:(id)a4;
- (JavaUtilStringTokenizer)initWithNSString:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5;
- (id)nextToken;
- (id)nextTokenWithNSString:(id)a3;
- (int)countTokens;
- (void)dealloc;
@end

@implementation JavaUtilStringTokenizer

- (JavaUtilStringTokenizer)initWithNSString:(id)a3
{
  return self;
}

- (JavaUtilStringTokenizer)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaUtilStringTokenizer)initWithNSString:(id)a3 withNSString:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (int)countTokens
{
  string = self->string_;
  if (!string) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t position = self->position_;
  int v5 = [(NSString *)string length];
  if ((int)position >= v5) {
    return 0;
  }
  LOBYTE(v6) = 0;
  int v7 = 0;
  do
  {
    delimiters = self->delimiters_;
    if (!delimiters) {
      goto LABEL_10;
    }
    unsigned int v9 = [(NSString *)delimiters indexOf:[(NSString *)self->string_ charAtWithInt:position] fromIndex:0];
    if ((v9 & 0x80000000) == 0) {
      v7 += (v6 & 1) + self->returnDelimiters_;
    }
    unsigned int v6 = v9 >> 31;
    uint64_t position = (position + 1);
  }
  while (v5 != position);
  return v7 + (v9 >> 31);
}

- (BOOL)hasMoreTokens
{
  if (!self->delimiters_)
  {
    v11 = new_JavaLangNullPointerException_initWithNSString_(@"delimiters == null");
    objc_exception_throw(v11);
  }
  string = self->string_;
  if (!string) {
    goto LABEL_15;
  }
  int v4 = [(NSString *)string length];
  uint64_t position = self->position_;
  if ((int)position < v4)
  {
    if (self->returnDelimiters_) {
      return 1;
    }
    int v7 = v4 - 1;
    while (1)
    {
      delimiters = self->delimiters_;
      if (!delimiters) {
        break;
      }
      unsigned int v9 = [(NSString *)delimiters indexOf:[(NSString *)self->string_ charAtWithInt:position] fromIndex:0];
      BOOL v10 = v9 == -1;
      BOOL result = v9 == -1;
      BOOL v10 = v10 || v7 == position;
      uint64_t position = (position + 1);
      if (v10) {
        return result;
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)nextToken
{
  if (!self->delimiters_)
  {
    v18 = new_JavaLangNullPointerException_initWithNSString_(@"delimiters == null");
    goto LABEL_30;
  }
  string = self->string_;
  if (!string) {
    goto LABEL_27;
  }
  uint64_t position = self->position_;
  int v5 = [(NSString *)string length];
  if ((int)position >= v5) {
    goto LABEL_29;
  }
  if (!self->returnDelimiters_)
  {
    while (1)
    {
      delimiters = self->delimiters_;
      if (!delimiters) {
        goto LABEL_27;
      }
      unsigned int v11 = [(NSString *)delimiters indexOf:[(NSString *)self->string_ charAtWithInt:position] fromIndex:0];
      int v12 = position + 1;
      if ((v11 & 0x80000000) != 0) {
        break;
      }
      uint64_t position = (position + 1);
      if (v5 == v12)
      {
        self->position_ = v5;
LABEL_29:
        v18 = new_JavaUtilNoSuchElementException_init();
LABEL_30:
        objc_exception_throw(v18);
      }
    }
    while (1)
    {
      self->position_ = v12;
      if (v12 >= v5) {
        goto LABEL_21;
      }
      v14 = self->delimiters_;
      if (!v14) {
        goto LABEL_27;
      }
      if ((-[NSString indexOf:fromIndex:](v14, "indexOf:fromIndex:", -[NSString charAtWithInt:](self->string_, "charAtWithInt:"), 0) & 0x80000000) == 0)
      {
LABEL_24:
        v16 = self->string_;
        uint64_t v17 = self->position_;
        return [(NSString *)v16 substring:position endIndex:v17];
      }
      int v12 = self->position_ + 1;
    }
  }
  unsigned int v6 = self->delimiters_;
  if (!v6) {
LABEL_27:
  }
    JreThrowNullPointerException();
  if (([(NSString *)v6 indexOf:[(NSString *)self->string_ charAtWithInt:self->position_] fromIndex:0] & 0x80000000) == 0)
  {
    int v7 = self->string_;
    ++self->position_;
    __int16 v8 = -[NSString charAtWithInt:](v7, "charAtWithInt:");
    return NSString_valueOfChar_(v8);
  }
  while (1)
  {
    int v13 = self->position_ + 1;
    self->position_ = v13;
    if (v13 >= v5) {
      break;
    }
    if ((-[NSString indexOf:fromIndex:](self->delimiters_, "indexOf:fromIndex:", -[NSString charAtWithInt:](self->string_, "charAtWithInt:"), 0) & 0x80000000) == 0)goto LABEL_24; {
  }
    }
LABEL_21:
  v15 = self->string_;
  return [(NSString *)v15 substring:position];
}

- (id)nextTokenWithNSString:(id)a3
{
  JreStrongAssign((id *)&self->delimiters_, a3);
  return [(JavaUtilStringTokenizer *)self nextToken];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilStringTokenizer;
  [(JavaUtilStringTokenizer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100452EE8;
}

@end