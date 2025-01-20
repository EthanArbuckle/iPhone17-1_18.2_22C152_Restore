@interface KGTransactionToken
- (BOOL)isEqualToToken:(id)a3;
- (NSString)stringRepresentation;
- (id)initForGraph:(id)a3 transactionSequence:(unint64_t)a4;
- (id)initForGraph:(id)a3 withString:(id)a4;
- (id)initForGraphIdentifier:(id)a3 transactionSequence:(unint64_t)a4;
- (unint64_t)transactionSequenceNumber;
@end

@implementation KGTransactionToken

- (void).cxx_destruct
{
}

- (unint64_t)transactionSequenceNumber
{
  return self->_transactionSequenceNumber;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (BOOL)isEqualToToken:(id)a3
{
  stringRepresentation = self->_stringRepresentation;
  v4 = [a3 stringRepresentation];
  LOBYTE(stringRepresentation) = [(NSString *)stringRepresentation isEqualToString:v4];

  return (char)stringRepresentation;
}

- (id)initForGraphIdentifier:(id)a3 transactionSequence:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KGTransactionToken;
  v7 = [(KGTransactionToken *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@:%lu", v6, a4];
    stringRepresentation = v7->_stringRepresentation;
    v7->_stringRepresentation = (NSString *)v8;

    v7->_transactionSequenceNumber = a4;
  }

  return v7;
}

- (id)initForGraph:(id)a3 transactionSequence:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KGTransactionToken;
  v7 = [(KGTransactionToken *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 graphIdentifier];
    uint64_t v9 = [NSString stringWithFormat:@"%@:%lu", v8, a4];
    stringRepresentation = v7->_stringRepresentation;
    v7->_stringRepresentation = (NSString *)v9;

    v7->_transactionSequenceNumber = a4;
  }

  return v7;
}

- (id)initForGraph:(id)a3 withString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)KGTransactionToken;
  uint64_t v8 = [(KGTransactionToken *)&v20 init];
  id v9 = v6;
  v10 = [v7 componentsSeparatedByString:@":"];
  if ([v10 count] != 2)
  {

LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F29128]);
  objc_super v12 = [v10 objectAtIndexedSubscript:0];
  v13 = (void *)[v11 initWithUUIDString:v12];

  v14 = [v9 graphIdentifier];
  int v15 = [v13 isEqual:v14];

  if (v15)
  {
    v16 = [v10 objectAtIndexedSubscript:1];
    uint64_t v17 = [v16 integerValue];
  }
  else
  {
    uint64_t v17 = -1;
  }

  if (v17 < 0) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v8->_stringRepresentation, a4);
  v8->_transactionSequenceNumber = v17;
  v18 = v8;
LABEL_9:

  return v18;
}

@end