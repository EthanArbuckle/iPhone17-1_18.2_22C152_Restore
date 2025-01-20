@interface DUStructuredEntityObjC
- (DUCalendarEventObjC)calendarEvent;
- (DUDebugInfoObjC)responseDebugInfo;
- (DUDisplayInfoObjC)displayInfo;
- (DUStructuredEntityObjC)init;
- (NSArray)labels;
- (NSDictionary)addressComponents;
- (NSString)email;
- (NSString)homeAutomationID;
- (NSString)phoneNumber;
- (NSString)title;
- (NSString)type;
- (NSString)url;
- (void)setAddressComponents:(id)a3;
- (void)setCalendarEvent:(id)a3;
- (void)setDisplayInfo:(id)a3;
- (void)setEmail:(id)a3;
- (void)setHomeAutomationID:(id)a3;
- (void)setLabels:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setResponseDebugInfo:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation DUStructuredEntityObjC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

- (void)setLabels:(id)a3
{
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setResponseDebugInfo:(id)a3
{
  objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseDebugInfo_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (DUDebugInfoObjC)responseDebugInfo
{
  v5 = objc_msgSend_responseDebugInfo(self->_underlying, a2, v2, v3, v4);
  id v9 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v6, (uint64_t)v5, v7, v8);

  return (DUDebugInfoObjC *)v9;
}

- (void)setDisplayInfo:(id)a3
{
  objc_msgSend_displayInfoForObjC_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDisplayInfo_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (DUDisplayInfoObjC)displayInfo
{
  v5 = objc_msgSend_displayInfo(self->_underlying, a2, v2, v3, v4);
  id v9 = objc_msgSend_objCForDisplayInfo_(DUObjCCompatibilityUtils, v6, (uint64_t)v5, v7, v8);

  return (DUDisplayInfoObjC *)v9;
}

- (void)setHomeAutomationID:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setHomeAutomationID_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSString)homeAutomationID
{
  return (NSString *)objc_msgSend_homeAutomationID(self->_underlying, a2, v2, v3, v4);
}

- (void)setCalendarEvent:(id)a3
{
  objc_msgSend_calendarEventForObjCCalendarEvent_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCalendarEvent_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (DUCalendarEventObjC)calendarEvent
{
  v5 = objc_msgSend_calendarEvent(self->_underlying, a2, v2, v3, v4);
  id v9 = objc_msgSend_objCCalendarEventForCalendarEvent_(DUObjCCompatibilityUtils, v6, (uint64_t)v5, v7, v8);

  return (DUCalendarEventObjC *)v9;
}

- (void)setAddressComponents:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setAddressComponents_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSDictionary)addressComponents
{
  return (NSDictionary *)objc_msgSend_addressComponents(self->_underlying, a2, v2, v3, v4);
}

- (void)setUrl:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setUrl_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSString)url
{
  return (NSString *)objc_msgSend_url(self->_underlying, a2, v2, v3, v4);
}

- (void)setEmail:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setEmail_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSString)email
{
  return (NSString *)objc_msgSend_email(self->_underlying, a2, v2, v3, v4);
}

- (void)setPhoneNumber:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setPhoneNumber_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_msgSend_phoneNumber(self->_underlying, a2, v2, v3, v4);
}

- (void)setType:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setType_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSString)type
{
  return (NSString *)objc_msgSend_type(self->_underlying, a2, v2, v3, v4);
}

- (void)setTitle:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setTitle_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (NSString)title
{
  return (NSString *)objc_msgSend_title(self->_underlying, a2, v2, v3, v4);
}

- (DUStructuredEntityObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUStructuredEntityObjC;
  uint64_t v2 = [(DUStructuredEntityObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding18DUStructuredEntity);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

@end