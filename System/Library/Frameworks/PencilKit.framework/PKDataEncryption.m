@interface PKDataEncryption
+ (id)decryptFile:(void *)a3 key:(uint64_t)a4 error:;
+ (id)encryptData:(void *)a3 key:;
+ (uint64_t)encryptData:(void *)a3 to:(void *)a4 key:(uint64_t)a5 error:;
@end

@implementation PKDataEncryption

+ (id)encryptData:(void *)a3 key:
{
  id v4 = a2;
  id v5 = a3;
  self;
  size_t dataOutMoved = 0;
  id v6 = v5;
  v7 = (const void *)[v6 bytes];
  size_t v8 = [v6 length];
  id v9 = v4;
  id v10 = 0;
  if (CCCrypt(0, 0, 1u, v7, v8, 0, (const void *)[v9 bytes], objc_msgSend(v9, "length"), 0, 0, &dataOutMoved) == -4301)
  {
    v11 = [MEMORY[0x1E4F1CA58] dataWithLength:dataOutMoved];
    id v12 = v6;
    v13 = (const void *)[v12 bytes];
    size_t v14 = [v12 length];
    id v15 = v9;
    v16 = (const void *)[v15 bytes];
    size_t v17 = [v15 length];
    id v10 = v11;
    if (CCCrypt(0, 0, 1u, v13, v14, 0, v16, v17, (void *)[v10 bytes], objc_msgSend(v10, "length"), &dataOutMoved))
    {

      id v10 = 0;
    }
    else
    {
      [v10 setLength:dataOutMoved];
    }
  }

  return v10;
}

+ (id)decryptFile:(void *)a3 key:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  size_t v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:1 error:a4];

  if (v8 && [v8 length])
  {
    id v9 = v8;
    id v10 = v6;
    self;
    size_t dataOutMoved = 0;
    id v11 = v10;
    id v12 = (const void *)[v11 bytes];
    size_t v13 = [v11 length];
    id v14 = v9;
    CCCryptorStatus v15 = CCCrypt(1u, 0, 1u, v12, v13, 0, (const void *)[v14 bytes], objc_msgSend(v14, "length"), 0, 0, &dataOutMoved);
    id v16 = 0;
    if (v15 == -4301)
    {
      size_t v17 = [MEMORY[0x1E4F1CA58] dataWithLength:dataOutMoved];
      id v18 = v11;
      v19 = (const void *)[v18 bytes];
      size_t v20 = [v18 length];
      id v21 = v14;
      v22 = (const void *)[v21 bytes];
      size_t v23 = [v21 length];
      id v16 = v17;
      if (CCCrypt(1u, 0, 1u, v19, v20, 0, v22, v23, (void *)[v16 bytes], objc_msgSend(v16, "length"), &dataOutMoved))
      {

        id v16 = 0;
      }
      else
      {
        [v16 setLength:dataOutMoved];
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (uint64_t)encryptData:(void *)a3 to:(void *)a4 key:(uint64_t)a5 error:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a2;
  uint64_t v11 = self;
  id v12 = +[PKDataEncryption encryptData:key:](v11, v10, v9);

  if (v12) {
    uint64_t v13 = [v12 writeToURL:v8 options:1 error:a5];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

@end