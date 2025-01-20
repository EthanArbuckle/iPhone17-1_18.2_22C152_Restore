@interface CalAssistantGetDefaultCalendar
- (id)eventStore;
- (void)performWithCompletion:(id)a3;
- (void)setEventStore:(id)a3;
@end

@implementation CalAssistantGetDefaultCalendar

- (id)eventStore
{
  eventStore = self->_eventStore;
  if (!eventStore)
  {
    objc_msgSend__ca_eventStoreWithError_(MEMORY[0x263F04B98], a2, 0, v2);
    v5 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_eventStore;
    self->_eventStore = v5;

    eventStore = self->_eventStore;
  }

  return eventStore;
}

- (void)setEventStore:(id)a3
{
  if (self->_eventStore != a3) {
    objc_storeStrong((id *)&self->_eventStore, a3);
  }

  MEMORY[0x270F9A758]();
}

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  sub_234902DF4();
  v8 = objc_msgSend_eventStore(self, v5, v6, v7);
  v12 = objc_msgSend_acquireDefaultCalendarForNewEvents(v8, v9, v10, v11);

  v16 = objc_msgSend_source(v12, v13, v14, v15);
  v20 = objc_msgSend_externalID(v16, v17, v18, v19);
  v24 = objc_msgSend_title(v16, v21, v22, v23);
  BOOL v28 = objc_msgSend_sourceType(v16, v25, v26, v27) != 0;
  id v29 = objc_alloc_init(MEMORY[0x263F64800]);
  objc_msgSend_setAccountIdentifier_(v29, v30, (uint64_t)v20, v31);
  v34 = objc_msgSend_numberWithBool_(NSNumber, v32, v28, v33);
  objc_msgSend_setRemote_(v29, v35, (uint64_t)v34, v36);

  objc_msgSend_setStrict_(v29, v37, 0, v38);
  objc_msgSend_setAccountName_(v29, v39, (uint64_t)v24, v40);
  id v41 = objc_alloc(MEMORY[0x263F647E0]);
  id v48 = (id)objc_msgSend_initWithAceCalendarSource_(v41, v42, (uint64_t)v29, v43);
  v47 = objc_msgSend_dictionary(v48, v44, v45, v46);
  v4[2](v4, v47);
}

- (void).cxx_destruct
{
}

@end