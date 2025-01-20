@interface _MKTokenAttributedString
- (BOOL)isEmpty;
- (NSAttributedString)attributedString;
- (NSString)string;
- (id)description;
- (void)setAttributedString:(id)a3;
- (void)setString:(id)a3;
@end

@implementation _MKTokenAttributedString

- (void)setAttributedString:(id)a3
{
  v4 = (NSAttributedString *)a3;
  string = self->_string;
  self->_string = 0;

  attributedString = self->_attributedString;
  self->_attributedString = v4;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
  id v6 = a3;
  attributedString = self->_attributedString;
  self->_attributedString = 0;
}

- (BOOL)isEmpty
{
  return ![(NSString *)self->_string length]
      && [(NSAttributedString *)self->_attributedString length] == 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ %@", self->_string, self->_attributedString];
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end