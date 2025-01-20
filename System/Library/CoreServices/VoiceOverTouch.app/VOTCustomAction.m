@interface VOTCustomAction
- (BOOL)ignoreWhenVoiceOverTouches;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForContext:(id)a3;
- (BOOL)performWithContext:(id)a3;
- (BOOL)requiresIconClassificationForLabel;
- (CGPoint)activationPoint;
- (CGRect)iconClassificationFrame;
- (NSString)categoryName;
- (NSString)identifier;
- (NSString)language;
- (NSString)name;
- (VOTCustomAction)initWithWireDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sortPriority;
- (void)setCategoryName:(id)a3;
- (void)setSortPriority:(unint64_t)a3;
@end

@implementation VOTCustomAction

- (VOTCustomAction)initWithWireDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)VOTCustomAction;
  v5 = [(VOTCustomAction *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"CustomActionName"];
    v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    v9 = [v4 objectForKeyedSubscript:@"CustomActionLanguage"];
    v10 = (NSString *)[v9 copy];
    language = v5->_language;
    v5->_language = v10;

    v12 = [v4 objectForKeyedSubscript:@"CustomActionIdentifier"];
    v13 = (NSString *)[v12 copy];
    identifier = v5->_identifier;
    v5->_identifier = v13;

    v15 = [v4 objectForKeyedSubscript:@"CustomActionIgnoreWhenVoiceOverTouches"];
    v5->_ignoreWhenVoiceOverTouches = [v15 BOOLValue];

    v16 = [v4 objectForKeyedSubscript:@"CustomActionActivationPoint"];
    if (v16)
    {
      CFTypeID TypeID = AXValueGetTypeID();
      if (TypeID == CFGetTypeID(v16))
      {
        AXValueGetValue(v16, kAXValueTypeCGPoint, &v5->_activationPoint);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = __UIAccessibilitySafeClass();
          [v18 pointValue];
          v5->_activationPoint.x = v19;
          v5->_activationPoint.y = v20;
        }
      }
    }
    v21 = [v4 objectForKeyedSubscript:@"CustomActionIconClassificationScreenFrame"];
    v22 = __UIAccessibilitySafeClass();

    [v22 rectValue];
    v5->_iconClassificationFrame.origin.x = v23;
    v5->_iconClassificationFrame.origin.y = v24;
    v5->_iconClassificationFrame.size.width = v25;
    v5->_iconClassificationFrame.size.height = v26;

    v27 = [v4 objectForKeyedSubscript:@"CustomActionRequiresIconClassification"];
    v28 = __UIAccessibilitySafeClass();

    v5->_requiresIconClassificationForLabel = [v28 BOOLValue];
    v29 = [v4 objectForKeyedSubscript:@"CustomActionCategoryName"];
    [(VOTCustomAction *)v5 setCategoryName:v29];

    v30 = [v4 objectForKeyedSubscript:@"CustomActionSortPriority"];
    v31 = __UIAccessibilitySafeClass();

    -[VOTCustomAction setSortPriority:](v5, "setSortPriority:", [v31 unsignedIntegerValue]);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && [(NSString *)self->_name isEqual:*((void *)v4 + 1)]
    && [(NSString *)self->_identifier isEqual:*((void *)v4 + 2)]
    && self->_ignoreWhenVoiceOverTouches == v4[24];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(NSString *)self->_identifier hash] ^ v3;
  BOOL ignoreWhenVoiceOverTouches = self->_ignoreWhenVoiceOverTouches;
  v6 = [(VOTCustomAction *)self categoryName];
  unint64_t v7 = v4 ^ ignoreWhenVoiceOverTouches ^ (unint64_t)[v6 hash];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)ignoreWhenVoiceOverTouches
{
  return self->_ignoreWhenVoiceOverTouches;
}

- (BOOL)performWithContext:(id)a3
{
  unint64_t v4 = [a3 actionElement];
  LOBYTE(self) = [v4 performCustomActionWithIdentifier:self->_identifier];

  return (char)self;
}

- (BOOL)isValidForContext:(id)a3
{
  return 1;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)VOTCustomAction;
  NSUInteger v3 = [(VOTCustomAction *)&v10 description];
  unint64_t v4 = [(VOTCustomAction *)self name];
  uint64_t v5 = [(VOTCustomAction *)self categoryName];
  v6 = (void *)v5;
  CFStringRef v7 = &stru_1001B7888;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  v8 = +[NSString stringWithFormat:@"%@, %@:%@", v3, v4, v7];

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)categoryName
{
  return self->_categoryName;
}

- (void)setCategoryName:(id)a3
{
}

- (CGPoint)activationPoint
{
  double x = self->_activationPoint.x;
  double y = self->_activationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)iconClassificationFrame
{
  double x = self->_iconClassificationFrame.origin.x;
  double y = self->_iconClassificationFrame.origin.y;
  double width = self->_iconClassificationFrame.size.width;
  double height = self->_iconClassificationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)requiresIconClassificationForLabel
{
  return self->_requiresIconClassificationForLabel;
}

- (NSString)language
{
  return self->_language;
}

- (unint64_t)sortPriority
{
  return self->_sortPriority;
}

- (void)setSortPriority:(unint64_t)a3
{
  self->_sortPrioritdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end