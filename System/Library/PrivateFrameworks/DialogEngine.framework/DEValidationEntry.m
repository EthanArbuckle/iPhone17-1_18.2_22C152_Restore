@interface DEValidationEntry
- (NSNumber)lineNumber;
- (NSString)filename;
- (NSString)text;
- (NSString)textWithLineNumber;
- (void)setFilename:(id)a3;
- (void)setLineNumber:(id)a3;
- (void)setText:(id)a3;
- (void)setTextWithLineNumber:(id)a3;
@end

@implementation DEValidationEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_lineNumber, 0);
  objc_storeStrong((id *)&self->_textWithLineNumber, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setLineNumber:(id)a3
{
}

- (NSNumber)lineNumber
{
  return self->_lineNumber;
}

- (void)setTextWithLineNumber:(id)a3
{
}

- (NSString)textWithLineNumber
{
  return self->_textWithLineNumber;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

@end