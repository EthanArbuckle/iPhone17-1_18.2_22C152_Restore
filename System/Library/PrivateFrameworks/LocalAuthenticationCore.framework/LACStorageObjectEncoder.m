@interface LACStorageObjectEncoder
- (id)_lastBioAuthDataToNumber:(id)a3;
- (id)encodeValue:(id)a3 forKey:(int64_t)a4 error:(id *)a5;
@end

@implementation LACStorageObjectEncoder

- (id)encodeValue:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = v8;
  if (a5) {
    *a5 = 0;
  }
  if (!v8) {
    goto LABEL_22;
  }
  if (([(objc_class *)+[LACSecureStorage classForKey:a4] isEqual:objc_opt_class()] & 1) == 0)
  {
    id v14 = v9;
    goto LABEL_11;
  }
  if (a4 != 7)
  {
    if (a4 != 14)
    {
      if (a4 == 12)
      {
        v10 = [(LACStorageObjectEncoder *)self _lastBioAuthDataToNumber:v9];
        v11 = v10;
        if (v10)
        {
          BOOL v12 = (unint64_t)[v10 integerValue] < 0x5265C01;
          v13 = [NSNumber numberWithBool:v12];
        }
        else
        {
          v13 = (void *)MEMORY[0x263EFFA80];
        }

        goto LABEL_23;
      }
      if ([v9 length] == 1)
      {
        objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)objc_msgSend(v9, "bytes"));
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      if (a5)
      {
        v15 = @"Expected BOOL in NSNumber";
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    id v14 = [(LACStorageObjectEncoder *)self _lastBioAuthDataToNumber:v9];
LABEL_11:
    v13 = v14;
    goto LABEL_23;
  }
  if ([v9 length] == 1)
  {
    objc_msgSend(NSNumber, "numberWithChar:", *(char *)objc_msgSend(v9, "bytes"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (a5)
  {
    v15 = @"Expected 1 byte in NSNumber";
LABEL_21:
    +[LACStorageError errorWithCode:1 debugDescription:v15];
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_22:
  v13 = 0;
LABEL_23:

  return v13;
}

- (id)_lastBioAuthDataToNumber:(id)a3
{
  if (*(void *)[a3 bytes])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end