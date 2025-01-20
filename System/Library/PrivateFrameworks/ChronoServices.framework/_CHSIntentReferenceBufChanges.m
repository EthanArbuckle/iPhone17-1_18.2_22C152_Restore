@interface _CHSIntentReferenceBufChanges
- (uint64_t)replacementStableHash;
- (void)omitIntentData;
- (void)omitPartialIntentData;
- (void)omitSchemaData;
- (void)omitStableHash;
- (void)preserveIntentData;
- (void)preservePartialIntentData;
- (void)preserveSchemaData;
- (void)preserveStableHash;
- (void)replaceIntentData:(id)a3;
- (void)replacePartialIntentData:(id)a3;
- (void)replaceSchemaData:(id)a3;
- (void)replaceStableHash:(int64_t)a3;
@end

@implementation _CHSIntentReferenceBufChanges

- (uint64_t)replacementStableHash
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)replaceStableHash:(int64_t)a3
{
  self->_changeTypeStableHash = 1;
  self->_replacementStableHash = a3;
}

- (void)omitStableHash
{
  self->_changeTypeStableHash = 2;
}

- (void)preserveStableHash
{
  self->_changeTypeStableHash = 0;
}

- (void)replaceIntentData:(id)a3
{
  id v5 = a3;
  self->_changeTypeIntentData = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 2561, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementIntentData = [v5 unsignedIntValue];
}

- (void)omitIntentData
{
  self->_changeTypeIntentData = 2;
}

- (void)preserveIntentData
{
  self->_changeTypeIntentData = 0;
}

- (void)replaceSchemaData:(id)a3
{
  id v5 = a3;
  self->_changeTypeSchemaData = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 2584, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementSchemaData = [v5 unsignedIntValue];
}

- (void)omitSchemaData
{
  self->_changeTypeSchemaData = 2;
}

- (void)preserveSchemaData
{
  self->_changeTypeSchemaData = 0;
}

- (void)replacePartialIntentData:(id)a3
{
  id v5 = a3;
  self->_changeTypePartialIntentData = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 2607, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementPartialIntentData = [v5 unsignedIntValue];
}

- (void)omitPartialIntentData
{
  self->_changeTypePartialIntentData = 2;
}

- (void)preservePartialIntentData
{
  self->_changeTypePartialIntentData = 0;
}

@end