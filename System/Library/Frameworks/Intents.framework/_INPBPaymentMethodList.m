@interface _INPBPaymentMethodList
+ (BOOL)supportsSecureCoding;
+ (Class)paymentMethodsType;
- (BOOL)hasCondition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)paymentMethods;
- (_INPBCondition)condition;
- (_INPBPaymentMethodList)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)paymentMethodsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)paymentMethodsCount;
- (void)addPaymentMethods:(id)a3;
- (void)clearPaymentMethods;
- (void)encodeWithCoder:(id)a3;
- (void)setCondition:(id)a3;
- (void)setPaymentMethods:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPaymentMethodList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethods, 0);

  objc_storeStrong((id *)&self->_condition, 0);
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (_INPBCondition)condition
{
  return self->_condition;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPaymentMethodList *)self condition];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"condition"];

  if ([(NSArray *)self->_paymentMethods count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_paymentMethods;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"paymentMethods"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCondition *)self->_condition hash];
  return [(NSArray *)self->_paymentMethods hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBPaymentMethodList *)self condition];
  v6 = [v4 condition];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBPaymentMethodList *)self condition];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBPaymentMethodList *)self condition];
    uint64_t v10 = [v4 condition];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBPaymentMethodList *)self paymentMethods];
  v6 = [v4 paymentMethods];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBPaymentMethodList *)self paymentMethods];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    long long v14 = [(_INPBPaymentMethodList *)self paymentMethods];
    long long v15 = [v4 paymentMethods];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBPaymentMethodList allocWithZone:](_INPBPaymentMethodList, "allocWithZone:") init];
  id v6 = [(_INPBCondition *)self->_condition copyWithZone:a3];
  [(_INPBPaymentMethodList *)v5 setCondition:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_paymentMethods copyWithZone:a3];
  [(_INPBPaymentMethodList *)v5 setPaymentMethods:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPaymentMethodList *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPaymentMethodList)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPaymentMethodList *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPaymentMethodList *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPaymentMethodList *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBPaymentMethodList *)self condition];

  if (v5)
  {
    id v6 = [(_INPBPaymentMethodList *)self condition];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_paymentMethods;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPaymentMethodListReadFrom(self, (uint64_t)a3);
}

- (id)paymentMethodsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_paymentMethods objectAtIndexedSubscript:a3];
}

- (unint64_t)paymentMethodsCount
{
  return [(NSArray *)self->_paymentMethods count];
}

- (void)addPaymentMethods:(id)a3
{
  id v4 = a3;
  paymentMethods = self->_paymentMethods;
  id v8 = v4;
  if (!paymentMethods)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_paymentMethods;
    self->_paymentMethods = v6;

    id v4 = v8;
    paymentMethods = self->_paymentMethods;
  }
  [(NSArray *)paymentMethods addObject:v4];
}

- (void)clearPaymentMethods
{
}

- (void)setPaymentMethods:(id)a3
{
  self->_paymentMethods = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasCondition
{
  return self->_condition != 0;
}

- (void)setCondition:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)paymentMethodsType
{
  return (Class)objc_opt_class();
}

@end