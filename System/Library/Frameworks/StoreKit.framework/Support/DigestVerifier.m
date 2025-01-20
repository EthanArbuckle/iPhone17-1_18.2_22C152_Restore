@interface DigestVerifier
- (BOOL)_validateAndResetDigestError:(id *)a3;
- (BOOL)verifyBuffer:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)verifyData:(id)a3 error:(id *)a4;
- (DigestVerifier)initWithChunkedDigest:(id)a3 resumptionOffset:(unint64_t)a4;
- (DigestVerifier)initWithDigest:(id)a3 type:(int64_t)a4;
- (unint64_t)bytesProcessed;
- (unint64_t)bytesValidated;
- (void)_hashBuffer:(const char *)a3 length:(unint64_t)a4;
- (void)_hashData:(id)a3;
@end

@implementation DigestVerifier

- (DigestVerifier)initWithChunkedDigest:(id)a3 resumptionOffset:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DigestVerifier;
  v7 = [(DigestVerifier *)&v14 init];
  if (v7)
  {
    v8 = (ChunkedDigest *)[v6 copy];
    digest = v7->_digest;
    v7->_digest = v8;

    v7->_bytesProcessed = a4;
    v7->_bytesValidated = a4;
    unsigned int v10 = [(ChunkedDigest *)v7->_digest chunkSize];
    if (v10)
    {
      v7->_index = a4 / v10;
      if (a4 % v10)
      {
LABEL_7:
        v7->_valid = 1;
        goto LABEL_8;
      }
    }
    else
    {
      v7->_index = 0;
    }
    v11 = [[HashDigest alloc] initWithDigestType:[(ChunkedDigest *)v7->_digest chunkType]];
    hashDigest = v7->_hashDigest;
    v7->_hashDigest = v11;

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (DigestVerifier)initWithDigest:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(ChunkedDigest);
  [(ChunkedDigest *)v7 setChunkType:a4];
  [(ChunkedDigest *)v7 setChunkSize:0];
  id v11 = v6;
  v8 = +[NSArray arrayWithObjects:&v11 count:1];

  [(ChunkedDigest *)v7 setChunkDigests:v8];
  v9 = [(DigestVerifier *)self initWithChunkedDigest:v7 resumptionOffset:0];

  return v9;
}

- (BOOL)verifyBuffer:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (self->_valid)
  {
    if ([(ChunkedDigest *)self->_digest chunkSize]
      && (unsigned int v9 = [(ChunkedDigest *)self->_digest chunkSize],
          unint64_t bytesProcessed = self->_bytesProcessed,
          unsigned int v11 = [(ChunkedDigest *)self->_digest chunkSize],
          int v12 = bytesProcessed / v11 * v11 - bytesProcessed,
          unint64_t v13 = v9 + v12,
          a4 >= v13))
    {
      [(DigestVerifier *)self _hashBuffer:a3 length:v9 + v12];
      BOOL v17 = [(DigestVerifier *)self _validateAndResetDigestError:a5];
      if (!v17) {
        return v17;
      }
      v15 = &a3[v13];
      objc_super v14 = self;
      unint64_t v16 = a4 - v13;
    }
    else
    {
      objc_super v14 = self;
      v15 = a3;
      unint64_t v16 = a4;
    }
    [(DigestVerifier *)v14 _hashBuffer:v15 length:v16];
    LOBYTE(v17) = self->_valid;
  }
  else
  {
    LOBYTE(v17) = 0;
  }
  return v17;
}

- (BOOL)verifyData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->_valid) {
    goto LABEL_8;
  }
  if ([(ChunkedDigest *)self->_digest chunkSize])
  {
    unsigned int v7 = [(ChunkedDigest *)self->_digest chunkSize];
    unint64_t bytesProcessed = self->_bytesProcessed;
    unsigned int v9 = [(ChunkedDigest *)self->_digest chunkSize];
    unint64_t v10 = v7 + (bytesProcessed / v9) * v9 - bytesProcessed;
    if ((unint64_t)[v6 length] >= v10)
    {
      int v12 = objc_msgSend(v6, "subdataWithRange:", 0, v10);
      [(DigestVerifier *)self _hashData:v12];

      if ([(DigestVerifier *)self _validateAndResetDigestError:a4])
      {
        unsigned int v13 = [(ChunkedDigest *)self->_digest chunkSize];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100086644;
        v15[3] = &unk_10035A1C8;
        v15[4] = self;
        v15[5] = a4;
        objc_msgSend(v6, "lib_enumerateSubdataWithOffset:length:usingBlock:", v10, v13, v15);
        goto LABEL_5;
      }
LABEL_8:
      BOOL valid = 0;
      goto LABEL_9;
    }
  }
  [(DigestVerifier *)self _hashData:v6];
LABEL_5:
  BOOL valid = self->_valid;
LABEL_9:

  return valid;
}

- (void)_hashBuffer:(const char *)a3 length:(unint64_t)a4
{
  self->_bytesProcessed += a4;
  -[HashDigest updateWithBuffer:length:](self->_hashDigest, "updateWithBuffer:length:", a3);
}

- (void)_hashData:(id)a3
{
  id v4 = a3;
  self->_bytesProcessed += (unint64_t)[v4 length];
  [(HashDigest *)self->_hashDigest updateWithData:v4];
}

- (BOOL)_validateAndResetDigestError:(id *)a3
{
  v5 = [(HashDigest *)self->_hashDigest finalAndCompute];
  unint64_t index = self->_index;
  unsigned int v7 = [(ChunkedDigest *)self->_digest chunkDigests];
  id v8 = [v7 count];

  if (index >= (unint64_t)v8)
  {
    id v15 = self->_index;
    unint64_t v16 = [(ChunkedDigest *)self->_digest chunkDigests];
    if (v15 == [v16 count])
    {
      unint64_t bytesProcessed = self->_bytesProcessed;
      unint64_t bytesValidated = self->_bytesValidated;

      if (bytesValidated == bytesProcessed) {
        goto LABEL_22;
      }
      if (!a3) {
        goto LABEL_13;
      }
    }
    else
    {

      if (!a3) {
        goto LABEL_13;
      }
    }
    ASDErrorWithDescription();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    self->_BOOL valid = 0;
    goto LABEL_22;
  }
  if (!v5)
  {
    if (qword_1003A0370 != -1) {
      dispatch_once(&qword_1003A0370, &stru_10035A1E8);
    }
    v19 = off_100399CD8;
    if (os_log_type_enabled((os_log_t)off_100399CD8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = self->_index;
      *(_DWORD *)buf = 134217984;
      unint64_t v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipped chunk digest at index %lu", buf, 0xCu);
    }
    self->_BOOL valid = 1;
    goto LABEL_21;
  }
  unsigned int v9 = [(ChunkedDigest *)self->_digest chunkDigests];
  unint64_t v10 = [v9 objectAtIndexedSubscript:self->_index];
  self->_BOOL valid = [v5 isEqualToString:v10];

  if (self->_valid)
  {
LABEL_21:
    self->_unint64_t bytesValidated = self->_bytesProcessed;
    ++self->_index;
    goto LABEL_22;
  }
  if (qword_1003A0370 != -1) {
    dispatch_once(&qword_1003A0370, &stru_10035A1E8);
  }
  unsigned int v11 = off_100399CD8;
  if (!os_log_type_enabled((os_log_t)off_100399CD8, OS_LOG_TYPE_ERROR))
  {
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_8;
  }
  digest = self->_digest;
  v26 = v11;
  v27 = [(ChunkedDigest *)digest chunkDigests];
  v28 = [v27 objectAtIndexedSubscript:self->_index];
  *(_DWORD *)buf = 138412546;
  unint64_t v30 = (unint64_t)v5;
  __int16 v31 = 2112;
  v32 = v28;
  _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Invalid hash '%@' expected '%@'", buf, 0x16u);

  if (a3)
  {
LABEL_8:
    int v12 = [(ChunkedDigest *)self->_digest chunkDigests];
    unsigned int v13 = [v12 objectAtIndexedSubscript:self->_index];
    objc_super v14 = +[NSString stringWithFormat:@"Invalid hash '%@' expected '%@'", v5, v13];

    ASDErrorWithDescription();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:
  if (self->_valid) {
    v21 = [[HashDigest alloc] initWithDigestType:[(ChunkedDigest *)self->_digest chunkType]];
  }
  else {
    v21 = 0;
  }
  hashDigest = self->_hashDigest;
  self->_hashDigest = v21;

  BOOL valid = self->_valid;
  return valid;
}

- (unint64_t)bytesProcessed
{
  return self->_bytesProcessed;
}

- (unint64_t)bytesValidated
{
  return self->_bytesValidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashDigest, 0);

  objc_storeStrong((id *)&self->_digest, 0);
}

@end