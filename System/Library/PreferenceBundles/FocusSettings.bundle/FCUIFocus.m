@interface FCUIFocus
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (DNDMode)_dndMode;
- (FCUIFocus)initWithMode:(id)a3;
- (NSArray)activityLifetimeDescriptions;
- (NSDate)activityCreationDate;
- (NSString)activityColorName;
- (NSString)activityDetailText;
- (NSString)activityDisplayName;
- (NSString)activityIdentifier;
- (NSString)activityLifetimesAlternativeDescription;
- (NSString)activitySymbolImageName;
- (NSString)description;
- (NSURL)activitySettingsURL;
- (NSURL)activitySetupURL;
- (NSUUID)activityUniqueIdentifier;
- (int64_t)activitySemanticType;
- (unint64_t)hash;
@end

@implementation FCUIFocus

- (FCUIFocus)initWithMode:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUIFocus;
  v5 = [(FCUIFocus *)&v9 init];
  if (v5)
  {
    v6 = (DNDMode *)[v4 copy];
    dndMode = v5->_dndMode;
    v5->_dndMode = v6;
  }
  return v5;
}

- (NSString)activityIdentifier
{
  return (NSString *)[(DNDMode *)self->_dndMode modeIdentifier];
}

- (NSUUID)activityUniqueIdentifier
{
  return (NSUUID *)[(DNDMode *)self->_dndMode identifier];
}

- (int64_t)activitySemanticType
{
  return (int64_t)[(DNDMode *)self->_dndMode semanticType];
}

- (NSString)activityDisplayName
{
  return (NSString *)[(DNDMode *)self->_dndMode name];
}

- (NSString)activitySymbolImageName
{
  return (NSString *)[(DNDMode *)self->_dndMode symbolImageName];
}

- (NSString)activityColorName
{
  v2 = [(DNDMode *)self->_dndMode tintColorName];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[DNDMode defaultTintColorName];
  }
  v5 = v4;

  return (NSString *)v5;
}

- (NSDate)activityCreationDate
{
  return 0;
}

- (NSString)activityDetailText
{
  return 0;
}

- (NSURL)activitySettingsURL
{
  return (NSURL *)[(DNDMode *)self->_dndMode settingsURL];
}

- (NSURL)activitySetupURL
{
  return (NSURL *)[(DNDMode *)self->_dndMode setupURL];
}

- (BOOL)isPlaceholder
{
  return 1;
}

- (NSArray)activityLifetimeDescriptions
{
  return 0;
}

- (NSString)activityLifetimesAlternativeDescription
{
  return 0;
}

- (unint64_t)hash
{
  v3 = [(FCUIFocus *)self activityUniqueIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(FCUIFocus *)self activityIdentifier];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  int64_t v7 = [(FCUIFocus *)self activitySemanticType];
  v8 = [(FCUIFocus *)self activityDisplayName];
  unint64_t v9 = v6 ^ v7 ^ (unint64_t)[v8 hash];
  v10 = [(FCUIFocus *)self activitySymbolImageName];
  unint64_t v11 = (unint64_t)[v10 hash];
  v12 = [(FCUIFocus *)self activityColorName];
  unint64_t v13 = v11 ^ (unint64_t)[v12 hash];
  unint64_t v14 = v9 ^ v13 ^ [(FCUIFocus *)self isPlaceholder];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FCUIFocus *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(FCUIFocus *)self activityUniqueIdentifier];
      int64_t v7 = [(FCUIFocus *)v5 activityUniqueIdentifier];
      if (BSEqualObjects())
      {
        v8 = [(FCUIFocus *)self activityIdentifier];
        unint64_t v9 = [(FCUIFocus *)v5 activityIdentifier];
        if (BSEqualObjects()
          && (id v10 = [(FCUIFocus *)self activitySemanticType],
              v10 == (id)[(FCUIFocus *)v5 activitySemanticType]))
        {
          unint64_t v11 = [(FCUIFocus *)self activityDisplayName];
          v12 = [(FCUIFocus *)v5 activityDisplayName];
          if (BSEqualObjects())
          {
            uint64_t v13 = [(FCUIFocus *)self activitySymbolImageName];
            [(FCUIFocus *)v5 activitySymbolImageName];
            unint64_t v14 = v18 = (void *)v13;
            if (BSEqualObjects())
            {
              unsigned int v15 = [(FCUIFocus *)self isPlaceholder];
              unsigned int v16 = v15 ^ [(FCUIFocus *)v5 isPlaceholder] ^ 1;
            }
            else
            {
              LOBYTE(v16) = 0;
            }
          }
          else
          {
            LOBYTE(v16) = 0;
          }
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(FCUIFocus *)self activityIdentifier];
  v5 = [(FCUIFocus *)self activityUniqueIdentifier];
  unint64_t v6 = +[NSNumber numberWithInteger:[(FCUIFocus *)self activitySemanticType]];
  int64_t v7 = [(FCUIFocus *)self activityDisplayName];
  v8 = [(FCUIFocus *)self activitySymbolImageName];
  unint64_t v9 = [(FCUIFocus *)self activityColorName];
  [(FCUIFocus *)self isPlaceholder];
  id v10 = NSStringFromBOOL();
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; activityIdentifier: %@; activityUniqueIdentifier: %@; activitySemanticType: %@; activityDisplayName: %@; activitySymbolImageName: %@; activityColorName: %@; isPlaceholder: %@ >",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
  unint64_t v11 = v10);

  return (NSString *)v11;
}

- (DNDMode)_dndMode
{
  return self->_dndMode;
}

- (void).cxx_destruct
{
}

@end