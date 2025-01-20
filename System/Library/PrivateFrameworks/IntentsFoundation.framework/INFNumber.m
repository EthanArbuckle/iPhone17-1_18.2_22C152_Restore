@interface INFNumber
+ (id)numberWithIdentifier:(id)a3;
- (INFNumber)initWithIdentifier:(id)a3;
- (NSNumber)value;
- (id)contributingSentenceContext;
- (id)dictionaryRepresentation;
- (id)identifier;
- (id)stringForContext:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation INFNumber

+ (id)numberWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setValue:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)dictionaryRepresentation
{
  return 0;
}

- (id)stringForContext:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v4 setNumberStyle:1];
  v5 = [v4 stringFromNumber:self->_value];

  return v5;
}

- (id)contributingSentenceContext
{
  v3 = +[INFSentenceContext sentenceContext];
  [v3 setNumber:self->_value];
  return v3;
}

- (INFNumber)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(INFNumber *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    value = v7->_value;
    v7->_value = (NSNumber *)&unk_1F37C6518;
  }
  return v7;
}

@end