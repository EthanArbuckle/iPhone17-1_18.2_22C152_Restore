@interface NSPresentationIntent
+ (BOOL)supportsSecureCoding;
+ (NSPresentationIntent)blockQuoteIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)codeBlockIntentWithIdentity:(NSInteger)identity languageHint:(NSString *)languageHint nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)headerIntentWithIdentity:(NSInteger)identity level:(NSInteger)level nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)listItemIntentWithIdentity:(NSInteger)identity ordinal:(NSInteger)ordinal nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)orderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)paragraphIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableCellIntentWithIdentity:(NSInteger)identity column:(NSInteger)column nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableHeaderRowIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableIntentWithIdentity:(NSInteger)identity columnCount:(NSInteger)columnCount alignments:(NSArray *)alignments nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)tableRowIntentWithIdentity:(NSInteger)identity row:(NSInteger)row nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)thematicBreakIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
+ (NSPresentationIntent)unorderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToPresentationIntent:(NSPresentationIntent *)other;
- (NSArray)columnAlignments;
- (NSInteger)column;
- (NSInteger)columnCount;
- (NSInteger)headerLevel;
- (NSInteger)identity;
- (NSInteger)indentationLevel;
- (NSInteger)ordinal;
- (NSInteger)row;
- (NSPresentationIntent)initWithCoder:(id)a3;
- (NSPresentationIntent)parentIntent;
- (NSPresentationIntentKind)intentKind;
- (NSString)languageHint;
- (id)_init;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPresentationIntent

- (NSPresentationIntent)parentIntent
{
  return (NSPresentationIntent *)objc_getProperty(self, a2, 16, 1);
}

- (NSPresentationIntentKind)intentKind
{
  return self->_intentKind;
}

- (NSInteger)identity
{
  return self->_identity;
}

+ (NSPresentationIntent)paragraphIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  v6 = [[NSPresentationIntent alloc] _init];
  v6[3] = identity;
  v6[1] = 0;
  v6[2] = parent;

  return (NSPresentationIntent *)v6;
}

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSPresentationIntent;
  return [(NSPresentationIntent *)&v3 init];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSPresentationIntent;
  [(NSPresentationIntent *)&v3 dealloc];
}

- (unint64_t)hash
{
  int64_t v3 = self->_intentKind ^ self->_identity ^ self->_headerLevel ^ self->_indentationLevel;
  NSUInteger v4 = v3 ^ [(NSString *)self->_languageHint hash] ^ self->_columnCount;
  columnAlignments = self->_columnAlignments;
  int64_t v6 = self->_ordinal ^ self->_column ^ self->_row;
  return v4 ^ v6 ^ [(NSArray *)columnAlignments hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 identity];
  if (v5 != [(NSPresentationIntent *)self identity]) {
    return 0;
  }

  return [(NSPresentationIntent *)self isEquivalentToPresentationIntent:a3];
}

- (BOOL)isEquivalentToPresentationIntent:(NSPresentationIntent *)other
{
  if (other == self) {
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v5 = [(NSPresentationIntent *)self languageHint];
  int64_t v6 = [(NSPresentationIntent *)other languageHint];
  v7 = [(NSPresentationIntent *)self parentIntent];
  v8 = [(NSPresentationIntent *)other parentIntent];
  v9 = [(NSPresentationIntent *)self columnAlignments];
  v10 = [(NSPresentationIntent *)other columnAlignments];
  NSPresentationIntentKind v11 = [(NSPresentationIntent *)other intentKind];
  if (v11 != [(NSPresentationIntent *)self intentKind]) {
    goto LABEL_18;
  }
  if (v5 != v6)
  {
    int v12 = [(NSString *)v5 isEqual:v6];
    if (!v12) {
      return v12;
    }
  }
  NSInteger v13 = [(NSPresentationIntent *)other headerLevel];
  if (v13 != [(NSPresentationIntent *)self headerLevel]) {
    goto LABEL_18;
  }
  NSInteger v14 = [(NSPresentationIntent *)other ordinal];
  if (v14 != [(NSPresentationIntent *)self ordinal]) {
    goto LABEL_18;
  }
  NSInteger v15 = [(NSPresentationIntent *)other indentationLevel];
  if (v15 != [(NSPresentationIntent *)self indentationLevel]) {
    goto LABEL_18;
  }
  if (v9 != v10)
  {
    int v12 = [(NSArray *)[(NSPresentationIntent *)other columnAlignments] isEqual:[(NSPresentationIntent *)self columnAlignments]];
    if (!v12) {
      return v12;
    }
  }
  NSInteger v16 = [(NSPresentationIntent *)other columnCount];
  if (v16 != [(NSPresentationIntent *)self columnCount]
    || (NSInteger v17 = [(NSPresentationIntent *)other column], v17 != [(NSPresentationIntent *)self column])
    || (NSInteger v18 = [(NSPresentationIntent *)other row], v18 != [(NSPresentationIntent *)self row]))
  {
LABEL_18:
    LOBYTE(v12) = 0;
    return v12;
  }
  if (v7 == v8)
  {
LABEL_19:
    LOBYTE(v12) = 1;
    return v12;
  }

  LOBYTE(v12) = [(NSPresentationIntent *)v7 isEquivalentToPresentationIntent:v8];
  return v12;
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSString *)[NSMutableString alloc] initWithFormat:@"<%@ %p>", objc_opt_class(), self];
  [(NSMutableString *)v3 appendString:@": "];
  unint64_t v4 = self->_intentKind - 1;
  if (v4 > 0xA) {
    uint64_t v5 = @"Paragraph";
  }
  else {
    uint64_t v5 = off_1E51FDF40[v4];
  }
  [(NSMutableString *)v3 appendString:v5];
  [(NSMutableString *)v3 appendFormat:@" (id %ld)", self->_identity];
  switch(self->_intentKind)
  {
    case 1:
      [(NSMutableString *)v3 appendFormat:@" (%ld) indent %ld", self->_headerLevel, self->_indentationLevel];
      break;
    case 2:
    case 3:
      [(NSMutableString *)v3 appendFormat:@" indent %ld", self->_indentationLevel, v21];
      break;
    case 4:
      [(NSMutableString *)v3 appendFormat:@" ordinal %ld, indent %ld", self->_ordinal, self->_indentationLevel];
      break;
    case 5:
      languageHint = self->_languageHint;
      if (!languageHint) {
        languageHint = (NSString *)@"no hint";
      }
      [(NSMutableString *)v3 appendFormat:@" (%@) indent %ld", languageHint, self->_indentationLevel];
      break;
    case 8:
      columnAlignments = self->_columnAlignments;
      int64_t columnCount = self->_columnCount;
      if (columnAlignments && [(NSArray *)self->_columnAlignments count])
      {
        int64_t v22 = columnCount;
        v23 = v3;
        v9 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v10 = [(NSArray *)columnAlignments countByEnumeratingWithState:&v25 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(columnAlignments);
              }
              NSInteger v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              char v15 = [v14 isEqual:&off_1ECAB6050];
              NSInteger v16 = @"left";
              if ((v15 & 1) == 0)
              {
                char v17 = [v14 isEqual:&off_1ECAB6068];
                NSInteger v16 = @"right";
                if ((v17 & 1) == 0)
                {
                  if ([v14 isEqual:&off_1ECAB6080]) {
                    NSInteger v16 = @"center";
                  }
                  else {
                    NSInteger v16 = @"unknown";
                  }
                }
              }
              [v9 addObject:v16];
            }
            uint64_t v11 = [(NSArray *)columnAlignments countByEnumeratingWithState:&v25 objects:v24 count:16];
          }
          while (v11);
        }
        NSInteger v18 = (__CFString *)[v9 componentsJoinedByString:@","];
        int64_t v3 = v23;
        int64_t columnCount = v22;
      }
      else
      {
        NSInteger v18 = @"none";
      }
      [(NSMutableString *)v3 appendFormat:@" %ld columns, alignment %@", columnCount, v18];
      break;
    case 0xALL:
      int64_t row = self->_row;
      goto LABEL_28;
    case 0xBLL:
      int64_t row = self->_column;
LABEL_28:
      [(NSMutableString *)v3 appendFormat:@" # %ld", row, v21];
      break;
    default:
      break;
  }
  if (self->_parentIntent)
  {
    [(NSMutableString *)v3 appendString:@"\n "];
    [(NSMutableString *)v3 appendString:[(NSPresentationIntent *)self->_parentIntent description]];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPresentationIntent)initWithCoder:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(NSPresentationIntent *)self _init];
  if (v4)
  {
    v4->_intentKind = [a3 decodeIntegerForKey:@"NS.intentKind"];
    v4->_parentIntent = (NSPresentationIntent *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.parentIntent"];
    v4->_identity = [a3 decodeIntegerForKey:@"NS.identity"];
    v4->_ordinal = [a3 decodeIntegerForKey:@"NS.ordinal"];
    if ([a3 requiresSecureCoding])
    {
      uint64_t v5 = (void *)[a3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"NS.columnAlignments"];
    }
    else
    {
      int64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
      v8[0] = objc_opt_class();
      v8[1] = objc_opt_class();
      uint64_t v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 2)), @"NS.columnAlignments");
    }
    v4->_columnAlignments = (NSArray *)v5;
    v4->_int64_t columnCount = [a3 decodeIntegerForKey:@"NS.columnCount"];
    v4->_headerLevel = [a3 decodeIntegerForKey:@"NS.headerLevel"];
    v4->_languageHint = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.languageHint"];
    v4->_column = [a3 decodeIntegerForKey:@"NS.column"];
    v4->_int64_t row = [a3 decodeIntegerForKey:@"NS.row"];
    v4->_indentationLevel = [a3 decodeIntegerForKey:@"NS.indentationLevel"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent intentKind](self, "intentKind"), @"NS.intentKind");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPresentationIntent parentIntent](self, "parentIntent"), @"NS.parentIntent");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent identity](self, "identity"), @"NS.identity");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent ordinal](self, "ordinal"), @"NS.ordinal");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPresentationIntent columnAlignments](self, "columnAlignments"), @"NS.columnAlignments");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent columnCount](self, "columnCount"), @"NS.columnCount");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent headerLevel](self, "headerLevel"), @"NS.headerLevel");
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPresentationIntent languageHint](self, "languageHint"), @"NS.languageHint");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent column](self, "column"), @"NS.column");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSPresentationIntent row](self, "row"), @"NS.row");
  NSInteger v5 = [(NSPresentationIntent *)self indentationLevel];

  [a3 encodeInteger:v5 forKey:@"NS.indentationLevel"];
}

+ (NSPresentationIntent)headerIntentWithIdentity:(NSInteger)identity level:(NSInteger)level nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = [[NSPresentationIntent alloc] _init];
  void v8[3] = identity;
  v8[1] = 1;
  v8[7] = level;
  if (parent) {
    NSInteger v9 = [(NSPresentationIntent *)parent indentationLevel];
  }
  else {
    NSInteger v9 = 0;
  }
  v8[11] = v9;
  v8[2] = parent;

  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)codeBlockIntentWithIdentity:(NSInteger)identity languageHint:(NSString *)languageHint nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = [[NSPresentationIntent alloc] _init];
  void v8[3] = identity;
  v8[1] = 5;
  v8[8] = [(NSString *)languageHint copy];
  if (parent) {
    NSInteger v9 = [(NSPresentationIntent *)parent indentationLevel];
  }
  else {
    NSInteger v9 = 0;
  }
  v8[11] = v9;
  v8[2] = parent;

  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)thematicBreakIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = [[NSPresentationIntent alloc] _init];
  v6[3] = identity;
  v6[1] = 7;
  v6[2] = parent;

  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)orderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = [[NSPresentationIntent alloc] _init];
  v6[3] = identity;
  v6[1] = 2;
  if (parent) {
    NSInteger v7 = [(NSPresentationIntent *)parent indentationLevel];
  }
  else {
    NSInteger v7 = 0;
  }
  v6[11] = v7;
  v6[2] = parent;

  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)unorderedListIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = [[NSPresentationIntent alloc] _init];
  v6[3] = identity;
  v6[1] = 3;
  if (parent) {
    NSInteger v7 = [(NSPresentationIntent *)parent indentationLevel];
  }
  else {
    NSInteger v7 = 0;
  }
  v6[11] = v7;
  v6[2] = parent;

  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)listItemIntentWithIdentity:(NSInteger)identity ordinal:(NSInteger)ordinal nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = [[NSPresentationIntent alloc] _init];
  v8[1] = 4;
  void v8[3] = identity;
  v8[4] = ordinal;
  if (parent) {
    NSInteger v9 = [(NSPresentationIntent *)parent indentationLevel] + 1;
  }
  else {
    NSInteger v9 = 0;
  }
  v8[11] = v9;
  v8[2] = parent;

  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)blockQuoteIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = [[NSPresentationIntent alloc] _init];
  v6[3] = identity;
  v6[1] = 6;
  if (parent) {
    NSInteger v7 = [(NSPresentationIntent *)parent indentationLevel] + 1;
  }
  else {
    NSInteger v7 = 0;
  }
  v6[11] = v7;
  v6[2] = parent;

  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)tableIntentWithIdentity:(NSInteger)identity columnCount:(NSInteger)columnCount alignments:(NSArray *)alignments nestedInsideIntent:(NSPresentationIntent *)parent
{
  if ([(NSArray *)alignments count] != columnCount)
  {
    NSInteger v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: column count does not match count of alignments", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  uint64_t v12 = [[NSPresentationIntent alloc] _init];
  v12[3] = identity;
  v12[1] = 8;
  v12[2] = parent;
  v12[6] = columnCount;
  v12[5] = [(NSArray *)alignments copy];

  return (NSPresentationIntent *)v12;
}

+ (NSPresentationIntent)tableRowIntentWithIdentity:(NSInteger)identity row:(NSInteger)row nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = [[NSPresentationIntent alloc] _init];
  void v8[3] = identity;
  v8[1] = 10;
  v8[10] = row;
  v8[2] = parent;

  return (NSPresentationIntent *)v8;
}

+ (NSPresentationIntent)tableHeaderRowIntentWithIdentity:(NSInteger)identity nestedInsideIntent:(NSPresentationIntent *)parent
{
  int64_t v6 = [[NSPresentationIntent alloc] _init];
  v6[3] = identity;
  v6[1] = 9;
  v6[2] = parent;

  return (NSPresentationIntent *)v6;
}

+ (NSPresentationIntent)tableCellIntentWithIdentity:(NSInteger)identity column:(NSInteger)column nestedInsideIntent:(NSPresentationIntent *)parent
{
  v8 = [[NSPresentationIntent alloc] _init];
  void v8[3] = identity;
  v8[1] = 11;
  v8[9] = column;
  v8[2] = parent;

  return (NSPresentationIntent *)v8;
}

- (NSInteger)ordinal
{
  return self->_ordinal;
}

- (NSArray)columnAlignments
{
  return self->_columnAlignments;
}

- (NSInteger)columnCount
{
  return self->_columnCount;
}

- (NSInteger)headerLevel
{
  return self->_headerLevel;
}

- (NSString)languageHint
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSInteger)column
{
  return self->_column;
}

- (NSInteger)row
{
  return self->_row;
}

- (NSInteger)indentationLevel
{
  return self->_indentationLevel;
}

@end