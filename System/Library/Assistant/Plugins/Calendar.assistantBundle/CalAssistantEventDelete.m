@interface CalAssistantEventDelete
- (id)_deleteEvent:(id)a3;
- (id)_validateEvent:(id)a3;
- (id)eventStore;
- (void)performWithCompletion:(id)a3;
- (void)setEventStore:(id)a3;
@end

@implementation CalAssistantEventDelete

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
  sub_234902DF4();
  v5 = (void *)qword_2687CDEB0;
  if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
    sub_23490698C(v5);
  }
  v6 = (void *)*MEMORY[0x263F28388];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
    sub_2349068F8(v6);
  }
  v10 = objc_msgSend_identifier(self, v7, v8, v9);
  v16 = objc_msgSend__validateEvent_(self, v11, (uint64_t)v10, v12);
  if (!v16)
  {
    v16 = objc_msgSend__deleteEvent_(self, v13, (uint64_t)v10, v15);
  }
  v17 = objc_msgSend_dictionary(v16, v13, v14, v15);
  v4[2](v4, v17);
}

- (id)_validateEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = objc_msgSend_identifier(v3, v4, v5, v6);

    if (v7)
    {
      uint64_t v8 = 0;
      goto LABEL_15;
    }
    sub_234902DF4();
    uint64_t v12 = (void *)qword_2687CDEB0;
    if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
      sub_234906AA8(v12);
    }
    v13 = (void *)*MEMORY[0x263F28388];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
      sub_234906A14(v13);
    }
    v11 = @"No Event ID was specified";
  }
  else
  {
    sub_234902DF4();
    uint64_t v9 = (void *)qword_2687CDEB0;
    if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
      sub_234906C18(v9);
    }
    v10 = (void *)*MEMORY[0x263F28388];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
      sub_234906B30(v10);
    }
    v11 = @"Expected SACalendarEvent object.";
  }
  id v14 = objc_alloc(MEMORY[0x263F64820]);
  uint64_t v8 = objc_msgSend_initWithReason_(v14, v15, (uint64_t)v11, v16);
LABEL_15:

  return v8;
}

- (id)_deleteEvent:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_identifier(v4, v5, v6, v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = objc_msgSend_URLWithString_(NSURL, v9, (uint64_t)v8, v11);

    uint64_t v8 = (void *)v12;
  }
  v13 = objc_msgSend_eventStore(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend__eventWithURI_checkValid_(v13, v14, (uint64_t)v8, 1);

  if (!v15)
  {
    sub_234902DF4();
    v43 = (void *)qword_2687CDEB0;
    if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
      sub_234906D84(v43);
    }
    v44 = (void *)*MEMORY[0x263F28388];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
      sub_234906CF0(v44);
    }
    id v45 = objc_alloc(MEMORY[0x263F64820]);
    uint64_t v48 = objc_msgSend_initWithReason_(v45, v46, @"Event not found", v47);
    goto LABEL_21;
  }
  if ((objc_msgSend_isEditable(v15, v16, v17, v18) & 1) == 0)
  {
    sub_234902DF4();
    v49 = (void *)qword_2687CDEB0;
    if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
      sub_234907060(v49);
    }
    v50 = (void *)*MEMORY[0x263F28388];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
      sub_234906FCC(v50);
    }
    id v51 = objc_alloc(MEMORY[0x263F64820]);
    uint64_t v48 = objc_msgSend_initWithReason_(v51, v52, @"Can't delete a read only event.", v53);
LABEL_21:
    id v42 = (id)v48;
    goto LABEL_24;
  }
  v22 = objc_msgSend_includeRecurrences(v4, v19, v20, v21);
  uint64_t v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);

  v30 = objc_msgSend_eventStore(self, v27, v28, v29);
  id v55 = 0;
  objc_msgSend_removeEvent_span_commit_error_(v30, v31, (uint64_t)v15, v26, 1, &v55);
  id v32 = v55;

  if (v32)
  {
    sub_234902DF4();
    v33 = (void *)qword_2687CDEB0;
    if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
      sub_234906EF4(v33, (uint64_t)self, v32);
    }
    v34 = (void *)*MEMORY[0x263F28388];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
      sub_234906E0C(v34, (uint64_t)self, v32);
    }
    id v35 = objc_alloc(MEMORY[0x263F64820]);
    v39 = objc_msgSend_localizedDescription(v32, v36, v37, v38);
    id v42 = (id)objc_msgSend_initWithReason_(v35, v40, (uint64_t)v39, v41);
  }
  else
  {
    id v42 = objc_alloc_init(MEMORY[0x263F648A0]);
  }

LABEL_24:

  return v42;
}

- (void).cxx_destruct
{
}

@end