@interface CommunicationFilterItem
- (BOOL)_acceptItemType:(id)a3;
- (BOOL)_acceptVersion:(id)a3;
- (BOOL)isPhoneNumber;
- (BOOL)matchesFilterItem:(id)a3;
- (CommunicationFilterItem)initWithDictionaryRepresentation:(id)a3;
- (CommunicationFilterItem)initWithEmailAddress:(id)a3;
- (CommunicationFilterItem)initWithPhoneNumber:(__CFPhoneNumber *)a3;
- (NSString)emailAddress;
- (NSString)unformattedID;
- (__CFPhoneNumber)phoneNumber;
- (id)_dictionaryRepresentationWithRedaction;
- (id)description;
- (id)dictionaryRepresentation;
- (void)dealloc;
- (void)dictionaryRepresentation;
@end

@implementation CommunicationFilterItem

- (CommunicationFilterItem)initWithEmailAddress:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CommunicationFilterItem;
  v4 = [(CommunicationFilterItem *)&v6 init];
  if (v4) {
    v4->_emailAddress = (NSString *)[a3 copy];
  }
  return v4;
}

- (CommunicationFilterItem)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 objectForKey:@"__kCMFItemTypeKey"];
  uint64_t v6 = [a3 objectForKey:@"__kCMFItemVersionKey"];
  uint64_t v7 = [a3 objectForKey:@"__kCMFItemPhoneNumberUnformattedKey"];
  [a3 objectForKey:@"__kCMFItemPhoneNumberCountryCodeKey"];
  uint64_t v8 = [a3 objectForKey:@"__kCMFItemEmailUnformattedKey"];
  if (![(CommunicationFilterItem *)self _acceptItemType:v5]
    || ![(CommunicationFilterItem *)self _acceptVersion:v6])
  {
    v11 = CMFDefaultLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
LABEL_7:
    int v13 = 138412290;
    uint64_t v14 = [a3 allKeys];
    _os_log_impl(&dword_2129DC000, v11, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't create CMFItem from dictionary %@", (uint8_t *)&v13, 0xCu);
    return 0;
  }
  if (v7)
  {
    v9 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
    v10 = [(CommunicationFilterItem *)self initWithPhoneNumber:v9];
    if (v9) {
      CFRelease(v9);
    }
    return v10;
  }
  if (!v8)
  {
    v11 = CMFDefaultLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    goto LABEL_7;
  }
  return [(CommunicationFilterItem *)self initWithEmailAddress:v8];
}

- (id)dictionaryRepresentation
{
  if (!self->_emailAddress && !self->_phoneNumber) {
    return 0;
  }
  v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(CommunicationFilterItem *)self isPhoneNumber])
  {
    uint64_t v4 = IMUnformattedPhoneNumberForCFPhoneNumberRef();
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = IMCountryCodeCFPhoneNumberRef();
      uint64_t v7 = [NSNumber numberWithUnsignedInt:0];
      [v3 setObject:v5 forKey:@"__kCMFItemPhoneNumberUnformattedKey"];
      if (v6) {
        [v3 setObject:v6 forKey:@"__kCMFItemPhoneNumberCountryCodeKey"];
      }
      goto LABEL_9;
    }
    v9 = CMFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CommunicationFilterItem dictionaryRepresentation](v9);
    }
    return 0;
  }
  emailAddress = self->_emailAddress;
  if (!emailAddress)
  {
    v10 = CMFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CommunicationFilterItem dictionaryRepresentation](v10);
    }
    return 0;
  }
  [v3 setObject:emailAddress forKey:@"__kCMFItemEmailUnformattedKey"];
  uint64_t v7 = [NSNumber numberWithUnsignedInt:1];
LABEL_9:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1), @"__kCMFItemVersionKey");
  if (v7) {
    [v3 setObject:v7 forKey:@"__kCMFItemTypeKey"];
  }
  return v3;
}

- (BOOL)isPhoneNumber
{
  return self->_phoneNumber != 0;
}

- (BOOL)_acceptVersion:(id)a3
{
  return (int)[a3 intValue] < 2;
}

- (BOOL)_acceptItemType:(id)a3
{
  return a3 && ([a3 unsignedIntegerValue] & 0xFFFFFFFELL) == 0;
}

- (void)dealloc
{
  phoneNumber = self->_phoneNumber;
  if (phoneNumber)
  {
    CFRelease(phoneNumber);
    self->_phoneNumber = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)CommunicationFilterItem;
  [(CommunicationFilterItem *)&v4 dealloc];
}

- (CommunicationFilterItem)initWithPhoneNumber:(__CFPhoneNumber *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CommunicationFilterItem;
  objc_super v4 = [(CommunicationFilterItem *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_phoneNumber = a3;
    if (a3) {
      CFRetain(a3);
    }
  }
  return v5;
}

- (id)description
{
  id v2 = [(CommunicationFilterItem *)self _dictionaryRepresentationWithRedaction];
  return (id)[v2 description];
}

- (NSString)unformattedID
{
  emailAddress = self->_emailAddress;
  if (emailAddress)
  {
    v3 = emailAddress;
    return v3;
  }
  else
  {
    return (NSString *)IMUnformattedPhoneNumberForCFPhoneNumberRef();
  }
}

- (BOOL)matchesFilterItem:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x216689F30](self, a2);
  emailAddress = self->_emailAddress;
  if (emailAddress) {
    BOOL v7 = -[NSString caseInsensitiveCompare:](emailAddress, "caseInsensitiveCompare:", [a3 emailAddress]) == NSOrderedSame;
  }
  else {
    BOOL v7 = self->_phoneNumber
  }
      && (uint64_t v8 = (const void *)[a3 phoneNumber]) != 0
      && CFEqual(v8, self->_phoneNumber) != 0;
  return v7;
}

- (id)_dictionaryRepresentationWithRedaction
{
  id v3 = [(CommunicationFilterItem *)self dictionaryRepresentation];
  if (!v3) {
    return 0;
  }
  objc_super v4 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v3];
  if ([(CommunicationFilterItem *)self isPhoneNumber]) {
    uint64_t v5 = @"__kCMFItemPhoneNumberUnformattedKey";
  }
  else {
    uint64_t v5 = @"__kCMFItemEmailUnformattedKey";
  }
  [v4 setObject:@"redacted" forKey:v5];
  return v4;
}

- (__CFPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)dictionaryRepresentation
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2129DC000, log, OS_LOG_TYPE_ERROR, "Dictionary representation for item failed: Couldn't find email address", v1, 2u);
}

@end