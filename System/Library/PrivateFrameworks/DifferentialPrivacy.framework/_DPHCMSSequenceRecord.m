@interface _DPHCMSSequenceRecord
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (_DPHCMSSequenceRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 sequenceBitIndex:(unsigned int)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10;
- (id)description;
- (id)jsonString;
- (int)sequenceBitIndex;
- (void)setSequenceBitIndex:(int)a3;
@end

@implementation _DPHCMSSequenceRecord

- (_DPHCMSSequenceRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 sequenceBitIndex:(unsigned int)a7 creationDate:(double)a8 submitted:(BOOL)a9 objectId:(id)a10
{
  v12.receiver = self;
  v12.super_class = (Class)_DPHCMSSequenceRecord;
  result = [(_DPCMSSequenceRecord *)&v12 initWithKey:a3 plainSequence:a4 sequence:a5 sequenceHashIndex:a6 creationDate:a9 submitted:a10 objectId:a8];
  if (result) {
    result->_sequenceBitIndex = a7;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10.receiver = self;
  v10.super_class = (Class)_DPHCMSSequenceRecord;
  uint64_t sequenceBitIndex = self->_sequenceBitIndex;
  v7 = [(_DPCMSSequenceRecord *)&v10 description];
  v8 = [v3 stringWithFormat:@"%@: { sequenceBitIndex=%d  %@ }", v5, sequenceBitIndex, v7];;

  return v8;
}

+ (id)entityName
{
  return @"HCMSSequence";
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)_DPHCMSSequenceRecord,
        [(_DPCMSSequenceRecord *)&v8 copyToManagedObject:v4]))
  {
    id v5 = v4;
    objc_msgSend(v5, "setSequenceBitIndex:", -[_DPHCMSSequenceRecord sequenceBitIndex](self, "sequenceBitIndex"));

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)_DPHCMSSequenceRecord,
        [(_DPCMSSequenceRecord *)&v7 copyFromManagedObject:v4]))
  {
    -[_DPHCMSSequenceRecord setSequenceBitIndex:](self, "setSequenceBitIndex:", [v4 sequenceBitIndex]);
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)jsonString
{
  v7.receiver = self;
  v7.super_class = (Class)_DPHCMSSequenceRecord;
  v3 = [(_DPCMSSequenceRecord *)&v7 sequence];
  v6.receiver = self;
  v6.super_class = (Class)_DPHCMSSequenceRecord;
  id v4 = +[_DPHCMSSample jsonStringFrom:v3 hashIndex:[(_DPCMSSequenceRecord *)&v6 sequenceHashIndex] bitIndex:[(_DPHCMSSequenceRecord *)self sequenceBitIndex]];

  return v4;
}

- (int)sequenceBitIndex
{
  return self->_sequenceBitIndex;
}

- (void)setSequenceBitIndex:(int)a3
{
  self->_uint64_t sequenceBitIndex = a3;
}

@end