@interface _DPCMSWordRecord
+ (id)entityName;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (NSData)fragment;
- (NSString)plainFragment;
- (_DPCMSWordRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 plainFragment:(id)a7 fragment:(id)a8 fragmentHashIndex:(unsigned __int16)a9 fragmentPosition:(unsigned __int16)a10 creationDate:(double)a11 submitted:(BOOL)a12 objectId:(id)a13;
- (id)description;
- (id)jsonString;
- (signed)fragmentHashIndex;
- (signed)fragmentPosition;
- (void)setFragment:(id)a3;
- (void)setFragmentHashIndex:(signed __int16)a3;
- (void)setFragmentPosition:(signed __int16)a3;
- (void)setPlainFragment:(id)a3;
@end

@implementation _DPCMSWordRecord

- (_DPCMSWordRecord)initWithKey:(id)a3 plainSequence:(id)a4 sequence:(id)a5 sequenceHashIndex:(unsigned __int16)a6 plainFragment:(id)a7 fragment:(id)a8 fragmentHashIndex:(unsigned __int16)a9 fragmentPosition:(unsigned __int16)a10 creationDate:(double)a11 submitted:(BOOL)a12 objectId:(id)a13
{
  uint64_t v15 = a6;
  id v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_DPCMSWordRecord;
  v21 = [(_DPCMSSequenceRecord *)&v25 initWithKey:a3 plainSequence:a4 sequence:a5 sequenceHashIndex:v15 creationDate:a12 submitted:a13 objectId:a11];
  v22 = v21;
  if (v21)
  {
    plainFragment = v21->_plainFragment;
    v21->_plainFragment = 0;

    v22->_fragmentHashIndex = a9;
    v22->_fragmentPosition = a10;
    objc_storeStrong((id *)&v22->_fragment, a8);
  }

  return v22;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E019F810](self, a2);
  v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { ", v6];

  uint64_t fragmentPosition = self->_fragmentPosition;
  uint64_t fragmentHashIndex = self->_fragmentHashIndex;
  uint64_t v9 = [(NSData *)self->_fragment hash];
  v13.receiver = self;
  v13.super_class = (Class)_DPCMSWordRecord;
  v10 = [(_DPCMSSequenceRecord *)&v13 description];
  objc_msgSend(v4, "appendFormat:", @"fragmentPosition=%d ; fragmentHashIndex=%ld ; fragment=%lu %@ }",
    fragmentPosition,
    fragmentHashIndex,
    v9,
    v10);

  v11 = (void *)[v4 copy];
  return v11;
}

+ (id)entityName
{
  return @"CMSWord";
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)_DPCMSWordRecord,
        [(_DPCMSSequenceRecord *)&v10 copyToManagedObject:v4]))
  {
    id v5 = v4;
    v6 = [(_DPCMSWordRecord *)self plainFragment];
    [v5 setPlainFragment:v6];

    v7 = [(_DPCMSWordRecord *)self fragment];
    [v5 setFragment:v7];

    objc_msgSend(v5, "setFragmentPosition:", -[_DPCMSWordRecord fragmentPosition](self, "fragmentPosition"));
    objc_msgSend(v5, "setFragmentHashIndex:", -[_DPCMSWordRecord fragmentHashIndex](self, "fragmentHashIndex"));

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
        v11.super_class = (Class)_DPCMSWordRecord,
        [(_DPCMSSequenceRecord *)&v11 copyFromManagedObject:v4]))
  {
    id v5 = v4;
    v6 = [v5 plainFragment];
    [(_DPCMSWordRecord *)self setPlainFragment:v6];

    v7 = [v5 fragment];
    [(_DPCMSWordRecord *)self setFragment:v7];

    -[_DPCMSWordRecord setFragmentPosition:](self, "setFragmentPosition:", [v5 fragmentPosition]);
    uint64_t v8 = [v5 fragmentHashIndex];

    [(_DPCMSWordRecord *)self setFragmentHashIndex:v8];
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
  v8.receiver = self;
  v8.super_class = (Class)_DPCMSWordRecord;
  id v4 = [(_DPCMSSequenceRecord *)&v8 sequence];
  v7.receiver = self;
  v7.super_class = (Class)_DPCMSWordRecord;
  id v5 = +[_DPCMSSample jsonStringFromSequence:v4 sequenceHashIndex:(unsigned __int16)[(_DPCMSSequenceRecord *)&v7 sequenceHashIndex] fragment:self->_fragment fragmentHashIndex:(unsigned __int16)self->_fragmentHashIndex fragmentPosition:(unsigned __int16)self->_fragmentPosition];

  return v5;
}

- (NSData)fragment
{
  return self->_fragment;
}

- (void)setFragment:(id)a3
{
}

- (signed)fragmentPosition
{
  return self->_fragmentPosition;
}

- (void)setFragmentPosition:(signed __int16)a3
{
  self->_uint64_t fragmentPosition = a3;
}

- (signed)fragmentHashIndex
{
  return self->_fragmentHashIndex;
}

- (void)setFragmentHashIndex:(signed __int16)a3
{
  self->_uint64_t fragmentHashIndex = a3;
}

- (NSString)plainFragment
{
  return self->_plainFragment;
}

- (void)setPlainFragment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plainFragment, 0);
  objc_storeStrong((id *)&self->_fragment, 0);
}

@end