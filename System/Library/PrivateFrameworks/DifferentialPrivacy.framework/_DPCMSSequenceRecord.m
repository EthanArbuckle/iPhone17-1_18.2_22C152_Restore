@interface _DPCMSSequenceRecord
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (NSData)sequence;
- (NSString)plainSequence;
- (_DPCMSSequenceRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9;
- (id)description;
- (id)jsonString;
- (signed)sequenceHashIndex;
- (void)setPlainSequence:(id)a3;
- (void)setSequence:(id)a3;
- (void)setSequenceHashIndex:(signed __int16)a3;
@end

@implementation _DPCMSSequenceRecord

- (_DPCMSSequenceRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9
{
  BOOL v10 = a8;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_DPCMSSequenceRecord;
  v17 = [(_DPCMSRecord *)&v21 initWithKey:a3 creationDate:v10 submitted:a9 objectId:a7];
  v18 = v17;
  if (v17)
  {
    plainSequence = v17->_plainSequence;
    v17->_plainSequence = 0;

    objc_storeStrong((id *)&v18->_sequence, a5);
    v18->_sequenceHashIndex = a6;
  }

  return v18;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E019F810](self, a2);
  v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { ", v6];

  uint64_t sequenceHashIndex = self->_sequenceHashIndex;
  uint64_t v8 = [(NSData *)self->_sequence hash];
  v12.receiver = self;
  v12.super_class = (Class)_DPCMSSequenceRecord;
  v9 = [(_DPCMSRecord *)&v12 description];
  [v4 appendFormat:@"sequenceHashIndex=%d ; sequence=%ld  ; %@ }", sequenceHashIndex, v8, v9];

  BOOL v10 = (void *)[v4 copy];
  return v10;
}

+ (id)entityName
{
  return @"CMSSequence";
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)_DPCMSSequenceRecord,
        [(_DPCMSRecord *)&v10 copyToManagedObject:v4]))
  {
    id v5 = v4;
    v6 = [(_DPCMSSequenceRecord *)self plainSequence];
    [v5 setPlainSequence:v6];

    v7 = [(_DPCMSSequenceRecord *)self sequence];
    [v5 setSequence:v7];

    objc_msgSend(v5, "setSequenceHashIndex:", -[_DPCMSSequenceRecord sequenceHashIndex](self, "sequenceHashIndex"));
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11.receiver = self,
        v11.super_class = (Class)_DPCMSSequenceRecord,
        [(_DPCMSRecord *)&v11 copyFromManagedObject:v4]))
  {
    id v5 = v4;
    v6 = [v5 plainSequence];
    [(_DPCMSSequenceRecord *)self setPlainSequence:v6];

    v7 = [v5 sequence];
    [(_DPCMSSequenceRecord *)self setSequence:v7];

    uint64_t v8 = [v5 sequenceHashIndex];
    [(_DPCMSSequenceRecord *)self setSequenceHashIndex:v8];
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)jsonString
{
  v3 = (void *)MEMORY[0x1E019F810](self, a2);
  id v4 = +[_DPCMSSample jsonStringFrom:self->_sequence hashIndex:self->_sequenceHashIndex];
  return v4;
}

- (NSData)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
}

- (signed)sequenceHashIndex
{
  return self->_sequenceHashIndex;
}

- (void)setSequenceHashIndex:(signed __int16)a3
{
  self->_uint64_t sequenceHashIndex = a3;
}

- (NSString)plainSequence
{
  return self->_plainSequence;
}

- (void)setPlainSequence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainSequence, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end