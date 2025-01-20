@interface HDJournalChapterItem
- (HDJournalChapterItem)init;
- (HDJournalChapterItem)initWithEntryClassName:(id)a3 serializedEntryData:(id)a4;
- (NSData)serializedEntryData;
- (NSString)description;
- (NSString)entryClassName;
- (id)deserializedEntryWithError:(id *)a3;
- (int64_t)size;
@end

@implementation HDJournalChapterItem

- (HDJournalChapterItem)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDJournalChapterItem)initWithEntryClassName:(id)a3 serializedEntryData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDJournalChapterItem;
  v8 = [(HDJournalChapterItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    entryClassName = v8->_entryClassName;
    v8->_entryClassName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    serializedEntryData = v8->_serializedEntryData;
    v8->_serializedEntryData = (NSData *)v11;
  }
  return v8;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)HDJournalChapterItem;
  v2 = [NSString stringWithFormat:@"<%@:%p %@ %ld>", -[HDJournalChapterItem class](&v4, sel_class), self, self->_entryClassName, -[NSData length](self->_serializedEntryData, "length")];

  return (NSString *)v2;
}

- (int64_t)size
{
  return [(NSData *)self->_serializedEntryData length];
}

- (id)deserializedEntryWithError:(id *)a3
{
  v5 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v6 = objc_opt_class();
  serializedEntryData = self->_serializedEntryData;

  return (id)[v5 unarchivedObjectOfClass:v6 fromData:serializedEntryData error:a3];
}

- (NSString)entryClassName
{
  return self->_entryClassName;
}

- (NSData)serializedEntryData
{
  return self->_serializedEntryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedEntryData, 0);

  objc_storeStrong((id *)&self->_entryClassName, 0);
}

@end