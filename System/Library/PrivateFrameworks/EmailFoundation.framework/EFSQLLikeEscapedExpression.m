@interface EFSQLLikeEscapedExpression
- (EFSQLLikeEscapedExpression)initWithValue:(id)a3;
- (EFSQLLikeEscapedExpression)initWithValue:(id)a3 pattern:(unint64_t)a4;
- (EFSQLLikeEscapedExpression)initWithValue:(id)a3 pattern:(unint64_t)a4 escapeCharacter:(unsigned __int16)a5;
- (NSString)ef_SQLExpression;
- (NSString)value;
- (id)_stringForPattern:(void *)a3 literal:;
- (unint64_t)pattern;
- (unsigned)escapeCharacter;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation EFSQLLikeEscapedExpression

- (EFSQLLikeEscapedExpression)initWithValue:(id)a3
{
  return [(EFSQLLikeEscapedExpression *)self initWithValue:a3 pattern:3];
}

- (EFSQLLikeEscapedExpression)initWithValue:(id)a3 pattern:(unint64_t)a4
{
  return [(EFSQLLikeEscapedExpression *)self initWithValue:a3 pattern:a4 escapeCharacter:92];
}

- (EFSQLLikeEscapedExpression)initWithValue:(id)a3 pattern:(unint64_t)a4 escapeCharacter:(unsigned __int16)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFSQLLikeEscapedExpression;
  v10 = [(EFSQLLikeEscapedExpression *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_value, a3);
    v11->_escapeCharacter = a5;
    v11->_pattern = a4;
  }

  return v11;
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLLikeEscapedExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v5 = a3;
  v4 = -[EFSQLLikeEscapedExpression _stringForPattern:literal:](self, self->_pattern, self->_value);
  objc_msgSend(v4, "ef_renderSQLExpressionInto:", v5);
  objc_msgSend(v5, "appendFormat:", @" ESCAPE '%C'", self->_escapeCharacter);
}

- (id)_stringForPattern:(void *)a3 literal:
{
  id v5 = a3;
  v6 = v5;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        v7 = NSString;
        v8 = objc_msgSend(v5, "ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:", objc_msgSend(a1, "escapeCharacter"));
        uint64_t v9 = [v7 stringWithFormat:@"%@%%", v8];
        goto LABEL_6;
      case 1:
        v10 = NSString;
        v8 = objc_msgSend(v5, "ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:", objc_msgSend(a1, "escapeCharacter"));
        uint64_t v9 = [v10 stringWithFormat:@"%%%@%%", v8];
        goto LABEL_6;
      case 2:
        v11 = NSString;
        v8 = objc_msgSend(v5, "ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:", objc_msgSend(a1, "escapeCharacter"));
        uint64_t v9 = [v11 stringWithFormat:@"%%%@", v8];
LABEL_6:
        a1 = (id)v9;

        break;
      case 3:
        a1 = v5;
        break;
      default:
        break;
    }
  }

  return a1;
}

- (NSString)value
{
  return self->_value;
}

- (unsigned)escapeCharacter
{
  return self->_escapeCharacter;
}

- (unint64_t)pattern
{
  return self->_pattern;
}

- (void).cxx_destruct
{
}

@end