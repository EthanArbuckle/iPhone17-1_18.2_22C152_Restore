@interface BSXPCCodingArray
- (BSXPCCodingArray)initWithArray:(id)a3;
- (BSXPCCodingArray)initWithXPCDictionary:(id)a3;
- (id)array;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSXPCCodingArray

- (void).cxx_destruct
{
}

- (id)array
{
  return self->_array;
}

- (BSXPCCodingArray)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSXPCCodingArray;
  v5 = [(BSXPCCodingArray *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    array = v5->_array;
    v5->_array = (NSArray *)v6;
  }
  return v5;
}

- (unint64_t)count
{
  return [(NSArray *)self->_array count];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_array countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (BSXPCCodingArray)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSXPCCodingArray;
  v5 = [(BSXPCCodingArray *)&v9 init];
  if (v5)
  {
    uint64_t v6 = (NSArray *)BSCreateDeserializedArrayFromXPCDictionaryWithKey(v4, "items", &__block_literal_global_27);
    array = v5->_array;
    v5->_array = v6;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (id)succinctDescription
{
  v2 = [(BSXPCCodingArray *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_array, "count"), @"count");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSXPCCodingArray *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(BSXPCCodingArray *)self succinctDescriptionBuilder];
  [v5 appendArraySection:self->_array withName:0 multilinePrefix:v4 skipIfEmpty:1];

  return v5;
}

@end