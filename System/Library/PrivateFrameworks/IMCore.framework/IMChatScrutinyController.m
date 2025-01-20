@interface IMChatScrutinyController
+ (id)sharedController;
- (double)_maxDurationForScrutinyMode;
- (id)scrutinyInfo;
- (id)transcriptRenderingMetadataForChatIdentifier:(id)a3;
- (void)markMessageAsCorrupt:(id)a3;
- (void)markMessageAsNotCorrupt:(id)a3;
- (void)setTranscriptRenderingMetadata:(id)a3 forChatIdentifier:(id)a4;
@end

@implementation IMChatScrutinyController

+ (id)sharedController
{
  if (qword_1EB3F2378 != -1) {
    dispatch_once(&qword_1EB3F2378, &unk_1EF8E5878);
  }
  v2 = (void *)qword_1EB3F2360;

  return v2;
}

- (void)markMessageAsCorrupt:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_markMessageAsCorrupt_setCorrupt_(v8, v7, (uint64_t)v3, 1);
}

- (void)markMessageAsNotCorrupt:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_markMessageAsCorrupt_setCorrupt_(v8, v7, (uint64_t)v3, 0);
}

- (double)_maxDurationForScrutinyMode
{
  return 300.0;
}

- (id)transcriptRenderingMetadataForChatIdentifier:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend_length(v4, v5, v6, v7))
  {
    id v36 = 0;
    goto LABEL_11;
  }
  v11 = objc_msgSend_scrutinyInfo(self, v8, v9, v10);
  v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"cid", v13);
  int isEqualToString = objc_msgSend_isEqualToString_(v14, v15, (uint64_t)v4, v16);

  if (!isEqualToString) {
    goto LABEL_9;
  }
  v20 = objc_msgSend_objectForKeyedSubscript_(v11, v18, @"latime", v19);
  objc_msgSend_doubleValue(v20, v21, v22, v23);
  double v25 = v24;

  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v26, v27, v28);
  if (v25 > 0.0)
  {
    double v33 = v32;
    objc_msgSend__maxDurationForScrutinyMode(self, v29, v30, v31);
    if (v33 < v25 || v33 - v25 > v35)
    {
      objc_msgSend_setTranscriptRenderingMetadata_forChatIdentifier_(self, v34, 0, (uint64_t)v4);
LABEL_9:
      id v36 = 0;
      goto LABEL_10;
    }
  }
  id v36 = v11;
LABEL_10:

LABEL_11:

  return v36;
}

- (id)scrutinyInfo
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)setTranscriptRenderingMetadata:(id)a3 forChatIdentifier:(id)a4
{
  id v28 = a3;
  id v8 = a4;
  if (v8
    && (objc_msgSend_allKeys(v28, v5, v6, v7),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12),
        v9,
        v13))
  {
    v17 = objc_msgSend_mutableCopy(v28, v14, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v8, @"cid");
    uint64_t v19 = NSNumber;
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v20, v21, v22);
    v26 = objc_msgSend_numberWithDouble_(v19, v23, v24, v25);
    objc_msgSend_setObject_forKeyedSubscript_(v17, v27, (uint64_t)v26, @"latime");
  }
  else
  {
    v17 = 0;
  }
  IMSetDomainValueForKey();
}

@end