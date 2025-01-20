@interface _CHSWidgetRelevanceBufChanges
- (void)omitAttributeKey;
- (void)omitIntentReference;
- (void)preserveAttributeKey;
- (void)preserveIntentReference;
- (void)replaceAttributeKey:(id)a3;
- (void)replaceIntentReference:(id)a3;
@end

@implementation _CHSWidgetRelevanceBufChanges

- (void)replaceAttributeKey:(id)a3
{
  id v5 = a3;
  self->_changeTypeAttributeKey = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 2014, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementAttributeKey = [v5 unsignedIntValue];
}

- (void)omitAttributeKey
{
  self->_changeTypeAttributeKey = 2;
}

- (void)preserveAttributeKey
{
  self->_changeTypeAttributeKey = 0;
}

- (void)replaceIntentReference:(id)a3
{
  id v5 = a3;
  self->_changeTypeIntentReference = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 2037, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementIntentReference = [v5 unsignedIntValue];
}

- (void)omitIntentReference
{
  self->_changeTypeIntentReference = 2;
}

- (void)preserveIntentReference
{
  self->_changeTypeIntentReference = 0;
}

@end