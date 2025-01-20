@interface CCTypeIdentifierRegistryBase
+ (BOOL)isValidFieldType:(unsigned __int16)a3;
+ (BOOL)isValidItemType:(unsigned __int16)a3;
+ (Class)itemMessageSubclassForFieldType:(unsigned __int16)a3;
+ (Class)itemMessageSubclassForIdentifier:(unsigned __int16)a3;
+ (Class)itemMessageSubclassForItemType:(unsigned __int16)a3;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (id)setIdentifierForItemType:(unsigned __int16)a3;
+ (unsigned)itemTypeForFieldType:(unsigned __int16)a3 error:(id *)a4;
+ (unsigned)itemTypeForSetIdentifier:(id)a3;
@end

@implementation CCTypeIdentifierRegistryBase

+ (BOOL)isValidItemType:(unsigned __int16)a3
{
  return [a1 itemMessageSubclassForItemType:a3] != 0;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = objc_msgSend(a1, "itemMessageSubclassForIdentifier:");
  if (v4)
  {
    v4 = [v4 descriptionForTypeIdentifier:v3];
  }

  return v4;
}

+ (BOOL)isValidFieldType:(unsigned __int16)a3
{
  return [a1 itemMessageSubclassForFieldType:a3] != 0;
}

+ (unsigned)itemTypeForFieldType:(unsigned __int16)a3 error:(id *)a4
{
  unsigned int v5 = a3;
  v6 = objc_msgSend(a1, "itemMessageSubclassForFieldType:");
  if (v6)
  {
    return [v6 itemType];
  }
  else
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"Provided type identifer %hu is not a valid field type", v5);
    v9 = CCUnrecognizedIdentifierErrorForDescription(v8);
    CCSetError(a4, v9);

    return CCTypeIdentifierUnknown;
  }
}

+ (id)setIdentifierForItemType:(unsigned __int16)a3
{
  return 0;
}

+ (unsigned)itemTypeForSetIdentifier:(id)a3
{
  return CCTypeIdentifierUnknown;
}

+ (Class)itemMessageSubclassForIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (Class)itemMessageSubclassForItemType:(unsigned __int16)a3
{
  return 0;
}

+ (Class)itemMessageSubclassForFieldType:(unsigned __int16)a3
{
  return 0;
}

@end