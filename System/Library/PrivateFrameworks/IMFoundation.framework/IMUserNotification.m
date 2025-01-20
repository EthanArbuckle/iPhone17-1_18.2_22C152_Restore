@interface IMUserNotification
+ (id)userNotificationWithIdentifier:(id)a3 timeout:(double)a4 alertLevel:(unint64_t)a5 displayFlags:(unint64_t)a6 displayInformation:(id)a7;
+ (id)userNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 alternateButton:(id)a7 otherButton:(id)a8;
+ (id)userNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 defaultButtonStyle:(unint64_t)a7 alternateButton:(id)a8 alternateButtonStyle:(unint64_t)a9 otherButton:(id)a10 otherButtonStyle:(unint64_t)a11;
- (BOOL)requireUserInteraction;
- (BOOL)showInLockScreen;
- (BOOL)usesNotificationCenter;
- (NSDictionary)displayInformation;
- (NSDictionary)responseInformation;
- (NSDictionary)userInfo;
- (NSString)representedApplicationBundle;
- (double)timeout;
- (id)_initWithIdentifier:(id)a3 timeout:(double)a4 displayFlags:(unint64_t)a5 displayInformation:(id)a6;
- (id)identifier;
- (unint64_t)displayFlags;
- (unint64_t)response;
- (unint64_t)responseFlags;
- (void)_setResponseFlags:(unint64_t)a3 responseInformation:(id)a4;
- (void)setShowInLockScreen:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation IMUserNotification

- (id)_initWithIdentifier:(id)a3 timeout:(double)a4 displayFlags:(unint64_t)a5 displayInformation:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v38.receiver = self;
  v38.super_class = (Class)IMUserNotification;
  v12 = [(IMUserNotification *)&v38 init];
  if (v12)
  {
    id v13 = objc_alloc(NSNumber);
    v17 = objc_msgSend_initWithDouble_(v13, v14, v15, v16, a4);
    id v18 = objc_alloc(NSNumber);
    v21 = objc_msgSend_initWithUnsignedInteger_(v18, v19, a5, v20);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v25 = v22;
    if (v10) {
      objc_msgSend_setObject_forKey_(v22, v23, (uint64_t)v10, @"Identifier");
    }
    if (v17) {
      objc_msgSend_setObject_forKey_(v25, v23, (uint64_t)v17, @"Timeout");
    }
    if (v21) {
      objc_msgSend_setObject_forKey_(v25, v23, (uint64_t)v21, @"DisplayFlags");
    }
    if (v11)
    {
      v28 = objc_msgSend_objectForKey_(v11, v23, @"IconURL", v24);
      if (v28
        && (uint64_t v29 = *MEMORY[0x1E4F1D9E8],
            objc_msgSend_objectForKey_(v11, v26, *MEMORY[0x1E4F1D9E8], v27),
            v30 = objc_claimAutoreleasedReturnValue(),
            v30,
            !v30))
      {
        v33 = objc_msgSend_mutableCopy(v11, v26, v31, v32);
        objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)v28, v29);
        objc_msgSend_setObject_forKey_(v25, v35, (uint64_t)v33, @"DisplayInformation");
      }
      else
      {
        objc_msgSend_setObject_forKey_(v25, v26, (uint64_t)v11, @"DisplayInformation");
      }
    }
    id reserved = v12->_reserved;
    v12->_id reserved = v25;
  }
  return v12;
}

+ (id)userNotificationWithIdentifier:(id)a3 timeout:(double)a4 alertLevel:(unint64_t)a5 displayFlags:(unint64_t)a6 displayInformation:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  id v14 = objc_alloc((Class)a1);
  uint64_t v16 = objc_msgSend__initWithIdentifier_timeout_displayFlags_displayInformation_(v14, v15, (uint64_t)v13, a6 | a5, v12, a4);

  return v16;
}

+ (id)userNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 alternateButton:(id)a7 otherButton:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_opt_class();
  v21 = objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_defaultButtonStyle_alternateButton_alternateButtonStyle_otherButton_otherButtonStyle_(v19, v20, (uint64_t)v18, (uint64_t)v17, v16, v15, 0, v14, 0, v13, 0);

  return v21;
}

+ (id)userNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 defaultButtonStyle:(unint64_t)a7 alternateButton:(id)a8 alternateButtonStyle:(unint64_t)a9 otherButton:(id)a10 otherButtonStyle:(unint64_t)a11
{
  id v40 = a1;
  id v41 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a10;
  id v21 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v24 = objc_msgSend_initWithCapacity_(v21, v22, 5, v23);
  if (!objc_msgSend_length(v20, v25, v26, v27) || objc_msgSend_length(v18, v28, v29, v30))
  {
    uint64_t v31 = v20;
    id v20 = v18;
    if (!v16) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  uint64_t v31 = 0;
  if (v16) {
LABEL_4:
  }
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v16, @"AlertHeader", v40);
LABEL_5:
  if (v17) {
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v17, @"AlertMessage");
  }
  if (v20) {
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v20, @"DefaultButtonTitle");
  }
  if (v19) {
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v19, @"AlternateButtonTitle");
  }
  if (v31) {
    objc_msgSend_setObject_forKey_(v24, v28, (uint64_t)v31, @"OtherButtonTitle");
  }
  if (a7)
  {
    uint64_t v32 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v28, a7, v30);
    objc_msgSend_setObject_forKey_(v24, v33, (uint64_t)v32, @"SBUserNotificationDefaultButtonPresentationStyle");
  }
  if (a9)
  {
    v34 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v28, a9, v30);
    objc_msgSend_setObject_forKey_(v24, v35, (uint64_t)v34, @"SBUserNotificationAlternateButtonPresentationStyle");
  }
  if (a11)
  {
    v36 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v28, a11, v30);
    objc_msgSend_setObject_forKey_(v24, v37, (uint64_t)v36, @"SBUserNotificationOtherButtonPresentationStyle");
  }
  objc_super v38 = objc_msgSend_userNotificationWithIdentifier_timeout_alertLevel_displayFlags_displayInformation_(v40, v28, (uint64_t)v41, 3, 0, v24, 0.0, v40);

  return v38;
}

- (id)identifier
{
  return (id)objc_msgSend_objectForKey_(self->_reserved, a2, @"Identifier", v2);
}

- (double)timeout
{
  v3 = objc_msgSend_objectForKey_(self->_reserved, a2, @"Timeout", v2);
  objc_msgSend_doubleValue(v3, v4, v5, v6);
  double v8 = v7;

  return v8;
}

- (unint64_t)displayFlags
{
  v3 = objc_msgSend_objectForKey_(self->_reserved, a2, @"DisplayFlags", v2);
  unint64_t v7 = objc_msgSend_unsignedIntegerValue(v3, v4, v5, v6);

  return v7;
}

- (NSDictionary)displayInformation
{
  return (NSDictionary *)objc_msgSend_objectForKey_(self->_reserved, a2, @"DisplayInformation", v2);
}

- (unint64_t)response
{
  return objc_msgSend_responseFlags(self, a2, v2, v3) & 3;
}

- (NSString)representedApplicationBundle
{
  v4 = objc_msgSend_displayInformation(self, a2, v2, v3);
  unint64_t v7 = objc_msgSend_objectForKey_(v4, v5, @"ApplicationIdentifier", v6);

  return (NSString *)v7;
}

- (BOOL)showInLockScreen
{
  v4 = objc_msgSend_displayInformation(self, a2, v2, v3);
  unint64_t v7 = objc_msgSend_objectForKey_(v4, v5, *MEMORY[0x1E4F1D9B8], v6);
  BOOL v11 = objc_msgSend_intValue(v7, v8, v9, v10) != 0;

  return v11;
}

- (void)setShowInLockScreen:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_displayInformation(self, a2, a3, v3);
  CFAllocatorRef allocatora = (CFAllocatorRef)objc_msgSend_mutableCopy(v6, v7, v8, v9);

  CFMutableDictionaryRef Mutable = allocatora;
  if (!allocatora) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v12 = *MEMORY[0x1E4F1D9B8];
  CFAllocatorRef allocator = Mutable;
  if (v4)
  {
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    objc_msgSend_setObject_forKey_(Mutable, v10, MEMORY[0x1E4F1CC38], v12);
    objc_msgSend_setObject_forKey_(allocator, v14, v13, @"SBUserNotificationAllowInStark");
  }
  else
  {
    objc_msgSend_removeObjectForKey_(Mutable, v10, v12, v12);
    objc_msgSend_removeObjectForKey_(allocator, v18, @"SBUserNotificationAllowInStark", v19);
  }
  uint64_t v22 = objc_msgSend_count(allocator, v15, v16, v17);
  id reserved = self->_reserved;
  if (v22) {
    objc_msgSend_setObject_forKey_(reserved, v20, (uint64_t)allocator, @"DisplayInformation");
  }
  else {
    objc_msgSend_removeObjectForKey_(reserved, v20, @"DisplayInformation", v21);
  }
}

- (BOOL)usesNotificationCenter
{
  uint64_t v3 = objc_msgSend_objectForKey_(self->_reserved, a2, @"UsesNotificationCenter", v2);
  BOOL v7 = objc_msgSend_intValue(v3, v4, v5, v6) != 0;

  return v7;
}

- (BOOL)requireUserInteraction
{
  return 1;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_msgSend_objectForKey_(self->_reserved, a2, @"UserInfo", v2);
}

- (void)setUserInfo:(id)a3
{
  id reserved = self->_reserved;
  if (a3) {
    objc_msgSend_setObject_forKey_(reserved, a2, (uint64_t)a3, @"UserInfo");
  }
  else {
    objc_msgSend_removeObjectForKey_(reserved, a2, @"UserInfo", v3);
  }
}

- (unint64_t)responseFlags
{
  uint64_t v3 = objc_msgSend_objectForKey_(self->_reserved, a2, @"ResponseFlags", v2);
  unint64_t v7 = objc_msgSend_unsignedIntegerValue(v3, v4, v5, v6);

  return v7;
}

- (NSDictionary)responseInformation
{
  return (NSDictionary *)objc_msgSend_objectForKey_(self->_reserved, a2, @"ResponseInformation", v2);
}

- (void)_setResponseFlags:(unint64_t)a3 responseInformation:(id)a4
{
  id v11 = a4;
  id v6 = objc_alloc(NSNumber);
  uint64_t v10 = objc_msgSend_initWithUnsignedInteger_(v6, v7, a3, v8);
  if (v10) {
    objc_msgSend_setObject_forKey_(self->_reserved, v9, (uint64_t)v10, @"ResponseFlags");
  }
  if (v11) {
    objc_msgSend_setObject_forKey_(self->_reserved, v9, (uint64_t)v11, @"ResponseInformation");
  }
}

- (void).cxx_destruct
{
}

@end