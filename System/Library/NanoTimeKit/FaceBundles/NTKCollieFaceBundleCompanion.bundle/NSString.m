@interface NSString
+ (BOOL)_isAnimojiCharacterStyleName:(id)a3;
+ (BOOL)_isMemojiCharacterStyleName:(id)a3;
+ (BOOL)_isSharedMemojiCharacterStyleName:(id)a3;
+ (BOOL)_isToyboxAnimojiCharacterStyleName:(id)a3;
+ (BOOL)_isToyboxMemojiCharacterStyleName:(id)a3;
+ (id)identifierFromMemojiCharacterStyleName:(id)a3;
+ (id)regularMemojiStyleNameForIdentifier:(id)a3;
+ (id)styleNameFromBasename:(id)a3;
- (BOOL)isAnyMemojiStyleName;
- (BOOL)isRegularAnimojiStyleName;
- (BOOL)isRegularMemojiStyleName;
- (BOOL)isResourcedStyleName;
- (BOOL)isSharedMemojiStyleName;
- (BOOL)isToyboxAnimojiStyleName;
- (BOOL)isToyboxAnyStyleName;
- (BOOL)isToyboxMemojiStyleName;
- (BOOL)isValidStyleName;
- (NSString)memojiIdentifier;
@end

@implementation NSString

+ (BOOL)_isSharedMemojiCharacterStyleName:(id)a3
{
  return [a3 isEqualToString:@"local-memoji"];
}

+ (BOOL)_isToyboxAnimojiCharacterStyleName:(id)a3
{
  return [a3 isEqualToString:@"toybox-animoji"];
}

+ (BOOL)_isToyboxMemojiCharacterStyleName:(id)a3
{
  return [a3 isEqualToString:@"toybox-memoji"];
}

+ (BOOL)_isMemojiCharacterStyleName:(id)a3
{
  return [a3 hasPrefix:@"memoji-"];
}

+ (id)identifierFromMemojiCharacterStyleName:(id)a3
{
  id v4 = a3;
  if ([a1 _isMemojiCharacterStyleName:v4])
  {
    v5 = [v4 substringFromIndex:objc_msgSend(@"memoji-", "length")];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_isAnimojiCharacterStyleName:(id)a3
{
  id v3 = a3;
  id v4 = +[NTKCollieStyleEditOptionAvatarRecordCache animojiIdentifiers];
  id v5 = [v4 indexOfObject:v3];

  return v5 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isToyboxAnimojiStyleName
{
  id v3 = objc_opt_class();

  return [v3 _isToyboxAnimojiCharacterStyleName:self];
}

- (BOOL)isToyboxMemojiStyleName
{
  id v3 = objc_opt_class();

  return [v3 _isToyboxMemojiCharacterStyleName:self];
}

- (BOOL)isToyboxAnyStyleName
{
  if ([(id)objc_opt_class() _isToyboxMemojiCharacterStyleName:self]) {
    return 1;
  }
  id v4 = objc_opt_class();

  return [v4 _isToyboxAnimojiCharacterStyleName:self];
}

- (BOOL)isSharedMemojiStyleName
{
  id v3 = objc_opt_class();

  return [v3 _isSharedMemojiCharacterStyleName:self];
}

- (BOOL)isRegularAnimojiStyleName
{
  id v3 = objc_opt_class();

  return [v3 _isAnimojiCharacterStyleName:self];
}

- (BOOL)isRegularMemojiStyleName
{
  id v3 = objc_opt_class();

  return [v3 _isMemojiCharacterStyleName:self];
}

- (BOOL)isAnyMemojiStyleName
{
  if (([(id)objc_opt_class() _isToyboxMemojiCharacterStyleName:self] & 1) != 0
    || ([(id)objc_opt_class() _isSharedMemojiCharacterStyleName:self] & 1) != 0)
  {
    return 1;
  }
  id v4 = objc_opt_class();

  return [v4 _isMemojiCharacterStyleName:self];
}

- (BOOL)isResourcedStyleName
{
  if ([(NSString *)self isToyboxAnimojiStyleName]) {
    return 1;
  }

  return [(NSString *)self isRegularAnimojiStyleName];
}

- (NSString)memojiIdentifier
{
  id v3 = objc_opt_class();

  return (NSString *)[v3 identifierFromMemojiCharacterStyleName:self];
}

- (BOOL)isValidStyleName
{
  if ([(NSString *)self isToyboxAnimojiStyleName]
    || [(NSString *)self isToyboxMemojiStyleName]
    || [(NSString *)self isSharedMemojiStyleName]
    || [(NSString *)self isRegularMemojiStyleName])
  {
    return 1;
  }

  return [(NSString *)self isRegularAnimojiStyleName];
}

+ (id)styleNameFromBasename:(id)a3
{
  id v3 = a3;
  id v4 = @"toybox-animoji";
  if (([v3 hasPrefix:@"toybox-animoji"] & 1) == 0)
  {
    id v4 = @"toybox-memoji";
    if (([v3 hasPrefix:@"toybox-memoji"] & 1) == 0)
    {
      id v4 = @"local-memoji";
      if (([v3 hasPrefix:@"local-memoji"] & 1) == 0)
      {
        id v5 = [@"memoji-" length];
        if ([v3 hasPrefix:@"memoji-"]
          && (unint64_t v6 = (unint64_t)v5 + 36, (unint64_t)[v3 length] >= v6))
        {
          id v4 = [v3 substringToIndex:v6];
        }
        else
        {
          +[NTKCollieStyleEditOptionAvatarRecordCache animojiIdentifiers];
          long long v12 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          id v7 = (id)objc_claimAutoreleasedReturnValue();
          id v4 = (__CFString *)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v4)
          {
            uint64_t v8 = *(void *)v13;
            while (2)
            {
              for (i = 0; i != v4; i = (__CFString *)((char *)i + 1))
              {
                if (*(void *)v13 != v8) {
                  objc_enumerationMutation(v7);
                }
                v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
                if (objc_msgSend(v3, "hasPrefix:", v10, (void)v12))
                {
                  id v4 = v10;
                  goto LABEL_16;
                }
              }
              id v4 = (__CFString *)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
              if (v4) {
                continue;
              }
              break;
            }
          }
LABEL_16:
        }
      }
    }
  }

  return v4;
}

+ (id)regularMemojiStyleNameForIdentifier:(id)a3
{
  return [@"memoji-" stringByAppendingString:a3];
}

@end