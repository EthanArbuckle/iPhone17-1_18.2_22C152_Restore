@interface CHEncodedStrokeIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHEncodedStrokeIdentifier)initWithCoder:(id)a3;
- (CHEncodedStrokeIdentifier)initWithData:(id)a3;
- (NSData)encodedStrokeIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHEncodedStrokeIdentifier

- (CHEncodedStrokeIdentifier)initWithData:(id)a3
{
  id v5 = a3;
  uint64_t v11 = objc_msgSend_init(self, v6, v7, v8, v9, v10);
  v12 = (CHEncodedStrokeIdentifier *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 16), a3);
    v12->_savedHash = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  if (self->_savedHash) {
    return self->_savedHash;
  }
  if ((unint64_t)objc_msgSend_length(self->_encodedStrokeIdentifier, a2, v2, v3, v4, v5) < 0x51)
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = 0;
    unint64_t v14 = 80;
    do
    {
      v15 = objc_msgSend_subdataWithRange_(self->_encodedStrokeIdentifier, v8, v14 - 80, 80, v11, v12);
      v13 ^= objc_msgSend_hash(v15, v16, v17, v18, v19, v20);

      v14 += 80;
    }
    while (v14 < objc_msgSend_length(self->_encodedStrokeIdentifier, v21, v22, v23, v24, v25));
  }
  unint64_t v31 = objc_msgSend_length(self->_encodedStrokeIdentifier, v8, v9, v10, v11, v12) % 0x50uLL;
  if (v31)
  {
    uint64_t v32 = objc_msgSend_length(self->_encodedStrokeIdentifier, v26, v27, v28, v29, v30);
    v36 = objc_msgSend_subdataWithRange_(self->_encodedStrokeIdentifier, v33, v32 - v31, v31, v34, v35);
    v13 ^= objc_msgSend_hash(v36, v37, v38, v39, v40, v41);
  }
  self->_savedHash = v13;
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHEncodedStrokeIdentifier *)v4;
    uint64_t v11 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else
      {
        encodedStrokeIdentifier = self->_encodedStrokeIdentifier;
        objc_msgSend_encodedStrokeIdentifier(v5, v6, v7, v8, v9, v10);
        uint64_t v18 = (NSData *)objc_claimAutoreleasedReturnValue();
        if (encodedStrokeIdentifier == v18)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          self = (CHEncodedStrokeIdentifier *)self->_encodedStrokeIdentifier;
          uint64_t v19 = objc_msgSend_encodedStrokeIdentifier(v11, v13, v14, v15, v16, v17);
          LOBYTE(self) = objc_msgSend_isEqual_(self, v20, (uint64_t)v19, v21, v22, v23);
        }
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_encodedStrokeIdentifier, @"encodedStrokeIdentifier", v3, v4);
}

- (CHEncodedStrokeIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"encodedStrokeIdentifier", v7, v8);

  uint64_t v14 = (CHEncodedStrokeIdentifier *)objc_msgSend_initWithData_(self, v10, (uint64_t)v9, v11, v12, v13);
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)encodedStrokeIdentifier
{
  return self->_encodedStrokeIdentifier;
}

- (void).cxx_destruct
{
}

@end