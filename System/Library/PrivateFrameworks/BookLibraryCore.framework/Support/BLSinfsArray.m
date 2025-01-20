@interface BLSinfsArray
- (BLSinfsArray)initWithSINFs:(id)a3;
- (BOOL)_isRecognizedProperty:(id)a3;
- (NSArray)sinfs;
- (id)_copyValueForSINF:(id)a3 property:(id)a4 error:(id *)a5;
- (id)copyValueForField:(int64_t)a3 error:(id *)a4;
- (id)copyValueForProperty:(id)a3 error:(id *)a4;
- (void)setSinfs:(id)a3;
@end

@implementation BLSinfsArray

- (BLSinfsArray)initWithSINFs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSinfsArray;
  v5 = [(BLSinfsArray *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    sinfs = v5->_sinfs;
    v5->_sinfs = v6;
  }
  return v5;
}

- (id)copyValueForField:(int64_t)a3 error:(id *)a4
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_sinfs;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7)
  {
LABEL_9:

LABEL_13:
    v14 = sub_10004B924(@"FairPlayErrorDomain", 3, 0, 0);
    id v13 = 0;
    if (!a4) {
      goto LABEL_15;
    }
LABEL_14:
    *a4 = v14;
    goto LABEL_15;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v18;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v18 != v9) {
      objc_enumerationMutation(v6);
    }
    v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
    uint64_t v16 = 0;
    if (!sub_10004D080(v11, a3, &v16)) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_9;
    }
  }
  id v12 = objc_alloc((Class)NSNumber);
  id v13 = [v12 initWithUnsignedLongLong:v16];

  if (!v13) {
    goto LABEL_13;
  }
  v14 = 0;
  if (a4) {
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

- (id)copyValueForProperty:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(BLSinfsArray *)self _isRecognizedProperty:v6])
  {
    uint64_t v16 = 2;
LABEL_15:
    uint64_t v15 = sub_10004B924(@"FairPlayErrorDomain", v16, 0, 0);
    unint64_t v13 = 0;
    goto LABEL_16;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->_sinfs;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v18 = 0;
        unint64_t v13 = [(BLSinfsArray *)self _copyValueForSINF:v12 property:v6 error:&v18];
        uint64_t v14 = (uint64_t)v18;
        if (v13 | v14)
        {
          uint64_t v15 = v14;
          goto LABEL_13;
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
  unint64_t v13 = 0;
LABEL_13:

  if (!(v13 | v15))
  {
    uint64_t v16 = 3;
    goto LABEL_15;
  }
LABEL_16:
  if (a4) {
    *a4 = (id) v15;
  }

  return (id)v13;
}

- (id)_copyValueForSINF:(id)a3 property:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 isEqualToString:@"SinfPropertyAccountIdentifier"])
  {
    uint64_t v15 = 0;
    id v9 = v7;
    unint64_t v10 = 2;
  }
  else
  {
    if (![v8 isEqualToString:@"SinfPropertyFairPlayKeyIdentifier"])
    {
      id v12 = 0;
      goto LABEL_12;
    }
    uint64_t v15 = 0;
    id v9 = v7;
    unint64_t v10 = 5;
  }
  int v11 = sub_10004D080(v9, v10, &v15);
  id v12 = 0;
  if (v11)
  {
    if (!a5) {
      goto LABEL_12;
    }
  }
  else
  {
    id v13 = objc_alloc((Class)NSNumber);
    id v12 = [v13 initWithUnsignedLongLong:v15];
    if (!a5) {
      goto LABEL_12;
    }
  }
  if (v11)
  {
    sub_10004B924(@"FairPlayErrorDomain", v11, 0, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v12;
}

- (BOOL)_isRecognizedProperty:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SinfPropertyAccountIdentifier"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"SinfPropertyFairPlayKeyIdentifier"];
  }

  return v4;
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void)setSinfs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end