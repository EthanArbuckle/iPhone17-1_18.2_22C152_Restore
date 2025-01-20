@interface CNComposeRecipient(Additions)
- (BOOL)isEmail;
- (BOOL)isNamedGroup;
- (BOOL)isPhone;
- (BOOL)isUnnamedGroup;
- (id)IDSCanonicalAddress;
- (id)IDSCanonicalAddressForAddress:()Additions;
- (id)canonicalAddress;
- (id)rawAddress;
- (uint64_t)copyPhoneNumber;
- (uint64_t)isNotAChildOfUnifiedRecipient;
- (void)setCanonicalAddress:()Additions;
@end

@implementation CNComposeRecipient(Additions)

- (BOOL)isEmail
{
  return [a1 kind] == 0;
}

- (BOOL)isPhone
{
  return [a1 kind] == 1;
}

- (BOOL)isNamedGroup
{
  if (![a1 isGroup]) {
    return 0;
  }
  v2 = [a1 displayString];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 length] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)isNotAChildOfUnifiedRecipient
{
  v2 = [a1 children];
  if ([v2 count])
  {
    char v3 = [a1 isGroup];

    if ((v3 & 1) == 0) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)isUnnamedGroup
{
  if (![a1 isGroup]) {
    return 0;
  }
  v2 = [a1 displayString];
  if (v2)
  {
    char v3 = [a1 displayString];
    BOOL v4 = [v3 length] == 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (uint64_t)copyPhoneNumber
{
  if (![a1 isPhone]) {
    return 0;
  }
  uint64_t v2 = [a1 address];
  if (!v2) {
    return 0;
  }
  char v3 = (void *)v2;
  BOOL v4 = (const void *)MEMORY[0x192FB9A40](1);
  uint64_t v5 = CFPhoneNumberCreate();
  if (v4) {
    CFRelease(v4);
  }

  return v5;
}

- (id)rawAddress
{
  uint64_t v2 = [a1 uncommentedAddress];
  if (v2) {
    [a1 uncommentedAddress];
  }
  else {
  char v3 = [a1 normalizedAddress];
  }

  return v3;
}

- (void)setCanonicalAddress:()Additions
{
}

- (id)canonicalAddress
{
  return objc_getAssociatedObject(a1, "CKMessageComposeCanonicalFormKey");
}

- (id)IDSCanonicalAddress
{
  uint64_t v2 = [a1 rawAddress];
  char v3 = IMStripFormattingFromAddress();

  BOOL v4 = [a1 IDSCanonicalAddressForAddress:v3];

  return v4;
}

- (id)IDSCanonicalAddressForAddress:()Additions
{
  id v4 = a3;
  if ([a1 kind] == 1 || objc_msgSend(a1, "isPhone"))
  {
    uint64_t v5 = IDSCopyIDForPhoneNumber();
LABEL_8:
    v7 = (void *)v5;

    goto LABEL_9;
  }
  if (![a1 kind] || objc_msgSend(a1, "kind") == 2 || (int v6 = objc_msgSend(a1, "isEmail"), v7 = v4, v6))
  {
    uint64_t v5 = MEMORY[0x192FB9BB0](v4);
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

@end