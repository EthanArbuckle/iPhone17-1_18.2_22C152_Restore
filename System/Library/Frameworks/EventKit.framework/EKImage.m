@interface EKImage
+ (Class)frozenClass;
+ (id)imageWithEventStore:(id)a3 systemSymbolName:(id)a4 colorData:(id)a5;
+ (id)knownIdentityKeysForComparison;
- (NSData)colorData;
- (NSString)name;
- (id)_generateIdentifierInCalendar:(id)a3;
- (id)identifier;
- (id)source;
- (int64_t)type;
- (void)saveInCalendar:(id)a3;
- (void)setColorData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSource:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation EKImage

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_2 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_2, &__block_literal_global_18);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_2;

  return v2;
}

void __41__EKImage_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57058];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_2;
  knownIdentityKeysForComparison_keys_2 = v0;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)imageWithEventStore:(id)a3 systemSymbolName:(id)a4 colorData:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)[a1 frozenClass]);
  v10 = (void *)[objc_alloc((Class)a1) initWithPersistentObject:v9];
  [v10 setName:v8];

  [v10 setColorData:v7];
  [v10 setType:1];

  return v10;
}

- (NSString)name
{
  return (NSString *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57060]];
}

- (void)setName:(id)a3
{
}

- (NSData)colorData
{
  return (NSData *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57050]];
}

- (void)setColorData:(id)a3
{
}

- (int64_t)type
{
  v2 = [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57070]];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)setType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(EKObject *)self setSingleChangedValue:v4 forKey:*MEMORY[0x1E4F57070]];
}

- (id)identifier
{
  return [(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57058]];
}

- (void)setIdentifier:(id)a3
{
}

- (id)source
{
  return [(EKObject *)self meltedAndCachedSingleRelationObjectForKey:*MEMORY[0x1E4F57068]];
}

- (void)setSource:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F57068];
  id v5 = a3;
  [(EKObject *)self updateMeltedAndCachedSingleRelationObject:v5 forKey:v4 frozenClass:objc_opt_class()];
}

- (void)saveInCalendar:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 source];
  id v5 = [v14 eventStore];
  if (![(EKObject *)self isNew])
  {
    id v9 = [(EKImage *)self source];
    if ([v4 isEqual:v9]) {
      goto LABEL_10;
    }
    v10 = [(EKImage *)self identifier];
    v11 = [v5 imageCache];
    v12 = [v4 objectID];
    v13 = [v11 persistentImageForSourceID:v12 identifier:v10];

    if (v13)
    {
      [(EKObject *)self setBackingObject:v13];
      [(EKObject *)self markAsSaved];

      goto LABEL_10;
    }
    [(EKObject *)self rebase];
  }
  [(EKImage *)self setSource:v4];
  v6 = [(EKImage *)self identifier];

  if (!v6)
  {
    id v7 = [(EKImage *)self _generateIdentifierInCalendar:v14];
    [(EKImage *)self setIdentifier:v7];
  }
  id v8 = [v5 imageCache];
  [v8 updateToCachedVersionOrCacheImage:self];

  id v9 = [(EKObject *)self backingObject];
  if ([v9 isNew] && (objc_msgSend(v9, "_isPendingInsert") & 1) == 0) {
    [v5 _insertObject:v9];
  }
LABEL_10:
}

- (id)_generateIdentifierInCalendar:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(EKImage *)self type];
  if (v4 == 2)
  {
    v12 = NSString;
    v11 = [(EKImage *)self name];
    v13 = [v12 stringWithFormat:@"custom:%@", v11];
  }
  else
  {
    if (v4 != 1)
    {
      v13 = @"icon";
      goto LABEL_12;
    }
    id v5 = [(EKImage *)self colorData];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
      CC_SHA1((const void *)[v7 bytes], objc_msgSend(v7, "length"), md);
      uint64_t v8 = 0;
      id v9 = v18;
      do
      {
        unint64_t v10 = md[v8];
        *(v9 - 1) = _generateIdentifierInCalendar__nibbleToChar[v10 & 0xF];
        *id v9 = _generateIdentifierInCalendar__nibbleToChar[v10 >> 4];
        v9 += 2;
        ++v8;
      }
      while (v8 != 8);
      v11 = (__CFString *)[[NSString alloc] initWithBytes:&v17 length:16 encoding:4];
    }
    else
    {
      v11 = @"nocolor";
    }
    id v14 = NSString;
    v15 = [(EKImage *)self name];
    v13 = [v14 stringWithFormat:@"symbol:%@:%@", v11, v15];
  }
LABEL_12:

  return v13;
}

@end