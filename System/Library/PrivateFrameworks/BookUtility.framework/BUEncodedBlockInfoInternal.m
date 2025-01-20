@interface BUEncodedBlockInfoInternal
- (BOOL)isEqual:(id)a3;
- (BUEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3;
- (NSString)description;
- (unint64_t)decodedLength;
- (unint64_t)encodedLength;
- (unint64_t)hash;
@end

@implementation BUEncodedBlockInfoInternal

- (BUEncodedBlockInfoInternal)initWithEncodedLength:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BUEncodedBlockInfoInternal;
  result = [(BUEncodedBlockInfoInternal *)&v5 init];
  if (result) {
    result->_encodedLength = a3;
  }
  return result;
}

- (unint64_t)decodedLength
{
  return self->_encodedLength;
}

- (BOOL)isEqual:(id)a3
{
  v4 = BUProtocolCast(&unk_26CF1DE48, a3);
  if (v4) {
    BOOL v5 = BUEncodedBlockInfoAreEqual(self, v4);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_encodedLength(self, a2, v2);
  return objc_msgSend_decodedLength(self, v5, v6) ^ v4;
}

- (NSString)description
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_encodedLength(self, a2, v2);
  uint64_t v8 = objc_msgSend_decodedLength(self, v6, v7);
  return (NSString *)objc_msgSend_stringWithFormat_(v4, v9, @"[EncodedLength=%zu; DecodedLength=%zu]",
                       v5,
                       v8);
}

- (unint64_t)encodedLength
{
  return self->_encodedLength;
}

@end