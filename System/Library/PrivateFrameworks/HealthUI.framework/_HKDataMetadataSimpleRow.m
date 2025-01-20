@interface _HKDataMetadataSimpleRow
- (NSString)baseIdentifier;
- (NSString)detail;
- (NSString)text;
- (void)setBaseIdentifier:(id)a3;
- (void)setDetail:(id)a3;
- (void)setText:(id)a3;
@end

@implementation _HKDataMetadataSimpleRow

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end