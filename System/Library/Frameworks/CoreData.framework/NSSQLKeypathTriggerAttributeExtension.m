@interface NSSQLKeypathTriggerAttributeExtension
- (BOOL)isEqualToExtension:(id)a3;
- (BOOL)validate:(id *)a3;
- (NSArray)bulkUpdateSQLStrings;
- (NSArray)dropSQLStrings;
- (NSArray)insertSQLStrings;
- (NSSQLKeypathTriggerAttributeExtension)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5;
- (NSString)description;
- (uint64_t)validateKeypath:(uint64_t)result;
- (void)dealloc;
@end

@implementation NSSQLKeypathTriggerAttributeExtension

- (NSSQLKeypathTriggerAttributeExtension)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  v8 = [(NSSQLKeypathTriggerAttributeExtension *)&v11 init];
  if (v8)
  {
    v8->_objectFromUserInfo = a3;
    if (a5) {
      v9 = (void *)[*((id *)a5 + 5) objectForKey:a4];
    }
    else {
      v9 = 0;
    }
    v8->_attribute = (NSSQLAttribute *)v9;
    v8->_entity = (NSSQLEntity *)a5;
    v8->_insertSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v8->_dropSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v8->_bulkUpdateSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  return v8;
}

- (void)dealloc
{
  self->_countedRelationship = 0;
  self->_insertSQLStrings = 0;

  self->_dropSQLStrings = 0;
  self->_bulkUpdateSQLStrings = 0;

  self->_entity = 0;
  self->_attribute = 0;

  self->_keypath = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  [(NSSQLKeypathTriggerAttributeExtension *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  return [(NSString *)[(NSSQLKeypathTriggerAttributeExtension *)&v3 description] stringByAppendingFormat:@" %@.%@ = %@", [(NSSQLEntity *)self->_entity name], [(NSSQLProperty *)self->_attribute name], self->_objectFromUserInfo];
}

- (BOOL)validate:(id *)a3
{
  v89[1] = *MEMORY[0x1E4F143B8];
  v67 = 0;
  id objectFromUserInfo = self->_objectFromUserInfo;
  if (objectFromUserInfo)
  {
    if ([objectFromUserInfo isNSString])
    {
      if ([self->_objectFromUserInfo length])
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v7 = (void *)[MEMORY[0x1E4F28C68] expressionWithFormat:self->_objectFromUserInfo];
        v8 = v7;
        if (v7)
        {
          if ([v7 expressionType] == 3)
          {
            v9 = (void *)[v8 minimalFormInContext:v6];
            if ([v9 expressionType] == 4)
            {
              v10 = (const char *)[v9 selector];
              if (v10 == NSSelectorFromString((NSString *)@"count:"))
              {
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "arguments"), "lastObject"), "expressionType") == 3)
                {
                  self->_keypath = (NSString *)(id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "arguments"), "lastObject"), "keyPath");
                  attribute = self->_attribute;
                  if (attribute)
                  {
                    if (attribute->super.super._propertyType == 1)
                    {
                      uint64_t v57 = objc_msgSend(-[NSSQLAttribute attributeDescription](attribute, "attributeDescription"), "attributeType");
                      if (v57 == 100 || v57 == 200 || v57 == 300)
                      {
                        char v35 = -[NSSQLKeypathTriggerAttributeExtension validateKeypath:]((uint64_t)self, (uint64_t *)&v67);
LABEL_23:
                        if ([v6 objectForKey:@"NSUnderlyingException"])
                        {
                          v45 = (void *)MEMORY[0x1E4F28C58];
                          uint64_t v74 = *MEMORY[0x1E4F28588];
                          v75[0] = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: Only expressions of the form 'relationship.@count' are supported.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name")];
                          uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
                          v67 = (void *)[v45 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v46];
                        }

                        if (v35) {
                          return 1;
                        }
                        v15 = v67;
                        if (!v67) {
                          goto LABEL_28;
                        }
                        goto LABEL_13;
                      }
                      v58 = (void *)MEMORY[0x1E4F28C58];
                      uint64_t v88 = *MEMORY[0x1E4F28588];
                      v89[0] = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: property '%@' is not an integer.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), -[NSSQLProperty name](self->_attribute, "name")];
                      uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
                    }
                    else
                    {
                      v58 = (void *)MEMORY[0x1E4F28C58];
                      uint64_t v86 = *MEMORY[0x1E4F28588];
                      uint64_t v87 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: Must be set on an attribute of type %@.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", 300)];
                      uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
                    }
                  }
                  else
                  {
                    v58 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v84 = *MEMORY[0x1E4F28588];
                    uint64_t v85 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: property '%@' not found.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), self->_objectFromUserInfo];
                    uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
                  }
                  uint64_t v36 = [v58 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v59];
                  if (v36) {
                    goto LABEL_20;
                  }
                  uint64_t v60 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                  _NSCoreDataLog(17, v60, v61, v62, v63, v64, v65, v66, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
                  v44 = __pflogFaultLog;
                  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_22;
                  }
                  *(_DWORD *)buf = 136315394;
                  v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
                  __int16 v82 = 1024;
                  int v83 = 187;
                  goto LABEL_46;
                }
                objc_super v11 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v88 = *MEMORY[0x1E4F28588];
                v89[0] = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: '%@' does not evaluate to a keypath expression.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), objc_msgSend((id)objc_msgSend(v9, "arguments"), "lastObject")];
                uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
              }
              else
              {
                objc_super v11 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v86 = *MEMORY[0x1E4F28588];
                uint64_t v87 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: The function '%@' is not supported, only 'count' is supported at this time.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), NSStringFromSelector((SEL)objc_msgSend(v9, "selector"))];
                uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
              }
            }
            else
            {
              objc_super v11 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v84 = *MEMORY[0x1E4F28588];
              uint64_t v85 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: '%@' does not evaluate to a function expression.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name"), self->_objectFromUserInfo];
              uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
            }
            uint64_t v36 = [v11 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v12];
            if (v36)
            {
LABEL_20:
              v67 = (void *)v36;
LABEL_22:
              char v35 = 0;
              goto LABEL_23;
            }
            uint64_t v37 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
            _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
            v44 = __pflogFaultLog;
            if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 136315394;
            v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
            __int16 v82 = 1024;
            int v83 = 150;
LABEL_46:
            _os_log_fault_impl(&dword_18AB82000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
            goto LABEL_22;
          }
          v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v78 = *MEMORY[0x1E4F28588];
          uint64_t v79 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: Only expressions of the form 'relationship.@count' are supported.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name")];
          uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          uint64_t v32 = [v33 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v34];
        }
        else
        {
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v76 = *MEMORY[0x1E4F28588];
          v26 = NSString;
          id v27 = [(NSSQLEntity *)self->_entity name];
          id v28 = [(NSSQLProperty *)self->_attribute name];
          id v29 = self->_objectFromUserInfo;
          v30 = (objc_class *)objc_opt_class();
          uint64_t v77 = [v26 stringWithFormat:@"The trigger on %@.%@ is not valid: could not turn '%@' in to an instance of %@", v27, v28, v29, NSStringFromClass(v30)];
          uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          uint64_t v32 = [v25 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v31];
        }
        char v35 = 0;
        v67 = (void *)v32;
        goto LABEL_23;
      }
      v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v72 = *MEMORY[0x1E4F28588];
      uint64_t v73 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: empty string is not a valid expression.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name")];
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      v15 = (void *)[v22 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v23];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v70 = *MEMORY[0x1E4F28588];
      v17 = NSString;
      id v18 = [(NSSQLEntity *)self->_entity name];
      id v19 = [(NSSQLProperty *)self->_attribute name];
      v20 = (objc_class *)objc_opt_class();
      uint64_t v71 = [v17 stringWithFormat:@"The trigger on %@.%@ is not valid: must be an instance of %@.", v18, v19, NSStringFromClass(v20)];
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v15 = (void *)[v16 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v21];
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *MEMORY[0x1E4F28588];
    uint64_t v69 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: nil is not a valid expression.", -[NSSQLEntity name](self->_entity, "name"), -[NSSQLProperty name](self->_attribute, "name")];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    v15 = (void *)[v13 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v14];
  }
  v67 = v15;
  if (!v15)
  {
LABEL_28:
    uint64_t v47 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v47, v48, v49, v50, v51, v52, v53, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
    v54 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v81 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
      __int16 v82 = 1024;
      int v83 = 118;
      _os_log_fault_impl(&dword_18AB82000, v54, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
LABEL_13:
  if (!a3) {
    return 0;
  }
  BOOL v24 = 0;
  *a3 = v15;
  return v24;
}

- (uint64_t)validateKeypath:(uint64_t)result
{
  v98[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 48);
    if (v4) {
      v5 = (void *)[*(id *)(v4 + 40) objectForKey:*(void *)(result + 16)];
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    v7 = v6;
    if (v6)
    {
      if (v6[24] - 7 > 2)
      {
        char v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F281F8];
        uint64_t v95 = *MEMORY[0x1E4F28588];
        uint64_t v96 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: keypath '%@' is not a relationship.", objc_msgSend(*(id *)(v3 + 48), "name"), objc_msgSend(*(id *)(v3 + 56), "name"), *(void *)(v3 + 16)];
        uint64_t v37 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v38 = &v96;
        uint64_t v39 = &v95;
      }
      else
      {
        if (([v6 isToMany] & 1) != 0 || v7[24] == 9)
        {
          *(void *)(v3 + 64) = v7;
          uint64_t v8 = *(void *)(v3 + 56);
          if (v8) {
            *(_WORD *)(v8 + 32) |= 8u;
          }
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v88 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v11 = [*(id *)(v3 + 56) columnName];
          uint64_t v12 = [*(id *)(v3 + 48) tableName];
          uint64_t v83 = v11;
          uint64_t v13 = [NSString stringWithFormat:@"ZT_%@_%@_%@", v12, v11, objc_msgSend(*(id *)(v3 + 64), "name")];
          uint64_t v14 = *(void *)(v3 + 48);
          if (v14) {
            v15 = *(void **)(v14 + 128);
          }
          else {
            v15 = 0;
          }
          uint64_t v16 = [v15 columnName];
          uint64_t v17 = *(void *)(v3 + 48);
          if (v17) {
            id v18 = *(void **)(v17 + 136);
          }
          else {
            id v18 = 0;
          }
          uint64_t v87 = [v18 columnName];
          uint64_t v19 = *(void *)(v3 + 64);
          if (v19 && *(unsigned char *)(v19 + 24) == 9)
          {
            uint64_t v20 = [*(id *)(v3 + 64) correlationTableName];
            uint64_t v85 = v13;
            uint64_t v76 = [(id)v19 columnName];
            v81 = -[NSSQLManyToMany inverseColumnName]((__CFString *)v19);
            id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            uint64_t v78 = v7;
            id v22 = v9;
            uint64_t v84 = v9;
            uint64_t v23 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INSERT_INCREMENT", v13, v20];
            uint64_t v79 = v10;
            BOOL v24 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v23];
            [v21 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@ AFTER INSERT ON %@ FOR EACH ROW", v23, v20];
            [v21 appendString:@" BEGIN"];
            uint64_t v25 = v83;
            [v21 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v12, v83, v83];
            [v21 appendFormat:@" WHERE NEW.%@ = %@;", v76, v16];
            objc_msgSend(v21, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
              v12,
              v87,
              v16,
              v25,
              v25,
              v12,
              v16,
              v76);
            [v21 appendFormat:@" END"];
            [v88 addObject:v24];

            v26 = v22;
            v7 = v78;
            [v26 addObject:v21];

            id v27 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            uint64_t v77 = v20;
            id v28 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_DELETE_DECREMENT", v85, v20];
            id v29 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v28];
            [v27 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@ AFTER DELETE ON %@ FOR EACH ROW", v28, v20];
            [v27 appendFormat:@" BEGIN"];
            [v27 appendFormat:@" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1)", v12, v25, v25];
            [v27 appendFormat:@" WHERE OLD.%@ = %@;", v76, v16];
            uint64_t v30 = v16;
            objc_msgSend(v27, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
              v12,
              v87,
              v16,
              v25,
              v25,
              v12,
              v16,
              v76);
            [v27 appendFormat:@" END"];
            [v84 addObject:v27];
            [v88 addObject:v29];

            id v10 = v79;
            uint64_t v31 = (void *)[[NSString alloc] initWithFormat:@"COUNT_%@", v85];
            uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CREATE TEMP TABLE %@ AS", v31];
            [v32 appendFormat:@" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT", v76, v77, v81];
            [v32 appendFormat:@" FROM %@", v77];
            [v32 appendFormat:@" GROUP BY %@;", v76];
            [v79 addObject:v32];

            v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" CREATE INDEX %@_INDEX ON %@(%@,COUNT);",
                            v31,
                            v31,
                            v76);
            [v79 addObject:v33];

            uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@),0);",
                    v12,
                    v83,
                    v31,
                    v30,
                    v76);
          }
          else
          {
            if (![*(id *)(v3 + 64) isToMany])
            {
LABEL_24:

              *(void *)(v3 + 24) = [v9 copy];
              *(void *)(v3 + 32) = [v88 copy];

              *(void *)(v3 + 40) = [v10 copy];
              return 1;
            }
            uint64_t v40 = *(void *)(v3 + 64);
            v80 = v10;
            uint64_t v75 = v16;
            uint64_t v41 = v12;
            if (v40) {
              uint64_t v42 = *(void **)(v40 + 56);
            }
            else {
              uint64_t v42 = 0;
            }
            uint64_t v43 = [v42 columnName];
            id v44 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            uint64_t v86 = v13;
            v45 = (void *)[[NSString alloc] initWithFormat:@"%@_INSERT_INCREMENT", v13];
            uint64_t v46 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v45];
            uint64_t v82 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 64), "destinationEntity"), "tableName");
            [v44 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v45];
            [v44 appendFormat:@" AFTER INSERT ON %@ FOR EACH ROW", v82];
            [v44 appendFormat:@" BEGIN"];
            uint64_t v47 = v83;
            [v44 appendFormat:@" UPDATE %@ SET %@ = IFNULL(%@,0) + 1", v41, v83, v83];
            uint64_t v48 = v75;
            [v44 appendFormat:@" WHERE NEW.%@ = %@;", v43, v75];
            objc_msgSend(v44, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            [v44 appendFormat:@" END"];
            [v9 addObject:v44];
            [v88 addObject:v46];

            id v49 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            uint64_t v50 = (void *)[[NSString alloc] initWithFormat:@"%@_DELETE_DECREMENT", v86];
            uint64_t v51 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v50];
            [v49 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v50];
            [v49 appendFormat:@" AFTER DELETE ON %@", v82];
            [v49 appendFormat:@" BEGIN"];
            objc_msgSend(v49, "appendFormat:", @" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE OLD.%@ = %@;",
              v41,
              v47,
              v47,
              v43,
              v75);
            objc_msgSend(v49, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            [v49 appendFormat:@" END"];
            [v9 addObject:v49];
            [v88 addObject:v51];

            id v52 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            uint64_t v53 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INSERT_INCREMENT", v86, v41];
            v54 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v53];
            [v52 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v53];
            [v52 appendFormat:@" AFTER INSERT ON %@ FOR EACH ROW", v41];
            [v52 appendFormat:@" BEGIN"];
            objc_msgSend(v52, "appendFormat:", @" UPDATE %@ SET %@ = (SELECT COUNT(%@) FROM %@ WHERE (%@ = NEW.%@)) WHERE %@ = NEW.%@;",
              v41,
              v83,
              v48,
              v82,
              v43,
              v48,
              v48,
              v48);
            objc_msgSend(v52, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v48);
            [v52 appendFormat:@" END"];
            [v9 addObject:v52];
            [v88 addObject:v54];

            id v55 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            v56 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_UPDATE_INCREMENT", v86, v43];
            uint64_t v57 = v9;
            uint64_t v84 = v9;
            v58 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v56];
            [v55 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v56];
            [v55 appendFormat:@" AFTER UPDATE OF %@ ON %@ WHEN", v43, v82];
            [v55 appendFormat:@" ((NEW.%@ IS NOT NULL AND OLD.%@ IS NULL) OR (NEW.%@ != OLD.%@))", v43, v43, v43, v43];
            [v55 appendFormat:@" BEGIN"];
            objc_msgSend(v55, "appendFormat:", @" UPDATE %@ SET %@ = IFNULL(%@,0) + 1 WHERE %@ = NEW.%@;",
              v41,
              v47,
              v47,
              v75,
              v43);
            objc_msgSend(v55, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = NEW.%@;",
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            [v55 appendFormat:@" END"];
            [v57 addObject:v55];
            [v88 addObject:v58];

            id v59 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            uint64_t v60 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_UPDATE_DECREMENT", v86, v43];
            uint64_t v61 = (void *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS %@", v60];
            [v59 appendFormat:@"CREATE TRIGGER IF NOT EXISTS %@", v60];
            [v59 appendFormat:@" AFTER UPDATE OF %@ ON %@ WHEN", v43, v82];
            [v59 appendFormat:@" ((OLD.%@ IS NOT NULL AND NEW.%@ IS NULL) OR (NEW.%@ != OLD.%@))", v43, v43, v43, v43];
            [v59 appendFormat:@" BEGIN"];
            objc_msgSend(v59, "appendFormat:", @" UPDATE %@ SET %@ = MAX(0,IFNULL(%@,0) - 1) WHERE %@ = OLD.%@;",
              v41,
              v47,
              v47,
              v75,
              v43);
            objc_msgSend(v59, "appendFormat:", @" SELECT NSCoreDataTriggerUpdateAffectedObjectValue('%@', %@, %@, '%@', %@) FROM %@ WHERE %@ = OLD.%@;",
              v41,
              v87,
              v48,
              v47,
              v47,
              v41,
              v48,
              v43);
            [v59 appendFormat:@" END"];
            [v84 addObject:v59];
            [v88 addObject:v61];

            uint64_t v31 = (void *)[[NSString alloc] initWithFormat:@"COUNT_%@", v86];
            uint64_t v62 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"CREATE TEMP TABLE %@ AS", v31];
            [v62 appendFormat:@" SELECT %@, COUNT(DISTINCT(%@.%@)) AS COUNT", v43, v82, v75];
            [v62 appendFormat:@" FROM %@", v82];
            [v62 appendFormat:@" GROUP BY %@;", v43];
            id v10 = v80;
            [v80 addObject:v62];

            uint64_t v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" CREATE INDEX %@_INDEX ON %@(%@,COUNT);",
                            v31,
                            v31,
                            v43);
            [v80 addObject:v63];

            uint64_t v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" UPDATE %@ SET %@ = IFNULL((SELECT COUNT FROM %@ WHERE %@ = %@), 0);",
                    v41,
                    v83,
                    v31,
                    v75,
                    v43);
          }
          uint64_t v64 = (void *)v34;
          [v10 addObject:v34];

          uint64_t v65 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@" DROP TABLE %@;", v31];
          [v10 addObject:v65];

          id v9 = v84;
          goto LABEL_24;
        }
        char v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F281F8];
        uint64_t v97 = *MEMORY[0x1E4F28588];
        v98[0] = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: relationship '%@' is not a to-many.", objc_msgSend(*(id *)(v3 + 48), "name"), objc_msgSend(*(id *)(v3 + 56), "name"), *(void *)(v3 + 16)];
        uint64_t v37 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v38 = v98;
        uint64_t v39 = &v97;
      }
    }
    else
    {
      char v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F281F8];
      uint64_t v93 = *MEMORY[0x1E4F28588];
      uint64_t v94 = [NSString stringWithFormat:@"The trigger on %@.%@ is not valid: '%@' is not a property of '%@'.", objc_msgSend(*(id *)(v3 + 48), "name"), objc_msgSend(*(id *)(v3 + 56), "name"), *(void *)(v3 + 16), objc_msgSend(*(id *)(v3 + 48), "name")];
      uint64_t v37 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v38 = &v94;
      uint64_t v39 = &v93;
    }
    uint64_t v66 = objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 134060, objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1));

    if (v66)
    {
      if (a2)
      {
        result = 0;
        *a2 = v66;
        return result;
      }
    }
    else
    {
      uint64_t v67 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v67, v68, v69, v70, v71, v72, v73, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m");
      uint64_t v74 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315394;
      v90 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLKeypathTriggerAttributeExtension.m";
      __int16 v91 = 1024;
      int v92 = 221;
      _os_log_fault_impl(&dword_18AB82000, v74, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  return result;
}

- (BOOL)isEqualToExtension:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NSSQLKeypathTriggerAttributeExtension;
  if (-[NSSQLKeypathTriggerAttributeExtension isEqual:](&v13, sel_isEqual_))
  {
LABEL_2:
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  keypath = self->_keypath;
  if (!keypath)
  {
    id objectFromUserInfo = self->_objectFromUserInfo;
    if (a3) {
      id v9 = (id)*((void *)a3 + 1);
    }
    else {
      id v9 = 0;
    }
    if (objectFromUserInfo == v9) {
      goto LABEL_2;
    }
    int v5 = [objectFromUserInfo isNSString];
    if (!v5) {
      return v5;
    }
    if (a3)
    {
      int v5 = [*((id *)a3 + 1) isNSString];
      if (!v5) {
        return v5;
      }
      uint64_t v10 = *((void *)a3 + 1);
      goto LABEL_15;
    }
    char v11 = [0 isNSString];
    uint64_t v10 = 0;
    if (v11)
    {
LABEL_15:
      int v5 = [self->_objectFromUserInfo isEqualToString:v10];
      if (!v5) {
        return v5;
      }
      goto LABEL_2;
    }
LABEL_20:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (a3) {
    uint64_t v7 = *((void *)a3 + 2);
  }
  else {
    uint64_t v7 = 0;
  }
  LOBYTE(v5) = [(NSString *)keypath isEqualToString:v7];
  return v5;
}

- (NSArray)insertSQLStrings
{
  return self->_insertSQLStrings;
}

- (NSArray)dropSQLStrings
{
  return self->_dropSQLStrings;
}

- (NSArray)bulkUpdateSQLStrings
{
  return self->_bulkUpdateSQLStrings;
}

@end