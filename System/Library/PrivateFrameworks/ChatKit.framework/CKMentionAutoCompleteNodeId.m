@interface CKMentionAutoCompleteNodeId
- (CKMentionAutoCompleteNodeId)init;
- (CKMentionAutoCompleteNodeId)initWithKeys:(id)a3;
- (NSArray)keys;
- (id)nodeIdByAppendingKey:(id)a3;
- (void)setKeys:(id)a3;
@end

@implementation CKMentionAutoCompleteNodeId

- (CKMentionAutoCompleteNodeId)initWithKeys:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMentionAutoCompleteNodeId;
  v5 = [(CKMentionAutoCompleteNodeId *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    keys = v5->_keys;
    v5->_keys = (NSArray *)v6;
  }
  return v5;
}

- (CKMentionAutoCompleteNodeId)init
{
  return [(CKMentionAutoCompleteNodeId *)self initWithKeys:MEMORY[0x1E4F1CBF0]];
}

- (id)nodeIdByAppendingKey:(id)a3
{
  id v4 = a3;
  v5 = [(CKMentionAutoCompleteNodeId *)self keys];
  uint64_t v6 = [v5 arrayByAddingObject:v4];

  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithKeys:v6];

  return v7;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end