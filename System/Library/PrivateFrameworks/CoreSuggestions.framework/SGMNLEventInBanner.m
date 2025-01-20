@interface SGMNLEventInBanner
- (PETScalarEventTracker)tracker;
- (SGMNLEventInBanner)init;
- (void)trackEventWithScalar:(unint64_t)a3 interface:(SGMNLEventInterface_)a4 actionType:(SGMNLEventActionType_)a5 eventType:(id)a6 languageID:(id)a7 daysFromStartDate:(unint64_t)a8 confidenceScore:(unint64_t)a9 significantSender:(SGMBoolOption_)a10 participantCount:(unint64_t)a11 extractionLevel:(SGMNLEventExtractionLevel_)a12 usedBubblesCount:(unint64_t)a13 titleSource:(SGMEventTitleSource_)a14 titleAdj:(SGMEventStringAdj_)a15 dateAdj:(SGMEventDateAdj_)a16 duraAdj:(SGMEventDurationAdj_)a17 locationAdj:(SGMEventLocationAdj_)a18 addedAttendeesCount:(id)a19 calendarAppUsageLevel:(id)a20 mailAppUsageLevel:(SGMAppUsageLevel_)a21 messagesAppUsageLevel:(SGMAppUsageLevel_)a22;
@end

@implementation SGMNLEventInBanner

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 interface:(SGMNLEventInterface_)a4 actionType:(SGMNLEventActionType_)a5 eventType:(id)a6 languageID:(id)a7 daysFromStartDate:(unint64_t)a8 confidenceScore:(unint64_t)a9 significantSender:(SGMBoolOption_)a10 participantCount:(unint64_t)a11 extractionLevel:(SGMNLEventExtractionLevel_)a12 usedBubblesCount:(unint64_t)a13 titleSource:(SGMEventTitleSource_)a14 titleAdj:(SGMEventStringAdj_)a15 dateAdj:(SGMEventDateAdj_)a16 duraAdj:(SGMEventDurationAdj_)a17 locationAdj:(SGMEventLocationAdj_)a18 addedAttendeesCount:(id)a19 calendarAppUsageLevel:(id)a20 mailAppUsageLevel:(SGMAppUsageLevel_)a21 messagesAppUsageLevel:(SGMAppUsageLevel_)a22
{
  v84[19] = *MEMORY[0x1E4F143B8];
  id v25 = a6;
  id v26 = a7;
  id v27 = a19;
  id v28 = a20;
  if (a4.var0 >= 0x14)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    v31 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMNLEventInterface_toString(SGMNLEventInterface)"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"SGMetricsDefines.h", 479, @"unrecognized tag %lu on SGMNLEventInterface", a4.var0);

    v29 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v29 = off_1E5B8F4E0[a4.var0];
  }
  v77 = v29;
  if (a5.var0 >= 0xC)
  {
    unint64_t v32 = 0x1E4F28000uLL;
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMNLEventActionType_toString(SGMNLEventActionType)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"SGMetricsDefines.h", 430, @"unrecognized tag %lu on SGMNLEventActionType", a5.var0);

    v76 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v76 = off_1E5B8F328[a5.var0];
    unint64_t v32 = 0x1E4F28000;
  }
  id v79 = v25;
  id v78 = v26;
  if (a10.var0 >= 3)
  {
    v36 = [*(id *)(v32 + 2816) currentHandler];
    unint64_t v35 = 0x1E4F29000uLL;
    v37 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMBoolOption_toString(SGMBoolOption)"];
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"SGMetricsDefines.h", 27, @"unrecognized tag %lu on SGMBoolOption", a10.var0);

    v75 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v75 = off_1E5B8F388[a10.var0];
    unint64_t v35 = 0x1E4F29000;
  }
  if (a12.var0 >= 6)
  {
    v39 = [*(id *)(v32 + 2816) currentHandler];
    v40 = [*(id *)(v35 + 24) stringWithUTF8String:"NSString * _Nonnull SGMNLEventExtractionLevel_toString(SGMNLEventExtractionLevel)"];
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"SGMetricsDefines.h", 380, @"unrecognized tag %lu on SGMNLEventExtractionLevel", a12.var0);

    v38 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v38 = off_1E5B8F3A0[a12.var0];
  }
  v74 = v38;
  if (a14.var0 >= 4)
  {
    v42 = [*(id *)(v32 + 2816) currentHandler];
    v43 = [*(id *)(v35 + 24) stringWithUTF8String:"NSString * _Nonnull SGMEventTitleSource_toString(SGMEventTitleSource)"];
    objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"SGMetricsDefines.h", 397, @"unrecognized tag %lu on SGMEventTitleSource", a14.var0);

    v41 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v41 = off_1E5B8F3D0[a14.var0];
  }
  v73 = v41;
  if (a15.var0 >= 5)
  {
    v45 = [*(id *)(v32 + 2816) currentHandler];
    v46 = [*(id *)(v35 + 24) stringWithUTF8String:"NSString * _Nonnull SGMEventStringAdj_toString(SGMEventStringAdj)"];
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"SGMetricsDefines.h", 290, @"unrecognized tag %lu on SGMEventStringAdj", a15.var0);

    v44 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v44 = off_1E5B8F3F0[a15.var0];
  }
  v72 = v44;
  if (a16.var0 >= 0xA)
  {
    v48 = [*(id *)(v32 + 2816) currentHandler];
    v49 = [*(id *)(v35 + 24) stringWithUTF8String:"NSString * _Nonnull SGMEventDateAdj_toString(SGMEventDateAdj)"];
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, @"SGMetricsDefines.h", 319, @"unrecognized tag %lu on SGMEventDateAdj", a16.var0);

    v47 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v47 = off_1E5B8F418[a16.var0];
  }
  v71 = v47;
  if (a17.var0 >= 6)
  {
    v51 = [*(id *)(v32 + 2816) currentHandler];
    v52 = [*(id *)(v35 + 24) stringWithUTF8String:"NSString * _Nonnull SGMEventDurationAdj_toString(SGMEventDurationAdj)"];
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, @"SGMetricsDefines.h", 340, @"unrecognized tag %lu on SGMEventDurationAdj", a17.var0);

    v50 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v50 = off_1E5B8F468[a17.var0];
  }
  v70 = v50;
  if (a18.var0 >= 5)
  {
    v54 = [*(id *)(v32 + 2816) currentHandler];
    v55 = [*(id *)(v35 + 24) stringWithUTF8String:"NSString * _Nonnull SGMEventLocationAdj_toString(SGMEventLocationAdj)"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"SGMetricsDefines.h", 359, @"unrecognized tag %lu on SGMEventLocationAdj", a18.var0);

    v53 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v53 = off_1E5B8F498[a18.var0];
  }
  v67 = v53;
  id v69 = v27;
  id v68 = v28;
  if (a21.var0 >= 4)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    v58 = [*(id *)(v35 + 24) stringWithUTF8String:"NSString * _Nonnull SGMAppUsageLevel_toString(SGMAppUsageLevel)"];
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, @"SGMetricsDefines.h", 496, @"unrecognized tag %lu on SGMAppUsageLevel", a21.var0);

    v56 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v56 = off_1E5B8F4C0[a21.var0];
  }
  if (a22.var0 >= 4)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    v61 = [NSString stringWithUTF8String:"NSString * _Nonnull SGMAppUsageLevel_toString(SGMAppUsageLevel)"];
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, @"SGMetricsDefines.h", 496, @"unrecognized tag %lu on SGMAppUsageLevel", a22.var0);

    v59 = @"ERR_UNMATCHED_TAG";
  }
  else
  {
    v59 = off_1E5B8F4C0[a22.var0];
  }
  tracker = self->_tracker;
  v84[0] = v77;
  v84[1] = v76;
  v84[2] = v79;
  v84[3] = v78;
  v62 = [NSNumber numberWithUnsignedInteger:a8];
  v84[4] = v62;
  v63 = [NSNumber numberWithUnsignedInteger:a9];
  v84[5] = v63;
  v84[6] = v75;
  v64 = [NSNumber numberWithUnsignedInteger:a11];
  v84[7] = v64;
  v84[8] = v74;
  v65 = [NSNumber numberWithUnsignedInteger:a13];
  v84[9] = v65;
  v84[10] = v73;
  v84[11] = v72;
  v84[12] = v71;
  v84[13] = v70;
  v84[14] = v67;
  v84[15] = v69;
  v84[16] = v68;
  v84[17] = v56;
  v84[18] = v59;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:19];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v66 value:a3];
}

- (SGMNLEventInBanner)init
{
  v29[19] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SGMNLEventInBanner;
  v2 = [(SGMNLEventInBanner *)&v28 init];
  if (v2)
  {
    id v25 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"I"];
    id v27 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"A"];
    id v26 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"T"];
    v22 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"L"];
    v24 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"D", 0, 57, 1);
    v20 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"C", 0, 101, 1);
    v21 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"S"];
    v19 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"P", 0, 100, 1);
    v23 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"E"];
    v18 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"B", 0, 11, 1);
    v17 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"TiS"];
    v16 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"TiA"];
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"DaA"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"DuA"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"LoA"];
    v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"AttC"];
    uint64_t v7 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"CaUL"];
    v8 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"MaUL"];
    v9 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"MeUL"];
    id v10 = objc_alloc(MEMORY[0x1E4F93738]);
    v29[0] = v25;
    v29[1] = v27;
    v29[2] = v26;
    v29[3] = v22;
    v29[4] = v24;
    v29[5] = v20;
    v29[6] = v21;
    v29[7] = v19;
    v29[8] = v23;
    v29[9] = v18;
    v29[10] = v17;
    v29[11] = v16;
    v29[12] = v3;
    v29[13] = v4;
    v29[14] = v5;
    v29[15] = v6;
    v29[16] = v7;
    v29[17] = v8;
    v11 = (void *)v7;
    v29[18] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:19];
    uint64_t v13 = [v10 initWithFeatureId:@"Found" event:@"NLEventInBanner" registerProperties:v12 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v13;
  }
  return v2;
}

@end