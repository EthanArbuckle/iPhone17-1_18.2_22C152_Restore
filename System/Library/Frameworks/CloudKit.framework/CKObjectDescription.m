@interface CKObjectDescription
- (BOOL)avoidShortDescription;
- (BOOL)printAsDictionary;
- (BOOL)redact;
- (CKObjectDescription)initWithObject:(id)a3 redact:(BOOL)a4;
- (CKObjectDescription)initWithObject:(id)a3 redact:(BOOL)a4 avoidShortDescription:(BOOL)a5;
- (CKOrderedDictionary)orderedDictionary;
- (NSString)descriptionPrefix;
- (id)_arrayDescription:(id)a3 shouldRedact:(BOOL)a4;
- (id)_dictionaryDescription:(id)a3 shouldRedact:(BOOL)a4;
- (id)_propertyDescriptionForProperty:(id)a3 shouldRedact:(BOOL)a4;
- (id)description;
- (id)unorderedDictionary;
- (void)_addProperty:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5;
- (void)addBooleanProperty:(id)a3 value:(BOOL)a4;
- (void)addBooleanProperty:(id)a3 value:(BOOL)a4 defaultValue:(int64_t)a5;
- (void)addFlagsForKey:(id)a3 flagsAndConditions:(id)a4;
- (void)addProperty:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5;
- (void)addPropertyIfExists:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5;
- (void)setDescriptionPrefix:(id)a3;
- (void)setOrderedDictionary:(id)a3;
- (void)setPrintAsDictionary:(BOOL)a3;
@end

@implementation CKObjectDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedDictionary, 0);

  objc_storeStrong((id *)&self->_descriptionPrefix, 0);
}

- (void)_addProperty:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5
{
  if (a4)
  {
    BOOL v7 = a5;
    id v9 = a3;
    objc_msgSend__propertyDescriptionForProperty_shouldRedact_(self, v10, (uint64_t)a4, v7);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_forKey_(self->_orderedDictionary, v11, (uint64_t)v19, (uint64_t)v9);
  }
  else
  {
    orderedDictionary = self->_orderedDictionary;
    v13 = (void *)MEMORY[0x1E4F1CA98];
    id v14 = a3;
    objc_msgSend_null(v13, v15, v16, v17);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_forKey_(orderedDictionary, v18, (uint64_t)v19, (uint64_t)v14);
  }
}

- (id)_propertyDescriptionForProperty:(id)a3 shouldRedact:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend__arrayDescription_shouldRedact_(self, v7, (uint64_t)v6, v4);
LABEL_18:
    v35 = (__CFString *)v8;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend__dictionaryDescription_shouldRedact_(self, v9, (uint64_t)v6, v4);
    goto LABEL_18;
  }
  v10 = objc_opt_class();
  if (objc_msgSend_conformsToProtocol_(v10, v11, (uint64_t)&unk_1ED849A28, v12))
  {
    id v16 = v6;
    if ((objc_msgSend_avoidShortDescription(self, v17, v18, v19) & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v28 = objc_msgSend_redact(self, v20, v21, v22);
      uint64_t v32 = objc_msgSend_avoidShortDescription(self, v29, v30, v31);
      uint64_t v34 = objc_msgSend_CKObjectDescriptionRedact_avoidShortDescription_(v16, v33, v28, v32);
    }
    else
    {
      if (v4)
      {
        uint64_t v23 = objc_msgSend_redact(self, v20, v21, v22);
        objc_msgSend_CKShortDescriptionRedact_(v16, v24, v23, v25);
      }
      else
      {
        objc_msgSend_CKShortDescriptionRedact_(v16, v20, 0, v22);
      uint64_t v34 = };
    }
    v35 = (__CFString *)v34;
  }
  else
  {
    if (!v4 || !objc_msgSend_redact(self, v13, v14, v15))
    {
      uint64_t v8 = objc_msgSend_description(v6, v13, v14, v15);
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
      {
        uint64_t v8 = objc_msgSend_performSelector_(v6, v26, (uint64_t)sel_redactedDescription, v27);
        goto LABEL_18;
      }
    }
    v35 = @"<private>";
  }
LABEL_19:

  return v35;
}

- (id)description
{
  uint64_t v5 = objc_msgSend_count(self->_orderedDictionary, a2, v2, v3);
  int v9 = objc_msgSend_printAsDictionary(self, v6, v7, v8);
  if (v5)
  {
    if (v9)
    {
      uint64_t v12 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v10, @"{ ", v11);
    }
    else
    {
      uint64_t v12 = objc_msgSend_stringWithString_(MEMORY[0x1E4F28E78], v10, (uint64_t)self->_descriptionPrefix, v11);
      objc_msgSend_appendString_(v12, v14, @" ", v15);
    }
    orderedDictionary = self->_orderedDictionary;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_18AF2C9FC;
    v30[3] = &unk_1E54624F0;
    v13 = v12;
    uint64_t v31 = v13;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(orderedDictionary, v17, (uint64_t)v30, v18);
    uint64_t v22 = objc_msgSend_length(v13, v19, v20, v21);
    objc_msgSend_deleteCharactersInRange_(v13, v23, v22 - 2, 2);
    if (objc_msgSend_printAsDictionary(self, v24, v25, v26)) {
      objc_msgSend_appendString_(v13, v27, @" }", v28);
    }
    else {
      objc_msgSend_appendString_(v13, v27, @">", v28);
    }
  }
  else if (v9)
  {
    v13 = @"{}";
  }
  else
  {
    objc_msgSend_stringByAppendingString_(self->_descriptionPrefix, v10, @">", v11);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)printAsDictionary
{
  return self->_printAsDictionary;
}

- (BOOL)avoidShortDescription
{
  return self->_avoidShortDescription;
}

- (BOOL)redact
{
  return self->_redact;
}

- (CKObjectDescription)initWithObject:(id)a3 redact:(BOOL)a4 avoidShortDescription:(BOOL)a5
{
  id v8 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CKObjectDescription;
  int v9 = [(CKObjectDescription *)&v33 init];
  v13 = v9;
  if (v9)
  {
    v9->_printAsDictionary = 0;
    v9->_redact = a4;
    v9->_avoidShortDescription = a5;
    if (v8)
    {
      int ShouldPrintPointer = objc_msgSend_CKDescriptionShouldPrintPointer(v8, v10, v11, v12);
      uint64_t v15 = NSString;
      uint64_t v19 = objc_msgSend_CKDescriptionClassName(v8, v16, v17, v18);
      uint64_t v22 = (void *)v19;
      if (ShouldPrintPointer) {
        objc_msgSend_stringWithFormat_(v15, v20, @"<%@: %p;", v21, v19, v8);
      }
      else {
      uint64_t v23 = objc_msgSend_stringWithFormat_(v15, v20, @"<%@", v21, v19);
      }
      descriptionPrefix = v13->_descriptionPrefix;
      v13->_descriptionPrefix = (NSString *)v23;
    }
    uint64_t v25 = objc_msgSend_orderedDictionary(CKOrderedDictionary, v10, v11, v12);
    orderedDictionary = v13->_orderedDictionary;
    v13->_orderedDictionary = (CKOrderedDictionary *)v25;

    uint64_t v27 = objc_opt_class();
    if (objc_msgSend_conformsToProtocol_(v27, v28, (uint64_t)&unk_1ED849A28, v29)) {
      objc_msgSend_CKDescribePropertiesUsing_(v8, v30, (uint64_t)v13, v31);
    }
  }

  return v13;
}

- (void)addProperty:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5
{
}

- (void)addPropertyIfExists:(id)a3 value:(id)a4 shouldRedact:(BOOL)a5
{
  if (a4) {
    MEMORY[0x1F4181798](self, sel__addProperty_value_shouldRedact_, a3, a4);
  }
}

- (CKObjectDescription)initWithObject:(id)a3 redact:(BOOL)a4
{
  return (CKObjectDescription *)objc_msgSend_initWithObject_redact_avoidShortDescription_(self, a2, (uint64_t)a3, a4, 0);
}

- (void)addBooleanProperty:(id)a3 value:(BOOL)a4
{
}

- (void)addBooleanProperty:(id)a3 value:(BOOL)a4 defaultValue:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = (const char *)a3;
  int v9 = v8;
  if (v6)
  {
    if (a5 == 1) {
      goto LABEL_7;
    }
    v10 = @"YES";
  }
  else
  {
    if (!a5) {
      goto LABEL_7;
    }
    v10 = @"NO";
  }
  uint64_t v11 = v8;
  id v8 = (const char *)objc_msgSend_addObject_forKey_(self->_orderedDictionary, v8, (uint64_t)v10, (uint64_t)v8);
  int v9 = v11;
LABEL_7:

  MEMORY[0x1F41817F8](v8, v9);
}

- (void)addFlagsForKey:(id)a3 flagsAndConditions:(id)a4
{
  id v19 = a3;
  id v8 = objc_msgSend_CKCompactMap_(a4, v6, (uint64_t)&unk_1ED7EF6D8, v7);
  if (objc_msgSend_count(v8, v9, v10, v11))
  {
    uint64_t v14 = objc_msgSend_sortedArrayUsingSelector_(v8, v12, (uint64_t)sel_compare_, v13);
    uint64_t v17 = objc_msgSend_componentsJoinedByString_(v14, v15, @"|", v16);

    objc_msgSend_addObject_forKey_(self->_orderedDictionary, v18, (uint64_t)v17, (uint64_t)v19);
  }
}

- (id)_arrayDescription:(id)a3 shouldRedact:(BOOL)a4
{
  id v6 = a3;
  if (objc_msgSend_avoidShortDescription(self, v7, v8, v9))
  {
    uint64_t v12 = objc_msgSend_orderedDictionaryWithCapacity_(CKOrderedDictionary, v10, 2, v11);
    objc_msgSend_addObject_forKey_(v12, v13, @"array", @"type");
    objc_msgSend_addObject_forKey_(v12, v14, @"items", @"items");
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_18B19E780;
    v16[3] = &unk_1E5466108;
    v16[4] = self;
    BOOL v17 = a4;
    uint64_t v12 = objc_msgSend_CKMap_(v6, v10, (uint64_t)v16, v11);
  }

  return v12;
}

- (id)_dictionaryDescription:(id)a3 shouldRedact:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_18B19E820;
  v6[3] = &unk_1E5466130;
  v6[4] = self;
  BOOL v7 = a4;
  BOOL v4 = objc_msgSend_CKMapValues_(a3, a2, (uint64_t)v6, a4);

  return v4;
}

- (id)unorderedDictionary
{
  return (id)objc_msgSend_dictionaryRepresentationRecursive_(self->_orderedDictionary, a2, 1, v2);
}

- (void)setPrintAsDictionary:(BOOL)a3
{
  self->_printAsDictionary = a3;
}

- (NSString)descriptionPrefix
{
  return self->_descriptionPrefix;
}

- (void)setDescriptionPrefix:(id)a3
{
}

- (CKOrderedDictionary)orderedDictionary
{
  return self->_orderedDictionary;
}

- (void)setOrderedDictionary:(id)a3
{
}

@end