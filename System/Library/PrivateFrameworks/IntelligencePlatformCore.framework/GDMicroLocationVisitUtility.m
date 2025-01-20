@interface GDMicroLocationVisitUtility
- (GDMicroLocationVisitUtility)initWithMicroLocationVisitStream:(id)a3;
- (id)_rawMicroLocationVisitEventPublisherFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5;
- (id)lastMicroLocationVisitEventPriorTo:(id)a3;
- (id)microLocationVisitEventPublisherFrom:(id)a3 to:(id)a4;
@end

@implementation GDMicroLocationVisitUtility

- (void).cxx_destruct
{
}

- (id)_rawMicroLocationVisitEventPublisherFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = (objc_class *)MEMORY[0x1E4F503E8];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 alloc];
  started = objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v12, v13, (uint64_t)v11, (uint64_t)v10, 0, 0, v5);

  v17 = objc_msgSend_publisherWithOptions_(self->_microLocationVisitStream, v15, (uint64_t)started, v16);
  v20 = objc_msgSend_filterWithIsIncluded_(v17, v18, (uint64_t)&unk_1F220AC58, v19);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1C791DCA4;
  v25[3] = &unk_1E65371A0;
  v25[4] = self;
  v25[5] = a2;
  v23 = objc_msgSend_mapWithTransform_(v20, v21, (uint64_t)v25, v22);

  return v23;
}

- (id)microLocationVisitEventPublisherFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = objc_msgSend__rawMicroLocationVisitEventPublisherFrom_to_reversed_(self, v8, (uint64_t)v6, (uint64_t)v7, 0);
  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  v13 = objc_msgSend_initWithUUIDBytes_(v10, v11, (uint64_t)&unk_1C79EFAE1, v12);
  v17 = objc_msgSend_UUIDString(v13, v14, v15, v16);

  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1C791E02C;
  v33[4] = sub_1C791E03C;
  id v34 = 0;
  uint64_t v19 = objc_msgSend_tupleWithFirst_second_(MEMORY[0x1E4F93BB8], v18, 0, 0);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = sub_1C791E044;
  v30 = &unk_1E6537138;
  v32 = v33;
  id v20 = v17;
  id v31 = v20;
  uint64_t v22 = objc_msgSend_scanWithInitial_nextPartialResult_(v9, v21, (uint64_t)v19, (uint64_t)&v27);
  v25 = objc_msgSend_flatMapWithTransform_(v22, v23, (uint64_t)&unk_1F220AC38, v24, v27, v28, v29, v30);

  _Block_object_dispose(v33, 8);
  return v25;
}

- (id)lastMicroLocationVisitEventPriorTo:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend__rawMicroLocationVisitEventPublisherFrom_to_reversed_(self, v5, (uint64_t)v4, 0, 1);
  id v7 = objc_alloc(MEMORY[0x1E4F29128]);
  id v10 = objc_msgSend_initWithUUIDBytes_(v7, v8, (uint64_t)&unk_1C79EFAE1, v9);
  v14 = objc_msgSend_UUIDString(v10, v11, v12, v13);

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_1C791E02C;
  v48 = sub_1C791E03C;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_1C791E02C;
  v42 = sub_1C791E03C;
  id v43 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1C791E568;
  v34[3] = &unk_1E6537110;
  id v15 = v14;
  id v35 = v15;
  v36 = &v44;
  v37 = &v38;
  id v17 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v6, v16, (uint64_t)&unk_1F220AC18, (uint64_t)v34);
  v18 = (void *)v45[5];
  if (v39[5])
  {
    if (v18)
    {
      uint64_t v19 = [GDMicroLocationVisitEvent alloc];
      v23 = objc_msgSend_date((void *)v39[5], v20, v21, v22);
      uint64_t v27 = objc_msgSend_microLocationIdentifier((void *)v45[5], v24, v25, v26);
      objc_msgSend_probability((void *)v45[5], v28, v29, v30);
      id isEnter = (id)objc_msgSend_initWithDate_microLocationIdentifier_probability_isEnter_(v19, v31, (uint64_t)v23, (uint64_t)v27, 0);
    }
    else
    {
      id isEnter = 0;
    }
  }
  else
  {
    id isEnter = v18;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return isEnter;
}

- (GDMicroLocationVisitUtility)initWithMicroLocationVisitStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDMicroLocationVisitUtility;
  id v6 = [(GDMicroLocationVisitUtility *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_microLocationVisitStream, a3);
  }

  return v7;
}

@end