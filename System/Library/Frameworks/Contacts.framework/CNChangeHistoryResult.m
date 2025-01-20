@interface CNChangeHistoryResult
+ (BOOL)supportsSecureCoding;
+ (uint64_t)enumerateEnumerator:(void *)a3 usingBlock:;
- (BOOL)changesTruncated;
- (BOOL)enumerateContactChangesWithKeysToFetch:(id)a3 fromContactStore:(id)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)enumerateGroupChangesFromContactStore:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)unifyResults;
- (CNChangeHistoryAnchor)latestChangeAnchor;
- (CNChangeHistoryResult)initWithCoder:(id)a3;
- (NSArray)contactChanges;
- (NSArray)events;
- (NSArray)groupChanges;
- (NSArray)labeledValueChanges;
- (id)contactChangesEnumeratorWithKeysToFetch:(id)a3 contactStore:(id)a4;
- (id)description;
- (id)groupChangesEnumeratorWithContactStore:(id)a3;
- (id)labeledValueChangesEnumeratorWithContactStore:(id)a3;
- (int64_t)changesCount;
- (void)encodeWithCoder:(id)a3;
- (void)setChangesCount:(int64_t)a3;
- (void)setChangesTruncated:(BOOL)a3;
- (void)setContactChanges:(id)a3;
- (void)setEvents:(id)a3;
- (void)setGroupChanges:(id)a3;
- (void)setLabeledValueChanges:(id)a3;
- (void)setLatestChangeAnchor:(id)a3;
- (void)setUnifyResults:(BOOL)a3;
@end

@implementation CNChangeHistoryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CNChangeHistoryResult;
  v5 = [(CNChangeHistoryResult *)&v29 init];
  if (v5)
  {
    v5->_changesTruncated = [v4 decodeBoolForKey:@"_changesTruncated"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_latestChangeAnchor"];
    uint64_t v7 = [v6 copy];
    latestChangeAnchor = v5->_latestChangeAnchor;
    v5->_latestChangeAnchor = (CNChangeHistoryAnchor *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_contactChanges"];
    uint64_t v13 = [v12 copy];
    contactChanges = v5->_contactChanges;
    v5->_contactChanges = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_groupChanges"];
    uint64_t v19 = [v18 copy];
    groupChanges = v5->_groupChanges;
    v5->_groupChanges = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"_labeledValueChanges"];
    uint64_t v25 = [v24 copy];
    labeledValueChanges = v5->_labeledValueChanges;
    v5->_labeledValueChanges = (NSArray *)v25;

    v5->_unifyResults = [v4 decodeBoolForKey:@"_unifyResults"];
    v5->_changesCount = [v4 decodeIntegerForKey:@"_changesCount"];
    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL changesTruncated = self->_changesTruncated;
  id v5 = a3;
  [v5 encodeBool:changesTruncated forKey:@"_changesTruncated"];
  [v5 encodeObject:self->_latestChangeAnchor forKey:@"_latestChangeAnchor"];
  [v5 encodeObject:self->_contactChanges forKey:@"_contactChanges"];
  [v5 encodeObject:self->_groupChanges forKey:@"_groupChanges"];
  [v5 encodeObject:self->_labeledValueChanges forKey:@"_labeledValueChanges"];
  [v5 encodeBool:self->_unifyResults forKey:@"_unifyResults"];
  [v5 encodeInteger:self->_changesCount forKey:@"_changesCount"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryResult changesTruncated](self, "changesTruncated"));
  id v5 = (id)[v3 appendName:@"changesTruncated" object:v4];

  v6 = [(CNChangeHistoryResult *)self latestChangeAnchor];
  id v7 = (id)[v3 appendName:@"latestChangeAnchor" object:v6];

  v8 = [(CNChangeHistoryResult *)self contactChanges];
  id v9 = (id)[v3 appendName:@"contactChanges" object:v8];

  uint64_t v10 = [(CNChangeHistoryResult *)self groupChanges];
  id v11 = (id)[v3 appendName:@"groupChanges" object:v10];

  v12 = [(CNChangeHistoryResult *)self labeledValueChanges];
  id v13 = (id)[v3 appendName:@"labeledValueChanges" object:v12];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CNChangeHistoryResult unifyResults](self, "unifyResults"));
  id v15 = (id)[v3 appendName:@"unifyResults" object:v14];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryResult changesCount](self, "changesCount"));
  id v17 = (id)[v3 appendName:@"changesCount" object:v16];

  v18 = [v3 build];

  return v18;
}

- (BOOL)enumerateContactChangesWithKeysToFetch:(id)a3 fromContactStore:(id)a4 error:(id *)a5 usingBlock:(id)a6
{
  id v9 = a6;
  uint64_t v10 = [(CNChangeHistoryResult *)self contactChangesEnumeratorWithKeysToFetch:a3 contactStore:a4];
  LOBYTE(a3) = +[CNChangeHistoryResult enumerateEnumerator:usingBlock:]((uint64_t)CNChangeHistoryResult, v10, v9);

  return (char)a3;
}

+ (uint64_t)enumerateEnumerator:(void *)a3 usingBlock:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v5[2](v5, *(void *)(*((void *)&v13 + 1) + 8 * i), &v17);
        if (v17)
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

- (id)contactChangesEnumeratorWithKeysToFetch:(id)a3 contactStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CNChangeHistoryResult *)self contactChanges];
  uint64_t v9 = +[CNChangeHistoryLegacyResultEnumerator contactEnumeratorWithChanges:v8 keysToFetch:v7 unifyResults:[(CNChangeHistoryResult *)self unifyResults] contactStore:v6];

  return v9;
}

- (BOOL)enumerateGroupChangesFromContactStore:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(CNChangeHistoryResult *)self groupChangesEnumeratorWithContactStore:a3];
  LOBYTE(self) = +[CNChangeHistoryResult enumerateEnumerator:usingBlock:]((uint64_t)CNChangeHistoryResult, v8, v7);

  return (char)self;
}

- (id)groupChangesEnumeratorWithContactStore:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryResult *)self groupChanges];
  id v6 = +[CNChangeHistoryLegacyResultEnumerator groupEnumeratorWithChanges:v5 contactStore:v4];

  return v6;
}

- (id)labeledValueChangesEnumeratorWithContactStore:(id)a3
{
  v3 = [(CNChangeHistoryResult *)self labeledValueChanges];
  id v4 = [v3 objectEnumerator];

  return v4;
}

- (BOOL)changesTruncated
{
  return self->_changesTruncated;
}

- (void)setChangesTruncated:(BOOL)a3
{
  self->_BOOL changesTruncated = a3;
}

- (CNChangeHistoryAnchor)latestChangeAnchor
{
  return self->_latestChangeAnchor;
}

- (void)setLatestChangeAnchor:(id)a3
{
}

- (NSArray)contactChanges
{
  return self->_contactChanges;
}

- (void)setContactChanges:(id)a3
{
}

- (NSArray)groupChanges
{
  return self->_groupChanges;
}

- (void)setGroupChanges:(id)a3
{
}

- (NSArray)labeledValueChanges
{
  return self->_labeledValueChanges;
}

- (void)setLabeledValueChanges:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (BOOL)unifyResults
{
  return self->_unifyResults;
}

- (void)setUnifyResults:(BOOL)a3
{
  self->_unifyResults = a3;
}

- (int64_t)changesCount
{
  return self->_changesCount;
}

- (void)setChangesCount:(int64_t)a3
{
  self->_changesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_labeledValueChanges, 0);
  objc_storeStrong((id *)&self->_groupChanges, 0);
  objc_storeStrong((id *)&self->_contactChanges, 0);

  objc_storeStrong((id *)&self->_latestChangeAnchor, 0);
}

@end