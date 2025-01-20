@interface AAPSyncAnchor
+ (BOOL)isValidStringRepresentation:(id)a3 withMainIndex:(unint64_t *)a4 subIndex:(unint64_t *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)anchorFromStringRepresentation:(id)a3;
+ (id)anchorFromStringRepresentation:(id)a3 error:(id *)a4;
- (AAPSyncAnchor)init;
- (AAPSyncAnchor)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAnchor:(id)a3;
- (BOOL)isNewerThanAnchor:(id)a3;
- (BOOL)isOlderThanAnchor:(id)a3;
- (BOOL)isPrimitiveAnchor;
- (NSString)stringRepresentation;
- (id)_initWithMainIndex:(unint64_t)a3 subIndex:(unint64_t)a4;
- (id)anchorByIncrementingSubIndex;
- (id)primitiveAnchor;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAPSyncAnchor

- (id)_initWithMainIndex:(unint64_t)a3 subIndex:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAPSyncAnchor;
  id result = [(AAPSyncAnchor *)&v7 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
    *((_DWORD *)result + 6) = 0;
  }
  return result;
}

- (AAPSyncAnchor)init
{
  return (AAPSyncAnchor *)[(AAPSyncAnchor *)self _initWithMainIndex:0 subIndex:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AAPSyncAnchor;
  [(AAPSyncAnchor *)&v3 dealloc];
}

+ (id)anchorFromStringRepresentation:(id)a3
{
  id v5 = 0;
  id v3 = [a1 anchorFromStringRepresentation:a3 error:&v5];
  if (v5) {
    +[NSException raise:format:](NSException, "raise:format:", NSParseErrorException, @"%@", [v5 localizedDescription]);
  }
  return v3;
}

+ (id)anchorFromStringRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if ([a1 isValidStringRepresentation:a3 withMainIndex:&v12 subIndex:&v11])
  {
    if (v11)
    {
      objc_super v7 = [AAPSyncAnchor alloc];
      return [(AAPSyncAnchor *)v7 _initWithMainIndex:v12 subIndex:v11];
    }
    else
    {
      return +[AAPSyncPrimitiveAnchor anchorFromIndex:v12];
    }
  }
  else
  {
    id result = 0;
    if (a3 && a4)
    {
      v9 = +[NSString stringWithFormat:@"cannot parse %@ from string representation: '%@'", a1, a3];
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      v14 = v9;
      v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"AAPAppDomain", 1, +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
      id result = 0;
      *a4 = v10;
    }
  }
  return result;
}

- (NSString)stringRepresentation
{
  p_stringRepresentationLock = &self->_stringRepresentationLock;
  os_unfair_lock_lock(&self->_stringRepresentationLock);
  lock_stringRepresentation = self->_lock_stringRepresentation;
  if (!lock_stringRepresentation)
  {
    unint64_t subIndex = self->_subIndex;
    id v6 = objc_alloc((Class)NSString);
    if (subIndex) {
      lock_stringRepresentation = (NSString *)objc_msgSend(v6, "initWithFormat:", @"%lu.%lu", self->_mainIndex, self->_subIndex);
    }
    else {
      lock_stringRepresentation = (NSString *)objc_msgSend(v6, "initWithFormat:", @"%lu", self->_mainIndex, v9);
    }
    self->_lock_stringRepresentation = lock_stringRepresentation;
  }
  objc_super v7 = lock_stringRepresentation;
  os_unfair_lock_unlock(p_stringRepresentationLock);

  return v7;
}

- (int64_t)compare:(id)a3
{
  if (!a3) {
    return 1;
  }
  unint64_t mainIndex = self->_mainIndex;
  unint64_t v4 = *((void *)a3 + 1);
  if (mainIndex < v4) {
    return -1;
  }
  if (mainIndex > v4) {
    return 1;
  }
  unint64_t subIndex = self->_subIndex;
  unint64_t v7 = *((void *)a3 + 2);
  BOOL v8 = subIndex >= v7;
  int64_t v9 = subIndex > v7;
  if (v8) {
    return v9;
  }
  else {
    return -1;
  }
}

- (BOOL)isEqualToAnchor:(id)a3
{
  return [(AAPSyncAnchor *)self compare:a3] == 0;
}

- (BOOL)isOlderThanAnchor:(id)a3
{
  return [(AAPSyncAnchor *)self compare:a3] == -1;
}

- (BOOL)isNewerThanAnchor:(id)a3
{
  return (char *)[(AAPSyncAnchor *)self compare:a3] == (char *)&dword_0 + 1;
}

- (id)primitiveAnchor
{
  if ([(AAPSyncAnchor *)self isPrimitiveAnchor]) {
    return self;
  }
  unint64_t mainIndex = self->_mainIndex;

  return +[AAPSyncPrimitiveAnchor anchorFromIndex:mainIndex];
}

- (id)anchorByIncrementingSubIndex
{
  id v2 = [[AAPSyncAnchor alloc] _initWithMainIndex:self->_mainIndex subIndex:self->_subIndex + 1];

  return v2;
}

+ (BOOL)isValidStringRepresentation:(id)a3 withMainIndex:(unint64_t *)a4 subIndex:(unint64_t *)a5
{
  if (!a3
    || (id v7 = [a3 componentsSeparatedByString:@"."],
        id v8 = [v7 count],
        int64_t v9 = +[NSCharacterSet decimalDigitCharacterSet],
        (unint64_t)v8 > 2))
  {
LABEL_18:
    LOBYTE(v16) = 0;
    return (char)v16;
  }
  v10 = v9;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v11) {
    goto LABEL_19;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v27;
  v25 = a5;
LABEL_5:
  v14 = 0;
  while (2)
  {
    if (*(void *)v27 != v13) {
      objc_enumerationMutation(v7);
    }
    v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v14);
    id v16 = [v15 length];
    if (v16)
    {
      unint64_t v17 = (unint64_t)v16;
      LODWORD(v16) = -[NSCharacterSet characterIsMember:](v10, "characterIsMember:", [v15 characterAtIndex:0]);
      if (v16)
      {
        uint64_t v18 = v13;
        uint64_t v19 = 1;
        while (v17 != v19)
        {
          unsigned __int8 v20 = -[NSCharacterSet characterIsMember:](v10, "characterIsMember:", [v15 characterAtIndex:v19++]);
          if ((v20 & 1) == 0)
          {
            a5 = v25;
            if (v19 - 1 >= v17) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
        v14 = (char *)v14 + 1;
        uint64_t v13 = v18;
        if (v14 != v12) {
          continue;
        }
        id v12 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        a5 = v25;
        if (v12) {
          goto LABEL_5;
        }
LABEL_19:
        if (a4)
        {
          uint64_t v21 = (uint64_t)objc_msgSend(objc_msgSend(v7, "objectAtIndex:", 0), "integerValue");
          *a4 = v21 & ~(v21 >> 63);
        }
        if (a5)
        {
          if ((unint64_t)v8 < 2)
          {
            unint64_t v23 = 0;
          }
          else
          {
            uint64_t v22 = (uint64_t)objc_msgSend(objc_msgSend(v7, "objectAtIndex:", 1), "integerValue");
            unint64_t v23 = v22 & ~(v22 >> 63);
          }
          *a5 = v23;
        }
        LOBYTE(v16) = 1;
      }
    }
    return (char)v16;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAPSyncAnchor)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AAPSyncAnchor;
  unint64_t v4 = [(AAPSyncAnchor *)&v7 init];
  if (v4)
  {
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"str"];
    if (![(id)objc_opt_class() isValidStringRepresentation:v5 withMainIndex:&v4->_mainIndex subIndex:&v4->_subIndex]|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && v4->_subIndex)
    {
      +[NSException raise:NSParseErrorException, @"cannot parse %@ from string representation: '%@'", objc_opt_class(), v5 format];
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4 = [(AAPSyncAnchor *)self stringRepresentation];

  [a3 encodeObject:v4 forKey:@"str"];
}

- (BOOL)isPrimitiveAnchor
{
  return 0;
}

- (unint64_t)hash
{
  return self->_subIndex + 50021 * self->_mainIndex;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(AAPSyncAnchor *)self isEqualToAnchor:a3];
}

@end