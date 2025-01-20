@interface NSData(MimeDataEncoding)
- (id)mf_decodeBase64;
- (id)mf_decodeBase64InRange:()MimeDataEncoding;
- (id)mf_decodeModifiedBase64;
- (id)mf_decodeQuotedPrintableForText:()MimeDataEncoding;
- (id)mf_encodeBase64;
- (id)mf_encodeBase64HeaderData;
- (id)mf_encodeBase64WithoutLineBreaks;
- (id)mf_encodeModifiedBase64;
@end

@implementation NSData(MimeDataEncoding)

- (id)mf_decodeQuotedPrintableForText:()MimeDataEncoding
{
  v5 = objc_alloc_init(MFBufferedDataConsumer);
  v6 = [(MFBaseFilterDataConsumer *)[MFQuotedPrintableDecoder alloc] initWithConsumer:v5];
  [(MFQuotedPrintableDecoder *)v6 setForTextPart:a3];
  v7 = _EnDecodeData(v5, v6, a1);

  return v7;
}

- (id)mf_decodeBase64
{
  return _decodeBase64Data(a1, 0, 0);
}

- (id)mf_decodeBase64InRange:()MimeDataEncoding
{
  return _decodeBase64Data(a1, 0, a3);
}

- (id)mf_decodeModifiedBase64
{
  return _decodeBase64Data(a1, 1, 0);
}

- (id)mf_encodeBase64WithoutLineBreaks
{
  return _encodeBase64Data(a1, 0, 1, 61);
}

- (id)mf_encodeBase64
{
  return _encodeBase64Data(a1, 1, 1, 61);
}

- (id)mf_encodeModifiedBase64
{
  return _encodeBase64Data(a1, 0, 0, 0);
}

- (id)mf_encodeBase64HeaderData
{
  return _encodeBase64Data(a1, 0, 1, 61);
}

@end