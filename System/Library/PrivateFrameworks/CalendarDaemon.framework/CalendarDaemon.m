uint64_t CalGetValuesFromFetchedObjectDictionary(void *a1, const char *a2)
{
  return [a1 objectForKeyedSubscript:@"values"];
}

BOOL CalendarCanContainAnAllowedEntityType(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 eventAccessLevel]
    && (CalCalendarCanContainEntityTypeAndStoreAllowsIt() & 1) != 0
    || [v2 reminderAccessGranted]
    && (CalCalendarCanContainEntityTypeAndStoreAllowsIt() & 1) != 0;

  return v3;
}

void sub_1BBC8ACD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1BBC8AF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC8B0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CalEntityCopyPropertyValues(void *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  CFTypeRef cf = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = v7;
  v10 = (void *)v8;
  obuint64_t j = v9;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v45;
    unsigned int v37 = *MEMORY[0x1E4F574B8];
    uint64_t v38 = *(void *)v45;
    uint64_t v35 = a2;
    id v36 = v6;
    v34 = (void *)v8;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = CalEntityCopyPropertyAllowingLimitedAccess(v6, a2, *(void **)(*((void *)&v44 + 1) + 8 * i), &cf, 0);
        v16 = (void *)cf;
        if (v15) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = cf == 0;
        }
        if (v17)
        {
          v18 = (void *)cf;
        }
        else
        {
          CFTypeID v19 = CFGetTypeID(cf);
          if (v19 == CPRecordGetTypeID())
          {
            uint64_t Type = CalEntityGetType();
            uint64_t ID = CalEntityGetID();
            AuxilliaryDatabaseuint64_t ID = v37;
            if (ID != 0x7FFFFFFF)
            {
              CalGetDatabaseForRecord();
              AuxilliaryDatabaseuint64_t ID = CalDatabaseGetAuxilliaryDatabaseID();
              CFRelease(v16);
            }
            v18 = CalFetchedObjectDictionary(Type, ID, AuxilliaryDatabaseID, 0);
            CFTypeRef cf = v18;
          }
          else
          {
            CFTypeID v23 = CFGetTypeID(v16);
            if (v23 != CFSetGetTypeID()) {
              goto LABEL_27;
            }
            v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:CFSetGetCount((CFSetRef)v16)];
            CalGetDatabaseForRecord();
            uint64_t v24 = CalDatabaseGetAuxilliaryDatabaseID();
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v25 = v16;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v49 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v41;
              do
              {
                for (uint64_t j = 0; j != v27; ++j)
                {
                  if (*(void *)v41 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  v30 = CalFetchedObjectDictionary([*(id *)(*((void *)&v40 + 1) + 8 * j) entityType], objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * j), "entityID"), v24, 0);
                  [v18 addObject:v30];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v49 count:16];
              }
              while (v27);
            }

            CFRelease(v25);
            CFTypeRef cf = v18;
            a2 = v35;
            id v6 = v36;
            v10 = v34;
          }
          uint64_t v13 = v38;
        }
        v16 = v18;
        if (v18)
        {
LABEL_27:
          [v10 addObject:v16];
          CFRelease(v16);
          continue;
        }
        v31 = [MEMORY[0x1E4F1CA98] null];
        [v10 addObject:v31];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v12);
  }

  if (a4) {
    *a4 = 0;
  }

  return v10;
}

uint64_t CalEntityCopyPropertyAllowingLimitedAccess(void *a1, uint64_t a2, void *a3, void *a4, char a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  *a4 = 0;
  int Type = CalEntityGetType();
  if ([v9 eventAccessLevel] == 1) {
    char v11 = a5;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0 && CalGetDatabaseForRecord())
  {
    if (Type == 6)
    {
      uint64_t v12 = CalDatabaseCopyLimitedAccessVirtualStore();
    }
    else
    {
      if (Type != 1) {
        goto LABEL_11;
      }
      uint64_t v12 = CalDatabaseCopyLimitedAccessVirtualCalendar();
    }
    a2 = v12;
  }
LABEL_11:
  if (CalEntityGetPropertyIDFromName(Type, (uint64_t)a3) == -1)
  {
    id v19 = v9;
    if (CalEntityGetType() == 6
      && [a3 isEqualToString:*MEMORY[0x1E4F57390]])
    {
      int Property = [v19 managedConfigurationAccountAccessForStore:a2];
      *a4 = CFNumberCreate(0, kCFNumberIntType, &Property);

      uint64_t v18 = 0;
    }
    else
    {

      if (CalEntityIsDeleted()) {
        uint64_t v18 = 1010;
      }
      else {
        uint64_t v18 = 1008;
      }
    }
    goto LABEL_71;
  }
  uint64_t PropertyDescriptor = CPRecordGetPropertyDescriptor();
  if (!PropertyDescriptor)
  {
    uint64_t v18 = 1001;
    goto LABEL_71;
  }
  uint64_t v14 = PropertyDescriptor;
  RecordLock = (os_unfair_lock_s *)CalGetRecordLock();
  os_unfair_lock_lock(RecordLock);
  char IsDeleted = _CalEntityIsDeleted();
  BOOL v17 = (unsigned char *)MEMORY[0x1E4F56A58];
  if ((IsDeleted & 1) == 0)
  {
    unsigned int v20 = *(_DWORD *)(v14 + 8);
    if (v20 > 7) {
      goto LABEL_47;
    }
    if (((1 << v20) & 0xCC) != 0)
    {
      if (*MEMORY[0x1E4F56A58])
      {
        if (a2)
        {
          if (CPRecordGetStore())
          {
            Context = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (Context) {
              os_unfair_lock_assert_owner(Context + 20);
            }
          }
        }
      }
      uint64_t v22 = CPRecordCopyProperty();
      goto LABEL_67;
    }
    if (v20)
    {
      if (v20 == 1)
      {
        if (*MEMORY[0x1E4F56A58])
        {
          if (a2)
          {
            if (CPRecordGetStore())
            {
              CFTypeID v23 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v23) {
                os_unfair_lock_assert_owner(v23 + 20);
              }
            }
          }
        }
        int Property = CPRecordGetProperty();
        uint64_t v22 = (uint64_t)CFNumberCreate(0, kCFNumberIntType, &Property);
        goto LABEL_67;
      }
LABEL_47:
      uint64_t v27 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        int v28 = *(_DWORD *)(v14 + 8);
        int Property = 67109378;
        *(_DWORD *)long long v46 = v28;
        *(_WORD *)&v46[4] = 2112;
        *(void *)&v46[6] = a3;
        _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_ERROR, "Unknown property type %d for name %@", (uint8_t *)&Property, 0x12u);
      }
      uint64_t v18 = 1001;
      goto LABEL_68;
    }
    uint64_t v24 = *(void *)(v14 + 16);
    if (v24 == MEMORY[0x1E4F57518])
    {
      uint64_t v25 = 1;
    }
    else
    {
      uint64_t v25 = *(void *)(v14 + 32);
      if ((unint64_t)(v25 - 1) >= 3)
      {
        if (v24 == MEMORY[0x1E4F57510])
        {
          uint64_t v25 = 2;
        }
        else if (v24 == MEMORY[0x1E4F57528] || v24 == MEMORY[0x1E4F57520])
        {
          uint64_t v25 = 3;
        }
        else
        {
          uint64_t v25 = 0;
        }
      }
    }
    if (*MEMORY[0x1E4F56A58])
    {
      if (a2)
      {
        if (CPRecordGetStore())
        {
          v29 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v29) {
            os_unfair_lock_assert_owner(v29 + 20);
          }
        }
      }
    }
    v30 = (const void *)CPRecordGetProperty();
    if (v30)
    {
      v31 = v30;
      if (v25 == 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_60:
          v32 = v31;
LABEL_66:
          uint64_t v22 = (uint64_t)CFRetain(v32);
LABEL_67:
          uint64_t v18 = 0;
          *a4 = v22;
          goto LABEL_68;
        }
        id v36 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          unsigned int v37 = v36;
          int Property = 138543618;
          *(void *)long long v46 = a3;
          *(_WORD *)&v46[8] = 2114;
          *(void *)&v46[10] = objc_opt_class();
          id v38 = *(id *)&v46[10];
          _os_log_impl(&dword_1BBC88000, v37, OS_LOG_TYPE_ERROR, "Wrong data type for attribute '%{public}@': %{public}@", (uint8_t *)&Property, 0x16u);
        }
LABEL_74:
        uint64_t v18 = 1011;
        goto LABEL_68;
      }
      CFTypeID v33 = CFGetTypeID(v30);
      if (v33 == CalRelationGetTypeID())
      {
        uint64_t RelatedObject = CalRelationGetRelatedObject();
        if ((v11 & 1) == 0) {
          uint64_t RelatedObject = FilterCalendarAndSource(Type, RelatedObject, a3);
        }
        if (RelatedObject)
        {
          v32 = (const void *)RelatedObject;
          goto LABEL_66;
        }
      }
      else
      {
        if (v33 != CalToManyRelationGetTypeID())
        {
          if (v33 == CFStringGetTypeID() || v33 == CFNumberGetTypeID() || v33 == CFBooleanGetTypeID()) {
            goto LABEL_60;
          }
          long long v44 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            int Property = 134218242;
            *(void *)long long v46 = v33;
            *(_WORD *)&v46[8] = 2112;
            *(void *)&v46[10] = a3;
            _os_log_impl(&dword_1BBC88000, v44, OS_LOG_TYPE_ERROR, "Unknown property typeId %ld for name %@. Assume its a value type and proceed.", (uint8_t *)&Property, 0x16u);
          }
          goto LABEL_74;
        }
        uint64_t v18 = CalToManyRelationCopyObjects();
        if (!v18) {
          goto LABEL_68;
        }
        v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:CFArrayGetCount((CFArrayRef)v18)];
        CFIndex Count = CFArrayGetCount((CFArrayRef)v18);
        if (Count >= 1)
        {
          CFIndex v41 = Count;
          for (CFIndex i = 0; i != v41; ++i)
          {
            CFArrayGetValueAtIndex((CFArrayRef)v18, i);
            long long v43 = CADEntityCopyObjectIDUnlocked();
            if (v43) {
              [v39 addObject:v43];
            }
          }
        }
        *a4 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:v39];
        CFRelease((CFTypeRef)v18);
      }
    }
    uint64_t v18 = 0;
    goto LABEL_68;
  }
  uint64_t v18 = 1010;
LABEL_68:
  if (*v17) {
    os_unfair_lock_assert_owner(RecordLock);
  }
  os_unfair_lock_unlock(RecordLock);
LABEL_71:

  return v18;
}

uint64_t CADEventAccessTypeFromAuthStatus(uint64_t a1)
{
  if (a1 == 4) {
    return 1;
  }
  else {
    return 2 * (a1 == 3);
  }
}

uint64_t CalEntityGetPropertyIDFromName(int a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 1:
      return MEMORY[0x1F410E100](a2);
    case 2:
    case 3:
      return MEMORY[0x1F410E200](a2);
    case 4:
      return MEMORY[0x1F410DF70](a2);
    case 5:
      return MEMORY[0x1F410EB70](a2);
    case 6:
      return MEMORY[0x1F410ECC8](a2);
    case 7:
      return MEMORY[0x1F410E010](a2);
    case 8:
      return MEMORY[0x1F410EB20](a2);
    case 9:
      return MEMORY[0x1F410E788](a2);
    case 10:
      return MEMORY[0x1F410E9F0](a2);
    case 11:
      return MEMORY[0x1F410DFD0](a2);
    case 12:
    case 13:
    case 22:
    case 25:
    case 26:
    case 27:
      goto LABEL_9;
    case 14:
      return MEMORY[0x1F410EAC8](a2);
    case 15:
      return MEMORY[0x1F410EC30](a2);
    case 16:
    case 17:
    case 19:
      goto LABEL_2;
    case 18:
      return MEMORY[0x1F410EBD8](a2);
    case 20:
      return MEMORY[0x1F410EEC8](a2);
    case 21:
      return MEMORY[0x1F410E298](a2);
    case 23:
      return MEMORY[0x1F410E288](a2);
    case 24:
      return MEMORY[0x1F410E778](a2);
    case 28:
      return MEMORY[0x1F410EA88](a2);
    case 29:
      return MEMORY[0x1F410E270](a2);
    default:
      if (a1 == 102)
      {
LABEL_2:
        return MEMORY[0x1F410EAF8](a2);
      }
      else
      {
LABEL_9:
        BOOL v3 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          v5[0] = 67109378;
          v5[1] = a1;
          __int16 v6 = 2080;
          id v7 = "CalEntityGetPropertyIDFromName";
          _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_ERROR, "Invalid entity type [%d] passed to [%s].", (uint8_t *)v5, 0x12u);
        }
        return 0xFFFFFFFFLL;
      }
  }
}

uint64_t CalEntityCopyProperty(void *a1, uint64_t a2, void *a3, void *a4)
{
  return CalEntityCopyPropertyAllowingLimitedAccess(a1, a2, a3, a4, 0);
}

id CADEntityCopyObjectID()
{
  uint64_t Type = CalEntityGetType();
  uint64_t ID = CalEntityGetID();
  id v2 = 0;
  if ((int)Type >= 1 && (int)ID >= 1)
  {
    if (ID == 0x7FFFFFFF)
    {
      id v2 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:Type entityID:0x7FFFFFFFLL];
    }
    else
    {
      CalGetDatabaseForRecord();
      id v2 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:Type entityID:ID databaseID:CalDatabaseGetAuxilliaryDatabaseID()];
    }
  }
  return v2;
}

id CalFetchedObjectDictionary(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    if (a3)
    {
      v25[0] = @"entityType";
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInt:a1];
      v26[0] = v8;
      v25[1] = @"rowID";
      id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
      v26[1] = v9;
      v25[2] = @"dbID";
      v10 = [MEMORY[0x1E4F28ED0] numberWithInt:a3];
      v25[3] = @"values";
      v26[2] = v10;
      v26[3] = v7;
      char v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = v26;
      uint64_t v13 = v25;
      uint64_t v14 = 4;
LABEL_6:
      int v15 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:v14];

      goto LABEL_10;
    }
    v27[0] = @"entityType";
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInt:a1];
    v28[0] = v8;
    v27[1] = @"rowID";
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
    v27[2] = @"values";
    v28[1] = v9;
    v28[2] = v7;
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v17 = v28;
    uint64_t v18 = v27;
    uint64_t v19 = 3;
  }
  else
  {
    if (a3)
    {
      v21[0] = @"entityType";
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInt:a1];
      v22[0] = v8;
      v21[1] = @"rowID";
      id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
      v22[1] = v9;
      v21[2] = @"dbID";
      v10 = [MEMORY[0x1E4F28ED0] numberWithInt:a3];
      v22[2] = v10;
      char v11 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v12 = v22;
      uint64_t v13 = v21;
      uint64_t v14 = 3;
      goto LABEL_6;
    }
    v23[0] = @"entityType";
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInt:a1];
    v23[1] = @"rowID";
    v24[0] = v8;
    id v9 = [MEMORY[0x1E4F28ED0] numberWithInt:a2];
    v24[1] = v9;
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v17 = v24;
    uint64_t v18 = v23;
    uint64_t v19 = 2;
  }
  int v15 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
LABEL_10:

  return v15;
}

uint64_t CADEntityIsInRestrictedStore(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  int Type = CalEntityGetType();
  int v12 = Type;
  CFTypeRef v7 = owningEntity(a2, &v12);
  if (!v7 || (CalEntityIsVirtual() & 1) == 0)
  {
    if (v12 > 5)
    {
      if (v12 != 101)
      {
        if (v12 == 17)
        {
          uint64_t v9 = [v5 isNotificationRestricted:v7 forAction:a3];
          goto LABEL_14;
        }
        if (v12 == 6)
        {
          uint64_t v9 = [v5 isStoreRestricted:v7 forAction:a3];
          goto LABEL_14;
        }
LABEL_16:
        if (v7)
        {
          if ((CalEntityIsNew() & 1) == 0)
          {
            char v11 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              int v14 = v12;
              __int16 v15 = 1024;
              int v16 = Type;
              _os_log_impl(&dword_1BBC88000, v11, OS_LOG_TYPE_ERROR, "Internal error: missed entity type in CADEntityAccessIsDenied: %i (from original entityType %i)", buf, 0xEu);
            }
          }
        }
        goto LABEL_3;
      }
    }
    else if ((v12 - 2) >= 2)
    {
      if (v12 == 1)
      {
        uint64_t v9 = [v5 isCalendarRestricted:v7 forAction:a3];
LABEL_14:
        uint64_t v8 = v9;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    uint64_t v9 = [v5 isCalendarItemRestricted:v7 forAction:a3];
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v8 = 0;
LABEL_15:

  return v8;
}

CFTypeRef owningEntity(CFTypeRef a1, int *a2)
{
  int Type = CalEntityGetType();
  if (!a1)
  {
LABEL_27:
    if (a2) {
      goto LABEL_28;
    }
    return a1;
  }
  int v5 = -1;
  while (2)
  {
    switch(Type)
    {
      case 4:
        uint64_t v6 = CalAlarmCopyOwningEntity();
        goto LABEL_24;
      case 5:
        uint64_t v6 = CalRecurrenceCopyOwner();
        goto LABEL_24;
      case 6:
      case 12:
      case 13:
      case 22:
      case 26:
      case 27:
        goto LABEL_27;
      case 7:
      case 8:
        goto LABEL_23;
      case 9:
        uint64_t v6 = CalEventActionCopyOwningEvent();
        goto LABEL_24;
      case 10:
        uint64_t v6 = CalExceptionDateCopyOwner();
        goto LABEL_24;
      case 11:
        uint64_t v6 = CalAttachmentCopyOwner();
        goto LABEL_24;
      case 14:
        uint64_t v6 = CalLocationCopyOwner();
        goto LABEL_24;
      case 15:
        uint64_t v6 = CalShareeCopyOwner();
        goto LABEL_24;
      case 16:
      case 17:
      case 19:
        goto LABEL_7;
      case 18:
        uint64_t v7 = CalResourceChangeCopyNotification();
        if (v7)
        {
          uint64_t v8 = (const void *)v7;
          uint64_t v9 = (const void *)CalNotificationCopyOwner();
          CFRelease(v8);
LABEL_25:
          if (!v9) {
            goto LABEL_27;
          }
          a1 = CFAutorelease(v9);
          int Type = CalEntityGetType();
          if (++v5 >= 5) {
            goto LABEL_27;
          }
          continue;
        }
        int Type = 18;
        if (!a2) {
          return a1;
        }
LABEL_28:
        *a2 = Type;
        return a1;
      case 20:
        uint64_t v6 = CalSuggestedEventInfoCopyOwner();
        goto LABEL_24;
      case 21:
        uint64_t v6 = CalContactCopyOwner();
        goto LABEL_24;
      case 23:
        uint64_t v6 = CalConferenceCopyOwner();
        goto LABEL_24;
      case 24:
        uint64_t v6 = CalErrorCopyOwner();
        goto LABEL_24;
      case 25:
        uint64_t v6 = CalAttachmentFileCopyStore();
        goto LABEL_24;
      case 28:
        uint64_t v6 = CalImageCopyStore();
        goto LABEL_24;
      case 29:
        uint64_t v6 = CalColorCopyStore();
        goto LABEL_24;
      default:
        if (Type == 100)
        {
LABEL_23:
          uint64_t v6 = CalParticipantCopyOwner();
        }
        else
        {
          if (Type != 102) {
            goto LABEL_27;
          }
LABEL_7:
          uint64_t v6 = CalNotificationCopyOwner();
        }
LABEL_24:
        uint64_t v9 = (const void *)v6;
        goto LABEL_25;
    }
  }
}

uint64_t CalAuthorizationStatusFromTCCAuthRight(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t result = 3;
  switch(a2)
  {
    case 0:
      if (TCCAccessRestricted()) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = 2;
      }
      break;
    case 1:
      uint64_t result = TCCAccessRestricted() != 0;
      break;
    case 2:
      return result;
    case 4:
      uint64_t result = 4;
      break;
    default:
      v4 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        int v5 = 134217984;
        uint64_t v6 = a2;
        _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_ERROR, "Unexpected tcc_authorization_right_t (int value: %llu): we don't support this kind of authorization.", (uint8_t *)&v5, 0xCu);
      }
      uint64_t result = 2;
      break;
  }
  return result;
}

uint64_t CADEntityExistsInDatabaseAndIsAccessible(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = CADCopyEntityInDatabase(a1, a3);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = CADEntityIsInRestrictedStore(v7, v8, a4) ^ 1;
    CFRelease(v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id CADEntityCopyObjectIDUnlocked()
{
  uint64_t Type = _CalEntityGetType();
  uint64_t ID = CPRecordGetID();
  id v2 = 0;
  if ((int)Type >= 1 && (int)ID >= 1)
  {
    CalGetDatabaseForRecord();
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F57428]) initWithEntityType:Type entityID:ID databaseID:CalDatabaseGetAuxilliaryDatabaseID()];
  }
  return v2;
}

uint64_t CreateFilterFromRowIDs(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ([v3 count])
  {
    int v5 = [MEMORY[0x1E4F1CA80] set];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v11, (void)v15) & 1) == 0) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    uint64_t v12 = CalFilterCreateWithDatabaseShowingCalendarsWithUIDsAndEntityType();
  }
  else
  {
    if ([v4 count])
    {
      [v4 allObjects];
      uint64_t v13 = CalFilterCreateWithDatabaseFilteringCalendarsWithUIDs();
    }
    else
    {
      uint64_t v13 = CalFilterCreateWithDatabaseShowingAll();
    }
    uint64_t v12 = v13;
  }

  return v12;
}

const void *CADCopyEntityInDatabase(uint64_t a1, void *a2)
{
  id v3 = (os_unfair_lock_s *)(a1 + 80);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  int v5 = (const void *)_CADGetEntity(a1, v4);

  if (v5) {
    CFRetain(v5);
  }
  if (*MEMORY[0x1E4F56A58]) {
    os_unfair_lock_assert_owner(v3);
  }
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t _CADGetEntity(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  _CalDatabaseGetRecordStore();
  int v3 = [v2 entityType];
  uint64_t v4 = 0;
  switch(v3)
  {
    case -1:
      goto LABEL_4;
    case 0:
    case 13:
    case 22:
    case 26:
    case 27:
      goto LABEL_33;
    case 1:
      if ([v2 isVirtual])
      {
        uint64_t LimitedAccessVirtualCalendar = _CalDatabaseGetLimitedAccessVirtualCalendar();
      }
      else
      {
        [v2 entityID];
        uint64_t LimitedAccessVirtualCalendar = _CalGetCalendarWithUID();
      }
      goto LABEL_32;
    case 2:
    case 3:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalGetCalendarItemWithRowID();
      goto LABEL_32;
    case 4:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalAlarmGetWithUID();
      goto LABEL_32;
    case 5:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalRecurrenceGetWithUID();
      goto LABEL_32;
    case 6:
      if ([v2 isVirtual])
      {
        uint64_t LimitedAccessVirtualCalendar = _CalDatabaseGetLimitedAccessVirtualStore();
      }
      else
      {
        [v2 entityID];
        uint64_t LimitedAccessVirtualCalendar = _CalGetStoreWithUID();
      }
      goto LABEL_32;
    case 7:
    case 8:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalParticipantGetWithUID();
      goto LABEL_32;
    case 9:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalEventActionGetWithUID();
      goto LABEL_32;
    case 10:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalExceptionDateGetWithUID();
      goto LABEL_32;
    case 11:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalAttachmentGetWithUID();
      goto LABEL_32;
    case 12:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalCategoryGetWithUID();
      goto LABEL_32;
    case 14:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalLocationGetWithUID();
      goto LABEL_32;
    case 15:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalShareeGetWithUID();
      goto LABEL_32;
    case 16:
    case 17:
    case 19:
      goto LABEL_9;
    case 18:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalResourceChangeGetWithUID();
      goto LABEL_32;
    case 20:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalSuggestedEventInfoGetWithUID();
      goto LABEL_32;
    case 21:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalContactGetWithUID();
      goto LABEL_32;
    case 23:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalConferenceGetWithUID();
      goto LABEL_32;
    case 24:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalErrorGetWithUID();
      goto LABEL_32;
    case 25:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalAttachmentFileGetWithUID();
      goto LABEL_32;
    case 28:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalImageGetWithUID();
      goto LABEL_32;
    case 29:
      [v2 entityID];
      uint64_t LimitedAccessVirtualCalendar = _CalColorGetWithUID();
      goto LABEL_32;
    default:
      if ((v3 - 100) >= 2)
      {
        if (v3 == 102)
        {
LABEL_9:
          [v2 entityID];
          uint64_t LimitedAccessVirtualCalendar = _CalNotificationGetWithUID();
LABEL_32:
          uint64_t v4 = LimitedAccessVirtualCalendar;
        }
      }
      else
      {
LABEL_4:
        id v6 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = v6;
          v9[0] = 67109120;
          v9[1] = [v2 entityType];
          _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_ERROR, "Unknown entity type in CADCopyEntity (type = %i)", (uint8_t *)v9, 8u);
        }
        uint64_t v4 = 0;
      }
LABEL_33:

      return v4;
  }
}

void sub_1BBC920F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC92330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CADEKPersistentEventDefaultPropertiesToLoad()
{
  v17[31] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56D00];
  v17[0] = *MEMORY[0x1E4F57150];
  v17[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F57028];
  v17[2] = *MEMORY[0x1E4F56FB0];
  v17[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56C20];
  v17[4] = *MEMORY[0x1E4F56D38];
  v17[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F56C88];
  v17[6] = *MEMORY[0x1E4F56C90];
  v17[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F56C38];
  v17[8] = *MEMORY[0x1E4F56C60];
  v17[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F56BF0];
  v17[10] = *MEMORY[0x1E4F56D08];
  v17[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F56C30];
  v17[12] = *MEMORY[0x1E4F56D40];
  v17[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F56F60];
  v17[14] = *MEMORY[0x1E4F56C28];
  v17[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F56D10];
  v17[16] = *MEMORY[0x1E4F56BB0];
  v17[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F57000];
  v17[18] = *MEMORY[0x1E4F57040];
  v17[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F57008];
  v17[20] = *MEMORY[0x1E4F56BC0];
  v17[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F56D30];
  v17[22] = *MEMORY[0x1E4F56FE8];
  v17[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F56D20];
  v17[24] = *MEMORY[0x1E4F56F68];
  v17[25] = v12;
  uint64_t v13 = *MEMORY[0x1E4F56C68];
  v17[26] = *MEMORY[0x1E4F56F88];
  v17[27] = v13;
  uint64_t v14 = *MEMORY[0x1E4F56C18];
  v17[28] = *MEMORY[0x1E4F57020];
  v17[29] = v14;
  v17[30] = *MEMORY[0x1E4F56FF0];
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:31];
  return v15;
}

uint64_t CalGetEntityIDFromFetchedObjectDictonary(void *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  if (!a1) {
    return 0;
  }
  id v7 = a1;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"entityType"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"rowID"];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"dbID"];

  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    if (a2) {
      *a2 = [v8 intValue];
    }
    if (a3) {
      *a3 = [v9 intValue];
    }
    if (a4) {
      *a4 = [v10 intValue];
    }
  }

  return v12;
}

void sub_1BBC94F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 168));
  objc_destroyWeak((id *)(v15 - 160));
  _Unwind_Resume(a1);
}

id GetSharedXPCInterfaceForCADInterface()
{
  if (GetSharedXPCInterfaceForCADInterface_onceToken != -1) {
    dispatch_once(&GetSharedXPCInterfaceForCADInterface_onceToken, &__block_literal_global_14);
  }
  uint64_t v0 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  return v0;
}

id GetSharedXPCInterfaceForCADClientInterface()
{
  if (GetSharedXPCInterfaceForCADClientInterface_onceToken != -1) {
    dispatch_once(&GetSharedXPCInterfaceForCADClientInterface_onceToken, &__block_literal_global_355);
  }
  uint64_t v0 = (void *)GetSharedXPCInterfaceForCADClientInterface____clientInterface;
  return v0;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_1BBC97908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 232), 8);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Block_object_dispose((const void *)(v28 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC98A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC98F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC99588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC99CB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC99F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9A670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BBC9B388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CADAccountManagementFromSource(uint64_t a1)
{
  if (a1 >= 3)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v2 = *MEMORY[0x1E4F1C3C8];
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a1];
    [v1 raise:v2, @"Invalid source account management value: [%@]", v3 format];
  }
}

void sub_1BBC9D298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9D404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void sub_1BBC9D554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9D6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9D824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9DAF0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9DDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9DFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9E368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC9E55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9E938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9EC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9EDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t CADObjectPassedOrSkippedAccessCheck(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 eventAccessLevel];
  if (v4)
  {
    if (v4 == 1) {
      uint64_t v5 = [v3 isVirtual];
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1BBC9F1E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC9F808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void __GetSharedXPCInterfaceForCADClientInterface_block_invoke()
{
  _DWORD v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1530DD0];
  uint64_t v1 = (void *)GetSharedXPCInterfaceForCADClientInterface____clientInterface;
  GetSharedXPCInterfaceForCADClientInterface____clientInterface = v0;

  uint64_t v2 = [(id)GetSharedXPCInterfaceForCADClientInterface____clientInterface classesForSelector:sel_CADClientReceiveDiagnosticsCollectionResults_forToken_finished_ argumentIndex:0 ofReply:0];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  int v4 = [v2 setByAddingObjectsFromArray:v3];
  [(id)GetSharedXPCInterfaceForCADClientInterface____clientInterface setClasses:v4 forSelector:sel_CADClientReceiveDiagnosticsCollectionResults_forToken_finished_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADClientInterface____clientInterface setClasses:v4 forSelector:sel_CADClientReceiveOccurrenceCacheSearchResults_forSearchToken_finished_ argumentIndex:0 ofReply:0];
}

void __GetSharedXPCInterfaceForCADInterface_block_invoke()
{
  v25[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1530CE0];
  uint64_t v1 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  GetSharedXPCInterfaceForCADInterface___remoteInterface = v0;

  uint64_t v24 = [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface classesForSelector:sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_ argumentIndex:1 ofReply:0];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  void v25[4] = objc_opt_class();
  v25[5] = objc_opt_class();
  v25[6] = objc_opt_class();
  v25[7] = objc_opt_class();
  CFTypeID v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:8];
  uint64_t v2 = [v24 setByAddingObjectsFromArray:v23];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADObject_getRelatedObjectsWithRelationName_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADObjectsExist_reply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADObjectsExist_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply_ argumentIndex:3 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseExportICSDataForCalendarItems_options_reply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_ argumentIndex:1 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADEventSetInvitationStatus_forEvents_error_ argumentIndex:1 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply_ argumentIndex:2 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply_ argumentIndex:1 ofReply:1];
  id v3 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  int v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:sel_CADDatabaseSetInitializationOptions_reply_ argumentIndex:0 ofReply:0];

  uint64_t v5 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  [v5 setClasses:v10 forSelector:sel_CADDatabaseConsumeAllChangesUpToToken_except_reply_ argumentIndex:1 ofReply:0];

  uint64_t v11 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
  [v11 setClasses:v16 forSelector:sel_CADDatabaseMarkIndividualChangesConsumed_reply_ argumentIndex:0 ofReply:0];

  long long v17 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  long long v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
  [v17 setClasses:v22 forSelector:sel_CADDatabaseFetchChangedObjectIDs_ argumentIndex:3 ofReply:1];

  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply_ argumentIndex:1 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADSourceGetGrantedDelegatesList_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetAllEventsWithUniqueID_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADObjects_getPropertiesWithNames_reply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADObjects_getPropertiesWithNames_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetSourcesWithFaultedProperties_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetCalendarsWithFaultedProperties_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply_ argumentIndex:0 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADOccurrenceCacheSearchWithTerm_inCalendars_responseToken_reply_ argumentIndex:1 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADOccurrenceCacheSearchLocationsWithTerm_inCalendars_responseToken_reply_ argumentIndex:1 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetEventsWithErrorsPerSource_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetSharedCalendarInvitationsWithReply_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetResourceChanges_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetInviteReplyNotifications_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetEventNotificationItemsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_reply_ argumentIndex:2 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetNotificationCountForSourceWithExternalIdentifier_excludingDelegateSources_filteredByShowsNotificationsFlag_expanded_reply_ argumentIndex:2 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetInboxRepliedSectionItems_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADOccurrenceCacheSearchLocationsWithTerm_inCalendars_responseToken_reply_ argumentIndex:1 ofReply:0];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetDeletableCalendars_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseGetDeletableSources_ argumentIndex:1 ofReply:1];
  [(id)GetSharedXPCInterfaceForCADInterface___remoteInterface setClasses:v2 forSelector:sel_CADDatabaseLoadEventsInCalendar_reply_ argumentIndex:1 ofReply:1];
}

void sub_1BBCA0664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBCA13E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t _minimumAuthStatus(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 2;
      if (a1 != 2)
      {
        uint64_t v4 = 4;
        BOOL v5 = a2 == 3 || a1 == 3;
        uint64_t v6 = 3;
        if (!v5) {
          uint64_t v6 = 0;
        }
        if (a2 == 4) {
          uint64_t v6 = 4;
        }
        if (a1 != 4) {
          uint64_t v4 = v6;
        }
        if (a2 == 1) {
          uint64_t v4 = 1;
        }
        if (a1 == 1) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = v4;
        }
        if (a2 != 2) {
          return v7;
        }
      }
    }
  }
  return result;
}

void sub_1BBCA63BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA6760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA68F0(_Unwind_Exception *a1)
{
}

void sub_1BBCA6910(void *a1)
{
}

void sub_1BBCA6C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA7058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___auditTokenForCurrentProcess_block_invoke()
{
  kern_return_t v0;
  int v1;
  NSObject *v2;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  uint64_t v0 = task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)&_auditTokenForCurrentProcess_token, &task_info_outCnt);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_FAULT)) {
      ___auditTokenForCurrentProcess_block_invoke_cold_1(v1, v2);
    }
  }
}

uint64_t ___processIdentifierForCurrentProcess_block_invoke()
{
  uint64_t result = getpid();
  _processIdentifierForCurrentProcess_pid = result;
  return result;
}

void sub_1BBCA72FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBCA8694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA8F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA9570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA98F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA9CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCAA108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCAA45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCAA638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCAAC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCABC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCABE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t CADSourceFromAccountManagement(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >= 3)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
    [v2 raise:v3, @"Invalid account management value: [%@]", v4 format];
  }
  return v1;
}

unint64_t CADTargetFromAccountManagement(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >= 3)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v3 = *MEMORY[0x1E4F1C3C8];
    uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a1];
    [v2 raise:v3, @"Invalid account management value: [%@]", v4 format];
  }
  return v1;
}

void CADAccountManagementFromTarget(uint64_t a1)
{
  if (a1 >= 3)
  {
    unint64_t v1 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v2 = *MEMORY[0x1E4F1C3C8];
    uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a1];
    [v1 raise:v2, @"Invalid target account management value: [%@]", v3 format];
  }
}

void CADStatsRegisterCollectionCallback(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&statsCollectionCallbacksLock);
  BOOL v5 = (void *)statsCollectionCallbacks;
  if (!statsCollectionCallbacks)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = (void *)statsCollectionCallbacks;
    statsCollectionCallbacks = v6;

    BOOL v5 = (void *)statsCollectionCallbacks;
  }
  uint64_t v8 = [CADStatsCallback alloc];
  uint64_t v9 = (void *)[v3 copy];

  uint64_t v10 = [(CADStatsCallback *)v8 initWithEventName:v4 callback:v9];
  [v5 addObject:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&statsCollectionCallbacksLock);
}

void CADStatsCollectWithAllStatCollectorsAndContext(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  createStatsInstances(1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  CADStatsCollectWithStatCollectorsAndContext(v5, v4, v3);
}

void CADStatsCollectWithStatCollectorsAndContext(void *a1, void *a2, void *a3)
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  mach_absolute_time();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  v121 = objc_opt_new();
  v120 = objc_opt_new();
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v157 objects:v168 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v158;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v158 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v157 + 1) + 8 * i);
        [v16 prepareWithContext:v6];
        if ([v16 wantsStores]) {
          [v8 addObject:v16];
        }
        if ([v16 wantsCalendars]) {
          [v9 addObject:v16];
        }
        if ([v16 wantsOccurrences]) {
          [v10 addObject:v16];
        }
        if ([v16 wantsEvents]) {
          [v121 addObject:v16];
        }
        if ([v16 wantsReminders]) {
          [v120 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v157 objects:v168 count:16];
    }
    while (v13);
  }

  [v6 database];
  v115 = v10;
  v116 = v8;
  v119 = v9;
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    long long v17 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_DEBUG, "Collecting statistics about stores and calendars.", buf, 2u);
    }
    CFArrayRef v18 = (const __CFArray *)CalDatabaseCopyOfAllStores();
    if (v18)
    {
      CFArrayRef v19 = v18;
      CFTypeRef cf = v7;
      CFIndex Count = CFArrayGetCount(v18);
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id v20 = v8;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v153 objects:v167 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v154;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v154 != v23) {
              objc_enumerationMutation(v20);
            }
            [*(id *)(*((void *)&v153 + 1) + 8 * j) processStores:v19];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v153 objects:v167 count:16];
        }
        while (v22);
      }

      if (Count >= 1)
      {
        for (CFIndex k = 0; k != Count; ++k)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v19, k);
          uint64_t v27 = (const void *)CalStoreCopyCalendars();
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          id v28 = v9;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v149 objects:v166 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v150;
            do
            {
              for (uint64_t m = 0; m != v30; ++m)
              {
                if (*(void *)v150 != v31) {
                  objc_enumerationMutation(v28);
                }
                [*(id *)(*((void *)&v149 + 1) + 8 * m) processCalendars:v27 inStore:ValueAtIndex];
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v149 objects:v166 count:16];
            }
            while (v30);
          }

          if (v27) {
            CFRelease(v27);
          }
          uint64_t v9 = v119;
        }
      }
      CFRelease(v19);
      id v7 = (id)cf;
      uint64_t v10 = v115;
      uint64_t v8 = v116;
    }
  }
  else
  {
    v105 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v105, OS_LOG_TYPE_DEBUG, "Skipping statistics for stores and calendars because nobody's interested.", buf, 2u);
    }
  }
  Mutable = CFArrayCreateMutable(0, 1, MEMORY[0x1E4F1D510]);
  v34 = (const void *)CalDatabaseCopyBirthdayCalendar();
  if (v34)
  {
    uint64_t v35 = v34;
    CFArrayAppendValue(Mutable, v34);
    CFRelease(v35);
  }
  id v36 = CFArrayCreateMutable(0, 1, MEMORY[0x1E4F1D510]);
  uint64_t v37 = CalDatabaseCopyStoreWithExternalID();
  if (v37)
  {
    id v38 = (const void *)v37;
    v39 = (const void *)CalDatabaseCopyCalendarWithExternalIDInStore();
    if (v39)
    {
      long long v40 = v39;
      CFArrayAppendValue(v36, v39);
      CFArrayAppendValue(Mutable, v40);
      CFRelease(v40);
    }
    CFRelease(v38);
  }
  uint64_t v118 = CalFilterCreateWithDatabaseFilteringCalendars();
  CFRelease(Mutable);
  CFTypeRef cfa = (CFTypeRef)CalFilterCreateWithDatabaseShowingCalendars();
  CFRelease(v36);
  uint64_t v41 = [v10 count];
  long long v42 = CADLogHandle;
  BOOL v43 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
  if (v41)
  {
    if (v43)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v42, OS_LOG_TYPE_DEBUG, "Collecting statistics about occurrences.", buf, 2u);
    }
    v111 = (const void *)CalDatabaseCopyEventOccurrenceCache();
    long long v44 = (void *)CalEventOccurrenceCacheCopyTimeZone();
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v45 = v10;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v145 objects:v165 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      v107 = v44;
      id v48 = 0;
      uint64_t v49 = *(void *)v146;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v146 != v49) {
            objc_enumerationMutation(v45);
          }
          uint64_t v51 = [*(id *)(*((void *)&v145 + 1) + 8 * n) desiredOccurrenceRange];
          v52 = v51;
          if (v51)
          {
            if (v48)
            {
              uint64_t v53 = [v48 unionRange:v51];

              id v48 = (id)v53;
            }
            else
            {
              id v48 = v51;
            }
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v145 objects:v165 count:16];
      }
      while (v47);

      long long v44 = v107;
      if (v48) {
        goto LABEL_69;
      }
    }
    else
    {
    }
    id v55 = objc_alloc(MEMORY[0x1E4F57838]);
    v56 = [MEMORY[0x1E4F1C9C8] date];
    v108 = (void *)[v55 initWithDate:v56 timeZone:v44];

    v106 = [v108 calendarDateByAddingDays:-1];
    v57 = [v108 calendarDateByAddingDays:365];
    v58 = v44;
    id v59 = objc_alloc(MEMORY[0x1E4F576D0]);
    v60 = [v106 date];
    v61 = [v57 date];
    v62 = v59;
    long long v44 = v58;
    id v48 = (id)[v62 initWithStartDate:v60 endDate:v61];

LABEL_69:
    v63 = [v48 startDate];
    v64 = [v48 endDate];
    uint64_t v140 = MEMORY[0x1E4F143A8];
    uint64_t v141 = 3221225472;
    v142 = __CADStatsCollectWithStatCollectorsAndContext_block_invoke;
    v143 = &unk_1E624DDA0;
    id v144 = v45;
    v54 = (const void *)v118;
    CalEventOccurrenceCacheProcessEventOccurrencesInDateRange();

    CalDatabaseReset();
    CFRelease(v111);

    uint64_t v8 = v116;
    goto LABEL_70;
  }
  v54 = (const void *)v118;
  if (v43)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v42, OS_LOG_TYPE_DEBUG, "Skipping statistics about occurrences because nobody's interested.", buf, 2u);
  }
LABEL_70:
  uint64_t v65 = [v121 count];
  v66 = CADLogHandle;
  BOOL v67 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
  if (v65)
  {
    if (v67)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v66, OS_LOG_TYPE_DEBUG, "Collecting statistics about events.", buf, 2u);
    }
    uint64_t v135 = MEMORY[0x1E4F143A8];
    uint64_t v136 = 3221225472;
    v137 = __CADStatsCollectWithStatCollectorsAndContext_block_invoke_62;
    v138 = &unk_1E624DDA0;
    id v139 = v121;
    CalDatabaseProcessEventsWithCalendarFilter();
  }
  else if (v67)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v66, OS_LOG_TYPE_DEBUG, "Skipping statistics about events because nobody's interested.", buf, 2u);
  }
  uint64_t v68 = [v120 count];
  v69 = CADLogHandle;
  BOOL v70 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
  if (v68)
  {
    if (v70)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v69, OS_LOG_TYPE_DEBUG, "Collecting statistics about reminders.", buf, 2u);
    }
    v112 = (const void *)CalDatabaseCopyEventOccurrenceCache();
    v71 = (void *)CalEventOccurrenceCacheCopyTimeZone();
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id v72 = v120;
    uint64_t v73 = [v72 countByEnumeratingWithState:&v131 objects:v164 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      v109 = v71;
      id v75 = 0;
      uint64_t v76 = *(void *)v132;
      do
      {
        for (iuint64_t i = 0; ii != v74; ++ii)
        {
          if (*(void *)v132 != v76) {
            objc_enumerationMutation(v72);
          }
          v78 = [*(id *)(*((void *)&v131 + 1) + 8 * ii) desiredReminderRange];
          v79 = v78;
          if (v78)
          {
            if (v75)
            {
              uint64_t v80 = [v75 unionRange:v78];

              id v75 = (id)v80;
            }
            else
            {
              id v75 = v78;
            }
          }
        }
        uint64_t v74 = [v72 countByEnumeratingWithState:&v131 objects:v164 count:16];
      }
      while (v74);

      v54 = (const void *)v118;
      v71 = v109;
      if (v75) {
        goto LABEL_96;
      }
    }
    else
    {
    }
    id v82 = objc_alloc(MEMORY[0x1E4F57838]);
    v83 = [MEMORY[0x1E4F1C9C8] date];
    v110 = (void *)[v82 initWithDate:v83 timeZone:v71];

    v84 = [v110 calendarDateByAddingDays:-1];
    v85 = [v110 calendarDateByAddingDays:14];
    v86 = v71;
    id v87 = objc_alloc(MEMORY[0x1E4F576D0]);
    v88 = [v84 date];
    v89 = [v85 date];
    v90 = v87;
    v71 = v86;
    id v75 = (id)[v90 initWithStartDate:v88 endDate:v89];

    v54 = (const void *)v118;
LABEL_96:
    v91 = [v75 startDate];
    v92 = [v75 endDate];
    uint64_t v126 = MEMORY[0x1E4F143A8];
    uint64_t v127 = 3221225472;
    v128 = __CADStatsCollectWithStatCollectorsAndContext_block_invoke_63;
    v129 = &unk_1E624DDA0;
    id v130 = v72;
    v81 = cfa;
    CalEventOccurrenceCacheProcessEventOccurrencesInDateRange();

    CalDatabaseReset();
    CFRelease(v112);

    uint64_t v8 = v116;
    goto LABEL_97;
  }
  v81 = cfa;
  if (v70)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v69, OS_LOG_TYPE_DEBUG, "Skipping statistics about reminders because nobody's interested.", buf, 2u);
  }
LABEL_97:
  CFRelease(v81);
  CFRelease(v54);
  mach_absolute_time();
  CalAnalyticsTimeIntervalFromMachTimes();
  uint64_t v94 = v93;
  v95 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v163 = v94;
    _os_log_impl(&dword_1BBC88000, v95, OS_LOG_TYPE_INFO, "Finished collecting stats in [%f] seconds", buf, 0xCu);
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v96 = v11;
  uint64_t v97 = [v96 countByEnumeratingWithState:&v122 objects:v161 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v123;
    do
    {
      for (juint64_t j = 0; jj != v98; ++jj)
      {
        if (*(void *)v123 != v99) {
          objc_enumerationMutation(v96);
        }
        v101 = *(void **)(*((void *)&v122 + 1) + 8 * jj);
        v102 = [v101 eventDictionaries];
        v103 = [v101 eventName];
        if ([v102 count]) {
          BOOL v104 = v103 == 0;
        }
        else {
          BOOL v104 = 1;
        }
        if (!v104) {
          [v7 setObject:v102 forKeyedSubscript:v103];
        }
      }
      uint64_t v98 = [v96 countByEnumeratingWithState:&v122 objects:v161 count:16];
    }
    while (v98);
  }
}

id createStatsInstances(char a1)
{
  v28[6] = *MEMORY[0x1E4F143B8];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  void v28[4] = objc_opt_class();
  v28[5] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];
  id v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((a1 & 1) != 0 || [*(id *)(*((void *)&v22 + 1) + 8 * i) enabled])
        {
          uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "alloc"), "init");
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  os_unfair_lock_lock((os_unfair_lock_t)&statsCollectionCallbacksLock);
  id v11 = objc_msgSend((id)statsCollectionCallbacks, "copy", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&statsCollectionCallbacksLock);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * j);
        if ((a1 & 1) != 0 || [*(id *)(*((void *)&v18 + 1) + 8 * j) enabled]) {
          [v3 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  return v3;
}

void __CADStatsCollectWithStatCollectorsAndContext_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "processOccurrences:", a2, (void)v9);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_ERROR, "null array passed to processing block", buf, 2u);
    }
  }
}

void __CADStatsCollectWithStatCollectorsAndContext_block_invoke_62(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "processEvents:", a2, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __CADStatsCollectWithStatCollectorsAndContext_block_invoke_63(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "processReminders:", a2, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void CADStatsCollect()
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = createStatsInstances(0);
  if ([v0 count])
  {
    unint64_t v1 = objc_opt_new();
    uint64_t v14 = objc_alloc_init(CADStatCollectionContext);
    CADStatsCollectWithStatCollectorsAndContext(v0, v14, v1);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v20;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v20 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = [v2 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * v6)];
          long long v8 = v7;
          if (v7)
          {
            long long v17 = 0u;
            long long v18 = 0u;
            long long v15 = 0u;
            long long v16 = 0u;
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v24 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v16;
              do
              {
                uint64_t v12 = 0;
                do
                {
                  if (*(void *)v16 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  CalAnalyticsSendEvent();
                  ++v12;
                }
                while (v10 != v12);
                uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v24 count:16];
              }
              while (v10);
            }
          }

          ++v6;
        }
        while (v6 != v4);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_DEBUG, "Not running stats collection because all events are disabled", buf, 2u);
    }
  }
}

void CalRequestAuthorizationForServiceWithCompletion(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a5;
  if (_getTCCServer_onceToken != -1) {
    dispatch_once(&_getTCCServer_onceToken, &__block_literal_global_6);
  }
  id v10 = (id)_getTCCServer_server;
  uint64_t v11 = (void *)tcc_message_options_create();
  uint64_t v12 = tcc_service_singleton_for_CF_name();
  uint64_t v13 = (void *)v12;
  if (v7 && v10 && v11 && v12)
  {
    tcc_message_options_set_client_dict();
    tcc_message_options_set_reply_handler_policy();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __CalRequestAuthorizationForServiceWithCompletion_block_invoke;
    v16[3] = &unk_1E624DDC8;
    id v17 = v9;
    uint64_t v14 = (void *)MEMORY[0x1C1867AB0](v16);
    tcc_server_message_request_authorization_change();
  }
  else
  {
    long long v15 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v15, OS_LOG_TYPE_ERROR, "Failed to init at least one tcc parameter.", buf, 2u);
    }
    (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, 1, 1015);
  }
}

void __CalRequestAuthorizationForServiceWithCompletion_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    uint64_t v7 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = a3;
      id v8 = "Failed to request TCC server authorization change: %@";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_4:
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t authorization_right = tcc_authorization_record_get_authorization_right();
      goto LABEL_8;
    }
    uint64_t v12 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      id v8 = "Received a null authorization record";
      id v9 = v12;
      uint32_t v10 = 2;
      goto LABEL_4;
    }
  }
  uint64_t authorization_right = 1;
LABEL_8:
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), authorization_right);
}

uint64_t ___getTCCServer_block_invoke()
{
  uint64_t v0 = tcc_server_create();
  _getTCCServer_server = v0;
  return MEMORY[0x1F41817F8](v0);
}

void sub_1BBCB2A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB2CEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB30C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB3738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 232), 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB4848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB4AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB4F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB5CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

BOOL _shouldSaveCallback(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = _occurrenceIDForComponent(a1);
  uint64_t v6 = [v4 objectForKey:v5];

  return v6 != 0;
}

id _copyExternalIDCallback(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _occurrenceIDForComponent(a1);
  id v5 = [v3 objectForKey:v4];

  uint64_t v6 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v6) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

void sub_1BBCB6CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB6EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB72D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB771C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB8D44(_Unwind_Exception *a1)
{
}

void _recursivelyFindAndReplacePropertyFromRebasedObject(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  uint64_t v14 = [v11 objectForKeyedSubscript:v10];
  uint64_t v15 = [v14 valueForKey:v12];

  if (!v15)
  {
    long long v16 = [v11 objectForKeyedSubscript:v10];
    uint64_t v17 = *MEMORY[0x1E4F57168];
    id v18 = [v16 valueForKey:*MEMORY[0x1E4F57168]];

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__1;
    uint64_t v37 = __Block_byref_object_dispose__1;
    id v38 = 0;
    if (v18)
    {
      do
      {
        long long v19 = [v11 objectForKeyedSubscript:v18];
        uint64_t v20 = [v19 valueForKey:v12];
        long long v21 = (void *)v34[5];
        v34[5] = v20;

        if (v34[5]) {
          break;
        }
        if (![v18 isTemporary])
        {
          if (!v34[5])
          {
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = ___recursivelyFindAndReplacePropertyFromRebasedObject_block_invoke;
            v26[3] = &unk_1E624E200;
            id v18 = v18;
            id v27 = v18;
            uint64_t v31 = &v39;
            id v28 = v9;
            id v29 = v12;
            v32 = &v33;
            id v30 = v10;
            [v28 withDatabaseForObject:v18 perform:v26];
          }
          break;
        }
        long long v22 = [v11 objectForKeyedSubscript:v18];
        uint64_t v23 = [v22 valueForKey:v17];

        id v18 = (id)v23;
      }
      while (v23);
    }
    if (v34[5] && !*((_DWORD *)v40 + 6))
    {
      long long v24 = [v13 objectForKeyedSubscript:v10];
      long long v25 = (void *)[v24 mutableCopy];

      [v13 setObject:v25 forKeyedSubscript:v10];
      [v25 setObject:v34[5] forKeyedSubscript:v12];
    }
    _Block_object_dispose(&v33, 8);
  }
  _Block_object_dispose(&v39, 8);
}

void sub_1BBCB918C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCBA158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t _CADGetExistingOrInsertedEntity(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  if ([v6 isTemporary])
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    id v6 = (id)v7;
  }
  else
  {
    uint64_t v7 = _CADGetEntity(a1, v6);
  }

  return v7;
}

void sub_1BBCBB9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id convertDefaultValueToNil(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v1 doubleValue], v2 == 0.0)) {
    id v3 = 0;
  }
  else {
    id v3 = v1;
  }

  return v3;
}

void sub_1BBCBCA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCBD1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCBD414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCBD600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id _occurrenceIDForComponent(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    id v3 = [v2 uid];
    id v4 = objc_msgSend(v2, "recurrence_id");
    id v5 = [v4 value];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 icsString];
      id v8 = [NSString stringWithFormat:@"%@/%@", v3, v7];
    }
    else
    {
      id v8 = v3;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void ___handleNewCreatedEvents_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = MEMORY[0x1C1865800](a3, [*(id *)(a1 + 32) entityID]);
  if (v4)
  {
    id v5 = (const void *)v4;
    uint64_t v6 = CalCalendarItemCopyCalendar();
    if (v6)
    {
      uint64_t v7 = (const void *)v6;
      uint64_t v8 = CADEntityCopyObjectID();
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      CFRelease(v7);
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1008;
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1010;
  }
}

void ___recursivelyFindAndReplacePropertyFromRebasedObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CADCopyEntityInDatabase(a3, *(void **)(a1 + 32));
  if (v4)
  {
    id v5 = v4;
    uint64_t v13 = 0;
    if (CalEntityCopyPropertyAllowingLimitedAccess(*(void **)(a1 + 40), (uint64_t)v4, *(void **)(a1 + 48), &v13, 1))BOOL v6 = 1; {
    else
    }
      BOOL v6 = v13 == 0;
    if (v6)
    {
      uint64_t v7 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v9 = *(void *)(a1 + 56);
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_ERROR, "Error when retrieving %@ for rebased item %@ from %@", buf, 0x20u);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1008;
    }
    else
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v13;
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1010;
  }
}

void sub_1BBCBEEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void CADLogInitIfNeeded()
{
  if (CADLogInitIfNeeded_onceToken != -1) {
    dispatch_once(&CADLogInitIfNeeded_onceToken, &__block_literal_global_8);
  }
}

uint64_t __CADLogInitIfNeeded_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.calendar.daemon", "Daemon");
  id v1 = (void *)CADLogHandle;
  CADLogHandle = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.calendar.daemon", "ManagedConfiguration");
  id v3 = (void *)CADMCLogHandle;
  CADMCLogHandle = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.calendar.daemon", "Notification");
  id v5 = (void *)CADNotificationLogHandle;
  CADNotificationLogHandle = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.calendar.daemon", "Predicates");
  uint64_t v7 = (void *)CADPredicateSignpostsHandle;
  CADPredicateSignpostsHandle = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.calendar.daemon", "Spotlight");
  uint64_t v9 = (void *)CADSpotlightHandle;
  CADSpotlightHandle = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.calendar.daemon", "AppEntity");
  CADAppEntityHandle = (uint64_t)v10;
  return MEMORY[0x1F41817F8](v10);
}

void sub_1BBCBF968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC0014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC0448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC08C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC0C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC1D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCC30D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1BBCC3FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC4E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1BBCC6FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_2(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id getCADXPCProxyHelperLogHandle()
{
  if (getCADXPCProxyHelperLogHandle_onceToken != -1) {
    dispatch_once(&getCADXPCProxyHelperLogHandle_onceToken, &__block_literal_global_68);
  }
  os_log_t v0 = (void *)getCADXPCProxyHelperLogHandle_loggingHandle;
  return v0;
}

uint64_t __getCADXPCProxyHelperLogHandle_block_invoke()
{
  os_log_t v0 = os_log_create(CADCalendarLogSubsystem, "CADXPCProxyHelper");
  getCADXPCProxyHelperLogHandle_loggingHandle = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

__CFString *CalRedactString(int a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  switch(a1)
  {
    case 1:
      CalRedactURLString();
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2:
      ICSRedactString();
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 3:
      id v13 = 0;
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithICSString:v3 options:257 error:&v13];

      if (v7) {
        goto LABEL_6;
      }
      goto LABEL_12;
    case 4:
      uint64_t v7 = [MEMORY[0x1E4FB7EC8] parseableDocumentFromICS:v3 options:257];
      if (v7)
      {
LABEL_6:
        if (_sortICSDocuments) {
          uint64_t v8 = 20;
        }
        else {
          uint64_t v8 = 16;
        }
        uint64_t v9 = [v7 ICSStringWithOptions:v8];
        uint64_t v10 = v9;
        if (v9)
        {
          uint64_t v11 = v9;
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"[Parse failure: Failed to generate redacted ICS; original ICS had length %lu]",
            [v4 length]);
          uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        os_log_t v6 = v11;
      }
      else
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"[Parse failure: Bad ICS. %lu characters]", objc_msgSend(v4, "length"));
        os_log_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      break;
    case 5:
      uint64_t v5 = (__CFString *)v3;
LABEL_14:
      os_log_t v6 = v5;
      break;
    default:
      os_log_t v6 = @"<private>";
      break;
  }

  return v6;
}

uint64_t writeNextTaskHeader(FILE *a1, FILE *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __writeNextTaskHeader_block_invoke;
  v24[3] = &unk_1E624E9D8;
  v24[4] = &v29;
  v24[5] = &v33;
  v24[6] = &v37;
  v24[7] = &v25;
  uint64_t v4 = (void (**)(void))MEMORY[0x1C1867AB0](v24);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __writeNextTaskHeader_block_invoke_2;
  v23[3] = &unk_1E624EA00;
  v23[5] = &v37;
  v23[6] = a1;
  v23[4] = &v33;
  uint64_t v5 = (uint64_t (**)(void, void, void))MEMORY[0x1C1867AB0](v23);
  while (2)
  {
    switch(*((_DWORD *)v26 + 6))
    {
      case 0:
        if ((((uint64_t (**)(void, const char *, void))v5)[2](v5, "\nTask ", 0) & 1) == 0) {
          goto LABEL_25;
        }
        int v6 = 1;
        goto LABEL_23;
      case 1:
        int v10 = fgetc(a1);
        ++*((_DWORD *)v38 + 6);
        if (v10 != 10)
        {
          if ((v10 - 58) <= 0xFFFFFFF5) {
LABEL_16:
          }
            v4[2](v4);
          continue;
        }
        int v11 = fgetc(a1);
        if (v11 == 10)
        {
          ++*((_DWORD *)v38 + 6);
          int v6 = 2;
LABEL_23:
          *((_DWORD *)v26 + 6) = v6;
          continue;
        }
        if (v11 != 82)
        {
          ungetc(v11, a1);
          goto LABEL_16;
        }
        ungetc(82, a1);
        *((_DWORD *)v30 + 6) = 3;
LABEL_25:
        if (*((int *)v34 + 6) >= 1) {
          fprintf(a2, "[Parse failure: %i unparsed bytes prior to task header]\n", *((_DWORD *)v34 + 6));
        }
        if (*((_DWORD *)v30 + 6))
        {
          uint64_t v13 = fseek(a1, -(uint64_t)*((int *)v38 + 6), 1);
          MEMORY[0x1F4188790](v13);
          uint64_t v15 = (char *)&v23[-1] - v14;
          size_t v17 = v16;
          if (fread((char *)&v23[-1] - v14, v16, 1uLL, a1) == 1)
          {
            fwrite(v15, v17, 1uLL, a2);
          }
          else
          {
            uint64_t v19 = +[CalDAVTrafficLogScrubber log];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              writeNextTaskHeader_cold_1(a1, v19);
            }
          }
          int v20 = *((_DWORD *)v38 + 6);
          if ((int)v17 < v20) {
            fprintf(a2, "<truncated %i bytes of task header>\n", v20 - v17);
          }
          uint64_t v18 = *((unsigned int *)v30 + 6);
        }
        else
        {
          uint64_t v18 = 0;
        }

        _Block_object_dispose(&v25, 8);
        _Block_object_dispose(&v29, 8);
        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);
        return v18;
      case 2:
        int v7 = fgetc(a1);
        switch(v7)
        {
          case -1:
            goto LABEL_16;
          case 60:
            int v8 = 2;
            uint64_t v9 = "<<<< ";
            break;
          case 62:
            int v8 = 1;
            uint64_t v9 = ">>>> ";
            break;
          default:
            ungetc(v7, a1);
            goto LABEL_16;
        }
        *((_DWORD *)v30 + 6) = v8;
        ++*((_DWORD *)v38 + 6);
        if ((((uint64_t (**)(void, const char *, uint64_t))v5)[2](v5, v9, 1) & 1) == 0) {
          continue;
        }
        int v6 = 3;
        goto LABEL_23;
      case 3:
        int v12 = fgetc(a1);
        ++*((_DWORD *)v38 + 6);
        if (v12 != 10) {
          continue;
        }
        goto LABEL_25;
      default:
        continue;
    }
  }
}

void sub_1BBCD02D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 + 128), 8);
  _Block_object_dispose((const void *)(v1 + 160), 8);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void *__writeNextTaskHeader_block_invoke(void *result)
{
  *(_DWORD *)(*(void *)(result[4] + 8) + 24) = 0;
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) += *(_DWORD *)(*(void *)(result[6] + 8) + 24);
  *(_DWORD *)(*(void *)(result[6] + 8) + 24) = 0;
  *(_DWORD *)(*(void *)(result[7] + 8) + 24) = 0;
  return result;
}

uint64_t __writeNextTaskHeader_block_invoke_2(uint64_t a1, unsigned char *a2, int a3)
{
  if (*a2)
  {
    int v6 = 0;
    int v7 = a2;
    while (1)
    {
      int v8 = getc(*(FILE **)(a1 + 48));
      if (v8 == -1) {
        return 0;
      }
      if (v8 == (char)*v7)
      {
        ++v6;
      }
      else
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                 + 24)
                                                                     + v6;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        if (a3)
        {
          ungetc(v8, *(FILE **)(a1 + 48));
          return 0;
        }
        if (v6)
        {
          ungetc(v8, *(FILE **)(a1 + 48));
          int v6 = 0;
        }
        else
        {
          ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        }
      }
      int v7 = &a2[v6];
      if (!*v7) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    int v6 = 0;
LABEL_13:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6;
    return 1;
  }
}

uint64_t __writeRequest_block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"GET", @"HEAD", @"POST", @"PUT", @"DELETE", @"CONNECT", @"OPTIONS", @"TRACE", @"PATCH", @"PROPFIND", @"PROPPATCH", @"MKCOL", @"COPY", @"MOVE", @"LOCK", @"UNLOCK", @"MKCALENDAR",
    @"REPORT",
    @"VERSION-CONTROL",
    @"CHECKOUT",
    @"CHECKIN",
    @"UNCHECKOUT",
    @"MKWORKSPACE",
    @"UPDATE",
    @"LABEL",
    @"MERGE",
    @"BASELINE-CONTROL",
    @"MKACTIVITY",
    @"ORDERPATCH",
    @"ACL",
  uint64_t v0 = 0);
  writeRequest_knownMethods = v0;
  return MEMORY[0x1F41817F8](v0);
}

void fputNSString(FILE *a1, void *a2)
{
  id v3 = [a2 dataUsingEncoding:4];
  fwrite((const void *)[v3 bytes], objc_msgSend(v3, "length"), 1uLL, a1);
}

id readFromFileUntilStringAndReturnData(FILE *a1, unsigned char *a2, int a3)
{
  int v6 = (unsigned __int8 *)malloc_type_malloc(0x800uLL, 0x7C7337E8uLL);
  if (*a2)
  {
    uint64_t v7 = 0;
    int v8 = 0;
    int v9 = 2048;
    int v10 = a2;
    do
    {
      int v11 = getc(a1);
      if (v11 == -1) {
        break;
      }
      if (v11 == (char)*v10) {
        ++v8;
      }
      else {
        int v8 = v11 == (char)*a2;
      }
      v6[v7++] = v11;
      if (v9 <= (int)v7)
      {
        v9 *= 2;
        int v12 = (unsigned __int8 *)reallocf(v6, v9);
        if (!v12)
        {
          size_t v17 = +[CalDAVTrafficLogScrubber log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            readFromFileUntilStringAndReturnData_cold_1();
          }

          int v16 = 0;
          goto LABEL_31;
        }
        int v6 = v12;
      }
      int v10 = &a2[v8];
    }
    while (*v10);
    if (a3) {
      goto LABEL_20;
    }
    if (v7 >= 2)
    {
      uint64_t v13 = 2415919360;
      int v14 = *v6;
      if (!*v6) {
        goto LABEL_30;
      }
      if (v14 == 254)
      {
        int v15 = v6[1];
        if (v15 == 255) {
          goto LABEL_30;
        }
      }
      else if (v14 == 255)
      {
        int v15 = v6[1];
        if (v15 == 254) {
          goto LABEL_34;
        }
      }
      else
      {
        int v15 = v6[1];
      }
      if (!v15)
      {
LABEL_34:
        uint64_t v13 = 2483028224;
        goto LABEL_30;
      }
    }
    uint64_t v13 = 4;
    goto LABEL_30;
  }
  LODWORD(v7) = 0;
  if (!a3)
  {
    uint64_t v13 = 4;
    int v8 = 0;
LABEL_30:
    int v16 = (void *)[[NSString alloc] initWithBytesNoCopy:v6 length:(int)v7 - v8 encoding:v13 freeWhenDone:1];
    goto LABEL_31;
  }
  int v8 = 0;
LABEL_20:
  int v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:(int)v7 - v8];
LABEL_31:
  return v16;
}

uint64_t __writeHttpStatus_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" .0123456789"];
  uint64_t v1 = [v0 invertedSet];
  uint64_t v2 = (void *)writeHttpStatus_disallowedCharacters;
  writeHttpStatus_disallowedCharacters = v1;

  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Unrecognized Status Code", @"Continue", @"Switching Protocols", @"OK", @"Created", @"Accepted", @"Non Authoritative Information", @"No Content", @"Reset Content", @"Partial Content", @"Multiple Choices", @"Moved Permanently", @"Found", @"See Other", @"Not Modified", @"Use Proxy", @"Temporary Redirect",
    @"Bad Request",
    @"Unauthorized",
    @"Payment Required",
    @"Forbidden",
    @"Not Found",
    @"Method Not Allowed",
    @"Not Acceptable",
    @"Proxy Authentication Required",
    @"Request Timeout",
    @"Conflict",
    @"Gone",
    @"Length Required",
    @"Precondition Failed",
    @"Request Entity Too Large",
    @"Request URI Too Long",
    @"Unsupported Media Type",
    @"Requested Range Not Satisfiable",
    @"Expectation Failed",
    @"I'm a teapot",
    @"Internal Server Error",
    @"Not Implemented",
    @"Bad Gateway",
    @"Service Unavailable",
    @"Gateway Timeout",
    @"HTTP Version Not Supported",
    @"Multi-Status",
    @"Unprocessable Entity",
    @"Locked",
    @"Failed Dependency",
    @"Insufficient Storage",
  uint64_t v3 = 0);
  writeHttpStatus_expectedStatusDescriptions = v3;
  return MEMORY[0x1F41817F8](v3);
}

void __getHeaderRedactionBehaviors_block_invoke()
{
  uint64_t v0 = (void *)getHeaderRedactionBehaviors_headerRedactionBehaviors;
  getHeaderRedactionBehaviors_headerRedactionBehaviors = (uint64_t)&unk_1F151D9F8;
}

uint64_t checkForString(FILE *a1, unsigned char *a2, char a3)
{
  if (*a2)
  {
    uint64_t v6 = 0;
    while (1)
    {
      int v7 = fgetc(a1);
      if (v7 == -1) {
        return 0;
      }
      if (v7 != (char)a2[v6]) {
        break;
      }
      uint64_t v8 = v6 + 1;
      if (!a2[++v6])
      {
        uint64_t v10 = -v8;
        goto LABEL_8;
      }
    }
    uint64_t v11 = 0;
    LODWORD(v10) = ~v6;
    goto LABEL_12;
  }
  LODWORD(v10) = 0;
LABEL_8:
  uint64_t v11 = 1;
  if ((a3 & 1) == 0) {
LABEL_12:
  }
    fseek(a1, (int)v10, 1);
  return v11;
}

CalXMLElementRedactionRule *___createRedactionRules_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = a3;
  id v10 = [v8 objectForKeyedSubscript:v7];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];
  }
  uint64_t v11 = objc_alloc_init(CalXMLElementRedactionRule);
  [(CalXMLElementRedactionRule *)v11 setElementName:5];
  [(CalXMLElementRedactionRule *)v11 setContent:a4];
  [(CalXMLElementRedactionRule *)v11 setCdata:a4];
  [v10 setObject:v11 forKeyedSubscript:v9];

  return v11;
}

CalXMLAttributeRedactionRule *___createRedactionRules_block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v6 attributes];
  if (!v8)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    [v6 setAttributes:v8];
  }
  id v9 = objc_alloc_init(CalXMLAttributeRedactionRule);
  [(CalXMLAttributeRedactionRule *)v9 setAttributeName:5];
  [(CalXMLAttributeRedactionRule *)v9 setAttributeValue:a4];
  [v8 setObject:v9 forKeyedSubscript:v7];

  return v9;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

char *urlStringRedactor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v4 = (void *)[[NSString alloc] initWithBytesNoCopy:a2 length:*a3 encoding:4 freeWhenDone:0];
  CalRedactURLString();
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = (const char *)[v5 UTF8String];
  *a3 = strlen(v6);
  id v7 = strdup(v6);

  return v7;
}

unsigned char *blobRedactor(void *a1, uint64_t a2, _DWORD *a3)
{
  id v5 = a1;
  if (a2)
  {
    id v6 = malloc_type_malloc(0x15uLL, 0xD5AE65E8uLL);
    if (v6)
    {
      ICSRedactBytes();
      v6[20] = 0;
      *a3 = 20;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_1BBCD2498(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBCD2B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _resourceChangeDeletionQueue()
{
  if (_resourceChangeDeletionQueue_queueCreationGuard != -1) {
    dispatch_once(&_resourceChangeDeletionQueue_queueCreationGuard, &__block_literal_global_20);
  }
  uint64_t v0 = (void *)_resourceChangeDeletionQueue_queue;
  return v0;
}

void ___resourceChangeDeletionQueue_block_invoke()
{
  objc_opt_class();
  CalGenerateQualifiedIdentifierWithClassAndSubdomain();
  id v0 = objc_claimAutoreleasedReturnValue();
  uint64_t v1 = (const char *)[v0 UTF8String];

  uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v2 = dispatch_queue_create(v1, v4);
  uint64_t v3 = (void *)_resourceChangeDeletionQueue_queue;
  _resourceChangeDeletionQueue_queue = (uint64_t)v2;
}

Class __getEKCalendarVisibilityManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!EventKitLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __EventKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E624EC70;
    uint64_t v5 = 0;
    EventKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EventKitLibraryCore_frameworkLibrary) {
    __getEKCalendarVisibilityManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("EKCalendarVisibilityManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getEKCalendarVisibilityManagerClass_block_invoke_cold_2();
  }
  getEKCalendarVisibilityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EventKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EventKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BBCD9318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CalendarDiagnosticsLibraryCore()
{
  if (!CalendarDiagnosticsLibraryCore_frameworkLibrary) {
    CalendarDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CalendarDiagnosticsLibraryCore_frameworkLibrary;
}

uint64_t __CalendarDiagnosticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CalendarDiagnosticsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCalDiagObfuscatorClass_block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  if (!CalendarDiagnosticsLibraryCore()) {
    __getCalDiagObfuscatorClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("CalDiagObfuscator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCalDiagObfuscatorClass_block_invoke_cold_2();
  }
  getCalDiagObfuscatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DefaultCalendarChanged()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F57900]);
}

__CFArray *createArrayOfRecordIDsFromXPCArray(void *a1)
{
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  Mutable = CFArrayCreateMutable(0, count, MEMORY[0x1E4F1D510]);
  if (count)
  {
    for (size_t i = 0; i != count; ++i)
    {
      xpc_array_get_uint64(v1, i);
      uint64_t v5 = (const void *)CalRecordIDCreate();
      CFArrayAppendValue(Mutable, v5);
      CFRelease(v5);
    }
  }

  return Mutable;
}

void sub_1BBCDC570(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1BBCDC5C0()
{
}

__CFString *_CADStringFromXPCActivityState(unint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1 < 6) {
    return off_1E624EEC0[a1];
  }
  uint64_t v3 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v5 = v3;
    uint64_t v6 = [v4 numberWithLong:a1];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_ERROR, "WARNING: Cannot convert unrecognized state: [%@] to a string. Returning nil as a result.", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

void sub_1BBCDDE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _CADPropertySearchPredicateExtendWhereClause(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  int v7 = v6;
  if (v5)
  {
    switch(a2)
    {
      case 2:
        [v5 appendString:v6];
        break;
      case 1:
        [v5 appendFormat:@" OR %@", v6];
        break;
      case 0:
        [v5 appendFormat:@" AND %@", v6];
        break;
    }
    id v8 = v5;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28E78] stringWithString:v6];
  }
  uint64_t v9 = v8;

  return v9;
}

uint64_t _CADPropertySearchPredicateGetAllowedFilterTypes()
{
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
}

__CFString **getSearchPropertyInfo(unint64_t a1)
{
  if (a1 > 0xE) {
    return 0;
  }
  else {
    return off_1E624EEF0[a1];
  }
}

void sub_1BBCE1070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE11A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE1320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CADEKPersistentEventMinimumDefaultPropertiesToLoad()
{
  v5[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F56FB0];
  v5[0] = *MEMORY[0x1E4F56D00];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F56D08];
  _DWORD v5[2] = *MEMORY[0x1E4F56C38];
  void v5[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F56C30];
  v5[4] = *MEMORY[0x1E4F56C68];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  return v3;
}

void sub_1BBCE1C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE207C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE244C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE26F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE2870(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    NSLog(&cfstr_ExceptionRaise.isa);
    *(_DWORD *)(*(void *)(*(void *)(v9 + 48) + 8) + 24) = 1001;

    objc_end_catch();
    JUMPOUT(0x1BBCE2844);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BBCE29C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE2B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE551C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CalEntitySetProperty(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int Type = _CalEntityGetType();
  id v8 = a3;
  if (CalEntityGetPropertyIDFromName(Type, (uint64_t)v8) != -1)
  {
    uint64_t PropertyDescriptor = CPRecordGetPropertyDescriptor();
    if (PropertyDescriptor)
    {
      uint64_t v10 = PropertyDescriptor;
      if (*(_DWORD *)(PropertyDescriptor + 8))
      {
        uint64_t v11 = 0;
        goto LABEL_5;
      }
      uint64_t v15 = *(void *)(PropertyDescriptor + 16);
      if (v15 != MEMORY[0x1E4F57518])
      {
        uint64_t v11 = *(void *)(PropertyDescriptor + 32);
        if ((unint64_t)(v11 - 1) >= 3)
        {
          BOOL v22 = v15 == MEMORY[0x1E4F57528] || v15 == MEMORY[0x1E4F57520];
          uint64_t v23 = 3;
          if (!v22) {
            uint64_t v23 = 0;
          }
          if (v15 == MEMORY[0x1E4F57510]) {
            uint64_t v11 = 2;
          }
          else {
            uint64_t v11 = v23;
          }
        }
        else if (v11 == 1)
        {
          goto LABEL_25;
        }
LABEL_5:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((*(_DWORD *)(v10 + 8) | 2) != 2)
          {
            uint64_t v12 = (void *)CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR)) {
              goto LABEL_53;
            }
            goto LABEL_54;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (*(_DWORD *)(v10 + 8) != 3)
            {
              uint64_t v12 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
              {
LABEL_53:
                long long v24 = v12;
                int v32 = 138543618;
                id v33 = v8;
                __int16 v34 = 2114;
                id v35 = (id)objc_opt_class();
                id v25 = v35;
                _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_ERROR, "Wrong data type for attribute '%{public}@': %{public}@", (uint8_t *)&v32, 0x16u);
              }
LABEL_54:
              uint64_t v13 = 1011;
              goto LABEL_55;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v20 = *(_DWORD *)(v10 + 8);
              if (v20)
              {
                if (v20 == 1)
                {
                  [a4 intValue];
                  if (a2)
                  {
                    if (*MEMORY[0x1E4F56A58])
                    {
                      if (CPRecordGetStore())
                      {
                        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
                        if (Context) {
                          os_unfair_lock_assert_owner(Context + 20);
                        }
                      }
                    }
                  }
                  goto LABEL_20;
                }
                if (v20 != 6)
                {
                  uint64_t v12 = (void *)CADLogHandle;
                  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_53;
                  }
                  goto LABEL_54;
                }
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (*(_DWORD *)(v10 + 8) != 7)
                {
                  uint64_t v12 = (void *)CADLogHandle;
                  if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_54;
                  }
                  goto LABEL_53;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a4)
                  {
                    int v28 = (void *)CADLogHandle;
                    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v29 = v28;
                      int v32 = 138412290;
                      id v33 = (id)objc_opt_class();
                      id v30 = v33;
                      _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_ERROR, "Value of class '%@' not handled.", (uint8_t *)&v32, 0xCu);
                    }
                    goto LABEL_21;
                  }
                  if (a2)
                  {
                    if (*MEMORY[0x1E4F56A58])
                    {
                      if (CPRecordGetStore())
                      {
                        uint64_t v31 = (const os_unfair_lock *)CPRecordStoreGetContext();
                        if (v31) {
                          os_unfair_lock_assert_owner(v31 + 20);
                        }
                      }
                    }
                  }
                  goto LABEL_20;
                }
                if (v11 != 3)
                {
                  uint64_t v12 = (void *)CADLogHandle;
                  if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_54;
                  }
                  goto LABEL_53;
                }
              }
            }
          }
        }
        if (a2)
        {
          if (*MEMORY[0x1E4F56A58])
          {
            if (CPRecordGetStore())
            {
              uint64_t v14 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v14) {
                os_unfair_lock_assert_owner(v14 + 20);
              }
            }
          }
        }
LABEL_20:
        CPRecordSetProperty();
LABEL_21:
        uint64_t v13 = 0;
        goto LABEL_55;
      }
LABEL_25:
      if (a2)
      {
        if (*MEMORY[0x1E4F56A58])
        {
          if (CPRecordGetStore())
          {
            uint64_t v16 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v16) {
              os_unfair_lock_assert_owner(v16 + 20);
            }
          }
        }
      }
      int Property = (const void *)CPRecordGetProperty();
      if (Property && (CFTypeID v18 = CFGetTypeID(Property), v18 == CalRelationGetTypeID()))
      {
        CalRelationSetRelatedObject();
      }
      else
      {
        long long v21 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          int v32 = 138412290;
          id v33 = v8;
          _os_log_impl(&dword_1BBC88000, v21, OS_LOG_TYPE_ERROR, "Expected relation for property %@", (uint8_t *)&v32, 0xCu);
        }
      }
      goto LABEL_21;
    }
LABEL_35:
    uint64_t v13 = 1001;
    goto LABEL_55;
  }
  if (Type == 6 && ([v8 isEqualToString:*MEMORY[0x1E4F573B0]] & 1) != 0) {
    goto LABEL_21;
  }
  if ((_CalEntityIsDeleted() & 1) == 0)
  {
    uint64_t v19 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v32 = 138412546;
      id v33 = v8;
      __int16 v34 = 1024;
      LODWORD(v35) = Type;
      _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_ERROR, "Invalid attribute name '%@' passed for entity type %d", (uint8_t *)&v32, 0x12u);
    }
    goto LABEL_35;
  }
  uint64_t v13 = 1010;
LABEL_55:

  return v13;
}

uint64_t FilterCalendarAndSource(int a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (CalGetDatabaseForRecord())
  {
    if (a1 == 1)
    {
      if ([v5 isEqualToString:*MEMORY[0x1E4F56EA8]])
      {
        uint64_t LimitedAccessVirtualStore = _CalDatabaseGetLimitedAccessVirtualStore();
        goto LABEL_8;
      }
    }
    else if (a1 == 2 && [v5 isEqualToString:*MEMORY[0x1E4F56BB0]])
    {
      uint64_t LimitedAccessVirtualStore = _CalDatabaseGetLimitedAccessVirtualCalendar();
LABEL_8:
      a2 = LimitedAccessVirtualStore;
    }
  }

  return a2;
}

__CFString *CADAccountActionDescription(uint64_t a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 1) {
    uint64_t v1 = @"Write";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Read";
  }
}

void sub_1BBCEC73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

CFTypeRef CADOwningEntity(const void *a1)
{
  return owningEntity(a1, 0);
}

uint64_t CADEntityIsInManagedStore(void *a1, const void *a2)
{
  id v3 = a1;
  uint64_t Type = CalEntityGetType();
  unsigned int v9 = Type;
  CFTypeRef v5 = owningEntity(a2, (int *)&v9);
  if ((int)v9 <= 5)
  {
    if (v9 - 2 >= 2)
    {
      if (v9 == 1)
      {
        uint64_t v6 = [v3 isCalendarManaged:v5];
LABEL_9:
        uint64_t v7 = v6;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v6 = [v3 isCalendarItemManaged:v5];
    goto LABEL_9;
  }
  if (v9 == 101) {
    goto LABEL_8;
  }
  if (v9 == 6)
  {
    uint64_t v6 = [v3 isStoreManaged:v5];
    goto LABEL_9;
  }
LABEL_11:
  if (v5) {
    NSLog(&cfstr_InternalErrorM.isa, v9, Type);
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

void _CADDeleteEntity(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int Type = _CalEntityGetType();
  switch(Type)
  {
    case 1:
      _CalRemoveCalendar();
      return;
    case 2:
      MEMORY[0x1F410F160](a1, 0, 0);
      return;
    case 3:
      uint64_t DatabaseForRecord = CalGetDatabaseForRecord();
      MEMORY[0x1F410F1B8](DatabaseForRecord, a1);
      return;
    case 4:
      MEMORY[0x1F410F120](a1);
      return;
    case 5:
      MEMORY[0x1F410F190](a1);
      return;
    case 6:
      MEMORY[0x1F410F1A8](a1);
      return;
    case 7:
      MEMORY[0x1F410F130](a1);
      return;
    case 8:
      MEMORY[0x1F410F188](a1);
      return;
    case 9:
      MEMORY[0x1F410F0A0](a1);
      return;
    case 10:
      if (_CalExceptionDateGetOwner()) {
        _CalCalendarItemRemoveExceptionDate();
      }
      MEMORY[0x1F410F168](a1);
      return;
    case 11:
      MEMORY[0x1F410F128](a1);
      return;
    case 12:
      MEMORY[0x1F410EF68](a1);
      return;
    case 13:
    case 22:
    case 25:
    case 26:
    case 27:
      goto LABEL_6;
    case 14:
      MEMORY[0x1F410F178](a1);
      return;
    case 15:
      MEMORY[0x1F410F1A0](a1);
      return;
    case 16:
    case 17:
    case 19:
      goto LABEL_2;
    case 18:
      MEMORY[0x1F410F198](a1);
      return;
    case 20:
      MEMORY[0x1F410F1B0](a1);
      return;
    case 21:
      MEMORY[0x1F410F150](a1);
      return;
    case 23:
      MEMORY[0x1F410F148](a1);
      return;
    case 24:
      MEMORY[0x1F410F158](a1);
      return;
    case 28:
      MEMORY[0x1F410F170](a1);
      return;
    case 29:
      MEMORY[0x1F410F140](a1);
      return;
    default:
      if (Type == 102)
      {
LABEL_2:
        MEMORY[0x1F410F180](a1);
      }
      else
      {
LABEL_6:
        id v3 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          uint64_t v4 = v3;
          v6[0] = 67109120;
          v6[1] = _CalEntityGetType();
          _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_ERROR, "Unknown entity type in _CADDeleteEntity (%i)", (uint8_t *)v6, 8u);
        }
      }
      return;
  }
}

void sub_1BBCEEE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF05B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF0894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF0C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF0ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF11F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF14AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF170C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF18D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF1AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF1D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF1F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF2210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF2454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF27CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF2C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF362C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF3828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF39A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF3BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF3E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void ___auditTokenForCurrentProcess_block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1BBC88000, a2, OS_LOG_TYPE_FAULT, "Failed to get audit token for current process. Result = %d", (uint8_t *)v2, 8u);
}

void writeNextTaskHeader_cold_1(FILE *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  ferror(a1);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1BBC88000, a2, v3, "Error reading from input: %i", v4);
}

void readFromFileUntilStringAndReturnData_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_1BBC88000, v0, v1, "Unable to realloc %i bytes", v2);
}

void __getEKCalendarVisibilityManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *EventKitLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CADNotificationUtilities.m", 29, @"%s", *a1);

  __break(1u);
}

void __getEKCalendarVisibilityManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getEKCalendarVisibilityManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CADNotificationUtilities.m", 33, @"Unable to find class %s", "EKCalendarVisibilityManager");

  __break(1u);
}

void __getCalDiagObfuscatorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CalendarDiagnosticsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CADDiagnosticsDiagnosticDatabaseCollector.m", 17, @"%s", *a1);

  __break(1u);
}

void __getCalDiagObfuscatorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCalDiagObfuscatorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CADDiagnosticsDiagnosticDatabaseCollector.m", 19, @"Unable to find class %s", "CalDiagObfuscator");

  __break(1u);
  CFAbsoluteTimeGetCurrent();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.locatiouint64_t n = v3;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8700](allocator, name, tryAbbrev);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8790](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1F41092C0]();
}

uint64_t CPFileCompressionZDeflate()
{
  return MEMORY[0x1F4109300]();
}

uint64_t CPRecordCopyProperty()
{
  return MEMORY[0x1F41093C8]();
}

uint64_t CPRecordGetID()
{
  return MEMORY[0x1F41093F8]();
}

uint64_t CPRecordGetOriginalProperty()
{
  return MEMORY[0x1F4109408]();
}

uint64_t CPRecordGetProperty()
{
  return MEMORY[0x1F4109410]();
}

uint64_t CPRecordGetPropertyDescriptor()
{
  return MEMORY[0x1F4109418]();
}

uint64_t CPRecordGetStore()
{
  return MEMORY[0x1F4109420]();
}

uint64_t CPRecordGetTypeID()
{
  return MEMORY[0x1F4109428]();
}

uint64_t CPRecordSetProperty()
{
  return MEMORY[0x1F4109480]();
}

uint64_t CPRecordStoreGetContext()
{
  return MEMORY[0x1F41095A8]();
}

uint64_t CalAbsoluteTimeGetAbsoluteTimeInTimeZone()
{
  return MEMORY[0x1F410F208]();
}

uint64_t CalAbsoluteTimeGetGregorianDate()
{
  return MEMORY[0x1F410F220]();
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1F410F230]();
}

uint64_t CalAddStateCaptureBlock()
{
  return MEMORY[0x1F410F250]();
}

uint64_t CalAlarmCopyDefaultAllDayAlarmOffset()
{
  return MEMORY[0x1F410DF38]();
}

uint64_t CalAlarmCopyDefaultAllDayAlarmOffsetWithPreferences()
{
  return MEMORY[0x1F410DF40]();
}

uint64_t CalAlarmCopyDefaultTimedAlarmOffset()
{
  return MEMORY[0x1F410DF48]();
}

uint64_t CalAlarmCopyDefaultTimedAlarmOffsetWithPreferences()
{
  return MEMORY[0x1F410DF50]();
}

uint64_t CalAlarmCopyOwningEntity()
{
  return MEMORY[0x1F410DF58]();
}

uint64_t CalAlarmCopyUUID()
{
  return MEMORY[0x1F410DF60]();
}

uint64_t CalAlarmGetAcknowledgedDate()
{
  return MEMORY[0x1F410DF68]();
}

uint64_t CalAlarmGetUID()
{
  return MEMORY[0x1F410DF78]();
}

uint64_t CalAlarmIsDefaultAlarm()
{
  return MEMORY[0x1F410DF80]();
}

uint64_t CalAlarmOccurrenceGetAlarm()
{
  return MEMORY[0x1F410DF88]();
}

uint64_t CalAlarmOccurrenceGetEventOccurrence()
{
  return MEMORY[0x1F410DF90]();
}

uint64_t CalAlarmOccurrenceGetFireDate()
{
  return MEMORY[0x1F410DF98]();
}

uint64_t CalAlertInviteeDeclines()
{
  return MEMORY[0x1F410DFB0]();
}

uint64_t CalAnalyticsIsEventUsed()
{
  return MEMORY[0x1F410F258]();
}

uint64_t CalAnalyticsSendEvent()
{
  return MEMORY[0x1F410F260]();
}

uint64_t CalAnalyticsTimeIntervalFromMachTimes()
{
  return MEMORY[0x1F410F270]();
}

uint64_t CalApproximateContinuousTime()
{
  return MEMORY[0x1F410F278]();
}

uint64_t CalAttachmentCopyOwner()
{
  return MEMORY[0x1F410DFB8]();
}

uint64_t CalAttachmentFileCopyAttachmentContainerForStore()
{
  return MEMORY[0x1F410DFC0]();
}

uint64_t CalAttachmentFileCopyStore()
{
  return MEMORY[0x1F410DFC8]();
}

uint64_t CalAttendeeCopyDisplayName()
{
  return MEMORY[0x1F410DFD8]();
}

uint64_t CalAttendeeCopyEmailAddress()
{
  return MEMORY[0x1F410DFE0]();
}

uint64_t CalAttendeeCopyFirstName()
{
  return MEMORY[0x1F410DFE8]();
}

uint64_t CalAttendeeCopyLastName()
{
  return MEMORY[0x1F410DFF0]();
}

uint64_t CalAttendeeCopyOwningEvent()
{
  return MEMORY[0x1F410DFF8]();
}

uint64_t CalAttendeeCopyPhoneNumber()
{
  return MEMORY[0x1F410E000]();
}

uint64_t CalAttendeeCopyResponseComment()
{
  return MEMORY[0x1F410E008]();
}

uint64_t CalAttendeeGetProposedStartDate()
{
  return MEMORY[0x1F410E018]();
}

uint64_t CalAttendeeGetProposedStartDateStatus()
{
  return MEMORY[0x1F410E020]();
}

uint64_t CalAttendeeGetStatus()
{
  return MEMORY[0x1F410E028]();
}

uint64_t CalAttendeeGetUID()
{
  return MEMORY[0x1F410E030]();
}

uint64_t CalAttendeeGetUseDeletedByOrganizerStatusInStore()
{
  return MEMORY[0x1F410E038]();
}

uint64_t CalAttendeeIsStatusKnownForInvitedEventsInStore()
{
  return MEMORY[0x1F410E040]();
}

uint64_t CalAttendeeIsStatusKnownForOrganizedEventsInStore()
{
  return MEMORY[0x1F410E048]();
}

uint64_t CalAttendeeRequireSearchInSingleAccountInStore()
{
  return MEMORY[0x1F410E050]();
}

uint64_t CalAuxDatabaseAccountCopyAccountID()
{
  return MEMORY[0x1F410E058]();
}

uint64_t CalAuxDatabaseAccountSetAccountID()
{
  return MEMORY[0x1F410E060]();
}

uint64_t CalAuxDatabaseAddAccount()
{
  return MEMORY[0x1F410E068]();
}

uint64_t CalAuxDatabaseCopyAccounts()
{
  return MEMORY[0x1F410E070]();
}

uint64_t CalAuxDatabaseCopyPath()
{
  return MEMORY[0x1F410E078]();
}

uint64_t CalAuxDatabaseCopyPersonaID()
{
  return MEMORY[0x1F410E080]();
}

uint64_t CalAuxDatabaseGetUID()
{
  return MEMORY[0x1F410E088]();
}

uint64_t CalAuxDatabaseRemoveAccount()
{
  return MEMORY[0x1F410E090]();
}

uint64_t CalCalendarCanContainEntityType()
{
  return MEMORY[0x1F410E098]();
}

uint64_t CalCalendarCanContainEntityTypeAndStoreAllowsIt()
{
  return MEMORY[0x1F410E0A0]();
}

uint64_t CalCalendarCopyColorString()
{
  return MEMORY[0x1F410E0A8]();
}

uint64_t CalCalendarCopySelfIdentityAddress()
{
  return MEMORY[0x1F410E0B0]();
}

uint64_t CalCalendarCopySharees()
{
  return MEMORY[0x1F410E0B8]();
}

uint64_t CalCalendarCopyStore()
{
  return MEMORY[0x1F410E0C0]();
}

uint64_t CalCalendarCopySubCalAccountID()
{
  return MEMORY[0x1F410E0C8]();
}

uint64_t CalCalendarCopySubscriptionURL()
{
  return MEMORY[0x1F410E0D0]();
}

uint64_t CalCalendarCopyTitle()
{
  return MEMORY[0x1F410E0D8]();
}

uint64_t CalCalendarCopyType()
{
  return MEMORY[0x1F410E0E0]();
}

uint64_t CalCalendarCopyURI()
{
  return MEMORY[0x1F410E0E8]();
}

uint64_t CalCalendarCopyUUID()
{
  return MEMORY[0x1F410E0F0]();
}

uint64_t CalCalendarGetBirthdayCalendarVersion()
{
  return MEMORY[0x1F410E0F8]();
}

uint64_t CalCalendarGetSharingStatus()
{
  return MEMORY[0x1F410E108]();
}

uint64_t CalCalendarGetUID()
{
  return MEMORY[0x1F410E110]();
}

uint64_t CalCalendarHasEvents()
{
  return MEMORY[0x1F410E118]();
}

uint64_t CalCalendarHasEventsWithRoomAsAttendee()
{
  return MEMORY[0x1F410E120]();
}

uint64_t CalCalendarInsertBirthdayCalendar()
{
  return MEMORY[0x1F410E128]();
}

uint64_t CalCalendarIsBirthdayCalendar()
{
  return MEMORY[0x1F410E130]();
}

uint64_t CalCalendarIsFacebookBirthdayCalendar()
{
  return MEMORY[0x1F410E138]();
}

uint64_t CalCalendarIsFamilyCalendar()
{
  return MEMORY[0x1F410E140]();
}

uint64_t CalCalendarIsFoundInMailCalendar()
{
  return MEMORY[0x1F410E148]();
}

uint64_t CalCalendarIsHidden()
{
  return MEMORY[0x1F410E150]();
}

uint64_t CalCalendarIsHolidaySubscribedCalendar()
{
  return MEMORY[0x1F410E158]();
}

uint64_t CalCalendarIsHolidaySyncedCalendar()
{
  return MEMORY[0x1F410E160]();
}

uint64_t CalCalendarIsIgnoringEventAlerts()
{
  return MEMORY[0x1F410E168]();
}

uint64_t CalCalendarIsIgnoringSharedCalendarNotifications()
{
  return MEMORY[0x1F410E170]();
}

uint64_t CalCalendarIsNaturalLanguageSuggestedEventsCalendar()
{
  return MEMORY[0x1F410E178]();
}

uint64_t CalCalendarIsNotificationsCollection()
{
  return MEMORY[0x1F410E180]();
}

uint64_t CalCalendarIsSubscribed()
{
  return MEMORY[0x1F410E188]();
}

uint64_t CalCalendarItemCopyAttendees()
{
  return MEMORY[0x1F410E190]();
}

uint64_t CalCalendarItemCopyCalendar()
{
  return MEMORY[0x1F410E198]();
}

uint64_t CalCalendarItemCopyCalendarScale()
{
  return MEMORY[0x1F410E1A0]();
}

uint64_t CalCalendarItemCopyDescription()
{
  return MEMORY[0x1F410E1A8]();
}

uint64_t CalCalendarItemCopyLocation()
{
  return MEMORY[0x1F410E1B0]();
}

uint64_t CalCalendarItemCopyOrganizer()
{
  return MEMORY[0x1F410E1B8]();
}

uint64_t CalCalendarItemCopyPreferredLocation()
{
  return MEMORY[0x1F410E1C0]();
}

uint64_t CalCalendarItemCopyRecurrences()
{
  return MEMORY[0x1F410E1C8]();
}

uint64_t CalCalendarItemCopySelfAttendee()
{
  return MEMORY[0x1F410E1D0]();
}

uint64_t CalCalendarItemCopyStartDate()
{
  return MEMORY[0x1F410E1D8]();
}

uint64_t CalCalendarItemCopySummary()
{
  return MEMORY[0x1F410E1E0]();
}

uint64_t CalCalendarItemCopyURL()
{
  return MEMORY[0x1F410E1E8]();
}

uint64_t CalCalendarItemCopyUUID()
{
  return MEMORY[0x1F410E1F0]();
}

uint64_t CalCalendarItemGetAvailabilitySupportedByStore()
{
  return MEMORY[0x1F410E1F8]();
}

uint64_t CalCalendarItemGetRowID()
{
  return MEMORY[0x1F410E208]();
}

uint64_t CalCalendarItemGetStatus()
{
  return MEMORY[0x1F410E210]();
}

uint64_t CalCalendarItemHasAttendees()
{
  return MEMORY[0x1F410E218]();
}

uint64_t CalCalendarItemHasClientLocation()
{
  return MEMORY[0x1F410E220]();
}

uint64_t CalCalendarItemHasLocation()
{
  return MEMORY[0x1F410E228]();
}

uint64_t CalCalendarItemHasRecurrenceRules()
{
  return MEMORY[0x1F410E230]();
}

uint64_t CalCalendarItemIsAllDay()
{
  return MEMORY[0x1F410E238]();
}

uint64_t CalCalendarItemIsFloating()
{
  return MEMORY[0x1F410E240]();
}

uint64_t CalCalendarItemIsPhantomMaster()
{
  return MEMORY[0x1F410E248]();
}

uint64_t CalCalendarMigrateSubscribedCalendarToStore()
{
  return MEMORY[0x1F410E250]();
}

uint64_t CalCalendarSetInvitationStatus()
{
  return MEMORY[0x1F410E260]();
}

uint64_t CalColorCopyStore()
{
  return MEMORY[0x1F410E268]();
}

uint64_t CalColorGetUID()
{
  return MEMORY[0x1F410E278]();
}

uint64_t CalConferenceCopyOwner()
{
  return MEMORY[0x1F410E280]();
}

uint64_t CalContactCopyOwner()
{
  return MEMORY[0x1F410E290]();
}

uint64_t CalContinuousIntervalToNSTimeInterval()
{
  return MEMORY[0x1F410F298]();
}

uint64_t CalCopyDatabaseForEntity()
{
  return MEMORY[0x1F410E2A0]();
}

uint64_t CalCopyDefaultTimeZone()
{
  return MEMORY[0x1F410F2A8]();
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x1F410F2B8]();
}

uint64_t CalCreateiCalendarDataFromCalEntitiesWithOptions()
{
  return MEMORY[0x1F410E2B0]();
}

uint64_t CalCreateiCalendarDataFromCalendarWithOptions()
{
  return MEMORY[0x1F410E2B8]();
}

uint64_t CalDatabaseBackupDatabaseFile()
{
  return MEMORY[0x1F410E2C0]();
}

uint64_t CalDatabaseBackupDatabaseFileAndAttachments()
{
  return MEMORY[0x1F410E2C8]();
}

uint64_t CalDatabaseBackupToICBU()
{
  return MEMORY[0x1F410E2D0]();
}

uint64_t CalDatabaseCleanUpDeclinedEvents()
{
  return MEMORY[0x1F410E2D8]();
}

uint64_t CalDatabaseCleanUpOrphanedLocalAttachments()
{
  return MEMORY[0x1F410E2E0]();
}

uint64_t CalDatabaseCleanupDanglers()
{
  return MEMORY[0x1F410E2E8]();
}

uint64_t CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient()
{
  return MEMORY[0x1F410E2F0]();
}

uint64_t CalDatabaseClearIndividualChangeRowIDsForClient()
{
  return MEMORY[0x1F410E2F8]();
}

uint64_t CalDatabaseClearRestoreGenerationChangedDelegate()
{
  return MEMORY[0x1F410E300]();
}

uint64_t CalDatabaseCopyAlarmOccurrencesFromAlarmCache()
{
  return MEMORY[0x1F410E308]();
}

uint64_t CalDatabaseCopyAlarmWithExternalIDInStore()
{
  return MEMORY[0x1F410E310]();
}

uint64_t CalDatabaseCopyAlarmWithUUID()
{
  return MEMORY[0x1F410E318]();
}

uint64_t CalDatabaseCopyAllAuxDatabases()
{
  return MEMORY[0x1F410E320]();
}

uint64_t CalDatabaseCopyAllEntitiesWithPropertyInCalendarOrStore()
{
  return MEMORY[0x1F410E328]();
}

uint64_t CalDatabaseCopyAllErrors()
{
  return MEMORY[0x1F410E330]();
}

uint64_t CalDatabaseCopyAllEventsWithUniqueIdentifierInStore()
{
  return MEMORY[0x1F410E338]();
}

uint64_t CalDatabaseCopyAllNaturalLanguageSuggestedEventsMatchingSummary()
{
  return MEMORY[0x1F410E340]();
}

uint64_t CalDatabaseCopyAttachmentWithUUID()
{
  return MEMORY[0x1F410E348]();
}

uint64_t CalDatabaseCopyAuxDatabaseAccountForAccountID()
{
  return MEMORY[0x1F410E350]();
}

uint64_t CalDatabaseCopyAuxDatabaseForPersonaID()
{
  return MEMORY[0x1F410E358]();
}

uint64_t CalDatabaseCopyAuxDatabaseWithUID()
{
  return MEMORY[0x1F410E360]();
}

uint64_t CalDatabaseCopyBirthdayCalendar()
{
  return MEMORY[0x1F410E368]();
}

uint64_t CalDatabaseCopyCalendarItemUUIDs()
{
  return MEMORY[0x1F410E370]();
}

uint64_t CalDatabaseCopyCalendarItemWithUUID()
{
  return MEMORY[0x1F410E378]();
}

uint64_t CalDatabaseCopyCalendarItemsWithCalendarFilter()
{
  return MEMORY[0x1F410E380]();
}

uint64_t CalDatabaseCopyCalendarItemsWithUUIDs()
{
  return MEMORY[0x1F410E388]();
}

uint64_t CalDatabaseCopyCalendarItemsWithUniqueIdentifier()
{
  return MEMORY[0x1F410E390]();
}

uint64_t CalDatabaseCopyCalendarWithExternalIDInStore()
{
  return MEMORY[0x1F410E398]();
}

uint64_t CalDatabaseCopyCalendarWithUID()
{
  return MEMORY[0x1F410E3A0]();
}

uint64_t CalDatabaseCopyChangesSinceSequenceNumber()
{
  return MEMORY[0x1F410E3A8]();
}

uint64_t CalDatabaseCopyColorWithProviderAndExternalID()
{
  return MEMORY[0x1F410E3B8]();
}

uint64_t CalDatabaseCopyDefaultLocalCalendar()
{
  return MEMORY[0x1F410E3C0]();
}

uint64_t CalDatabaseCopyDefaultOrAnyReadWriteCalendarForNewEvents()
{
  return MEMORY[0x1F410E3C8]();
}

uint64_t CalDatabaseCopyDirectoryPath()
{
  return MEMORY[0x1F410E3D0]();
}

uint64_t CalDatabaseCopyDirectoryPathForDatabase()
{
  return MEMORY[0x1F410E3D8]();
}

uint64_t CalDatabaseCopyEntitiesWhere()
{
  return MEMORY[0x1F410E3E0]();
}

uint64_t CalDatabaseCopyEventIDsOfEventsMatching()
{
  return MEMORY[0x1F410E3E8]();
}

uint64_t CalDatabaseCopyEventOccurrenceCache()
{
  return MEMORY[0x1F410E3F0]();
}

uint64_t CalDatabaseCopyEventOccurrenceNearestToDate()
{
  return MEMORY[0x1F410E3F8]();
}

uint64_t CalDatabaseCopyEventOccurrenceNearestToDatePreferringForwardSearch()
{
  return MEMORY[0x1F410E400]();
}

uint64_t CalDatabaseCopyEventOccurrencesInDateRangeEx()
{
  return MEMORY[0x1F410E408]();
}

uint64_t CalDatabaseCopyEventOccurrencesInDateRangeWithEventFilter()
{
  return MEMORY[0x1F410E410]();
}

uint64_t CalDatabaseCopyEventWithPublicID()
{
  return MEMORY[0x1F410E418]();
}

uint64_t CalDatabaseCopyEventWithUID()
{
  return MEMORY[0x1F410E420]();
}

uint64_t CalDatabaseCopyEventWithUUID()
{
  return MEMORY[0x1F410E428]();
}

uint64_t CalDatabaseCopyEventWithUniqueIdentifierInStore()
{
  return MEMORY[0x1F410E430]();
}

uint64_t CalDatabaseCopyEventsWithRecurrenceSet()
{
  return MEMORY[0x1F410E438]();
}

uint64_t CalDatabaseCopyFirstNaturalLanguageSuggestedEventMatchingSummary()
{
  return MEMORY[0x1F410E440]();
}

uint64_t CalDatabaseCopyInitializationConfiguration()
{
  return MEMORY[0x1F410E448]();
}

uint64_t CalDatabaseCopyLimitedAccessVirtualCalendar()
{
  return MEMORY[0x1F410E450]();
}

uint64_t CalDatabaseCopyLimitedAccessVirtualStore()
{
  return MEMORY[0x1F410E458]();
}

uint64_t CalDatabaseCopyLocalStore()
{
  return MEMORY[0x1F410E460]();
}

uint64_t CalDatabaseCopyNaturalLanguageSuggestionsCalendar()
{
  return MEMORY[0x1F410E468]();
}

uint64_t CalDatabaseCopyOfAllCalendarsInStore()
{
  return MEMORY[0x1F410E470]();
}

uint64_t CalDatabaseCopyOfAllCalendarsInStoreWithOptions()
{
  return MEMORY[0x1F410E478]();
}

uint64_t CalDatabaseCopyOfAllEventsCreatedFromSuggestionsInStore()
{
  return MEMORY[0x1F410E480]();
}

uint64_t CalDatabaseCopyOfAllEventsCreatedFromSuggestionsWithExtractionGroupIdentifierInStore()
{
  return MEMORY[0x1F410E488]();
}

uint64_t CalDatabaseCopyOfAllEventsWithScheduleAgentClientAndCalendarUID()
{
  return MEMORY[0x1F410E490]();
}

uint64_t CalDatabaseCopyOfAllNotifiableEventsInStore()
{
  return MEMORY[0x1F410E498]();
}

uint64_t CalDatabaseCopyOfAllNotifications()
{
  return MEMORY[0x1F410E4A0]();
}

uint64_t CalDatabaseCopyOfAllRepliedEventsInStore()
{
  return MEMORY[0x1F410E4A8]();
}

uint64_t CalDatabaseCopyOfAllStores()
{
  return MEMORY[0x1F410E4B0]();
}

uint64_t CalDatabaseCopyOfAllUnacknowledgedEventsInStore()
{
  return MEMORY[0x1F410E4B8]();
}

uint64_t CalDatabaseCopyOfAllUnalertedEventsInStore()
{
  return MEMORY[0x1F410E4C0]();
}

uint64_t CalDatabaseCopyOrCreateDefaultCalendarForNewEvents()
{
  return MEMORY[0x1F410E4C8]();
}

uint64_t CalDatabaseCopyOriginalVisibleEventsWithDates()
{
  return MEMORY[0x1F410E4D0]();
}

uint64_t CalDatabaseCopyProperty()
{
  return MEMORY[0x1F410E4D8]();
}

uint64_t CalDatabaseCopyResourceChangeWithUID()
{
  return MEMORY[0x1F410E4E8]();
}

uint64_t CalDatabaseCopySourceStats()
{
  return MEMORY[0x1F410E4F0]();
}

uint64_t CalDatabaseCopyStoreForBirthdayCalendar()
{
  return MEMORY[0x1F410E4F8]();
}

uint64_t CalDatabaseCopyStoreWithExternalID()
{
  return MEMORY[0x1F410E500]();
}

uint64_t CalDatabaseCopyStoreWithUID()
{
  return MEMORY[0x1F410E508]();
}

uint64_t CalDatabaseCopyStoreWithUUID()
{
  return MEMORY[0x1F410E510]();
}

uint64_t CalDatabaseCopySubscribedCalendarStoreCreateIfNeeded()
{
  return MEMORY[0x1F410E518]();
}

uint64_t CalDatabaseCopySuggestionsCalendar()
{
  return MEMORY[0x1F410E520]();
}

uint64_t CalDatabaseCopyUniqueIdentifier()
{
  return MEMORY[0x1F410E528]();
}

uint64_t CalDatabaseCountCachedRecords()
{
  return MEMORY[0x1F410E530]();
}

uint64_t CalDatabaseCreateAuxDatabaseAccount()
{
  return MEMORY[0x1F410E538]();
}

uint64_t CalDatabaseCreateWithAuxDatabaseRef()
{
  return MEMORY[0x1F410E540]();
}

uint64_t CalDatabaseCreateWithConfiguration()
{
  return MEMORY[0x1F410E548]();
}

uint64_t CalDatabaseCreateWithConfigurationForPersonaID()
{
  return MEMORY[0x1F410E558]();
}

uint64_t CalDatabaseCreateWithOptions()
{
  return MEMORY[0x1F410E560]();
}

uint64_t CalDatabaseEnumerateDatabases()
{
  return MEMORY[0x1F410E570]();
}

uint64_t CalDatabaseEnumerateUnconsumedObjectChangesForClient()
{
  return MEMORY[0x1F410E580]();
}

uint64_t CalDatabaseGetAuxDatabaseChangesSequence()
{
  return MEMORY[0x1F410E588]();
}

uint64_t CalDatabaseGetAuxilliaryDatabaseID()
{
  return MEMORY[0x1F410E590]();
}

uint64_t CalDatabaseGetCalendarDataContainerProvider()
{
  return MEMORY[0x1F410E598]();
}

uint64_t CalDatabaseGetChangedEKObjectsForClient()
{
  return MEMORY[0x1F410E5A0]();
}

uint64_t CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient()
{
  return MEMORY[0x1F410E5A8]();
}

uint64_t CalDatabaseGetCountOfCalendarItemsInStore()
{
  return MEMORY[0x1F410E5B0]();
}

uint64_t CalDatabaseGetIDOfOneEventWithAnErrorPerSource()
{
  return MEMORY[0x1F410E5B8]();
}

uint64_t CalDatabaseGetLastCacheInvalidationTimestamp()
{
  return MEMORY[0x1F410E5C0]();
}

uint64_t CalDatabaseGetPreferences()
{
  return MEMORY[0x1F410E5C8]();
}

uint64_t CalDatabaseGetRestoreGeneration()
{
  return MEMORY[0x1F410E5D0]();
}

uint64_t CalDatabaseGetSequenceNumber()
{
  return MEMORY[0x1F410E5D8]();
}

uint64_t CalDatabaseGetStoreForPersistentChangeTrackingClientIdentifier()
{
  return MEMORY[0x1F410E5E0]();
}

uint64_t CalDatabaseInsertSuggestionsCalendar()
{
  return MEMORY[0x1F410E5F0]();
}

uint64_t CalDatabaseIsCurrentProcessCalaccessd()
{
  return MEMORY[0x1F410E5F8]();
}

uint64_t CalDatabaseLockForThread()
{
  return MEMORY[0x1F410E600]();
}

uint64_t CalDatabaseMovedAsideDatabaseFilePathInDirectory()
{
  return MEMORY[0x1F410E610]();
}

uint64_t CalDatabaseMultiLock()
{
  return MEMORY[0x1F410E618]();
}

uint64_t CalDatabaseNextInMemoryChangeTrackingClientID()
{
  return MEMORY[0x1F410E620]();
}

uint64_t CalDatabasePerformMigrationIfNeeded()
{
  return MEMORY[0x1F410E628]();
}

uint64_t CalDatabaseProcessEventsWithCalendarFilter()
{
  return MEMORY[0x1F410E630]();
}

uint64_t CalDatabasePurgeIdlePersistentChangeTrackingClients()
{
  return MEMORY[0x1F410E638]();
}

uint64_t CalDatabaseRebuildOccurrenceCache()
{
  return MEMORY[0x1F410E640]();
}

uint64_t CalDatabaseRegisterClientForPersistentChangeTracking()
{
  return MEMORY[0x1F410E648]();
}

uint64_t CalDatabaseRegisterClientForPersistentChangeTrackingInStore()
{
  return MEMORY[0x1F410E650]();
}

uint64_t CalDatabaseRemoveNaturalLanguageSuggestionsCalendar()
{
  return MEMORY[0x1F410E660]();
}

uint64_t CalDatabaseRemoveProperty()
{
  return MEMORY[0x1F410E668]();
}

uint64_t CalDatabaseRemoveSuggestionsCalendar()
{
  return MEMORY[0x1F410E670]();
}

uint64_t CalDatabaseRequestApplicationSnapshotUpdateWithRateLimiter()
{
  return MEMORY[0x1F410E678]();
}

uint64_t CalDatabaseRequestWidgetRefreshWithRateLimiter()
{
  return MEMORY[0x1F410E680]();
}

uint64_t CalDatabaseReset()
{
  return MEMORY[0x1F410E688]();
}

uint64_t CalDatabaseRestoreFromBackupDatabaseFile()
{
  return MEMORY[0x1F410E690]();
}

uint64_t CalDatabaseRestoreFromBackupDatabaseFileAndAttachments()
{
  return MEMORY[0x1F410E698]();
}

uint64_t CalDatabaseRestoreFromICBU()
{
  return MEMORY[0x1F410E6A0]();
}

uint64_t CalDatabaseRevert()
{
  return MEMORY[0x1F410E6A8]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x1F410E6B0]();
}

uint64_t CalDatabaseSaveWithOptions()
{
  return MEMORY[0x1F410E6C0]();
}

uint64_t CalDatabaseSetAuxilliaryDatabaseID()
{
  return MEMORY[0x1F410E6C8]();
}

uint64_t CalDatabaseSetChangeLoggingEnabled()
{
  return MEMORY[0x1F410E6D0]();
}

uint64_t CalDatabaseSetClientIdentifier()
{
  return MEMORY[0x1F410E6D8]();
}

uint64_t CalDatabaseSetClientName()
{
  return MEMORY[0x1F410E6E0]();
}

uint64_t CalDatabaseSetDefaultCalendarForNewEventsInStore()
{
  return MEMORY[0x1F410E6E8]();
}

uint64_t CalDatabaseSetDefaultCalendarForNewEventsWithReason()
{
  return MEMORY[0x1F410E6F0]();
}

uint64_t CalDatabaseSetInMemoryChangeTrackingID()
{
  return MEMORY[0x1F410E6F8]();
}

uint64_t CalDatabaseSetIntegrityErrorReportingDelegate()
{
  return MEMORY[0x1F410E700]();
}

uint64_t CalDatabaseSetIsUnitTesting()
{
  return MEMORY[0x1F410E708]();
}

uint64_t CalDatabaseSetProperty()
{
  return MEMORY[0x1F410E710]();
}

uint64_t CalDatabaseSetPropertyModificationLoggingEnabled()
{
  return MEMORY[0x1F410E718]();
}

uint64_t CalDatabaseSetRestoreGenerationChangedDelegate()
{
  return MEMORY[0x1F410E720]();
}

uint64_t CalDatabaseUnlockForThread()
{
  return MEMORY[0x1F410E730]();
}

uint64_t CalEntityGetID()
{
  return MEMORY[0x1F410E738]();
}

uint64_t CalEntityGetType()
{
  return MEMORY[0x1F410E740]();
}

uint64_t CalEntityIsDeleted()
{
  return MEMORY[0x1F410E748]();
}

uint64_t CalEntityIsNew()
{
  return MEMORY[0x1F410E750]();
}

uint64_t CalEntityIsOfType()
{
  return MEMORY[0x1F410E758]();
}

uint64_t CalEntityIsVirtual()
{
  return MEMORY[0x1F410E760]();
}

uint64_t CalEqualStrings()
{
  return MEMORY[0x1F410F2E8]();
}

uint64_t CalErrorCopyOwner()
{
  return MEMORY[0x1F410E770]();
}

uint64_t CalEventActionCopyOwningEvent()
{
  return MEMORY[0x1F410E780]();
}

uint64_t CalEventAttendeeIsSelf()
{
  return MEMORY[0x1F410E790]();
}

uint64_t CalEventCancelDeletedEventsInStore()
{
  return MEMORY[0x1F410E798]();
}

uint64_t CalEventCopyAlarms()
{
  return MEMORY[0x1F410E7A0]();
}

uint64_t CalEventCopyAttendees()
{
  return MEMORY[0x1F410E7A8]();
}

uint64_t CalEventCopyCalendar()
{
  return MEMORY[0x1F410E7B0]();
}

uint64_t CalEventCopyContactIdentifier()
{
  return MEMORY[0x1F410E7B8]();
}

uint64_t CalEventCopyContactName()
{
  return MEMORY[0x1F410E7C0]();
}

uint64_t CalEventCopyCreatorIdentityString()
{
  return MEMORY[0x1F410E7C8]();
}

uint64_t CalEventCopyCreatorTeamIdentityString()
{
  return MEMORY[0x1F410E7D0]();
}

uint64_t CalEventCopyDescription()
{
  return MEMORY[0x1F410E7D8]();
}

uint64_t CalEventCopyLocation_Deprecated()
{
  return MEMORY[0x1F410E7E0]();
}

uint64_t CalEventCopyOrganizer()
{
  return MEMORY[0x1F410E7E8]();
}

uint64_t CalEventCopyRecurrences()
{
  return MEMORY[0x1F410E7F0]();
}

uint64_t CalEventCopyRowIDsAndUniqueIdentifiersInCalendar()
{
  return MEMORY[0x1F410E7F8]();
}

uint64_t CalEventCopyStartTimeZone()
{
  return MEMORY[0x1F410E800]();
}

uint64_t CalEventCopyStore()
{
  return MEMORY[0x1F410E808]();
}

uint64_t CalEventCopySummary()
{
  return MEMORY[0x1F410E810]();
}

uint64_t CalEventCopyURI()
{
  return MEMORY[0x1F410E818]();
}

uint64_t CalEventCopyURL()
{
  return MEMORY[0x1F410E820]();
}

uint64_t CalEventCopyUniqueIdentifier()
{
  return MEMORY[0x1F410E828]();
}

uint64_t CalEventDeclineDeletedInvitationsInStore()
{
  return MEMORY[0x1F410E830]();
}

uint64_t CalEventDurationConstrainedToRecurrenceIntervalInStore()
{
  return MEMORY[0x1F410E838]();
}

uint64_t CalEventGetCalendarId()
{
  return MEMORY[0x1F410E840]();
}

uint64_t CalEventGetDeliverySourceOrExternalIDRequiredForResponseInStore()
{
  return MEMORY[0x1F410E848]();
}

uint64_t CalEventGetDuration()
{
  return MEMORY[0x1F410E850]();
}

uint64_t CalEventGetEndDate()
{
  return MEMORY[0x1F410E858]();
}

uint64_t CalEventGetFutureStartDateLimitedToOccurrenceCacheBoundsInStore()
{
  return MEMORY[0x1F410E860]();
}

uint64_t CalEventGetInvitationChangedProperties()
{
  return MEMORY[0x1F410E868]();
}

uint64_t CalEventGetJunkStatus()
{
  return MEMORY[0x1F410E870]();
}

uint64_t CalEventGetOccurrenceOrderEnforcedAfterDetachmentInStore()
{
  return MEMORY[0x1F410E878]();
}

uint64_t CalEventGetOccurrencesMustOccurOnSeparateDaysInStore()
{
  return MEMORY[0x1F410E880]();
}

uint64_t CalEventGetParticipationStatus()
{
  return MEMORY[0x1F410E888]();
}

uint64_t CalEventGetParticipationStatusModifiedDate()
{
  return MEMORY[0x1F410E890]();
}

uint64_t CalEventGetProposedStartDate()
{
  return MEMORY[0x1F410E898]();
}

uint64_t CalEventGetProposedStatusRequiredForResponseInStore()
{
  return MEMORY[0x1F410E8A0]();
}

uint64_t CalEventGetRejectedStatusChangeRequiresNoExternalStatusInStore()
{
  return MEMORY[0x1F410E8A8]();
}

uint64_t CalEventGetStartDate()
{
  return MEMORY[0x1F410E8B0]();
}

uint64_t CalEventGetStartDateOfEarliestOccurrenceEndingAfterDateWithExclusions()
{
  return MEMORY[0x1F410E8B8]();
}

uint64_t CalEventGetStatus()
{
  return MEMORY[0x1F410E8C0]();
}

uint64_t CalEventGetStatusIsAccurateInStore()
{
  return MEMORY[0x1F410E8C8]();
}

uint64_t CalEventGetTravelAdvisoryBehavior()
{
  return MEMORY[0x1F410E8D0]();
}

uint64_t CalEventGetUID()
{
  return MEMORY[0x1F410E8D8]();
}

uint64_t CalEventHasPredictedLocation()
{
  return MEMORY[0x1F410E8E0]();
}

uint64_t CalEventIsAllDay()
{
  return MEMORY[0x1F410E8E8]();
}

uint64_t CalEventIsCandidateForTravelAdvisories()
{
  return MEMORY[0x1F410E8F0]();
}

uint64_t CalEventIsDetached()
{
  return MEMORY[0x1F410E8F8]();
}

uint64_t CalEventIsFloating()
{
  return MEMORY[0x1F410E900]();
}

uint64_t CalEventIsImmediatelyEligibleForTravelAdvisories()
{
  return MEMORY[0x1F410E908]();
}

uint64_t CalEventIsRecurring()
{
  return MEMORY[0x1F410E910]();
}

uint64_t CalEventNextReminderOccurrenceDateIfEventKitIsLikelyToWantIt()
{
  return MEMORY[0x1F410E918]();
}

uint64_t CalEventOccurrenceCacheCopyAllDaysAndOccurrenceCounts()
{
  return MEMORY[0x1F410E920]();
}

uint64_t CalEventOccurrenceCacheCopyEventOccurrencesAfterDate()
{
  return MEMORY[0x1F410E930]();
}

uint64_t CalEventOccurrenceCacheCopyEventOccurrencesInDateRange()
{
  return MEMORY[0x1F410E938]();
}

uint64_t CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate()
{
  return MEMORY[0x1F410E940]();
}

uint64_t CalEventOccurrenceCacheCopyOccurrencesOnDay()
{
  return MEMORY[0x1F410E948]();
}

uint64_t CalEventOccurrenceCacheCopyTimeZone()
{
  return MEMORY[0x1F410E950]();
}

uint64_t CalEventOccurrenceCacheCount()
{
  return MEMORY[0x1F410E958]();
}

uint64_t CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate()
{
  return MEMORY[0x1F410E960]();
}

uint64_t CalEventOccurrenceCacheMergeCounts()
{
  return MEMORY[0x1F410E970]();
}

uint64_t CalEventOccurrenceCacheProcessEventOccurrencesInDateRange()
{
  return MEMORY[0x1F410E978]();
}

uint64_t CalEventOccurrenceCacheTrimExtendAndUpdate()
{
  return MEMORY[0x1F410E980]();
}

uint64_t CalEventOccurrenceCreateForInitialOccurrence()
{
  return MEMORY[0x1F410E988]();
}

uint64_t CalEventOccurrenceCreateForInitialOccurrenceWithTimeZone()
{
  return MEMORY[0x1F410E990]();
}

uint64_t CalEventOccurrenceGetDate()
{
  return MEMORY[0x1F410E998]();
}

uint64_t CalEventOccurrenceGetEvent()
{
  return MEMORY[0x1F410E9A0]();
}

uint64_t CalEventOccurrenceGetTypeID()
{
  return MEMORY[0x1F410E9A8]();
}

uint64_t CalEventOccurrencesExistForEventInDateRange()
{
  return MEMORY[0x1F410E9B0]();
}

uint64_t CalEventPreferredLocationIsAConferenceRoom()
{
  return MEMORY[0x1F410E9B8]();
}

uint64_t CalEventRequiresOutgoingInvitationsInDefaultCalendarInStore()
{
  return MEMORY[0x1F410E9C0]();
}

uint64_t CalEventResponseCommentsSupportedInStore()
{
  return MEMORY[0x1F410E9C8]();
}

uint64_t CalEventSetInvitationChangedProperties()
{
  return MEMORY[0x1F410E9D0]();
}

uint64_t CalEventSetNeedsNotification()
{
  return MEMORY[0x1F410E9D8]();
}

uint64_t CalEventURLFieldSupportedInStore()
{
  return MEMORY[0x1F410E9E0]();
}

uint64_t CalExceptionDateCopyOwner()
{
  return MEMORY[0x1F410E9E8]();
}

uint64_t CalFilterCreateWithDatabaseFilteringCalendars()
{
  return MEMORY[0x1F410E9F8]();
}

uint64_t CalFilterCreateWithDatabaseFilteringCalendarsWithUIDs()
{
  return MEMORY[0x1F410EA00]();
}

uint64_t CalFilterCreateWithDatabaseShowingAll()
{
  return MEMORY[0x1F410EA08]();
}

uint64_t CalFilterCreateWithDatabaseShowingCalendars()
{
  return MEMORY[0x1F410EA10]();
}

uint64_t CalFilterCreateWithDatabaseShowingCalendarsWithUIDs()
{
  return MEMORY[0x1F410EA18]();
}

uint64_t CalFilterCreateWithDatabaseShowingCalendarsWithUIDsAndEntityType()
{
  return MEMORY[0x1F410EA20]();
}

uint64_t CalFilterSetSearchTerm()
{
  return MEMORY[0x1F410EA28]();
}

uint64_t CalGenerateQualifiedIdentifierWithClassAndSubdomain()
{
  return MEMORY[0x1F410F2F0]();
}

uint64_t CalGetDatabaseForRecord()
{
  return MEMORY[0x1F410EA30]();
}

uint64_t CalGetRecordLock()
{
  return MEMORY[0x1F410EA38]();
}

uint64_t CalHasCurrentUserInvitedAttendeeWithEmail()
{
  return MEMORY[0x1F410EA48]();
}

uint64_t CalHasCurrentUserInvitedAttendeeWithPhoneNumber()
{
  return MEMORY[0x1F410EA50]();
}

uint64_t CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithEmail()
{
  return MEMORY[0x1F410EA58]();
}

uint64_t CalHasCurrentUserRepondedPositivelyToInvitationsWithAttendeeWithPhoneNumber()
{
  return MEMORY[0x1F410EA60]();
}

uint64_t CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithEmail()
{
  return MEMORY[0x1F410EA68]();
}

uint64_t CalHasCurrentUserRespondedPositivelyToInvitationsFromOrganizerWithPhoneNumber()
{
  return MEMORY[0x1F410EA70]();
}

uint64_t CalIdentityGarbageCollectOrphans()
{
  return MEMORY[0x1F410EA78]();
}

uint64_t CalImageCopyStore()
{
  return MEMORY[0x1F410EA80]();
}

uint64_t CalInviteReplyNotificationCopyHostURL()
{
  return MEMORY[0x1F410EA90]();
}

uint64_t CalInviteReplyNotificationCopyInviteReplyCalendar()
{
  return MEMORY[0x1F410EA98]();
}

uint64_t CalInviteReplyNotificationCopyOwner()
{
  return MEMORY[0x1F410EAA0]();
}

uint64_t CalItemsUpdateFromiCalendarDocumentWithOptionsIncludingPhantomMaster()
{
  return MEMORY[0x1F410EAA8]();
}

uint64_t CalLocationCopyOwner()
{
  return MEMORY[0x1F410EAB0]();
}

uint64_t CalLocationCopyTitle()
{
  return MEMORY[0x1F410EAB8]();
}

uint64_t CalLocationGetCoordinates()
{
  return MEMORY[0x1F410EAC0]();
}

uint64_t CalLocationHasCoordinates()
{
  return MEMORY[0x1F410EAD0]();
}

uint64_t CalLocationHasKnownSpatialData()
{
  return MEMORY[0x1F410EAD8]();
}

uint64_t CalMonotonicTime()
{
  return MEMORY[0x1F410F358]();
}

uint64_t CalNSTimeIntervalToContinuousInterval()
{
  return MEMORY[0x1F410F360]();
}

uint64_t CalNotificationCopyOwner()
{
  return MEMORY[0x1F410EAE0]();
}

uint64_t CalNotificationGetCreationDate()
{
  return MEMORY[0x1F410EAE8]();
}

uint64_t CalNotificationGetEntityType()
{
  return MEMORY[0x1F410EAF0]();
}

uint64_t CalNotificationGetUID()
{
  return MEMORY[0x1F410EB00]();
}

uint64_t CalOrganizerCopyEmailAddress()
{
  return MEMORY[0x1F410EB08]();
}

uint64_t CalOrganizerCopyOwner()
{
  return MEMORY[0x1F410EB10]();
}

uint64_t CalOrganizerCopyPhoneNumber()
{
  return MEMORY[0x1F410EB18]();
}

uint64_t CalOrganizerIsSelf()
{
  return MEMORY[0x1F410EB28]();
}

uint64_t CalParticipantCopyOwner()
{
  return MEMORY[0x1F410EB30]();
}

uint64_t CalParticipantGetProposedStartDateChanged()
{
  return MEMORY[0x1F410EB38]();
}

uint64_t CalParticipantGetStatusChanged()
{
  return MEMORY[0x1F410EB40]();
}

uint64_t CalParticipantSetProposedStartDateChanged()
{
  return MEMORY[0x1F410EB48]();
}

uint64_t CalRecordIDCreate()
{
  return MEMORY[0x1F410EB50]();
}

uint64_t CalRecurrenceCopyOwner()
{
  return MEMORY[0x1F410EB58]();
}

uint64_t CalRecurrenceGetEffectiveEndDate()
{
  return MEMORY[0x1F410EB68]();
}

uint64_t CalRedactURLString()
{
  return MEMORY[0x1F410F368]();
}

uint64_t CalRelationGetRelatedObject()
{
  return MEMORY[0x1F410EB78]();
}

uint64_t CalRelationGetTypeID()
{
  return MEMORY[0x1F410EB80]();
}

uint64_t CalRelationSetRelatedObject()
{
  return MEMORY[0x1F410EB88]();
}

uint64_t CalRemoveAuxDatabase()
{
  return MEMORY[0x1F410EB90]();
}

uint64_t CalRemoveClientForPersistentChangeTracking()
{
  return MEMORY[0x1F410EBA0]();
}

uint64_t CalRemoveNotification()
{
  return MEMORY[0x1F410EBA8]();
}

uint64_t CalRemoveResourceChange()
{
  return MEMORY[0x1F410EBB0]();
}

uint64_t CalResourceChangeCopyCalendar()
{
  return MEMORY[0x1F410EBC0]();
}

uint64_t CalResourceChangeCopyCalendarItem()
{
  return MEMORY[0x1F410EBC8]();
}

uint64_t CalResourceChangeCopyNotification()
{
  return MEMORY[0x1F410EBD0]();
}

uint64_t CalResourceChangeGetPublicStatus()
{
  return MEMORY[0x1F410EBE0]();
}

uint64_t CalResourceChangeGetType()
{
  return MEMORY[0x1F410EBE8]();
}

uint64_t CalResourceChangeGetUID()
{
  return MEMORY[0x1F410EBF0]();
}

uint64_t CalResourceChangeNotificationCopyChanges()
{
  return MEMORY[0x1F410EBF8]();
}

uint64_t CalResourceChangeNotificationCopyOwner()
{
  return MEMORY[0x1F410EC00]();
}

uint64_t CalResourceChangeSetAlerted()
{
  return MEMORY[0x1F410EC08]();
}

uint64_t CalSetShowCompletedReminders()
{
  return MEMORY[0x1F410EC10]();
}

uint64_t CalSetShowDeclinedEvents()
{
  return MEMORY[0x1F410EC18]();
}

uint64_t CalShareeCopyOwner()
{
  return MEMORY[0x1F410EC20]();
}

uint64_t CalShareeGetAccessLevel()
{
  return MEMORY[0x1F410EC28]();
}

uint64_t CalShowCompletedReminders()
{
  return MEMORY[0x1F410EC38]();
}

uint64_t CalShowDeclinedEvents()
{
  return MEMORY[0x1F410EC40]();
}

uint64_t CalStoreAllowsCalendarAddDeleteModify()
{
  return MEMORY[0x1F410EC48]();
}

uint64_t CalStoreAllowsEvents()
{
  return MEMORY[0x1F410EC50]();
}

uint64_t CalStoreAllowsPrivateEventAccessByDelegate()
{
  return MEMORY[0x1F410EC58]();
}

uint64_t CalStoreAllowsProposeNewTime()
{
  return MEMORY[0x1F410EC60]();
}

uint64_t CalStoreAllowsTasks()
{
  return MEMORY[0x1F410EC68]();
}

uint64_t CalStoreAreRecurrencesPinnedToMonthDays()
{
  return MEMORY[0x1F410EC70]();
}

uint64_t CalStoreCopyCalendars()
{
  return MEMORY[0x1F410EC78]();
}

uint64_t CalStoreCopyDefaultAlarmOffset()
{
  return MEMORY[0x1F410EC80]();
}

uint64_t CalStoreCopyDelegatedAccountOwnerStoreID()
{
  return MEMORY[0x1F410EC88]();
}

uint64_t CalStoreCopyExternalID()
{
  return MEMORY[0x1F410EC90]();
}

uint64_t CalStoreCopyName()
{
  return MEMORY[0x1F410ECA0]();
}

uint64_t CalStoreCopyUUID()
{
  return MEMORY[0x1F410ECA8]();
}

uint64_t CalStoreGetMaxAlarmsSupported()
{
  return MEMORY[0x1F410ECB0]();
}

uint64_t CalStoreGetMaxRecurrencesSupported()
{
  return MEMORY[0x1F410ECB8]();
}

uint64_t CalStoreGetProhibitsICSImport()
{
  return MEMORY[0x1F410ECC0]();
}

uint64_t CalStoreGetStrictestEventPrivateValue()
{
  return MEMORY[0x1F410ECD0]();
}

uint64_t CalStoreGetSupportsClearingPrivateComments()
{
  return MEMORY[0x1F410ECD8]();
}

uint64_t CalStoreGetSupportsIncomingInvitations()
{
  return MEMORY[0x1F410ECE0]();
}

uint64_t CalStoreGetSupportsInvitationModifications()
{
  return MEMORY[0x1F410ECE8]();
}

uint64_t CalStoreGetSupportsJunkReporting()
{
  return MEMORY[0x1F410ECF0]();
}

uint64_t CalStoreGetSupportsOutgoingInvitations()
{
  return MEMORY[0x1F410ECF8]();
}

uint64_t CalStoreGetSupportsPhoneNumbers()
{
  return MEMORY[0x1F410ED00]();
}

uint64_t CalStoreGetType()
{
  return MEMORY[0x1F410ED08]();
}

uint64_t CalStoreGetUID()
{
  return MEMORY[0x1F410ED10]();
}

uint64_t CalStoreIsDelegate()
{
  return MEMORY[0x1F410ED18]();
}

uint64_t CalStoreIsEnabled()
{
  return MEMORY[0x1F410ED20]();
}

uint64_t CalStoreIsFacebook()
{
  return MEMORY[0x1F410ED28]();
}

uint64_t CalStoreIsWritable()
{
  return MEMORY[0x1F410ED30]();
}

uint64_t CalStoreMustAcknowledgeMasterEvent()
{
  return MEMORY[0x1F410ED38]();
}

uint64_t CalStoreProhibitsDetachmentOnCommentChange()
{
  return MEMORY[0x1F410ED40]();
}

uint64_t CalStoreProhibitsMultipleDaysInMonthlyRecurrence()
{
  return MEMORY[0x1F410ED48]();
}

uint64_t CalStoreProhibitsMultipleMonthsInYearlyRecurrence()
{
  return MEMORY[0x1F410ED50]();
}

uint64_t CalStoreProhibitsPrivateEventsWithAttendees()
{
  return MEMORY[0x1F410ED58]();
}

uint64_t CalStoreProhibitsSlicingEventsWithAttendees()
{
  return MEMORY[0x1F410ED60]();
}

uint64_t CalStoreProhibitsUsingEventOrganizerEmailWhenComposingMail()
{
  return MEMORY[0x1F410ED68]();
}

uint64_t CalStoreProhibitsYearlyRecurrenceInterval()
{
  return MEMORY[0x1F410ED70]();
}

uint64_t CalStoreRecurrenceSeriesMustIncludeMoreThanFirstOccurrence()
{
  return MEMORY[0x1F410ED78]();
}

uint64_t CalStoreRemoveItemsOfTypeOlderThanDateInStore()
{
  return MEMORY[0x1F410ED80]();
}

uint64_t CalStoreRepairDefaultLocalStore()
{
  return MEMORY[0x1F410ED88]();
}

uint64_t CalStoreRequiresMSFormattedUIDKey()
{
  return MEMORY[0x1F410ED90]();
}

uint64_t CalStoreRequiresOccurrencesConformToRecurrenceRule()
{
  return MEMORY[0x1F410ED98]();
}

uint64_t CalStoreRequiresOpeningAttachmentAsLink()
{
  return MEMORY[0x1F410EDA0]();
}

uint64_t CalStoreRequiresSamePrivacyLevelAcrossRecurrenceSeries()
{
  return MEMORY[0x1F410EDA8]();
}

uint64_t CalStoreRequiresSeparateFilesForAllAttachments()
{
  return MEMORY[0x1F410EDB0]();
}

uint64_t CalStoreSetEnabled()
{
  return MEMORY[0x1F410EDB8]();
}

uint64_t CalStoreShouldUseDeleteAndAddInsteadOfMoveBetweenCalendars()
{
  return MEMORY[0x1F410EDC8]();
}

uint64_t CalStoreShowsNotifications()
{
  return MEMORY[0x1F410EDD0]();
}

uint64_t CalStoreSnoozeAlarmRequiresDetach()
{
  return MEMORY[0x1F410EDD8]();
}

uint64_t CalStoreSupportsAlarmProximity()
{
  return MEMORY[0x1F410EDE0]();
}

uint64_t CalStoreSupportsAlarmTriggerDates()
{
  return MEMORY[0x1F410EDE8]();
}

uint64_t CalStoreSupportsAlarmTriggerIntervals()
{
  return MEMORY[0x1F410EDF0]();
}

uint64_t CalStoreSupportsAlarmsTriggeringAfterStartDate()
{
  return MEMORY[0x1F410EDF8]();
}

uint64_t CalStoreSupportsAttachments()
{
  return MEMORY[0x1F410EE00]();
}

uint64_t CalStoreSupportsAutoGeocodingStructuredLocations()
{
  return MEMORY[0x1F410EE08]();
}

uint64_t CalStoreSupportsAvailabilityRequests()
{
  return MEMORY[0x1F410EE10]();
}

uint64_t CalStoreSupportsDelegateEnumeration()
{
  return MEMORY[0x1F410EE18]();
}

uint64_t CalStoreSupportsDelegation()
{
  return MEMORY[0x1F410EE20]();
}

uint64_t CalStoreSupportsEventForwarding()
{
  return MEMORY[0x1F410EE28]();
}

uint64_t CalStoreSupportsFloatingTimeZone()
{
  return MEMORY[0x1F410EE30]();
}

uint64_t CalStoreSupportsIgnoringEventsInAvailabilityRequests()
{
  return MEMORY[0x1F410EE38]();
}

uint64_t CalStoreSupportsInboxAvailability()
{
  return MEMORY[0x1F410EE40]();
}

uint64_t CalStoreSupportsInvitationModificationsWithoutNotification()
{
  return MEMORY[0x1F410EE48]();
}

uint64_t CalStoreSupportsLocationDirectorySearches()
{
  return MEMORY[0x1F410EE50]();
}

uint64_t CalStoreSupportsManagedSubscriptionCalendars()
{
  return MEMORY[0x1F410EE58]();
}

uint64_t CalStoreSupportsParticipantRoles()
{
  return MEMORY[0x1F410EE60]();
}

uint64_t CalStoreSupportsPrivateEvents()
{
  return MEMORY[0x1F410EE68]();
}

uint64_t CalStoreSupportsPush()
{
  return MEMORY[0x1F410EE70]();
}

uint64_t CalStoreSupportsRecurrenceSplit()
{
  return MEMORY[0x1F410EE78]();
}

uint64_t CalStoreSupportsRecurrencesOnDetachedEvents()
{
  return MEMORY[0x1F410EE80]();
}

uint64_t CalStoreSupportsReminderActions()
{
  return MEMORY[0x1F410EE88]();
}

uint64_t CalStoreSupportsReminderLocations()
{
  return MEMORY[0x1F410EE90]();
}

uint64_t CalStoreSupportsSharedCalendars()
{
  return MEMORY[0x1F410EE98]();
}

uint64_t CalStoreSupportsStructuredLocations()
{
  return MEMORY[0x1F410EEA0]();
}

uint64_t CalStoreSupportsSubscriptionCalendars()
{
  return MEMORY[0x1F410EEA8]();
}

uint64_t CalStoreSupportsSubscriptionMirroring()
{
  return MEMORY[0x1F410EEB0]();
}

uint64_t CalStoreSupportsTravelTime()
{
  return MEMORY[0x1F410EEB8]();
}

uint64_t CalSuggestedEventInfoCopyOwner()
{
  return MEMORY[0x1F410EEC0]();
}

uint64_t CalSuggestionNotificationCopyOwner()
{
  return MEMORY[0x1F410EED0]();
}

uint64_t CalTaskAllDayDueDatesSupportedInStore()
{
  return MEMORY[0x1F410EED8]();
}

uint64_t CalTaskCopyDueDate()
{
  return MEMORY[0x1F410EEE0]();
}

uint64_t CalTaskCopyDueDateTimeZone()
{
  return MEMORY[0x1F410EEE8]();
}

uint64_t CalTaskCopyURI()
{
  return MEMORY[0x1F410EEF0]();
}

uint64_t CalToManyRelationCopyObjects()
{
  return MEMORY[0x1F410EEF8]();
}

uint64_t CalToManyRelationGetTypeID()
{
  return MEMORY[0x1F410EF00]();
}

uint64_t DACPLoggingAddCustomLogFile()
{
  return MEMORY[0x1F4117108]();
}

uint64_t DACPLoggingAppendDataToLogFile()
{
  return MEMORY[0x1F4117110]();
}

uint64_t DACustomLogDirectory()
{
  return MEMORY[0x1F4117128]();
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x1F41173D0]();
}

uint64_t EKWeakLinkClass()
{
  return MEMORY[0x1F410F400]();
}

uint64_t ICSRedactBytes()
{
  return MEMORY[0x1F4177BD8]();
}

uint64_t ICSRedactString()
{
  return MEMORY[0x1F4177BE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PAAuthenticatedClientIdentity()
{
  return MEMORY[0x1F4145F18]();
}

uint64_t PCSettingsGetStyle()
{
  return MEMORY[0x1F413F1C8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t SpotlightDaemonClientRegister()
{
  return MEMORY[0x1F415BAA8]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _CalAlarmGetWithUID()
{
  return MEMORY[0x1F410EF08]();
}

uint64_t _CalAttachmentFileGetWithUID()
{
  return MEMORY[0x1F410EF10]();
}

uint64_t _CalAttachmentGetWithUID()
{
  return MEMORY[0x1F410EF18]();
}

uint64_t _CalCalendarCopyUUID()
{
  return MEMORY[0x1F410EF20]();
}

uint64_t _CalCalendarGetStore()
{
  return MEMORY[0x1F410EF28]();
}

uint64_t _CalCalendarItemCopyUUID()
{
  return MEMORY[0x1F410EF30]();
}

uint64_t _CalCalendarItemCreate()
{
  return MEMORY[0x1F410EF38]();
}

uint64_t _CalCalendarItemCreateCopy()
{
  return MEMORY[0x1F410EF40]();
}

uint64_t _CalCalendarItemGetCalendar()
{
  return MEMORY[0x1F410EF48]();
}

uint64_t _CalCalendarItemHasRecurrenceRules()
{
  return MEMORY[0x1F410EF50]();
}

uint64_t _CalCalendarItemRemoveExceptionDate()
{
  return MEMORY[0x1F410EF58]();
}

uint64_t _CalCategoryGetWithUID()
{
  return MEMORY[0x1F410EF60]();
}

uint64_t _CalColorGetWithUID()
{
  return MEMORY[0x1F410EF70]();
}

uint64_t _CalConferenceGetWithUID()
{
  return MEMORY[0x1F410EF78]();
}

uint64_t _CalContactGetWithUID()
{
  return MEMORY[0x1F410EF80]();
}

uint64_t _CalCreateResourceChangeOfType()
{
  return MEMORY[0x1F410EF88]();
}

uint64_t _CalDatabaseCopyCalendar()
{
  return MEMORY[0x1F410EF90]();
}

uint64_t _CalDatabaseCopyCalendarItemsWithCalendar()
{
  return MEMORY[0x1F410EF98]();
}

uint64_t _CalDatabaseCreateAlarm()
{
  return MEMORY[0x1F410EFA0]();
}

uint64_t _CalDatabaseCreateAttachment()
{
  return MEMORY[0x1F410EFA8]();
}

uint64_t _CalDatabaseCreateAttendee()
{
  return MEMORY[0x1F410EFB0]();
}

uint64_t _CalDatabaseCreateCalendarForEntityType()
{
  return MEMORY[0x1F410EFB8]();
}

uint64_t _CalDatabaseCreateCategory()
{
  return MEMORY[0x1F410EFC0]();
}

uint64_t _CalDatabaseCreateColor()
{
  return MEMORY[0x1F410EFC8]();
}

uint64_t _CalDatabaseCreateConference()
{
  return MEMORY[0x1F410EFD0]();
}

uint64_t _CalDatabaseCreateContact()
{
  return MEMORY[0x1F410EFD8]();
}

uint64_t _CalDatabaseCreateError()
{
  return MEMORY[0x1F410EFE0]();
}

uint64_t _CalDatabaseCreateEventAction()
{
  return MEMORY[0x1F410EFE8]();
}

uint64_t _CalDatabaseCreateExceptionDate()
{
  return MEMORY[0x1F410EFF0]();
}

uint64_t _CalDatabaseCreateImage()
{
  return MEMORY[0x1F410EFF8]();
}

uint64_t _CalDatabaseCreateInviteReplyNotification()
{
  return MEMORY[0x1F410F000]();
}

uint64_t _CalDatabaseCreateLocation()
{
  return MEMORY[0x1F410F008]();
}

uint64_t _CalDatabaseCreateNotification()
{
  return MEMORY[0x1F410F010]();
}

uint64_t _CalDatabaseCreateOrganizer()
{
  return MEMORY[0x1F410F018]();
}

uint64_t _CalDatabaseCreateRecurrence()
{
  return MEMORY[0x1F410F020]();
}

uint64_t _CalDatabaseCreateResourceChangeNotification()
{
  return MEMORY[0x1F410F028]();
}

uint64_t _CalDatabaseCreateSharee()
{
  return MEMORY[0x1F410F030]();
}

uint64_t _CalDatabaseCreateStore()
{
  return MEMORY[0x1F410F038]();
}

uint64_t _CalDatabaseCreateSuggestedEventInfo()
{
  return MEMORY[0x1F410F040]();
}

uint64_t _CalDatabaseCreateSuggestionNotification()
{
  return MEMORY[0x1F410F048]();
}

uint64_t _CalDatabaseGetImageWithIdentifierInStoreID()
{
  return MEMORY[0x1F410F050]();
}

uint64_t _CalDatabaseGetLimitedAccessVirtualCalendar()
{
  return MEMORY[0x1F410F058]();
}

uint64_t _CalDatabaseGetLimitedAccessVirtualStore()
{
  return MEMORY[0x1F410F060]();
}

uint64_t _CalDatabaseGetRecordStore()
{
  return MEMORY[0x1F410F068]();
}

uint64_t _CalDatabasePostDBOrSyncStatusChangeNotification()
{
  return MEMORY[0x1F410F070]();
}

uint64_t _CalEntityGetType()
{
  return MEMORY[0x1F410F078]();
}

uint64_t _CalEntityIsDeleted()
{
  return MEMORY[0x1F410F080]();
}

uint64_t _CalEntityIsOfType()
{
  return MEMORY[0x1F410F088]();
}

uint64_t _CalErrorGetWithUID()
{
  return MEMORY[0x1F410F090]();
}

uint64_t _CalEventActionGetWithUID()
{
  return MEMORY[0x1F410F098]();
}

uint64_t _CalEventGetDuration()
{
  return MEMORY[0x1F410F0A8]();
}

uint64_t _CalEventGetJunkStatusWhileLocked()
{
  return MEMORY[0x1F410F0B0]();
}

uint64_t _CalEventIsDetached()
{
  return MEMORY[0x1F410F0B8]();
}

uint64_t _CalEventOccurrenceCacheCopySpotlightOccurrenceDates()
{
  return MEMORY[0x1F410F0C0]();
}

uint64_t _CalEventSetInvitationStatus()
{
  return MEMORY[0x1F410F0C8]();
}

uint64_t _CalExceptionDateGetOwner()
{
  return MEMORY[0x1F410F0D0]();
}

uint64_t _CalExceptionDateGetWithUID()
{
  return MEMORY[0x1F410F0D8]();
}

uint64_t _CalGetCalendarItemWithRowID()
{
  return MEMORY[0x1F410F0E0]();
}

uint64_t _CalGetCalendarWithUID()
{
  return MEMORY[0x1F410F0E8]();
}

uint64_t _CalGetStoreWithUID()
{
  return MEMORY[0x1F410F0F0]();
}

uint64_t _CalImageGetWithUID()
{
  return MEMORY[0x1F410F0F8]();
}

uint64_t _CalLocationGetWithUID()
{
  return MEMORY[0x1F410F100]();
}

uint64_t _CalNotificationGetWithUID()
{
  return MEMORY[0x1F410F108]();
}

uint64_t _CalParticipantGetWithUID()
{
  return MEMORY[0x1F410F110]();
}

uint64_t _CalRecurrenceGetWithUID()
{
  return MEMORY[0x1F410F118]();
}

uint64_t _CalRemoveCalendar()
{
  return MEMORY[0x1F410F138]();
}

uint64_t _CalResourceChangeGetWithUID()
{
  return MEMORY[0x1F410F1C0]();
}

uint64_t _CalShareeGetWithUID()
{
  return MEMORY[0x1F410F1C8]();
}

uint64_t _CalStoreAddCalendar()
{
  return MEMORY[0x1F410F1D0]();
}

uint64_t _CalStoreCopyUUID()
{
  return MEMORY[0x1F410F1D8]();
}

uint64_t _CalSuggestedEventInfoGetWithUID()
{
  return MEMORY[0x1F410F1E0]();
}

uint64_t _CalTimeZoneForceUpdate()
{
  return MEMORY[0x1F410F428]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1F40D9630]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

uint64_t dispatch_workloop_is_current()
{
  return MEMORY[0x1F40CBD60]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1F40CC0E8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x1F40CC388](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  CFIndex v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1F4181F68](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1F4181F70](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1F4181F88](p, *(void *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x1F415CC50]();
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1F415CCA8]();
}

uint64_t tcc_events_filter_create_with_criteria()
{
  return MEMORY[0x1F415CCD0]();
}

uint64_t tcc_events_subscribe()
{
  return MEMORY[0x1F415CCD8]();
}

uint64_t tcc_identity_copy_external_representation()
{
  return MEMORY[0x1F415CCE8]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_identity_create_from_external_representation()
{
  return MEMORY[0x1F415CCF8]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_client_dict()
{
  return MEMORY[0x1F415CD38]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return MEMORY[0x1F415CD90]();
}

uint64_t tcc_server_message_request_authorization_change()
{
  return MEMORY[0x1F415CDC0]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1F415CDF8]();
}

int ungetc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CE5D0](*(void *)&a1, a2);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA98](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}