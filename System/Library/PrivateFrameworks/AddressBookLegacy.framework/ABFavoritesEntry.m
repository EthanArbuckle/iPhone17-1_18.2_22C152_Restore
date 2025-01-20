@interface ABFavoritesEntry
+ (void)_runLookup;
- (ABFavoritesEntry)initWithDictionaryRepresentation:(id)a3;
- (ABFavoritesEntry)initWithDictionaryRepresentation:(id)a3 addressBook:(void *)a4;
- (ABFavoritesEntry)initWithPerson:(void *)a3 property:(int)a4 identifier:(int)a5;
- (ABFavoritesEntry)initWithPerson:(void *)a3 property:(int)a4 identifier:(int)a5 type:(int)a6;
- (BOOL)isEqual:(id)a3;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)label;
- (id)nonLocalizedLabel;
- (id)value;
- (int)_abUid;
- (int)identifier;
- (int)property;
- (int)type;
- (void)ABPerson;
- (void)_lookupChanged:(id)a3;
- (void)_lookupNotFound;
- (void)_postEntryChanged;
- (void)_queueLookup;
- (void)_unqueueLookup;
- (void)dealloc;
- (void)dictionaryRepresentation:(id *)a3 isDirty:(BOOL *)a4;
@end

@implementation ABFavoritesEntry

- (ABFavoritesEntry)initWithPerson:(void *)a3 property:(int)a4 identifier:(int)a5
{
  return [(ABFavoritesEntry *)self initWithPerson:a3 property:*(void *)&a4 identifier:*(void *)&a5 type:0];
}

- (ABFavoritesEntry)initWithPerson:(void *)a3 property:(int)a4 identifier:(int)a5 type:(int)a6
{
  v19.receiver = self;
  v19.super_class = (Class)ABFavoritesEntry;
  id v10 = [(ABFavoritesEntry *)&v19 init];
  *((_DWORD *)v10 + 6) = a4;
  ABRecordID RecordID = ABRecordGetRecordID(a3);
  *((_DWORD *)v10 + 2) = RecordID;
  if (RecordID == -1) {
    goto LABEL_12;
  }
  *((_DWORD *)v10 + 3) = a5;
  if (a3 && (v12 = (const void *)ABCGetAddressBookForRecord()) != 0) {
    CFTypeRef v13 = CFRetain(v12);
  }
  else {
    CFTypeRef v13 = ABAddressBookCreateWithOptions(0, 0);
  }
  *((void *)v10 + 8) = v13;
  *((void *)v10 + 6) = ABCopyPreferredNameForPerson(a3);
  CFTypeRef v14 = ABRecordCopyValue(a3, a4);
  if (!v14) {
    goto LABEL_12;
  }
  v15 = v14;
  if (ABMultiValueGetCount(v14) < 1)
  {
    CFRelease(v15);
LABEL_12:

    return 0;
  }
  CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v15, a5);
  *((void *)v10 + 2) = ABMultiValueCopyValueAtIndex(v15, IndexForIdentifier);
  *((void *)v10 + 5) = ABMultiValueCopyLabelAtIndex(v15, IndexForIdentifier);
  uint64_t v17 = *((void *)v10 + 8);
  if (v17) {
    *((void *)v10 + 7) = ABAddressBookCopyUniqueIdentifier(v17);
  }
  *((_DWORD *)v10 + 7) = a6;
  *((unsigned char *)v10 + 32) |= 1u;
  CFRelease(v15);
  return (ABFavoritesEntry *)v10;
}

- (ABFavoritesEntry)initWithDictionaryRepresentation:(id)a3
{
  return [(ABFavoritesEntry *)self initWithDictionaryRepresentation:a3 addressBook:0];
}

- (ABFavoritesEntry)initWithDictionaryRepresentation:(id)a3 addressBook:(void *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)ABFavoritesEntry;
  v6 = [(ABFavoritesEntry *)&v13 init];
  if (v6)
  {
    v6->_property = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"Property"), "intValue");
    v6->_value = (NSString *)(id)[a3 objectForKey:@"Value"];
    v6->_label = (NSString *)(id)[a3 objectForKey:@"Label"];
    v6->_name = (NSString *)(id)[a3 objectForKey:@"Name"];
    v6->_abUid = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"ABUid"), "intValue");
    v6->_abIdentifier = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"ABIdentifier"), "intValue");
    v6->_abDatabaseUUID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"ABDatabaseUUID"), "copy");
    v6->_type = 0;
    v7 = (void *)[a3 objectForKey:@"EntryType"];
    if (v7 && (int v8 = [v7 intValue], v6->_type = v8, v8 == -1))
    {

      return 0;
    }
    else
    {
      if (a4)
      {
        CFRetain(a4);
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABFavoritesEntry initWithDictionaryRepresentation:addressBook:]", 136, 0, @"addressBook is NULL, some API is non-functional when this is the case (example -ABPerson)", v9, v10, v11, (uint64_t)v13.receiver);
      }
      v6->_addressBook = a4;
    }
  }
  return v6;
}

- (void)dealloc
{
  [(ABFavoritesEntry *)self _unqueueLookup];

  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  v4.receiver = self;
  v4.super_class = (Class)ABFavoritesEntry;
  [(ABFavoritesEntry *)&v4 dealloc];
}

- (id)dictionaryRepresentation
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v4 = [NSNumber numberWithInt:self->_abUid];
  uint64_t v5 = [NSNumber numberWithInt:self->_abIdentifier];
  uint64_t v6 = [NSNumber numberWithInt:self->_property];
  v7 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"ABUid", v5, @"ABIdentifier", v6, @"Property", objc_msgSend(NSNumber, "numberWithInt:", self->_type), @"EntryType", 0);
  int v8 = v7;
  value = self->_value;
  if (value) {
    [v7 setObject:value forKey:@"Value"];
  }
  label = self->_label;
  if (label) {
    [v8 setObject:label forKey:@"Label"];
  }
  name = self->_name;
  if (name) {
    [v8 setObject:name forKey:@"Name"];
  }
  abDatabaseUUID = self->_abDatabaseUUID;
  if (abDatabaseUUID) {
    [v8 setObject:abDatabaseUUID forKey:@"ABDatabaseUUID"];
  }
  return v8;
}

- (void)dictionaryRepresentation:(id *)a3 isDirty:(BOOL *)a4
{
  *a3 = [(ABFavoritesEntry *)self dictionaryRepresentation];
  *a4 = *((unsigned char *)self + 32) & 1;
  *((unsigned char *)self + 32) &= ~1u;
}

- (id)displayName
{
  id result = self->_name;
  if (!result || self->_abUid < 0) {
    return self->_value;
  }
  return result;
}

- (int)property
{
  return self->_property;
}

- (id)label
{
  CFStringRef label = (const __CFString *)self->_label;
  if (!label || self->_abUid < 0) {
    return 0;
  }
  uint64_t v4 = (__CFString *)ABAddressBookCopyLocalizedLabel(label);
  uint64_t v5 = v4;
  return v4;
}

- (id)nonLocalizedLabel
{
  return self->_label;
}

- (id)value
{
  return self->_value;
}

- (int)identifier
{
  return self->_abIdentifier;
}

- (int)type
{
  return self->_type;
}

- (void)ABPerson
{
  id result = self->_addressBook;
  if (result) {
    return (void *)ABAddressBookGetPersonWithRecordID(result, self->_abUid);
  }
  return result;
}

- (int)_abUid
{
  return self->_abUid;
}

- (BOOL)isEqual:(id)a3
{
  if (self->_property != *((_DWORD *)a3 + 6)) {
    goto LABEL_8;
  }
  BOOL v5 = [(NSString *)self->_value isEqualToString:*((void *)a3 + 2)];
  if (v5)
  {
    if (self->_type == *((_DWORD *)a3 + 7))
    {
      CFStringRef label = self->_label;
      uint64_t v7 = *((void *)a3 + 5);
      if (label && v7)
      {
        if (!-[NSString isEqualToString:](label, "isEqualToString:") || self->_abUid != *((_DWORD *)a3 + 2)) {
          goto LABEL_8;
        }
        goto LABEL_11;
      }
      if (!((unint64_t)label | v7))
      {
LABEL_11:
        LOBYTE(v5) = 1;
        return v5;
      }
    }
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (void)_runLookup
{
  id v56 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  ABAddressBookRef v2 = ABAddressBookCreateWithOptions(0, 0);
  v3 = v2;
  if (v2) {
    id v4 = (id)ABAddressBookCopyUniqueIdentifier((uint64_t)v2);
  }
  else {
    id v4 = 0;
  }
  [(id)__LookupQueueLock lock];
  if (CFArrayGetCount((CFArrayRef)__LookupQueue) >= 1)
  {
    v55 = sel__lookupChanged_;
    v60 = (void *)*MEMORY[0x1E4F1D260];
    v64 = v3;
    id v57 = v4;
    while (1)
    {
      BOOL v5 = (id)CFArrayGetValueAtIndex((CFArrayRef)__LookupQueue, 0);
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)__LookupQueue, 0);
      [(id)__LookupQueueLock unlock];
      if (!v5) {
        goto LABEL_128;
      }
      if (v4)
      {
        int v6 = [*((id *)v5 + 7) isEqualToString:v4] ^ 1;
        if (!v3) {
          goto LABEL_22;
        }
      }
      else
      {
        int v6 = 0;
        if (!v3) {
          goto LABEL_22;
        }
      }
      ABRecordID v7 = *((_DWORD *)v5 + 2);
      if (v7 < 0) {
        char v8 = 1;
      }
      else {
        char v8 = v6;
      }
      if ((v8 & 1) != 0 || (PersonWithABRecordID RecordID = ABAddressBookGetPersonWithRecordID(v3, v7)) == 0)
      {
LABEL_22:
        CFTypeRef v12 = 0;
        goto LABEL_23;
      }
      uint64_t v10 = PersonWithRecordID;
      CFTypeRef v11 = ABRecordCopyValue(PersonWithRecordID, *((_DWORD *)v5 + 6));
      CFTypeRef v12 = v11;
      if (!v11) {
        goto LABEL_23;
      }
      CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(v11, *((_DWORD *)v5 + 3));
      if ((IndexForIdentifier & 0x8000000000000000) == 0) {
        break;
      }
LABEL_94:
      if (*((void *)v5 + 5))
      {
        CFIndex Count = ABMultiValueGetCount(v12);
        if (Count >= 1)
        {
          CFIndex v42 = Count;
          unint64_t v14 = 0;
          while (1)
          {
            v43 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, v14);
            int v44 = [*((id *)v5 + 5) isEqualToString:v43];

            if (v44) {
              break;
            }
            if (v42 == ++v14)
            {
              v3 = v64;
              goto LABEL_23;
            }
          }
          int v58 = v6;
          ABMultiValueIdentifier IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v12, v14);
          v3 = v64;
          goto LABEL_102;
        }
      }
LABEL_23:
      if (!*((void *)v5 + 2))
      {
        if (v12) {
          CFRelease(v12);
        }
        goto LABEL_89;
      }
      int v58 = v6;
      if (v12) {
        CFRelease(v12);
      }
      if (v3 && *((void *)v5 + 2))
      {
        CFArrayRef v68 = 0;
        if ([v5 property] == kABPersonPhoneProperty)
        {
          CFArrayRef v17 = ABCCopyArrayOfUIDsMatchingPhoneNumberWithCountryAndHint((uint64_t)v3, *((void *)v5 + 2), 0, &v68);
        }
        else
        {
          if ([v5 property] != kABPersonEmailProperty) {
            goto LABEL_88;
          }
          CFTypeRef v67 = 0;
          CFTypeRef cf = 0;
          CFArrayRef v17 = (const __CFArray *)ABCCopyArrayOfUIDsMatchingEmailAddressIncludingLabels((uint64_t)v3, *((const __CFString **)v5 + 2), &cf, &v67);
          if (cf) {
            CFRelease(cf);
          }
          if (v67) {
            CFRelease(v67);
          }
        }
        if (!v17)
        {
          CFArrayRef v19 = v68;
          if (v68) {
LABEL_87:
          }
            CFRelease(v19);
LABEL_88:
          id v4 = v57;
          goto LABEL_89;
        }
        CFIndex v18 = CFArrayGetCount(v17);
        if (v68) {
          CFIndex v65 = CFArrayGetCount(v68);
        }
        else {
          CFIndex v65 = 0;
        }
        if (v18 < 1)
        {
          ABRecordRef v21 = 0;
          uint64_t v10 = 0;
          v62 = 0;
          int v23 = -1;
          int v61 = -1;
          int v59 = -1;
LABEL_76:
          CFRelease(v17);
          if (v68) {
            CFRelease(v68);
          }
          if (!v10)
          {
            uint64_t v10 = v62;
            int v61 = v59;
            if (!v62)
            {
              uint64_t v10 = v21;
              int v61 = v23;
              if (!v21) {
                goto LABEL_88;
              }
            }
          }
          CFArrayRef v35 = (const __CFArray *)ABRecordCopyValue(v10, objc_msgSend(v5, "property", v55));
          if (!v35) {
            goto LABEL_88;
          }
          CFArrayRef v19 = v35;
          int v36 = [v5 property];
          v37 = (const void *)*((void *)v5 + 2);
          if (v36 == kABPersonPhoneProperty) {
            CFIndex FirstIndexOfValueWithCallback = ABCMultiValueGetFirstIndexOfValueWithCallback((uint64_t)v19, (uint64_t)v37, (unsigned int (*)(uint64_t, const void *))_ABFavoritesPhoneNumbersEqualCallback);
          }
          else {
            CFIndex FirstIndexOfValueWithCallback = ABCMultiValueGetFirstIndexOfValue((uint64_t)v19, v37);
          }
          unint64_t v14 = FirstIndexOfValueWithCallback;
          if (FirstIndexOfValueWithCallback < 0) {
            goto LABEL_87;
          }
          ABMultiValueIdentifier IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v19, FirstIndexOfValueWithCallback);
          CFTypeRef v12 = CFRetain(v19);
          CFRelease(v19);
          LODWORD(v40) = 0;
          id v4 = v57;
          goto LABEL_103;
        }
        v62 = 0;
        CFArrayRef v63 = v17;
        v20 = 0;
        ABRecordRef v21 = 0;
        CFIndex v22 = 0;
        int v59 = -1;
        int v61 = -1;
        int v23 = -1;
        while (2)
        {
          ABRecordID ValueAtIndex = CFArrayGetValueAtIndex(v17, v22);
          ABRecordRef v25 = ABAddressBookGetPersonWithRecordID(v3, ValueAtIndex);
          if (v25)
          {
            v26 = v25;
            if (!v21)
            {
              int v23 = ValueAtIndex;
              ABRecordRef v21 = v25;
            }
            if (v65 <= v22) {
              v27 = 0;
            }
            else {
              v27 = (void *)CFArrayGetValueAtIndex(v68, v22);
            }
            v28 = (__CFString *)ABCopyPreferredNameForPerson(v26);
            if (v28)
            {
              v29 = v28;
              if (*((void *)v5 + 6))
              {
                int v30 = -[__CFString isEqualToString:](v28, "isEqualToString:");
                int v31 = v61;
                if (v30) {
                  int v31 = ValueAtIndex;
                }
                int v61 = v31;
                if (v30) {
                  v20 = v26;
                }
              }
              CFRelease(v29);
            }
            CFArrayRef v17 = v63;
            if (v20 || !v27 || v27 == v60)
            {
              if (!v27 || !v20) {
                goto LABEL_72;
              }
              uint64_t v10 = v62;
              v3 = v64;
              if (v62 == v20) {
                goto LABEL_76;
              }
            }
            else
            {
              if (*((void *)v5 + 5))
              {
                int v32 = objc_msgSend(v27, "isEqualToString:");
                v20 = 0;
                int v33 = v59;
                if (v32) {
                  int v33 = ValueAtIndex;
                }
                int v59 = v33;
                v34 = v62;
                if (v32) {
                  v34 = v26;
                }
                v62 = v34;
              }
              else
              {
                v20 = 0;
              }
LABEL_72:
              v3 = v64;
            }
          }
          ++v22;
          uint64_t v10 = v20;
          if (v18 == v22) {
            goto LABEL_76;
          }
          continue;
        }
      }
LABEL_89:
      objc_msgSend(v5, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__lookupNotFound, 0, 0, v55);
LABEL_90:

      [(id)__LookupQueueLock lock];
      if (CFArrayGetCount((CFArrayRef)__LookupQueue) <= 0) {
        goto LABEL_127;
      }
    }
    unint64_t v14 = IndexForIdentifier;
    v15 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, IndexForIdentifier);
    v16 = (void *)*((void *)v5 + 5);
    if (v16)
    {
      if (![v16 isEqualToString:v15])
      {
LABEL_93:

        goto LABEL_94;
      }
      if (*((void *)v5 + 5)) {
        goto LABEL_100;
      }
    }
    if (!v15)
    {
LABEL_100:
      int v58 = v6;

      ABMultiValueIdentifier IdentifierAtIndex = -1;
LABEL_102:
      unint64_t v40 = v14 >> 63;
      int v61 = -1;
LABEL_103:
      v45 = (__CFString *)ABCopyPreferredNameForPerson(v10);
      if ([(__CFString *)v45 isEqualToString:*((void *)v5 + 6)])
      {

        v45 = 0;
      }
      v46 = (void *)ABMultiValueCopyValueAtIndex(v12, v14);
      if ([v46 isEqualToString:*((void *)v5 + 2)])
      {

        v46 = 0;
      }
      v47 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, v14);
      v48 = v47;
      if (!*((void *)v5 + 5) || -[__CFString isEqualToString:](v47, "isEqualToString:"))
      {

        v48 = 0;
      }
      if (v12)
      {
        CFRelease(v12);
        if ((v40 & 1) == 0) {
          goto LABEL_114;
        }
      }
      else if (!v40)
      {
LABEL_114:
        BOOL v52 = (IdentifierAtIndex & v61) < 0 != v49 && v46 == 0 && v45 == 0 && v48 == 0;
        int v53 = v58;
        if (!v52) {
          int v53 = 1;
        }
        if (v53 == 1)
        {
          v54 = objc_alloc_init(ABFavoritesLookupChangeRecord);
          v54->identifier = IdentifierAtIndex;
          v54->uid = v61;
          v54->value = (NSString *)v46;
          v54->name = &v45->isa;
          v54->CFStringRef label = &v48->isa;
          v54->abDatabaseUUID = (NSString *)v4;
          [v5 performSelectorOnMainThread:v55 withObject:v54 waitUntilDone:0];
        }
        goto LABEL_90;
      }
      goto LABEL_89;
    }
    goto LABEL_93;
  }
LABEL_127:
  __LookupQueueRunning = 0;
  objc_msgSend((id)__LookupQueueLock, "unlock", v55);
LABEL_128:
  if (v3) {
    CFRelease(v3);
  }
}

- (void)_queueLookup
{
  id v3 = (id)__LookupQueueLock;
  if (!__LookupQueueLock)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    __LookupQueueLock = (uint64_t)v3;
  }
  [v3 lock];
  Mutable = (__CFArray *)__LookupQueue;
  if (!__LookupQueue)
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    __LookupQueue = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, self);
  if ((__LookupQueueRunning & 1) == 0)
  {
    __LookupQueueRunning = 1;
    [MEMORY[0x1E4F29060] detachNewThreadSelector:sel__runLookup toTarget:objc_opt_class() withObject:0];
  }
  BOOL v5 = (void *)__LookupQueueLock;
  [v5 unlock];
}

- (void)_unqueueLookup
{
  if (__LookupQueueRunning == 1)
  {
    [(id)__LookupQueueLock lock];
    [(id)__LookupQueue removeObject:self];
    id v3 = (void *)__LookupQueueLock;
    [v3 unlock];
  }
}

- (void)_postEntryChanged
{
  id v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CNFavoritesEntryChangedNotification" object:self userInfo:0];
}

- (void)_lookupNotFound
{
  if (!self->_label && !self->_name && self->_abUid < 0 && self->_abIdentifier < 0) {
    return;
  }
  int abUid = self->_abUid;
  if ((abUid & 0x80000000) == 0) {
    self->_int abUid = -1;
  }
  if (self->_abIdentifier < 0)
  {
    p_abDatabaseUUID = &self->_abDatabaseUUID;
    abDatabaseUUID = self->_abDatabaseUUID;
    if (!abDatabaseUUID)
    {
      if (abUid < 0) {
        return;
      }
      goto LABEL_12;
    }
  }
  else
  {
    p_abDatabaseUUID = &self->_abDatabaseUUID;
    abDatabaseUUID = self->_abDatabaseUUID;
    self->_abIdentifier = -1;
    if (!abDatabaseUUID) {
      goto LABEL_12;
    }
  }

  *p_abDatabaseUUID = 0;
LABEL_12:
  *((unsigned char *)self + 32) |= 1u;
  [(ABFavoritesEntry *)self _postEntryChanged];
}

- (void)_lookupChanged:(id)a3
{
  int v5 = *((_DWORD *)a3 + 2);
  if ((v5 & 0x80000000) == 0) {
    self->_abIdentifier = v5;
  }
  int v6 = *((_DWORD *)a3 + 3);
  if (v6 < 0)
  {
    unsigned int v8 = 0;
    BOOL v9 = v5 >= 0;
    uint64_t abUid = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t abUid = self->_abUid;
    self->_uint64_t abUid = v6;
    unsigned int v8 = abUid >> 31;
    BOOL v9 = 1;
  }
  if (*((void *)a3 + 2))
  {

    self->_value = (NSString *)*((void *)a3 + 2);
  }
  if (*((void *)a3 + 3))
  {

    self->_name = (NSString *)*((void *)a3 + 3);
    unsigned int v8 = 1;
  }
  if (*((void *)a3 + 4))
  {

    self->_CFStringRef label = (NSString *)*((void *)a3 + 4);
    unsigned int v8 = 1;
  }
  if ((self->_abUid & 0x80000000) == 0)
  {

    self->_abDatabaseUUID = (NSString *)*((void *)a3 + 5);
    if ((abUid & 0x80000000) != 0) {
      goto LABEL_17;
    }
LABEL_16:
    if ([+[ABFavoritesListManager sharedInstance] entryIsDuplicateAndThusRemoved:self oldUid:abUid])
    {
      return;
    }
    goto LABEL_17;
  }

  if ((abUid & 0x80000000) == 0) {
    goto LABEL_16;
  }
LABEL_17:
  if (v8) {
    [(ABFavoritesEntry *)self _postEntryChanged];
  }
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithInt:abUid];
    CFTypeRef v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"CNFavoritesEntryOldIdentityKey", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"CNFavoritesEntryIdentityChangedNotification", self, v11);
  }
  *((unsigned char *)self + 32) |= 1u;
}

@end