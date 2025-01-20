@interface GDGeoHashVisitUtility
- (GDGeoHashVisitUtility)initWithGeoHashStream:(id)a3;
- (id)_rawGeoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7 level:(int64_t)a8;
- (id)_rawGeoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5 level:(int64_t)a6;
- (id)geoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 level:(int64_t)a5;
- (id)lastGeoHashVisitEventAt:(id)a3 level:(int64_t)a4;
@end

@implementation GDGeoHashVisitUtility

- (void).cxx_destruct
{
}

- (id)_rawGeoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 maxEvents:(unint64_t)a5 lastN:(unint64_t)a6 reversed:(BOOL)a7 level:(int64_t)a8
{
  BOOL v9 = a7;
  v14 = (objc_class *)MEMORY[0x1E4F503E8];
  id v15 = a4;
  id v16 = a3;
  id v17 = [v14 alloc];
  started = objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(v17, v18, (uint64_t)v16, (uint64_t)v15, a5, a6, v9);

  v22 = objc_msgSend_publisherWithOptions_(self->_geoHashStream, v20, (uint64_t)started, v21);
  v25 = objc_msgSend_filterWithIsIncluded_(v22, v23, (uint64_t)&unk_1F220AB78, v24);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C791AA3C;
  v30[3] = &unk_1E6536F70;
  v30[4] = a8;
  v28 = objc_msgSend_mapWithTransform_(v25, v26, (uint64_t)v30, v27);

  return v28;
}

- (id)_rawGeoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 reversed:(BOOL)a5 level:(int64_t)a6
{
  return (id)objc_msgSend__rawGeoHashVisitEventPublisherFrom_to_maxEvents_lastN_reversed_level_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, a5, a6);
}

- (id)geoHashVisitEventPublisherFrom:(id)a3 to:(id)a4 level:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = objc_msgSend__rawGeoHashVisitEventPublisherFrom_to_reversed_level_(self, v10, (uint64_t)v8, (uint64_t)v9, 0, a5);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1C791ADB0;
  v22[4] = sub_1C791ADC0;
  id v23 = 0;
  objc_msgSend_lastGeoHashVisitEventAt_level_(self, v12, (uint64_t)v8, a5);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_tupleWithFirst_second_(MEMORY[0x1E4F93BB8], v13, 0, 0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C791ADC8;
  v21[3] = &unk_1E6536F50;
  v21[4] = v22;
  v21[5] = a5;
  id v16 = objc_msgSend_scanWithInitial_nextPartialResult_(v11, v15, (uint64_t)v14, (uint64_t)v21);
  v19 = objc_msgSend_flatMapWithTransform_(v16, v17, (uint64_t)&unk_1F220AB58, v18);

  _Block_object_dispose(v22, 8);
  return v19;
}

- (id)lastGeoHashVisitEventAt:(id)a3 level:(int64_t)a4
{
  id v6 = a3;
  id v8 = objc_msgSend__rawGeoHashVisitEventPublisherFrom_to_maxEvents_lastN_reversed_level_(self, v7, (uint64_t)v6, 0, 1, 0, 1, a4);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1C791ADB0;
  v28 = sub_1C791ADC0;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1C791B1E0;
  v23[3] = &unk_1E6536F28;
  v23[4] = &v24;
  id v10 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v8, v9, (uint64_t)&unk_1F220AB38, (uint64_t)v23);
  if (v25[5])
  {
    v11 = [GDGeoHashVisitEvent alloc];
    id v15 = objc_msgSend_date((void *)v25[5], v12, v13, v14);
    uint64_t v19 = objc_msgSend_geoHash((void *)v25[5], v16, v17, v18);
    isEnter_level = objc_msgSend_initWithDate_geoHash_isEnter_level_(v11, v20, (uint64_t)v15, v19, 1, a4);
  }
  else
  {
    isEnter_level = 0;
  }
  _Block_object_dispose(&v24, 8);

  return isEnter_level;
}

- (GDGeoHashVisitUtility)initWithGeoHashStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDGeoHashVisitUtility;
  id v6 = [(GDGeoHashVisitUtility *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_geoHashStream, a3);
  }

  return v7;
}

@end