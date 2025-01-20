@interface IKDOMLSInput
- (BOOL)certifiedText;
- (NSString)encoding;
- (NSString)stringData;
- (id)byteStream;
- (void)setByteStream:(id)a3;
- (void)setCertifiedText:(BOOL)a3;
- (void)setEncoding:(id)a3;
- (void)setStringData:(id)a3;
@end

@implementation IKDOMLSInput

- (id)byteStream
{
  return self->_byteStream;
}

- (void)setByteStream:(id)a3
{
}

- (NSString)stringData
{
  return self->_stringData;
}

- (void)setStringData:(id)a3
{
}

- (NSString)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(id)a3
{
}

- (BOOL)certifiedText
{
  return self->_certifiedText;
}

- (void)setCertifiedText:(BOOL)a3
{
  self->_certifiedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_stringData, 0);
  objc_storeStrong(&self->_byteStream, 0);
}

@end