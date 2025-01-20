@interface _UIContactSearchResult
- (BOOL)isEqual:(id)a3;
- (MFComposeRecipient)composeRecipient;
- (unint64_t)hash;
- (void)setComposeRecipient:(id)a3;
@end

@implementation _UIContactSearchResult

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [(MFComposeRecipient *)self->_composeRecipient isEqual:v4[1]];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(MFComposeRecipient *)self->_composeRecipient address];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (MFComposeRecipient)composeRecipient
{
  return self->_composeRecipient;
}

- (void)setComposeRecipient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end