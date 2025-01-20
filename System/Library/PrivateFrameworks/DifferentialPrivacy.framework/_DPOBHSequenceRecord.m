@interface _DPOBHSequenceRecord
+ (id)entityName;
+ (id)recordWithKey:(id)a3 sequence:(id)a4 bitPosition:(int64_t)a5 bitValue:(BOOL)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9;
- (BOOL)copyFromManagedObject:(id)a3;
- (BOOL)copyToManagedObject:(id)a3;
- (BOOL)sequenceBitValue;
- (NSString)plainSequence;
- (_DPOBHSequenceRecord)initWithKey:(id)a3 sequence:(id)a4 bitPosition:(int64_t)a5 bitValue:(BOOL)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9;
- (id)description;
- (id)jsonString;
- (int64_t)sequenceBitPosition;
- (void)setPlainSequence:(id)a3;
- (void)setSequenceBitPosition:(int64_t)a3;
- (void)setSequenceBitValue:(BOOL)a3;
@end

@implementation _DPOBHSequenceRecord

- (_DPOBHSequenceRecord)initWithKey:(id)a3 sequence:(id)a4 bitPosition:(int64_t)a5 bitValue:(BOOL)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9
{
  v15.receiver = self;
  v15.super_class = (Class)_DPOBHSequenceRecord;
  v11 = [(_DPOBHRecord *)&v15 initWithKey:a3 creationDate:a8 submitted:a9 objectId:a7];
  v12 = v11;
  if (v11)
  {
    v11->_sequenceBitPosition = a5;
    v11->_sequenceBitValue = a6;
    plainSequence = v11->_plainSequence;
    v11->_plainSequence = 0;
  }
  return v12;
}

+ (id)recordWithKey:(id)a3 sequence:(id)a4 bitPosition:(int64_t)a5 bitValue:(BOOL)a6 creationDate:(double)a7 submitted:(BOOL)a8 objectId:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  id v16 = a9;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithKey:v18 sequence:v17 bitPosition:a5 bitValue:v11 creationDate:v9 submitted:v16 objectId:a7];

  return v19;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E019F810](self, a2);
  v4 = (void *)[&stru_1F3681BE0 mutableCopy];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 appendFormat:@"%@: { ", v6];

  if (self->_sequenceBitValue) {
    v7 = @"+1";
  }
  else {
    v7 = @"-1";
  }
  objc_msgSend(v4, "appendFormat:", @"sequenceBitPosition=%lld ; sequenceBitValue=%@ ; ",
    self->_sequenceBitPosition,
    v7);
  v11.receiver = self;
  v11.super_class = (Class)_DPOBHSequenceRecord;
  v8 = [(_DPOBHRecord *)&v11 description];
  [v4 appendFormat:@"%@ }", v8];

  BOOL v9 = (void *)[v4 copy];
  return v9;
}

+ (id)entityName
{
  return @"OBHSequence";
}

- (BOOL)copyToManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)_DPOBHSequenceRecord,
        [(_DPOBHRecord *)&v9 copyToManagedObject:v4]))
  {
    id v5 = v4;
    v6 = [(_DPOBHSequenceRecord *)self plainSequence];
    [v5 setPlainSequence:v6];

    objc_msgSend(v5, "setSequenceBitPosition:", -[_DPOBHSequenceRecord sequenceBitPosition](self, "sequenceBitPosition"));
    objc_msgSend(v5, "setSequenceBitValue:", -[_DPOBHSequenceRecord sequenceBitValue](self, "sequenceBitValue"));

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)copyFromManagedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)_DPOBHSequenceRecord,
        [(_DPOBHRecord *)&v10 copyFromManagedObject:v4]))
  {
    id v5 = v4;
    v6 = [v5 plainSequence];
    [(_DPOBHSequenceRecord *)self setPlainSequence:v6];

    -[_DPOBHSequenceRecord setSequenceBitPosition:](self, "setSequenceBitPosition:", [v5 sequenceBitPosition]);
    uint64_t v7 = [v5 sequenceBitValue];

    [(_DPOBHSequenceRecord *)self setSequenceBitValue:v7];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)jsonString
{
  v3 = NSString;
  int64_t v4 = [(_DPOBHSequenceRecord *)self sequenceBitPosition];
  BOOL v5 = [(_DPOBHSequenceRecord *)self sequenceBitValue];
  v6 = @"-1";
  if (v5) {
    v6 = @"+1";
  }
  return (id)[v3 stringWithFormat:@"\"%lld,%@\"", v4, v6];
}

- (int64_t)sequenceBitPosition
{
  return self->_sequenceBitPosition;
}

- (void)setSequenceBitPosition:(int64_t)a3
{
  self->_sequenceBitPosition = a3;
}

- (BOOL)sequenceBitValue
{
  return self->_sequenceBitValue;
}

- (void)setSequenceBitValue:(BOOL)a3
{
  self->_sequenceBitValue = a3;
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
}

@end