@interface NSException(NSException)
+ (uint64_t)supportsSecureCoding;
- (NSString)debugDescription;
- (uint64_t)encodeWithCoder:()NSException;
- (uint64_t)initWithCoder:()NSException;
@end

@implementation NSException(NSException)

- (NSString)debugDescription
{
  int v2 = [a1 _isUnarchived];
  uint64_t v3 = [a1 description];
  if (v2) {
    return +[NSString stringWithFormat:@"%@\n UNARCHIVED", v3, v5];
  }
  else {
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\n%@", v3, [a1 callStackSymbols]);
  }
}

- (uint64_t)encodeWithCoder:()NSException
{
  char v5 = [a3 allowsKeyedCoding];
  uint64_t v6 = [a1 name];
  if (v5)
  {
    [a3 encodeObject:v6 forKey:@"NS.name"];
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "reason"), @"NS.reason");
    uint64_t v7 = [a1 userInfo];
    return [a3 encodeObject:v7 forKey:@"NS.userinfo"];
  }
  else
  {
    [a3 encodeObject:v6];
    objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "reason"));
    uint64_t v9 = [a1 userInfo];
    return [a3 encodeObject:v9];
  }
}

- (uint64_t)initWithCoder:()NSException
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v5 = [&unk_1ECAB6140 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(&unk_1ECAB6140);
          }
          uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          if (([a3 containsValueForKey:v9] & 1) == 0)
          {
            v32 = @"NSDebugDescription";
            v33 = +[NSString stringWithFormat:@"Missing required key '%@'", v9];
            v20 = (void *)MEMORY[0x1E4F1C9E8];
            v21 = &v33;
            v22 = &v32;
            goto LABEL_21;
          }
        }
        uint64_t v6 = [&unk_1ECAB6140 countByEnumeratingWithState:&v35 objects:v34 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [a3 decodeObjectOfClass:v10 forKey:@"NS.name"];
    if (v11)
    {
      uint64_t v12 = v11;
      if (_NSIsNSString())
      {
        uint64_t v13 = [a3 decodeObjectOfClass:v10 forKey:@"NS.reason"];
        if (v13 && (_NSIsNSString() & 1) == 0)
        {
          v26 = @"NSDebugDescription";
          v27 = +[NSString stringWithFormat:@"Reason must be a string - got: %@", objc_opt_class()];
          v20 = (void *)MEMORY[0x1E4F1C9E8];
          v21 = &v27;
          v22 = &v26;
        }
        else
        {
          uint64_t v14 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "setByAddingObjectsFromSet:", __NSPropertyListClasses_ForArchival_ErrorAndException()), @"NS.userinfo");
          if (!v14 || (_NSIsNSDictionary() & 1) != 0)
          {
            v15 = (void *)[a1 initWithName:v12 reason:v13 userInfo:v14];
            [v15 _markAsUnarchived];
            return (uint64_t)v15;
          }
          v24 = @"NSDebugDescription";
          v25 = +[NSString stringWithFormat:@"UserInfo must be a dictionary - got: %@", objc_opt_class()];
          v20 = (void *)MEMORY[0x1E4F1C9E8];
          v21 = &v25;
          v22 = &v24;
        }
      }
      else
      {
        v28 = @"NSDebugDescription";
        v29 = +[NSString stringWithFormat:@"Name must be a string - got: %@", objc_opt_class()];
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        v21 = &v29;
        v22 = &v28;
      }
    }
    else
    {
      v30 = @"NSDebugDescription";
      v31 = +[NSString stringWithFormat:@"Missing required 'name' for the exception."];
      v20 = (void *)MEMORY[0x1E4F1C9E8];
      v21 = &v31;
      v22 = &v30;
    }
LABEL_21:
    v23 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, [v20 dictionaryWithObjects:v21 forKeys:v22 count:1]);

    [a3 failWithError:v23];
    return 0;
  }
  uint64_t v16 = [a3 decodeObject];
  uint64_t v17 = [a3 decodeObject];
  uint64_t v18 = [a3 decodeObject];

  return [a1 initWithName:v16 reason:v17 userInfo:v18];
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

@end