@interface _EFSQLCharacterExpression
- (NSString)ef_SQLExpression;
- (_EFSQLCharacterExpression)initWithCharacter:(unsigned __int16)a3;
- (unsigned)character;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation _EFSQLCharacterExpression

- (_EFSQLCharacterExpression)initWithCharacter:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_EFSQLCharacterExpression;
  result = [(_EFSQLCharacterExpression *)&v5 init];
  if (result) {
    result->_character = a3;
  }
  return result;
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(_EFSQLCharacterExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
}

- (unsigned)character
{
  return self->_character;
}

@end