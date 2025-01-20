@interface ABPersonLinker
+ (BOOL)isAutoLinkingEnabled;
+ (BOOL)isInitialLinkingEnabled;
+ (BOOL)isLinkDataValidForAddressBook:(void *)a3;
+ (void)startAutoLinkingNewPeopleInAddressBook:(void *)a3 inProcess:(BOOL)a4;
- (ABPersonLinker)init;
- (ABPersonLinker)initWithAddressBook:(void *)a3;
- (BOOL)linkRecentlyAddedPeopleWithLimit:(int64_t)a3;
- (BOOL)shouldLinkPerson:(void *)a3 toPeopleInDatabase:(id)a4 andNewlyAddedPeople:(id)a5 inInitialLinking:(BOOL)a6;
- (id)copyArrayOfAllPeopleWithROWIDGreatThan:(int)a3 withLimit:(int64_t)a4;
- (id)otherPeopleInArray:(id)a3 matchingPerson:(void *)a4;
- (id)otherPeopleInDatabaseMatchingPerson:(void *)a3 notIncludingPeople:(id)a4;
- (id)suggestedPeopleToLinkWithPerson:(void *)a3 isInitialLinking:(BOOL)a4;
- (void)addPerson:(void *)a3 toDictionary:(id)a4 withProperty:(int)a5;
- (void)dealloc;
- (void)linkNewlyAddedPerson:(void *)a3;
- (void)linkRecentlyAddedPeople;
- (void)makeInitialLinks;
- (void)makeInitialLinksCountingOuterIterations:(unint64_t *)a3;
- (void)makeLinksForAddedPeople:(id)a3 inInitialLinking:(BOOL)a4 countingOuterIterations:(unint64_t *)a5 detectedLinkCount:(unint64_t *)a6;
- (void)presortPeople:(id)a3;
- (void)removeAllLinks;
@end

@implementation ABPersonLinker

+ (BOOL)isLinkDataValidForAddressBook:(void *)a3
{
  return ABAddressBookGetIntegerProperty((uint64_t)a3) == 9;
}

+ (BOOL)isInitialLinkingEnabled
{
  return 1;
}

+ (BOOL)isAutoLinkingEnabled
{
  return 1;
}

+ (void)startAutoLinkingNewPeopleInAddressBook:(void *)a3 inProcess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x19F3B4540](a1, a2);
  v7 = ABOSLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = a3;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_19DCDB000, v7, OS_LOG_TYPE_DEFAULT, "[ABPersonLinker] startAutoLinkingNewPeopleInAddressBook:%@ inProcess:%i", (uint8_t *)&v9, 0x12u);
  }
  if (v4)
  {
    v8 = [[ABPersonLinker alloc] initWithAddressBook:a3];
    [(ABPersonLinker *)v8 linkRecentlyAddedPeople];
  }
  else
  {
    ABStartDatabaseDoctor((uint64_t)a3);
  }
}

- (ABPersonLinker)initWithAddressBook:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ABPersonLinker;
  BOOL v4 = [(ABPersonLinker *)&v6 init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    v4->_addressBook = a3;
  }
  return v4;
}

- (ABPersonLinker)init
{
  return 0;
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }

  v4.receiver = self;
  v4.super_class = (Class)ABPersonLinker;
  [(ABPersonLinker *)&v4 dealloc];
}

- (id)otherPeopleInDatabaseMatchingPerson:(void *)a3 notIncludingPeople:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (self->_peopleByOrganization && self->_peopleByFirstName && self->_peopleByLastName)
  {
    if (ABRecordGetIntValue((uint64_t)a3, kABPersonKindProperty) == 1)
    {
      uint64_t v8 = objc_msgSend((id)(id)ABRecordCopyValue(a3, kABPersonOrganizationProperty), "lowercaseString");
      if (v8) {
        int v9 = (__CFString *)v8;
      }
      else {
        int v9 = &stru_1EF03E278;
      }
      v10 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_peopleByOrganization, "objectForKey:", v9), "mutableCopy");
    }
    else
    {
      uint64_t v31 = objc_msgSend((id)(id)ABRecordCopyValue(a3, kABPersonFirstNameProperty), "lowercaseString");
      uint64_t v32 = objc_msgSend((id)(id)ABRecordCopyValue(a3, kABPersonLastNameProperty), "lowercaseString");
      if (v31) {
        v33 = (__CFString *)v31;
      }
      else {
        v33 = &stru_1EF03E278;
      }
      v34 = (void *)[(NSMutableDictionary *)self->_peopleByFirstName objectForKey:v33];
      if (v32) {
        v35 = (__CFString *)v32;
      }
      else {
        v35 = &stru_1EF03E278;
      }
      uint64_t v36 = [(NSMutableDictionary *)self->_peopleByLastName objectForKey:v35];
      v37 = (void *)[v34 mutableCopy];
      v10 = v37;
      if (v36)
      {
        [v37 intersectSet:v36];
      }
      else
      {

        v10 = 0;
      }
    }
    objc_msgSend(v10, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", a4));
    [v10 removeObject:a3];
    id v40 = (id)objc_msgSend((id)objc_msgSend(v10, "allObjects"), "copy");

    return v40;
  }
  else
  {
    ABRecordID RecordID = ABRecordGetRecordID(a3);
    if (RecordID == -1 && ![a4 count])
    {
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:RecordID];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v13 = [a4 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(a4);
            }
            ABRecordID v17 = ABRecordGetRecordID(*(ABRecordRef *)(*((void *)&v41 + 1) + 8 * i));
            if (v17 != -1) {
              [v12 addIndex:v17];
            }
          }
          uint64_t v14 = [a4 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v14);
      }
    }
    int IntValue = ABRecordGetIntValue((uint64_t)a3, kABPersonKindProperty);
    if (IntValue)
    {
      if (IntValue != 1) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ABPersonLinker.m", 202, @"Wrong kind of person, expected an organization");
      }
      CFTypeRef v27 = ABRecordCopyValue(a3, kABPersonOrganizationProperty);
      if (v27)
      {
        v28 = v27;
        uint64_t SelectStatement = CPRecordStoreCreateSelectStatement();
        if (SelectStatement)
        {
          v30 = (const void *)SelectStatement;
          v26 = (void *)CPRecordStoreProcessQueryWithBindBlock();
          CFRelease(v30);
        }
        else
        {
          v26 = 0;
        }
        CFRelease(v28);
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      unint64_t v19 = (unint64_t)ABRecordCopyValue(a3, kABPersonFirstNameProperty);
      unint64_t v20 = (unint64_t)ABRecordCopyValue(a3, kABPersonLastNameProperty);
      if (!(v19 | v20)) {
        goto LABEL_35;
      }
      v21 = (void *)[MEMORY[0x1E4F28E78] string];
      [v21 appendString:@"WHERE "];
      [v21 appendString:@"First"];
      v22 = v19 ? @" LIKE ? AND " : @" IS NULL AND ";
      [v21 appendString:v22];
      [v21 appendString:@"Last"];
      v23 = v20 ? @" LIKE ? AND " : @" IS NULL AND ";
      [v21 appendString:v23];
      [v21 appendFormat:@"%@ = %@", @"Kind", @"0"];
      uint64_t v24 = CPRecordStoreCreateSelectStatement();
      if (v24)
      {
        v25 = (const void *)v24;
        v26 = (void *)CPRecordStoreProcessQueryWithBindBlock();
        CFRelease(v25);
      }
      else
      {
LABEL_35:
        v26 = 0;
      }
    }
    id v38 = v26;
    return v26;
  }
}

void *__73__ABPersonLinker_otherPeopleInDatabaseMatchingPerson_notIncludingPeople___block_invoke(void *result, uint64_t a2)
{
  if (a2)
  {
    v3 = *(sqlite3_stmt **)(a2 + 8);
    if (v3)
    {
      objc_super v4 = result;
      v5 = (void *)result[4];
      if (v5)
      {
        sqlite3_bind_text(v3, 1, (const char *)[v5 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        int v6 = 2;
      }
      else
      {
        int v6 = 1;
      }
      result = (void *)v4[5];
      if (result)
      {
        v7 = *(sqlite3_stmt **)(a2 + 8);
        uint64_t v8 = (const char *)[result UTF8String];
        return (void *)sqlite3_bind_text(v7, v6, v8, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
  return result;
}

void *__73__ABPersonLinker_otherPeopleInDatabaseMatchingPerson_notIncludingPeople___block_invoke_2(void *result, uint64_t a2)
{
  if (a2)
  {
    v2 = *(sqlite3_stmt **)(a2 + 8);
    if (v2)
    {
      result = (void *)result[4];
      if (result)
      {
        v3 = (const char *)[result UTF8String];
        return (void *)sqlite3_bind_text(v2, 1, v3, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
  return result;
}

- (id)otherPeopleInArray:(id)a3 matchingPerson:(void *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (ABRecordGetIntValue((uint64_t)a4, kABPersonKindProperty))
  {
    if (ABRecordGetIntValue((uint64_t)a4, kABPersonKindProperty) != 1) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ABPersonLinker.m", 260, @"Wrong kind of person, expected an organization");
    }
    CFTypeRef v8 = ABRecordCopyValue(a4, kABPersonOrganizationProperty);
    if (v8)
    {
      int v9 = (void *)v8;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v34 != v12) {
              objc_enumerationMutation(a3);
            }
            uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (v14 != a4
              && ABRecordGetIntValue(*(void *)(*((void *)&v33 + 1) + 8 * i), kABPersonKindProperty) == 1)
            {
              uint64_t v15 = (void *)ABRecordCopyValue(v14, kABPersonOrganizationProperty);
              v16 = v15;
              if (v15)
              {
                if (![v15 localizedCaseInsensitiveCompare:v9]) {
                  [v32 addObject:v14];
                }
              }
            }
          }
          uint64_t v11 = [a3 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v11);
      }
    }
  }
  else
  {
    CFTypeRef v18 = ABRecordCopyValue(a4, kABPersonFirstNameProperty);
    CFTypeRef v19 = ABRecordCopyValue(a4, kABPersonLastNameProperty);
    v30 = (void *)v19;
    uint64_t v31 = (void *)v18;
    if (v18) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (!v20)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v21 = [a3 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v38 != v23) {
              objc_enumerationMutation(a3);
            }
            v25 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            if (v25 != a4
              && !ABRecordGetIntValue(*(void *)(*((void *)&v37 + 1) + 8 * j), kABPersonKindProperty))
            {
              v26 = (void *)ABRecordCopyValue(v25, kABPersonFirstNameProperty);
              CFTypeRef v27 = ABRecordCopyValue(v25, kABPersonLastNameProperty);
              v28 = (void *)v27;
              if (v26) {
                BOOL v29 = v27 == 0;
              }
              else {
                BOOL v29 = 1;
              }
              if (!v29
                && ![v26 localizedCaseInsensitiveCompare:v31]
                && ![v28 localizedCaseInsensitiveCompare:v30])
              {
                [v32 addObject:v25];
              }
            }
          }
          uint64_t v22 = [a3 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v22);
      }
    }
  }
  return v32;
}

- (BOOL)shouldLinkPerson:(void *)a3 toPeopleInDatabase:(id)a4 andNewlyAddedPeople:(id)a5 inInitialLinking:(BOOL)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  int IntValue = ABRecordGetIntValue((uint64_t)a3, kABPersonKindProperty);
  uint64_t v10 = [a4 count];
  unint64_t v11 = [a5 count] + v10;
  ABRecordRef v12 = ABPersonCopySource(a3);
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v11];
  uint64_t v14 = v13;
  if (v12)
  {
    [v13 addObject:v12];
    CFRelease(v12);
  }
  id v42 = (id)ABRecordCopyValue(a3, kABPersonMiddleNameProperty);
  if (v11)
  {
    unint64_t v15 = 0;
    while (1)
    {
      if (v15 >= [a4 count])
      {
        unint64_t v17 = v15 - [a4 count];
        id v16 = a5;
      }
      else
      {
        id v16 = a4;
        unint64_t v17 = v15;
      }
      CFTypeRef v18 = (const void *)[v16 objectAtIndex:v17];
      ABRecordRef v19 = ABPersonCopySource(v18);
      if (!v19) {
        goto LABEL_11;
      }
      BOOL v20 = v19;
      if ([v14 containsObject:v19])
      {
        CFRelease(v20);
        goto LABEL_47;
      }
      [v14 addObject:v20];
      CFRelease(v20);
      if (IntValue)
      {
LABEL_11:
        BOOL v21 = 1;
        goto LABEL_18;
      }
      uint64_t v22 = (void *)ABRecordCopyValue(v18, kABPersonMiddleNameProperty);
      if (!v22) {
        goto LABEL_16;
      }
      if (!v42) {
        break;
      }
      BOOL v21 = [v42 localizedCaseInsensitiveCompare:v22] == 0;
LABEL_17:

LABEL_18:
      if (++v15 >= v11 || !v21) {
        goto LABEL_22;
      }
    }
    id v42 = v22;
LABEL_16:
    BOOL v21 = 1;
    goto LABEL_17;
  }
  BOOL v21 = 1;
LABEL_22:
  if (v21 && !a6)
  {
    int v23 = ABRecordGetIntValue((uint64_t)a3, kABPersonLinkProperty);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v24 = [a5 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(a5);
          }
          int v28 = ABRecordGetIntValue(*(void *)(*((void *)&v51 + 1) + 8 * i), kABPersonLinkProperty);
          if (v28 != -1)
          {
            if (v23 == -1)
            {
              int v23 = v28;
            }
            else
            {
              BOOL v29 = v23 == v28;
              int v23 = v28;
              if (!v29) {
                goto LABEL_47;
              }
            }
          }
        }
        uint64_t v25 = [a5 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v25);
    }
    if (v23 == -1)
    {
      if ((unint64_t)[a4 count] >= 2)
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        uint64_t v35 = [a4 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v48;
          int v38 = -1;
LABEL_52:
          uint64_t v39 = 0;
          while (1)
          {
            if (*(void *)v48 != v37) {
              objc_enumerationMutation(a4);
            }
            int v40 = ABRecordGetIntValue(*(void *)(*((void *)&v47 + 1) + 8 * v39), kABPersonLinkProperty);
            if (v40 == -1) {
              goto LABEL_47;
            }
            if (v38 == -1)
            {
              int v38 = v40;
            }
            else if (v38 != v40)
            {
              goto LABEL_47;
            }
            if (v36 == ++v39)
            {
              uint64_t v36 = [a4 countByEnumeratingWithState:&v47 objects:v56 count:16];
              LOBYTE(v21) = 1;
              if (v36) {
                goto LABEL_52;
              }
              goto LABEL_48;
            }
          }
        }
      }
    }
    else
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v30 = [a4 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v44;
LABEL_39:
        uint64_t v33 = 0;
        while (1)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(a4);
          }
          if (ABRecordGetIntValue(*(void *)(*((void *)&v43 + 1) + 8 * v33), kABPersonLinkProperty) != v23)break; {
          if (v31 == ++v33)
          }
          {
            uint64_t v31 = [a4 countByEnumeratingWithState:&v43 objects:v55 count:16];
            LOBYTE(v21) = 1;
            if (v31) {
              goto LABEL_39;
            }
            goto LABEL_48;
          }
        }
LABEL_47:
        LOBYTE(v21) = 0;
        goto LABEL_48;
      }
    }
    LOBYTE(v21) = 1;
  }
LABEL_48:

  return v21;
}

- (id)suggestedPeopleToLinkWithPerson:(void *)a3 isInitialLinking:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(ABPersonLinker *)self otherPeopleInDatabaseMatchingPerson:a3 notIncludingPeople:0];
  if ([(ABPersonLinker *)self shouldLinkPerson:a3 toPeopleInDatabase:v7 andNewlyAddedPeople:0 inInitialLinking:v4])
  {
    return v7;
  }
  else
  {
    return 0;
  }
}

- (void)addPerson:(void *)a3 toDictionary:(id)a4 withProperty:(int)a5
{
  uint64_t v7 = objc_msgSend((id)(id)ABRecordCopyValue(a3, a5), "lowercaseString");
  if (v7) {
    CFTypeRef v8 = (__CFString *)v7;
  }
  else {
    CFTypeRef v8 = &stru_1EF03E278;
  }
  int v9 = (void *)[a4 objectForKey:v8];
  if (!v9)
  {
    int v9 = objc_opt_new();
    [a4 setObject:v9 forKey:v8];
  }
  [v9 addObject:a3];
}

- (void)presortPeople:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  peopleByLastName = self->_peopleByLastName;
  p_peopleByLastName = &self->_peopleByLastName;
  if (peopleByLastName) {

  }
  self->_peopleByLastName = (NSMutableDictionary *)objc_opt_new();
  peopleByFirstName = self->_peopleByFirstName;
  if (peopleByFirstName) {

  }
  int v6 = (NSMutableDictionary *)objc_opt_new();
  peopleByOrganization = self->_peopleByOrganization;
  self->_peopleByFirstName = v6;
  if (peopleByOrganization) {

  }
  self->_peopleByOrganization = (NSMutableDictionary *)objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int IntValue = ABRecordGetIntValue(v12, kABPersonKindProperty);
        p_peopleByOrganization = &self->_peopleByOrganization;
        uint64_t v15 = kABPersonOrganizationProperty;
        if (!IntValue)
        {
          [(ABPersonLinker *)self addPerson:v12 toDictionary:self->_peopleByFirstName withProperty:kABPersonFirstNameProperty];
          p_peopleByOrganization = p_peopleByLastName;
          uint64_t v15 = kABPersonLastNameProperty;
        }
        -[ABPersonLinker addPerson:toDictionary:withProperty:](self, "addPerson:toDictionary:withProperty:", v12, *p_peopleByOrganization, v15, p_peopleByLastName);
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (void)makeLinksForAddedPeople:(id)a3 inInitialLinking:(BOOL)a4 countingOuterIterations:(unint64_t *)a5 detectedLinkCount:(unint64_t *)a6
{
  uint64_t v7 = self;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  BOOL v60 = a4;
  if (a4) {
    [(ABPersonLinker *)self removeAllLinks];
  }
  if (a3)
  {
    CFArrayRef v8 = (CFArrayRef)a3;
  }
  else
  {
    CFArrayRef v8 = ABAddressBookCopyArrayOfAllPeople(v7->_addressBook);
    [(ABPersonLinker *)v7 presortPeople:v8];
  }
  if (ABDiagnosticsEnabled())
  {
    [a3 count];
    [(__CFArray *)v8 count];
    _ABLog2(7, (uint64_t)"-[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:]", 464, 0, @"[ABPersonLinker] (%@) makeLinksForAddedPeople %ld inInitialLinking %i peopleToLink %ld", v9, v10, v11, (uint64_t)v7);
  }
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[__CFArray count](v8, "count"));
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v13 = [(__CFArray *)v8 countByEnumeratingWithState:&v71 objects:v77 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v61 = 0;
    uint64_t v57 = (uint64_t)v7;
    unint64_t v58 = 0;
    uint64_t v15 = *(void *)v72;
    CFArrayRef v56 = v8;
    id v59 = a3;
    do
    {
      uint64_t v16 = 0;
      uint64_t v62 = v14;
      do
      {
        if (*(void *)v72 != v15) {
          objc_enumerationMutation(v8);
        }
        unint64_t v17 = *(const void **)(*((void *)&v71 + 1) + 8 * v16);
        if (([v12 containsObject:v17] & 1) == 0)
        {
          id v18 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          if (ABRecordGetIntValue((uint64_t)v17, kABPersonLinkProperty) == -1)
          {
            id v23 = [(ABPersonLinker *)v7 otherPeopleInArray:a3 matchingPerson:v17];
            id v24 = [(ABPersonLinker *)v7 otherPeopleInDatabaseMatchingPerson:v17 notIncludingPeople:v23];
            if (ABDiagnosticsEnabled())
            {
              CFMutableStringRef v25 = ABPersonCopyCompositeName(v17);
              if (ABDiagnosticsEnabled())
              {
                ABRecordGetRecordID(v17);
                [v24 count];
                [v23 count];
                CFArrayRef v8 = v56;
                uint64_t v7 = (ABPersonLinker *)v57;
                _ABLog2(7, (uint64_t)"-[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:]", 480, 0, @"[ABPersonLinker] (%@) person %i %@, otherPeopleinDatabase %ld, otherNewlyAddedPeople %ld", v26, v27, v28, v57);
              }
            }
            if ([(ABPersonLinker *)v7 shouldLinkPerson:v17 toPeopleInDatabase:v24 andNewlyAddedPeople:v23 inInitialLinking:v60])
            {
              if ([v24 count] || objc_msgSend(v23, "count")) {
                ++v58;
              }
              if ([v24 count])
              {
                if (v60)
                {
                  long long v69 = 0u;
                  long long v70 = 0u;
                  long long v67 = 0u;
                  long long v68 = 0u;
                  uint64_t v29 = [v24 countByEnumeratingWithState:&v67 objects:v76 count:16];
                  if (v29)
                  {
                    uint64_t v30 = v29;
                    uint64_t v31 = *(void *)v68;
                    do
                    {
                      for (uint64_t i = 0; i != v30; ++i)
                      {
                        if (*(void *)v68 != v31) {
                          objc_enumerationMutation(v24);
                        }
                        ABPersonLinkPerson(v17, *(const void **)(*((void *)&v67 + 1) + 8 * i));
                      }
                      uint64_t v30 = [v24 countByEnumeratingWithState:&v67 objects:v76 count:16];
                    }
                    while (v30);
                  }
                }
                else
                {
                  ABPersonLinkPerson(v17, (const void *)[v24 lastObject]);
                }
              }
              long long v65 = 0u;
              long long v66 = 0u;
              long long v63 = 0u;
              long long v64 = 0u;
              uint64_t v33 = [v23 countByEnumeratingWithState:&v63 objects:v75 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v64;
                do
                {
                  for (uint64_t j = 0; j != v34; ++j)
                  {
                    if (*(void *)v64 != v35) {
                      objc_enumerationMutation(v23);
                    }
                    ABPersonLinkPerson(v17, *(const void **)(*((void *)&v63 + 1) + 8 * j));
                  }
                  uint64_t v34 = [v23 countByEnumeratingWithState:&v63 objects:v75 count:16];
                }
                while (v34);
              }
              CFArrayRef v8 = v56;
              uint64_t v7 = (ABPersonLinker *)v57;
            }
            [v12 addObjectsFromArray:v24];
            [v12 addObjectsFromArray:v23];
            ++v61;
            a3 = v59;
          }
          else
          {
            CFMutableStringRef v19 = ABPersonCopyCompositeName(v17);
            if (ABDiagnosticsEnabled())
            {
              ABRecordGetRecordID(v17);
              _ABLog2(7, (uint64_t)"-[ABPersonLinker makeLinksForAddedPeople:inInitialLinking:countingOuterIterations:detectedLinkCount:]", 517, 0, @"[ABPersonLinker] (%@) person %i %@, personLinkId %i", v20, v21, v22, (uint64_t)v7);
            }
          }
          uint64_t v14 = v62;
        }
        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [(__CFArray *)v8 countByEnumeratingWithState:&v71 objects:v77 count:16];
    }
    while (v14);
  }
  else
  {
    unint64_t v61 = 0;
    unint64_t v58 = 0;
  }

  if (a5) {
    *a5 = v61;
  }
  if (v60)
  {
    ABAddressBookSetIntegerProperty((uint64_t)v7->_addressBook, @"PersonLinkerVersion", 9, v37, v38, v39, v40, v41, v52);
    id v42 = (const void *)[(__CFArray *)v8 lastObject];
    if (v42)
    {
      uint64_t RecordID = ABRecordGetRecordID(v42);
      ABAddressBookSetIntegerProperty((uint64_t)v7->_addressBook, @"PersonLinkerLastProcessedPerson", RecordID, v44, v45, v46, v47, v48, v53);
      ABAddressBookSave(v7->_addressBook, 0);
    }
  }
  if (a6) {
    *a6 = v58;
  }
  peopleByFirstName = v7->_peopleByFirstName;
  if (peopleByFirstName)
  {

    v7->_peopleByFirstName = 0;
  }
  peopleByLastName = v7->_peopleByLastName;
  if (peopleByLastName)
  {

    v7->_peopleByLastName = 0;
  }
  peopleByOrganization = v7->_peopleByOrganization;
  if (peopleByOrganization)
  {

    v7->_peopleByOrganization = 0;
  }
}

- (void)removeAllLinks
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = ABAddressBookCopyArrayOfAllPeople(self->_addressBook);
  if (ABDiagnosticsEnabled())
  {
    [(__CFArray *)v3 count];
    _ABLog2(7, (uint64_t)"-[ABPersonLinker removeAllLinks]", 562, 0, @"[ABPersonLinker] %@: removeAllLinks on %ld people", v4, v5, v6, (uint64_t)self);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = [(__CFArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v3);
        }
        ABPersonUnlink(*(CFTypeRef *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [(__CFArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)makeInitialLinksCountingOuterIterations:(unint64_t *)a3
{
}

- (void)makeInitialLinks
{
}

- (id)copyArrayOfAllPeopleWithROWIDGreatThan:(int)a3 withLimit:(int64_t)a4
{
  addressBook = self->_addressBook;
  if (!addressBook) {
    return 0;
  }
  id result = (id)*((void *)addressBook + 2);
  if (result) {
    return (id)CPRecordStoreCopyAllInstancesOfClassWhereWithBindBlock();
  }
  return result;
}

sqlite3_stmt *__67__ABPersonLinker_copyArrayOfAllPeopleWithROWIDGreatThan_withLimit___block_invoke(sqlite3_stmt *result, uint64_t a2)
{
  if (a2)
  {
    CFArrayRef v3 = result;
    id result = *(sqlite3_stmt **)(a2 + 8);
    if (result)
    {
      sqlite3_bind_int(result, 1, *((_DWORD *)v3 + 10));
      uint64_t v4 = *(sqlite3_stmt **)(a2 + 8);
      int v5 = *((_DWORD *)v3 + 8);
      return (sqlite3_stmt *)sqlite3_bind_int(v4, 2, v5);
    }
  }
  return result;
}

- (BOOL)linkRecentlyAddedPeopleWithLimit:(int64_t)a3
{
  unsigned int IntegerProperty = ABAddressBookGetIntegerProperty((uint64_t)self->_addressBook);
  if (IntegerProperty) {
    uint64_t v6 = IntegerProperty;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  id v7 = [(ABPersonLinker *)self copyArrayOfAllPeopleWithROWIDGreatThan:v6 withLimit:a3];
  uint64_t v8 = [v7 count];
  if (ABDiagnosticsEnabled())
  {
    [v7 count];
    _ABLog2(7, (uint64_t)"-[ABPersonLinker linkRecentlyAddedPeopleWithLimit:]", 601, 0, @"[ABPersonLinker] (%@) link recently added people with last autolinked person ID %i, limit %ld, number of people found %ld", v9, v10, v11, (uint64_t)self);
  }
  if ([v7 count])
  {
    uint64_t v20 = 0;
    [(ABPersonLinker *)self makeLinksForAddedPeople:v7 inInitialLinking:0 countingOuterIterations:0 detectedLinkCount:&v20];
    uint64_t RecordID = ABRecordGetRecordID((ABRecordRef)[v7 lastObject]);
    ABAddressBookSetIntegerProperty((uint64_t)self->_addressBook, @"PersonLinkerLastProcessedPerson", RecordID, v13, v14, v15, v16, v17, v19);
    if (v20) {
      ABAddressBookSave(self->_addressBook, 0);
    }
  }

  return v8 == a3;
}

- (void)linkRecentlyAddedPeople
{
}

- (void)linkNewlyAddedPerson:(void *)a3
{
  if (ABDiagnosticsEnabled())
  {
    CFMutableStringRef v5 = ABPersonCopyCompositeName(a3);
    if (ABDiagnosticsEnabled()) {
      _ABLog2(7, (uint64_t)"-[ABPersonLinker linkNewlyAddedPerson:]", 627, 0, @"[ABPersonLinker] (%@) link newly added person %@", v6, v7, v8, (uint64_t)self);
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  [(ABPersonLinker *)self makeLinksForAddedPeople:v9 inInitialLinking:0 countingOuterIterations:0 detectedLinkCount:0];
}

@end