@interface _DPHCMSWordRecord
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (_DPHCMSWordRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 sequenceBitIndex:(unsigned int)a7 plainFragment:(id)a8 fragment:(id)a9 fragmentHashIndex:(unsigned __int16)a10 fragmentBitIndex:(unsigned int)a11 fragmentPosition:(unsigned __int16)a12 creationDate:(double)a13 submitted:(BOOL)a14 objectId:(id)a15;
- (id)description;
- (id)jsonString;
- (int)fragmentBitIndex;
- (int)sequenceBitIndex;
- (void)setFragmentBitIndex:(int)a3;
- (void)setSequenceBitIndex:(int)a3;
@end

@implementation _DPHCMSWordRecord

- (_DPHCMSWordRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 sequenceBitIndex:(unsigned int)a7 plainFragment:(id)a8 fragment:(id)a9 fragmentHashIndex:(unsigned __int16)a10 fragmentBitIndex:(unsigned int)a11 fragmentPosition:(unsigned __int16)a12 creationDate:(double)a13 submitted:(BOOL)a14 objectId:(id)a15
{
  v18.receiver = self;
  v18.super_class = (Class)_DPHCMSWordRecord;
  BYTE4(v17) = a14;
  WORD1(v17) = a12;
  LOWORD(v17) = a10;
  result = -[_DPCMSWordRecord initWithKey:plainSequence:sequence:sequenceHashIndex:plainFragment:fragment:fragmentHashIndex:fragmentPosition:creationDate:submitted:objectId:](&v18, sel_initWithKey_plainSequence_sequence_sequenceHashIndex_plainFragment_fragment_fragmentHashIndex_fragmentPosition_creationDate_submitted_objectId_, a3, a4, a5, a6, a8, a9, a13, v17, a15);
  if (result)
  {
    result->_fragmentBitIndex = a11;
    result->_sequenceBitIndex = a7;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v11.receiver = self;
  v11.super_class = (Class)_DPHCMSWordRecord;
  uint64_t fragmentBitIndex = self->_fragmentBitIndex;
  uint64_t sequenceBitIndex = self->_sequenceBitIndex;
  v8 = [(_DPCMSWordRecord *)&v11 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { fragmentBitIndex=%d ; sequenceBitIndex=%d ; %@ }",
    v5,
    fragmentBitIndex,
    sequenceBitIndex,
  v9 = v8);

  return v9;
}

+ (id)entityName
{
  return @"HCMSWord";
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v8.receiver = self,
        v8.super_class = (Class)_DPHCMSWordRecord,
        [(_DPCMSWordRecord *)&v8 copyToManagedObject:v4]))
  {
    id v5 = v4;
    objc_msgSend(v5, "setFragmentBitIndex:", -[_DPHCMSWordRecord fragmentBitIndex](self, "fragmentBitIndex"));
    objc_msgSend(v5, "setSequenceBitIndex:", -[_DPHCMSWordRecord sequenceBitIndex](self, "sequenceBitIndex"));

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
    && (v9.receiver = self,
        v9.super_class = (Class)_DPHCMSWordRecord,
        [(_DPCMSWordRecord *)&v9 copyFromManagedObject:v4]))
  {
    id v5 = v4;
    -[_DPHCMSWordRecord setFragmentBitIndex:](self, "setFragmentBitIndex:", [v5 fragmentBitIndex]);
    uint64_t v6 = [v5 sequenceBitIndex];

    [(_DPHCMSWordRecord *)self setSequenceBitIndex:v6];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)jsonString
{
  v16.receiver = self;
  v16.super_class = (Class)_DPHCMSWordRecord;
  v3 = [(_DPCMSSequenceRecord *)&v16 sequence];
  v15.receiver = self;
  v15.super_class = (Class)_DPHCMSWordRecord;
  unsigned __int16 v4 = [(_DPCMSSequenceRecord *)&v15 sequenceHashIndex];
  uint64_t v5 = [(_DPHCMSWordRecord *)self sequenceBitIndex];
  v14.receiver = self;
  v14.super_class = (Class)_DPHCMSWordRecord;
  uint64_t v6 = [(_DPCMSWordRecord *)&v14 fragment];
  v13.receiver = self;
  v13.super_class = (Class)_DPHCMSWordRecord;
  unsigned __int16 v7 = [(_DPCMSWordRecord *)&v13 fragmentHashIndex];
  uint64_t v8 = [(_DPHCMSWordRecord *)self fragmentBitIndex];
  v12.receiver = self;
  v12.super_class = (Class)_DPHCMSWordRecord;
  LOWORD(v11) = [(_DPCMSWordRecord *)&v12 fragmentPosition];
  objc_super v9 = +[_DPHCMSSample jsonStringFromSequence:v3 sequenceHashIndex:v4 sequencebitIndex:v5 fragment:v6 fragmentHashIndex:v7 fragmentbitIndex:v8 fragmentPosition:v11];

  return v9;
}

- (int)fragmentBitIndex
{
  return self->_fragmentBitIndex;
}

- (void)setFragmentBitIndex:(int)a3
{
  self->_uint64_t fragmentBitIndex = a3;
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